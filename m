Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6DFC433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:57:45 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.6757.1651820254205579905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WeSqR67Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id a21so7651899edb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OPyMQ9ZoaXud0w68m8fbnpUNmGLx9EQAF0mrVAlJDLk=;
        b=WeSqR67Z54fOIz5SMcVuD4tg2YQy8s///7zn3kh3XIGs5T4B+CuZTFhGwyRpKDwxK1
         FPMviCpD0a189vHjrcjrN/xOk12tRQX3tgtm60xOGFRtsBK2O5YhU6U9/0PJ9viYgmby
         7xT6UsDATYe6IYrH0+N4d2+c/pUltIA5WGpOPUOWIEPsCkGs0JQNVC643aWM8EVecCrv
         2IyAeVMVi0rNJVf2GX+8RWhlQ9BH2VsBd4ldtGH0qypU/nkEmXVAig2ylPPWxal7mtxL
         Wya3p+zFt6A+FlONW6jwlpZwYKrhXlzT3J9lsj4rfKd1ZFjtiZ8smmW3o8Xl3d2iuq1O
         lcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OPyMQ9ZoaXud0w68m8fbnpUNmGLx9EQAF0mrVAlJDLk=;
        b=rX7BSpZMESts+6ChOnLh1rsbEZ9CwWy/qBL2QtRTTcqNV8pAYnc+n2ntjVtz24FuiN
         grHQNa6F3+S8IiKQV/Y6oc/mhqaO+EyoJlvALBfdWB3DoWJnjgAkFBFSbWeAJwPFPuv9
         Xl8rQGrgGg7ER+t9WpBf0UNfhDnW1dPGG6VSWt+vIUQxj8i2JqKX3g/M/5PT+yGsdSrO
         fKZ8RVYMz2LtfIBSb/bQWSMJGjf5GqEyEZIAXwOyD8lW8iB4h6qSe/QlGz/sT61B+mYY
         xs4T0Nd15+cXW6+pmd/OiNxlJjnnp2R21sVkqiqkvUbG7C2k++ULLKVLUyY6e6b1GYfs
         3eAQ==
X-Gm-Message-State: AOAM532BeUS+QRePSAjw8uTXPsDwJyHi/QNLTs0mP2KKPrRl/3RNyK0Z
	4IXF/FIWVpbKZ30gZ3Gk7Cy+ZIb/qYo=
X-Google-Smtp-Source: 
 ABdhPJyUfz+Cbc58Zk1FEsNyhqQEJPN/UcZXYfAbZOlYt7Tme/SVx4uldQ7M94q56d5PfXsqFk6SFA==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr2041225edc.232.1651820252613;
        Thu, 05 May 2022 23:57:32 -0700 (PDT)
Received: from PC882.demcon.local ([77.67.86.210])
        by smtp.gmail.com with ESMTPSA id
 u17-20020a170906781100b006f3ef214dacsm1630216ejm.18.2022.05.05.23.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 23:57:32 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
X-Google-Original-From: Windel Bouwman <windel@windel.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Windel Bouwman <windel@windel.nl>
Subject: [meta-filesystems][PATCH] Add zfs recipe
Date: Fri,  6 May 2022 08:55:12 +0200
Message-Id: <20220506065512.18959-1-windel@windel.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 06:57:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96971

Signed-off-by: Windel Bouwman <windel@windel.nl>
---
 .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
new file mode 100644
index 000000000..072af7901
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -0,0 +1,54 @@
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
+DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl curl"
+
+PACKAGECONFIG[pam] = "--enable-pam --with-pamconfigsdir=${datadir}/pam-configs --with-pammoduledir=${libdir}/security, --disable-pam"
+
+EXTRA_OECONF:append = " \
+    --disable-pyzfs \
+    --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
+    --with-mounthelperdir=${base_sbin} \
+    --with-udevdir=${base_libdir}/udev \
+    --enable-systemd \
+    --disable-sysvinit \
+    --without-dracutdir \
+    "
+
+EXTRA_OEMAKE:append = " \
+    INSTALL_MOD_PATH=${D}${root_prefix} \
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


