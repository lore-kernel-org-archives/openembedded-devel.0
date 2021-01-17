Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.21167.1610905010171411586
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hVi5TeCb;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g15so9468380pgu.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NOL4vKJk8FSKkTmJM4b0Pj35Rpj3GxNWlpst4iT0Jzc=;
        b=hVi5TeCb0ER9o8yYXcX6yhsx61YJiBUm5Forr3QRIXxtyujk5dca33UcUZMRO4+M9p
         /itSrmoNCJ6uaVkeb8XE3ok7TiQV/vis245xNFUAUVWDjIs8OuQ1n37tpX+06JNF75FH
         blNTDOHCD2YoZ4hDbdcBGOdo1bs0H9O0b12QDdck7XJt9SI+i6+f4KzJ5Ho+tmGtzw3h
         mEVDdyRg2JJka3/uNbHFepXsymSn5biFzkDxy+Jkg5dnXcutC1G+5SC89WBmPKuooBPm
         l5mW6c1qRRVfGWiGWkNT85D0J6tLtauuHEa2k2XQjWbAjcY8y/38JEqP64U72YfnGyte
         7Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NOL4vKJk8FSKkTmJM4b0Pj35Rpj3GxNWlpst4iT0Jzc=;
        b=ftzwpOhvM+lP4SK6Nr4Mi87667L2ddPo2ma2gmAXiqiwS9k+z4E3SFK5RxAJKSdMST
         hX5oPhchodJD6Bnes0cJolvGcxLGbKDpvwav6kZt1IsdzTPh/hlBnbTxcZXY34481a3l
         XMLQBMPIwqrsJpWT8snLiklG2Ak+CKNNoyxeuxvSnt6BC8CVCbbZALQq4ehKH9FKUKy8
         CcFN82/rSmH/qwyN6dwjERks8KNLiIJ2P4E3pliN2LydeRSTWm4X668uocoWs5V1eGQW
         qYPiqjOrC7bYxvaX+Mo5airho13tsB6I2M5xJRejPe2UtldLj/mmVAYjPXXDGaPD5CeV
         cV5Q==
X-Gm-Message-State: AOAM531Wtg+qFNsqpj77WXi+4Eq5wmAbdaIXkVkPKwl7wJs3DoY4LgAw
	9v3TFm0ITPnPNd6dFr02VGe9akwXlsCbGg==
X-Google-Smtp-Source: ABdhPJwj0x69NiIkmaTCBJbLqD9QKamZL0yXZ5ImJnJnI2U8PQd6mQmpGpppZnu1d/dV+YuoM0PT9Q==
X-Received: by 2002:a62:1981:0:b029:1b7:ec14:e2d9 with SMTP id 123-20020a6219810000b02901b7ec14e2d9mr331944pfz.54.1610905009505;
        Sun, 17 Jan 2021 09:36:49 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:49 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 09/31] ebtables: do not install /etc/ethertypes
Date: Sun, 17 Jan 2021 09:36:14 -0800
Message-Id: <f5324e4cd84e4fc51800fbea6be1b857904142db.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

The /etc/ethertypes is provided by netbase since 6.0[1].
Do not instal the file in ebtables, otherwise there would be a conflict:
Error: Transaction test error:
  file /etc/ethertypes conflicts between attempted installs of netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64

[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af6f068632281f8abd42dd3e3301eddd2b0d3ae4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...kefile-do-not-install-etc-ethertypes.patch | 35 +++++++++++++++++++
 .../ebtables/ebtables_2.0.10-4.bb             |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
new file mode 100644
index 0000000000..65f5938809
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.patch
@@ -0,0 +1,35 @@
+From d3d72c9ca6a0ce2597adb02c786de28268973ccd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 16 Dec 2020 15:49:24 +0800
+Subject: [PATCH] Makefile: do not install /etc/ethertypes
+
+The /etc/ethertypes is provided by netbase since 6.0[1].
+Do not instal the file in ebtables, otherwise there would be a conflict:
+Error: Transaction test error:
+  file /etc/ethertypes conflicts between attempted installs of netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
+
+[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 95651b6..85c5f98 100644
+--- a/Makefile
++++ b/Makefile
+@@ -184,7 +184,7 @@ exec: ebtables ebtables-restore
+ 	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
+ 
+ .PHONY: install
+-install: $(MANDIR)/man8/ebtables.8 $(DESTDIR)$(ETHERTYPESFILE) exec scripts
++install: $(MANDIR)/man8/ebtables.8 exec scripts
+ 	mkdir -p $(DESTDIR)$(LIBDIR)
+ 	install -m 0755 extensions/*.so $(DESTDIR)$(LIBDIR)
+ 	install -m 0755 *.so $(DESTDIR)$(LIBDIR)
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 276784009f..bf523502e1 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "net"
 PR = "r4"
 
-RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "bash netbase"
 
 RRECOMMENDS_${PN} += "kernel-module-ebtables \
     "
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
+           file://0001-Makefile-do-not-install-etc-ethertypes.patch \
            "
 
 SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
-- 
2.17.1

