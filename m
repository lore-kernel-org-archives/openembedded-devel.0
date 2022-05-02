Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B967DC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:14:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.11098.1651500898822198583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fbi3wUGJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id l18so27991116ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p1IocPm+x1zVdTbRtLSJXu75dvz+bRE1Uykh5IF6bs4=;
        b=Fbi3wUGJjBCtulkI+5U2zXAdKLeltwqF7F5caxQdu38uhKWZMKRfaS/ddjNjXAxUmA
         GjbshMAYEfw5zd6bG/ntRUlSVkyZa03EHW/lJq1htw9AWcCq8epDd7HHJhfX6XQ2Hrap
         aRS1ThLuk5VfMmsBTSqFBSuPwoiYtlu4wH21JFaQ+H3CRexa/Flj1GOhD62HGBiOBKJ1
         ZqAfUFlIYG2UuhQPH5kFk88q+BGf/QhbxZQT9iPL8UeXmfBO15G+mRUQk3Mj6WuBYpyB
         TqFREefOP87KuJdHeXkFj2VKQgfT/UnwnDRpE6B3lirPOHNt2gfIsMoCFICJNO0W/P4+
         VyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p1IocPm+x1zVdTbRtLSJXu75dvz+bRE1Uykh5IF6bs4=;
        b=EVFLWzggAZ8LN9nRXFG+ZF4BZO36/LbWHDN8Q8k9RjKhkNlg2liKtmap+9ow+PM6No
         D/zMh8ncIgQBHmq8MGIfzDBMFtCgewrxwKwgH4o3U3IJYVmAarwnA9zl9Fd5I56kAsRx
         CekP6hwhysoJ+Lej33DviI/M9lN71eaFq7Ub0sNdgR0V7u/78IvmJIJWV5SJHIdDIRaU
         GHjZDrsvOA8CgbrxYI8fNDwHblGsYFiwx0OzeKjmM1F91/WTc3t6kLuPhA0Jpp12v0eB
         TqOw/aIIxY/V9BSUKaTGsV7ck6blDwOrj5Ptd97D1cfaPCnubOaFxvynciBOVO2Cnn1I
         FJgA==
X-Gm-Message-State: AOAM530NNZK6yM2BZKZ77d2zBa3tbYU7qYCFNS1D2yPG2ld7H5DV66xA
	DeVJEAdiMg88ONTMmeJt9YxZ+j8aMrQ=
X-Google-Smtp-Source: 
 ABdhPJyROdEvtUqu5n2j0hQ6kIFoZTpvHFCDMx9bBGAjPedYsSKBAw4Pg+4goQ3Ob/FP+USHdxuRdA==
X-Received: by 2002:a17:906:c145:b0:6f3:9ea7:1d41 with SMTP id
 dp5-20020a170906c14500b006f39ea71d41mr11252121ejc.269.1651500896982;
        Mon, 02 May 2022 07:14:56 -0700 (PDT)
Received: from PC882.demcon.local (77-174-125-73.fixed.kpn.net.
 [77.174.125.73])
        by smtp.gmail.com with ESMTPSA id
 gv1-20020a1709072bc100b006f3ef214dd2sm3650949ejc.56.2022.05.02.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:14:56 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
X-Google-Original-From: Windel Bouwman <windel@windel.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Windel Bouwman <windel@windel.nl>
Subject: [meta-filesystems][PATCH] Add zfs recipe
Date: Mon,  2 May 2022 16:14:41 +0200
Message-Id: <20220502141441.26320-1-windel@windel.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:14:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96929

Signed-off-by: Windel Bouwman <windel@windel.nl>
---
 .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
new file mode 100644
index 000000000..01a64cc95
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -0,0 +1,46 @@
+
+SUMMARY = "OpenZFS on Linux and FreeBSD"
+DESCRIPTION = "OpenZFS on Linux and FreeBSD"
+LICENSE = "CDDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
+HOMEPAGE ="https://github.com/openzfs/zfs"
+
+SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
+
+# Using both 'module' and 'autotools' classes seems a bit odd, they both
+# define a do_compile function.
+# That's why we opt for module-base, also this prevents module splitting.
+inherit module-base pkgconfig autotools
+
+DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
+
+EXTRA_OECONF:append = " \
+    --disable-pyzfs \
+    --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
+    --enable-systemd \
+    --disable-sysvinit \
+    --without-dracutdir \
+    "
+
+do_install:append() {
+    # /usr/share/zfs contains the zfs-tests folder which we do not need:
+    rm -rf ${D}${datadir}/zfs
+
+    rm -rf ${D}${datadir}/initramfs-tools
+}
+
+FILES:${PN} += "\
+    ${base_sbindir}/* \
+    ${base_libdir}/* \
+    ${sysconfdir}/* \
+    ${sbindir}/* \
+    ${bindir}/* \
+    ${libexecdir}/${BPN}/* \
+    ${libdir}/* \
+    "
+
+FILES:${PN}-dev += "\
+    ${prefix}/src/zfs-${PV}/* \
+    ${prefix}/src/spl-${PV}/* \
+    "
-- 
2.25.1


