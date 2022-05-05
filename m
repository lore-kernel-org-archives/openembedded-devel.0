Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3323C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 14:29:07 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.11739.1651760943774310934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 07:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dr/ZTKNS;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id n10so9095289ejk.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KrwYyF9u+5Gh6H1aPRIvzW/XVjZqPx1CWe1UaC7Jjlw=;
        b=Dr/ZTKNSehjQUOXZzPa1N/Z2+ymJMr43MOMUrMMURivdgBvUmw9H+k9Rj8gHsxM396
         QOXJHf0Kz7J7e2WJbjb+b22uc6nAuK8H4CG+k/4lZ7NdJw9xlwrRYlFvzIwzJNUkQNZe
         FvwGf2TJ5phg7Xq9BXAkhAVDW3AF+/uHTK1feccZdJoEJgw6Xxn9w2jk0ME+AWGnmyGz
         MM0DotnX7nNMvWO2YZg8eetle3CzyzSGoj0aLFVzpMamiPAiF4jdi/GiJOAzunpDpZQG
         9VO6OW+7q7eZyYg2AuQBdWVkjbTjePKMsHlgY5XTtdOpg8laSvLonwWdRWZsHIj9oXOK
         +kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KrwYyF9u+5Gh6H1aPRIvzW/XVjZqPx1CWe1UaC7Jjlw=;
        b=il2eG+p12yMd7nU5wc0GLkKBIvO97I2IbUa9aRNfYBu04tRzkXp++SSyB9cuRX37Zc
         lTM+dZ+jJ69HU+QGP6qJif3aL+NY2AR+b0vkYM1TbXY+7XW66r64TVx2G1hZba4Ni/5G
         OrUXSiTEranO/8qdAB0egKApepDSrw/tb++9yqa/X5d0a6u70XKkHXUMQeL4dS7f71+e
         jm/1gLqK8l77xJPIfmMXveX8H6XTqBwJn+ZE7aXeafZkatmppGtIYQBRVexajCi9SfBe
         yt+x07fd7SESb/ylUh8DPau+o3nNa4LgSmcjqTkriPHENc/FKynUzdCAmX0lRaDbFcrA
         kN/g==
X-Gm-Message-State: AOAM533rRWj/rh7bGbGlHQkIlW45cpcgT2pUcZFGB+wqbWM/dqeBTZc3
	liT9R4wKoBbNR8i3nm4WIBxrbGo3irQ=
X-Google-Smtp-Source: 
 ABdhPJztmv8LxpoTRH8U0qlpLVOyRsyCiavMxW7iIo3sdtkMVOANDh3uG4PVGqKuW6nJe0mGOty9xw==
X-Received: by 2002:a17:907:3e86:b0:6f5:917:10cc with SMTP id
 hs6-20020a1709073e8600b006f5091710ccmr1355806ejc.53.1651760942133;
        Thu, 05 May 2022 07:29:02 -0700 (PDT)
Received: from PC882.demcon.local ([77.67.86.210])
        by smtp.gmail.com with ESMTPSA id
 zp15-20020a17090684ef00b006f3ef214e56sm797637ejb.188.2022.05.05.07.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:29:01 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
X-Google-Original-From: Windel Bouwman <windel@windel.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Windel Bouwman <windel@windel.nl>
Subject: [meta-filesystems][PATCH] Add zfs recipe
Date: Thu,  5 May 2022 16:27:49 +0200
Message-Id: <20220505142749.28938-1-windel@windel.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 14:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96960

Signed-off-by: Windel Bouwman <windel@windel.nl>
---
 .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
new file mode 100644
index 000000000..ebe2ec39d
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
+DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
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


