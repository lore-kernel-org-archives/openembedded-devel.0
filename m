Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F16FC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 14:01:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.12423.1718373670814610544
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 07:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9z9bCti;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6559668e1so19501175ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718373670; x=1718978470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRZrhH4SrEU6WXg5Hv3eKQl7QrsoFd4hO9+wZAfwbps=;
        b=D9z9bCtid5NprA/6zivOj3GlxDX1eykOU4nLG2V/GtihbMl9KzfAKX0nI7Q+A4jpxT
         WJemgckQrhwgQgHHt5h02i6oHa8hVMntWq1WVoywEcHWR53vrqoffaqv6/dF2K3rvLzM
         oX4hIHm59G3QJzPt1Br14hnGGvMAEY2AAQ9b6bevZsFOct6vlnSLkE5K4qtDX5K7KjtS
         YyrpTnkxZ06B3xwWxG7prCf+YEP6i2RTqYNZqilmu2nC272PwTQULQdS3pQs5aMqNJE4
         IkW94Puya6t0l/NzVJXvukNW5y/P1DG4L58xPvIG7jQlINRGqJ6hGgxk/vw1U61Z7LHb
         1D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373670; x=1718978470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRZrhH4SrEU6WXg5Hv3eKQl7QrsoFd4hO9+wZAfwbps=;
        b=IGvz52hwRPQBCJpio+0B/LbOLlnrbkKYFUqxpUu7zEXaGknuLOv6PMeZnbKlqNT1HB
         tSPkqyG7/HUgc9rdZ+blCDW+VMEKn6ICTSQFVo+WEHVn03zCpKyFoP4LH7wFrWsaCNSv
         qX1kMfG35kTfuR88CwrEvOsfisuPbc6y/g+kzTUYiSstbs8QIKgbB5EKZhbZfW7FAO3o
         2IT8f99PVvwaxXCYj4IqISSJJaXcz7N+YpWyJQbIC0j/+fN+z6CdQHbSGsq/Bl9VbiJl
         0ka8au3z8/kt2r8QB75En7kR5iM0KHwBLC6S7Beo3pwLwfK4wxSsZfbXrk6PUUpKWWnm
         CE0w==
X-Gm-Message-State: AOJu0Yx1SJQQsRsZXrUsaa9a1DxSTh7mBKk9Nr8Nw5oTjrLaQxWzEqNf
	8IKAtLuGTOfMe3pgeMDmufhmq+FbqYiNIMPwh/n4/jNS1PhP7b2rDM+/wM4=
X-Google-Smtp-Source: AGHT+IHKb6fuVNlUktFsafbdhGMRWbDV+n5MVkwlkIq04rz/dxTC7k/r6b/Kq+k3Qput+L4BKBjxTQ==
X-Received: by 2002:a17:902:ead2:b0:1f7:2703:20b9 with SMTP id d9443c01a7336-1f8629fe882mr24455455ad.42.1718373667843;
        Fri, 14 Jun 2024 07:01:07 -0700 (PDT)
Received: from L-17494.kpit.com ([103.146.224.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1ad10sm32330785ad.239.2024.06.14.07.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:01:07 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bindu.bhabu@kpit.com
Cc: Nikhil R <nikhil.r@kpit.com>,
	Bhabu Bindu <bhabubindu@kpit.com>
Subject: [oe][meta-oe][scarthgap][PATCH] giflib: upgrade to version 5.2.2
Date: Fri, 14 Jun 2024 19:31:01 +0530
Message-Id: <20240614140101.641467-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 14:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110909

Upgrade to latest version giflib v5.2.2.

This version fixes bugs listed in link below:
Link: https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS

Fixes for CVE-2023-48161, CVE-2022-28506, CVE-2023-39742
Link: https://clients.neighbourhood.ie/yocto/1-40.html#:~:text=CVE%2D2023%2D39742%3A%20giflib%3Agiflib%2Dnative

Added dependency on ImageMagick which includes "convert" utility,
to ensure availability of required tool during compilation process.

Add patch to rename binary used in Makefile from
"convert" to "convert.im7" as installed by imagemagick package.

Signed-off-by: Bhabu Bindu <bhabubindu@kpit.com>
---
 ...x_to_convert_binary_used_in_Makefile.patch | 42 +++++++++++++++++++
 .../{giflib_5.2.1.bb => giflib_5.2.2.bb}      |  9 ++--
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb => giflib_5.2.2.bb} (65%)

diff --git a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
new file mode 100644
index 000000000..a01b28ac6
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
@@ -0,0 +1,42 @@
+Subject: Modify binary name "convert" to "convert.im7"
+
+The change is needed to resolve the below compilation error
+after giflib version upgrade. Log data follows:
+| DEBUG: Executing shell function do_compile
+| NOTE: make -j 8
+| make -C doc
+| make[1]: Entering directory '../giflib/5.2.2/giflib-5.2.2/doc'
+| convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
+| make[1]: convert: No such file or directory
+| make[1]: *** [Makefile:46: giflib-logo.gif] Error 127
+| make[1]: Leaving directory '../giflib/5.2.2/giflib-5.2.2/doc'
+| make: *** [Makefile:93: all] Error 2
+| ERROR: oe_runmake failed
+
+Added dependency on ImageMagick which includes "convert" utility,
+to ensure availability of required tool during compilation process.
+
+This patch updates the binary name used in Makefile from
+"convert" to "convert.im7" for resizing the logo image used in HTML
+documentation as Imagemagick installs binary in this format.
+
+Below commits justify the cause of adding the suffix to binaries
+provided by ImageMagic package:
+https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=dcbb49f707e7ad9bf755dd3275ffc442154b8144
+https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/imagemagick?id=6e0c24e9b3f9d430dec57f61f8c12c74bca5375d
+
+Signed-off-by:   Bhabu Bindu <bhabubindu@kpit.com>
+Upstream-Status: Inappropriate [OE specific]
+
+===================================================================
+--- a/doc/Makefile
++++ b/doc/Makefile
+@@ -43,7 +43,7 @@
+ 
+ # Logo image file for HTML docs
+ giflib-logo.gif: ../pic/gifgrid.gif
+-	convert $^ -resize 50x50 $@
++	convert.im7 $^ -resize 50x50 $@
+ 
+ # Philosophical choice: the website gets the internal manual pages
+ allhtml: $(XMLALL:.xml=.html) giflib-logo.gif
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
similarity index 65%
rename from meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 79afe9a70..7d8a175fe 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -5,10 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
 CVE_PRODUCT = "giflib_project:giflib"
 
-DEPENDS = "xmlto-native"
+DEPENDS = "xmlto-native imagemagick-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
+           file://add_suffix_to_convert_binary_used_in_Makefile.patch"
+
+SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
-SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
 
 do_install() {
     # using autotools's default will end up in /usr/local
-- 
2.25.1


