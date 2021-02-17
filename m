Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.7844.1613570983409388663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZJh8vyhW;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id t4so2439199ljh.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7/t7g//eHbBNYEhCksR8KZJIEkJlgosQ+m2naM113Q=;
        b=ZJh8vyhWKm0/tRT8B1IuFKmE6gkrBs3K5TB+5ATMCvpsB2fFbI1aF7Z8aUa8qfCV+v
         U17/MgV/j366OdqBpWF7jA/UMaJOydtdK2LRP4BUd8JHeNZEukdDIoZ/fqVNwD2Q0Tuk
         hKaM9egpNP6T6pC8I5crBImYKWDFsO/RnIirCNvBA+h708gSMc7r/H/0cwUIyOlqp3yH
         k7ZAT4V2PR5YPvl1cnIQQi76+v8UNHtMyXi2CClSo76qA3fm5FW9ZFqtQkCsU7Jv+XF3
         Us3NGPCLvDC0BXjzhWtTGVoprF48Am0iEBnOvFM7xJrfuPV6EtP0NIhS/iSO1XztDrL8
         UAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z7/t7g//eHbBNYEhCksR8KZJIEkJlgosQ+m2naM113Q=;
        b=mQViNTjb5dMpUGA9m5nmUM1DZVSzHCo2smIuSQHDWx9LD+0ESnrlbIysVQMqw3Ixij
         T4cdfAcZyiIJhEuDAnUfS6fjOEFvtOalb36J2U14hB3ak8WFgJyhg25A3hBpKYcXB4d+
         PD5Zpn4RO2YAVPFtBxAJugr+4gkxvceDfOLo5ceYbhruRx7HQXr0PSlSlfsO/vEiKrQO
         hAc1zp7vL2qqYNCMUx43EfzbUwnzfOky++f6bzKN4JsHtLUUCzOLRafUzNzGfiVuxTEs
         +uIoFg98moMvQpVCUv54uoSv1/S7dzGvAteq9s6fSEmtZagZ2GUgRwGYLKpGTN9D6DAr
         Tbig==
X-Gm-Message-State: AOAM531lIhSUczaP3o5spAZPKYMMj0o7rHCiw9LgdrdzlAQZvrL7Dgir
	S3jXGyvplrICQbguplXifCo=
X-Google-Smtp-Source: ABdhPJxNvvaV6IeOiBTCuc8Znnmljbuu7Gp6rTjHq0xgXXw3e7R9oyGTHV5etySFSx9uYo/Y0kWYNQ==
X-Received: by 2002:a2e:b178:: with SMTP id a24mr14728101ljm.484.1613570981609;
        Wed, 17 Feb 2021 06:09:41 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.215.157])
        by smtp.gmail.com with ESMTPSA id q26sm253363lfc.254.2021.02.17.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:09:41 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-security] [PATCH 3/5] meta: refactor IMA/EVM sign rootfs
Date: Wed, 17 Feb 2021 15:09:27 +0100
Message-Id: <20210217140929.987752-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210217140929.987752-1-liu.ming50@gmail.com>
References: <20210217140929.987752-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

The current logic in ima-evm-rootfs.bbclass does not guarantee
ima_evm_sign_rootfs is the last function in IMAGE_PREPROCESS_COMMAND
by appending to it, for instance, if there are other "_append" being
used as it's the case in openembedded-core/meta/classes/image.bbclass:

| IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' \
| if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) \
| and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True,
| False, d) else ''} reproducible_final_image_task; "

and ima-evm-rootfs should be in IMAGE_CLASSES instead of in INHERIT
since that would impact all recipes but not only image recipes.

To fix the above issues, we introduce a ima_evm_sign_handler setting
IMA/EVM rootfs signing requirements/dependencies in event
bb.event.RecipePreFinalise, it checks 'ima' distro feature to decide if
IMA/EVM rootfs signing logic should be applied or not.

We also need split public keys to ima-evm-keys recipe, so it could be
added both in initramfs and rootfs, so initramfs recipe does not have to
inherit ima-evm-rootfs

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-integrity/README.md                      |  4 ++-
 meta-integrity/classes/ima-evm-rootfs.bbclass | 30 ++++++++-----------
 .../initrdscripts/initramfs-framework-ima.bb  |  2 +-
 .../ima-evm-keys/ima-evm-keys_1.0.bb          | 16 ++++++++++
 4 files changed, 32 insertions(+), 20 deletions(-)
 create mode 100644 meta-integrity/recipes-security/ima-evm-keys/ima-evm-keys_1.0.bb

diff --git a/meta-integrity/README.md b/meta-integrity/README.md
index 4607948..5048fba 100644
--- a/meta-integrity/README.md
+++ b/meta-integrity/README.md
@@ -73,8 +73,10 @@ Adding the layer only enables IMA (see below regarding EVM) during
 compilation of the Linux kernel. To also activate it when building
 the image, enable image signing in the local.conf like this:
 
