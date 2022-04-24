Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6387C47087
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13952.1650769816545976081
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KBTtmJjB;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id q3so19609430plg.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJIjRHedlnz5ee6Ho0VIU/N05OtM6PSbErHA0s1Oln4=;
        b=KBTtmJjBUiY7FsJs93O8IjC/RVbyYNGLtigeJvx6hQ+E9QcwXBWmBrIAYm41HeFFRG
         maQ3Eyo3D+13XOx+FMPZsIM0blkALD058GIizna5ZC2j0FYIRfYC7Ts3HtWuS2itp0YR
         thEC4Qarxy3kqlW0XvmOx3m8KjoLVA6Dmq05GHDmnkpkMOJshNL3Jy9Lnf6f8BZ5c3E4
         Dj7P//kGet3+uWaoVpeVv5RWemwDHAqwcdoV2fFiXrvgjiH/XoPuwQag1sJS4NUwEE/R
         IIJojnOTdS9KJDVl75flpEnTnjuEicRX/G/IADJuwrr9sEVV8CKlsLjbSdtQ2U1D+i4R
         cdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJIjRHedlnz5ee6Ho0VIU/N05OtM6PSbErHA0s1Oln4=;
        b=xOYdzRQb/J+jzZAJUDTbYPxCoZYsKK8VP8Wj5NpmnVdVFfoPsvlFYbnqigY/kYxYgj
         daEykMx14i6glDTMoAF06VAL/T3fgMG9DqTd7Jr+tBqswsejO+k/uKoDJ7mgiCf7oXPh
         m9nE47xP5SoqAj2LzHCzZN89jssAR6Wu6dH9/tL97SVMyk40F/kuZH9xxSbMUkSt/Rsb
         v7EB3sF9C3QmYP6poVYqZwKqyto/9gpK4YNpQb7AI8vE5ZfvZ66CetFFPQ/vxb6nLWR1
         0R72up3W2npJVaBVQNs78A7/SmjapyVJaINjJMF1ti3S5scB2th38yIMM3uoMA4XAnQH
         +GUA==
X-Gm-Message-State: AOAM530yGBxKbCQ9PfnYIl6ctaR6/q74t/bmZB/6n33hfedH4tbskcvj
	m1J4xh2JL0g/BQQqVjdhzYnQyl2MMKKDIA==
X-Google-Smtp-Source: 
 ABdhPJy4WidQqgny3lAQiVfRa3OROAO/89nkWjT4kHp4G+Si1Tvkpe0cbzX2WcbqKwkkCs6S3u9uWA==
X-Received: by 2002:a17:902:b10f:b0:156:612f:318d with SMTP id
 q15-20020a170902b10f00b00156612f318dmr11720202plr.143.1650769815922;
        Sat, 23 Apr 2022 20:10:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/12] linux-atm: Add knob to root prefix
Date: Sat, 23 Apr 2022 20:10:03 -0700
Message-Id: <20220424031004.3209576-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96748

Fixes build with usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux-atm/0001-make-Add-PREFIX-knob.patch | 31 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  7 ++---
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
new file mode 100644
index 0000000000..9c83ef0af4
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
@@ -0,0 +1,31 @@
+From 94cb952207e44a5c29578c9c56912190a5422876 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 09:41:51 -0700
+Subject: [PATCH] make: Add PREFIX knob
+
+This will be used to pass appropriate root prefix which is different
+when using usrmerge
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/extra/Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/src/extra/Makefile.am
++++ b/src/extra/Makefile.am
+@@ -8,10 +8,10 @@ BUILT_SOURCES = pca200e.bin pca200e_ecd.
+ CLEANFILES = pca200e.bin pca200e_ecd.bin2 sba200e_ecd.bin2
+ 
+ install-exec-hook:
+-	$(MKDIR_P) $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
++	$(MKDIR_P) $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
+ 
+ %.bin %.bin2: %.data
+ 	objcopy -Iihex $< -Obinary $@.gz
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index effd7502ff..bb79b78568 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -13,11 +13,11 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
            file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
+           file://0001-make-Add-PREFIX-knob.patch \
 "
 
 SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
 
-SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
 SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
 
 LIC_FILES_CHKSUM = "\
@@ -27,7 +27,6 @@ file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
 
 inherit autotools pkgconfig
 
-# The firmware is explicitly put under /lib when installed.
-#
+EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"
 
-FILES:${PN} += "/lib/firmware"
+FILES:${PN} += "${nonarch_base_libdir}/firmware"
-- 
2.36.0


