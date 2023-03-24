Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F801C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 01:31:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.91711.1679621456086944719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 18:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J0ZILh5D;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id o2so529087plg.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 18:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmvD1weiCeJChZHaFY8qM7Bs58eNzZYZCqAHzYV8Gys=;
        b=J0ZILh5DcE0ToOu2fOjH3lISxi7sZ2ViwA8JCHaj4BNVSLmAaO21IqS04VMDwdLznI
         lmWsaP7PKc51PYyeRWbVSI2zt3vV8zvgWkxawmkJ60juA1vjkqTzbJqYyY9u1gEtfwNi
         YzzzVL+OnIwbCBBE8Xe52XpTBnmN4l+5PekHNiQiHh/k3qaDDQpMQ7RY2dGp5pgIQoMg
         BQJUbs8HaKYu9V2PydDn0pzbwQ9yTSoeMi6L6V49NiGPMUeTehZopGlgGUCdBoacnNpv
         7Up75GljCJ1CkdwZaJrMqbEoSnPiCB29cwJ98GBLILTNQET4SXm1hqn0X46IoD08cuKf
         zEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmvD1weiCeJChZHaFY8qM7Bs58eNzZYZCqAHzYV8Gys=;
        b=FQVByfxTFRO7gAskH3JQKOI+vs8TLmErKipuBuT3/Nrrc5aKaxYjEPZNUNuEgYUiqB
         0jOMzfeYQvgtuSTa7VYPumAaOC23ZK9dRTX3FhFA/SFBbFvLkTPyNyuekS303neQsd2T
         4x6zrsTMFcXsK0LnAosR48sttnFqOElmckdHTFOvO2v4WjSP3/pY4KWX49xiHkU+/XS0
         3TQ8kU2s5vFmWJi9JGMXafAQEQOoz+nK07x1/2yV0kK3lkQxoOnCrVYTn3orXT2jFUhj
         DmsXmlmCVMj18UbxlKDoGMnVZ9FPDfiK9e5ykWaTS/l4rtAFL3UIQuJoYiNB9FwP/H2H
         vRIw==
X-Gm-Message-State: AAQBX9dM+kpK1dPkzGPEGyHZ4f/IungOK0TpdE8KLq95qTK4vH45H8Tf
	5abIb+YOh2k3FaO2oCIgmtaitK9CBMAsgw==
X-Google-Smtp-Source: AKy350Z46ESkz6NpHLXPbwI7qSk3CQJpVC1WnVG9jeAROvjhJ9Do3kcBQSpE0Rv25HKoHWCU2JIBdw==
X-Received: by 2002:a17:902:fa10:b0:19e:d60a:e9e with SMTP id la16-20020a170902fa1000b0019ed60a0e9emr626744plb.42.1679621454817;
        Thu, 23 Mar 2023 18:30:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902aa9200b001a1add0d616sm11865980plr.161.2023.03.23.18.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:30:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Disable upstart scripts
Date: Thu, 23 Mar 2023 18:30:52 -0700
Message-Id: <20230324013052.50554-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 01:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101700

They are not cross compile friendly as they poke into build host
directories to determine if system is upstart based and it can fail
build on such hosts e.g. ubuntu

If someone is still using upstart with OE then please fix it and send a
better fix upstream to re-enable it here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-not-check-for-upstart-on-build-host.patch | 46 +++++++++++++++++++
 .../fluentbit/fluentbit_1.9.7.bb              |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch
new file mode 100644
index 0000000000..71bdd34eeb
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch
@@ -0,0 +1,46 @@
+From c41653e856d05ed430d22f8b311714ff756a0e0b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Mar 2023 18:05:27 -0700
+Subject: [PATCH] cmake: Do not check for upstart on build host
+
+Some ubuntu distros might have this directory /usr/share/upstart around
+and yocto based distros not using systemd will process this piece of
+code and falsely assume that target supports upstart, which may not be
+true in case of cross-compilation.
+
+This also can end up in configure errors e.g.
+
+| CMake Error at src/CMakeLists.txt:496 (install):
+|   install DIRECTORY given unknown argument "/etc/td-agent-bit/".
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Inappropriate [ Cross-compile Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/CMakeLists.txt | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index bb30b2a..c63b6d8 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -486,14 +486,6 @@ if(FLB_BINARY)
+       )
+     install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
+-  elseif(IS_DIRECTORY /usr/share/upstart)
+-    set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
+-    configure_file(
+-      "${PROJECT_SOURCE_DIR}/init/upstart.in"
+-      ${FLB_UPSTART_SCRIPT}
+-      )
+-    install(FILES ${FLB_UPSTART_SCRIPT} COMPONENT binary DESTINATION /etc/init)
+-    install(DIRECTORY DESTINATION COMPONENT binary ${FLB_INSTALL_CONFDIR})
+   else()
+     # FIXME: should we support Sysv init script ?
+   endif()
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
index f626168421..26238e51f1 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-b
            file://0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch \
            file://0005-stackdriver-Fix-return-type-mismatch.patch \
            file://0006-monkey-Fix-TLS-detection-testcase.patch \
+           file://0007-cmake-Do-not-check-for-upstart-on-build-host.patch \
            "
 SRC_URI:remove:x86 = "file://0002-mbedtls-Remove-unused-variable.patch"
 SRC_URI:append:libc-musl = "\
-- 
2.40.0