-    INHERIT += "ima-evm-rootfs"
+    IMAGE_CLASSES += "ima-evm-rootfs"
     IMA_EVM_KEY_DIR = "${INTEGRITY_BASE}/data/debug-keys"
+    IMA_EVM_PRIVKEY = "${IMA_EVM_KEY_DIR}/privkey_ima.pem"
+    IMA_EVM_X509 = "${IMA_EVM_KEY_DIR}/x509_ima.der"
 
 This uses the default keys provided in the "data" directory of the layer.
 Because everyone has access to these private keys, such an image
diff --git a/meta-integrity/classes/ima-evm-rootfs.bbclass b/meta-integrity/classes/ima-evm-rootfs.bbclass
index d6ade3b..4359af0 100644
--- a/meta-integrity/classes/ima-evm-rootfs.bbclass
+++ b/meta-integrity/classes/ima-evm-rootfs.bbclass
@@ -37,15 +37,6 @@ ima_evm_sign_rootfs () {
     # reasons (including a change of the signing keys) without also
     # re-running do_rootfs.
 
-    # Copy file(s) which must be on the device. Note that
-    # evmctl uses x509_evm.der also for "ima_verify", which is probably
-    # a bug (should default to x509_ima.der). Does not matter for us
-    # because we use the same key for both.
-    install -d ./${sysconfdir}/keys
-    rm -f ./${sysconfdir}/keys/x509_evm.der
-    install "${IMA_EVM_X509}" ./${sysconfdir}/keys/x509_evm.der
-    ln -sf x509_evm.der ./${sysconfdir}/keys/x509_ima.der
-
     # Fix /etc/fstab: it must include the "i_version" mount option for
     # those file systems where writing files is allowed, otherwise
     # these changes will not get detected at runtime.
@@ -80,13 +71,16 @@ ima_evm_sign_rootfs () {
 }
 
 # Signing must run as late as possible in the do_rootfs task.
-# IMAGE_PREPROCESS_COMMAND runs after ROOTFS_POSTPROCESS_COMMAND, so
-# append (not prepend!) to IMAGE_PREPROCESS_COMMAND, and do it with
-# _append instead of += because _append gets evaluated later. In
-# particular, we must run after prelink_image in
-# IMAGE_PREPROCESS_COMMAND, because prelinking changes executables.
-
-IMAGE_PREPROCESS_COMMAND_append = " ima_evm_sign_rootfs ; "
+# To guarantee that, we append it to IMAGE_PREPROCESS_COMMAND in
+# RecipePreFinalise event handler, this ensures it's the last
+# function in IMAGE_PREPROCESS_COMMAND.
+python ima_evm_sign_handler () {
+    if not e.data or 'ima' not in e.data.getVar('DISTRO_FEATURES').split():
+        return
 
-# evmctl must have been installed first.
-do_rootfs[depends] += "ima-evm-utils-native:do_populate_sysroot"
+    e.data.appendVar('IMAGE_PREPROCESS_COMMAND', ' ima_evm_sign_rootfs; ')
+    e.data.appendVar('IMAGE_INSTALL', ' ima-evm-keys')
+    e.data.appendVarFlag('do_rootfs', 'depends', ' ima-evm-utils-native:do_populate_sysroot')
+}
+addhandler ima_evm_sign_handler
+ima_evm_sign_handler[eventmask] = "bb.event.RecipePreFinalise"
diff --git a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima.bb b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima.bb
index dacdc8b..77f6f7c 100644
--- a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima.bb
+++ b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima.bb
@@ -27,5 +27,5 @@ do_install () {
 
 FILES_${PN} = "/init.d ${sysconfdir}"
 
-RDEPENDS_${PN} = "keyutils ${IMA_POLICY}"
+RDEPENDS_${PN} = "keyutils ima-evm-keys ${IMA_POLICY}"
 RDEPENDS_${PN} += "initramfs-framework-base"
diff --git a/meta-integrity/recipes-security/ima-evm-keys/ima-evm-keys_1.0.bb b/meta-integrity/recipes-security/ima-evm-keys/ima-evm-keys_1.0.bb
new file mode 100644
index 0000000..62685bb
--- /dev/null
+++ b/meta-integrity/recipes-security/ima-evm-keys/ima-evm-keys_1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "IMA/EMV public keys"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ima"
+
+ALLOW_EMPTY_${PN} = "1"
+
+do_install () {
+    if [ -e "${IMA_EVM_X509}" ]; then
+        install -d ${D}/${sysconfdir}/keys
+        install "${IMA_EVM_X509}" ${D}${sysconfdir}/keys/x509_evm.der
+        lnr ${D}${sysconfdir}/keys/x509_evm.der ${D}${sysconfdir}/keys/x509_ima.der
+    fi
+}
-- 
2.29.0

