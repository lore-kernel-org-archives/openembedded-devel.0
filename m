Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973B5C6FA90
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.11309.1662276863941981702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DuJcqOwV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q63so5584101pga.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1ITdv9ItFqX40dbxTdg68EWqUkFlnrtWIFm3m4TO1fE=;
        b=DuJcqOwVDfOZlADtdEh5690rTBUCymv4OjVpRJQAT19WZrzjucRoF4Dl/jK3ltzAJ+
         qL5G+6E5VxwAXQrH7jnBRaDEAZNsMUBIc3QOwhEno408xFd3cZvCb0FOOYXFSlr6zk0H
         U59VhbuDh2zc6NrqE6emQx1oRnrFjWhcykJEW1VcdJvKjk6p1R3phrGKXhaQegMlk9aw
         O4Jqxl5ncrd00FJKVF1CRyqcTMV2k0H4YIyMD3lLQDKI83q+66eoO5fJuNxtzSPIVhc4
         ucxysDGi2mmheEmhpwGbUUStH0EWbDPIdjgQR+X1j0loEM9OBDmqirB25YbTOYWEXi0O
         5Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1ITdv9ItFqX40dbxTdg68EWqUkFlnrtWIFm3m4TO1fE=;
        b=rcNUasx7m0+3Gv8AtqLZJeVvtZPpLYABSFit101uYhqyZwU0/AbFiL9G883AC68A9r
         30aAvNt5+eudJOTD2cLw9orHe/pnRN2CSngYEkXv8jaNpCElph+2+yeIkIsrZAq15XWN
         n3pyyOCL83k96/2/1K+2FLRfg19PNkuZ736BmfjtxGVwWXBk5jYujzREJqK24XMZmxri
         fbbiT+Cy/I21SnRBBAzsUfx4bdvR+XW9NoOp612/EiROu3CLSePdWK/dPyuQtebMQVKI
         62bW+B98OZipRueTWkANHyy+fmpE/AsJLtX6VBzCnaHJXjQyCHIqJAI4F1rzeEPOuTOC
         k85A==
X-Gm-Message-State: ACgBeo0Ln+OgIA6nBy8b1T87YJnwAKkBBJcp/Zq2KXKfjku2WyG7n8yx
	RqhiIdGoPDpR61DRim5Gz2J2W1y7cOyy9w==
X-Google-Smtp-Source: 
 AA6agR6G/jXCju9/O3lTPUt8OzBY9uX9C/zsOdqynsiyjXTz8wHOlPZ/7b4wWB7ZpVJitzeQSGZ5Xw==
X-Received: by 2002:a63:6ac8:0:b0:42a:3638:86ac with SMTP id
 f191-20020a636ac8000000b0042a363886acmr36768735pgc.582.1662276881466;
        Sun, 04 Sep 2022 00:34:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 20/63] epeg: Fix AC_CHECK_LIB for libjpeg and libexif
Date: Sun,  4 Sep 2022 00:33:34 -0700
Message-Id: <20220904073417.3251865-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98614

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Fix-checks-for-libjpeg-and-libexif.patch | 32 +++++++++++++++++++
 meta-oe/recipes-support/epeg/epeg_git.bb      |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch

diff --git a/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch b/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
new file mode 100644
index 0000000000..1568fe96e1
--- /dev/null
+++ b/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
@@ -0,0 +1,32 @@
+From 4e0c62634b0db6dbad0d41377bb71a8012abd75b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 12:56:54 -0700
+Subject: [PATCH] configure: Fix checks for libjpeg and libexif
+
+Use the functions from the respective library instead of using main
+function which is not part of library
+
+Upstream-Status: Submitted [https://github.com/mattes/epeg/pull/27]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a4f6ebd..e474b1d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,8 +31,8 @@ AC_SUBST(version_info)
+ dnl AC_CHECK_FUNCS(fmemopen)
+ dnl AC_CHECK_FUNCS(open_memstream)
+ 
+-AC_CHECK_LIB([jpeg], [main], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
+-AC_CHECK_LIB([exif], [main], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
++AC_CHECK_LIB([jpeg], [jpeg_simple_progression], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
++AC_CHECK_LIB([exif], [exif_data_new_from_file], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
+ 
+ my_includes=""
+ my_libs="-ljpeg -lexif"
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
index bdffe4ba78..e5277b1579 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7732a9290ea1e4b034fdc15cf49968d \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
 DEPENDS = "jpeg libexif"
 
-SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https \
+           file://0001-configure-Fix-checks-for-libjpeg-and-libexif.patch \
+           "
 SRCREV = "9a175cd67eaa61fe45413d8da82da72936567047"
 S = "${WORKDIR}/git"
 
-- 
2.37.3


