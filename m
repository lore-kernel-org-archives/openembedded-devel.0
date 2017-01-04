Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB2A71987
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 01:27:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so50921186wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 17:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QgzrCC2olezYWTIVJdFdAedZzWB+d1ea8vq0l8Ewt7Y=;
	b=jOTi/db5QsteDp3/yFgoflkxGg+Z6XI/jgzx8Tb29z87q8pK3cWFqfGO3SQB9vynM8
	JTsyI0YfEKluLjBPKnI3P+XjgMpxGonZExcoM1byeA8uW/wWma3OpNtd5RxTj43u+zDE
	5M77L9BCFQ5v6sN/e+O6lKBCpgSUdd4o0RKYV0pP67RkNwu50Q033qKuhjzMDhSf6SET
	Q83W60TKXWn5ri3uCLCfzLRakg/UX6AbpKop4sPtJW7R/vbKMsNAc/suYJ1MYzCQfBfo
	NkCRy084/LWs5YV5kq86wR9WPSVMkxcME0MYhCDlidUiwTUu8jah2ka/SCVWYDOPUCz7
	UT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QgzrCC2olezYWTIVJdFdAedZzWB+d1ea8vq0l8Ewt7Y=;
	b=H+N+kZzklURQvDeiW7/IiUMfooy8WJCO47Xqr7Znm6Drb6Xg0bfTit9UegHJt3t5q3
	AmQhjolDh1yPUD+H+h9SlG6nYDzo39QDasAYfl6qjtixXaKlOf6OzlMZYgmThB0c7kUJ
	HtiZPLlFG/8Koze6UddtsO93fTVkLAKbClyKJQMH9OAcXb8/5vsyxe1WiyLZ6oI4im0a
	HaIF7uhTzlMoVkb5PzvZ7j80cPkmlMkmTUusunu6iCAF+afuGFBQ4MJsxMRGpC1aIx/B
	ni4o2cwU1aed/ahC0jXoDupUe0D5lUTw94b1LxSLAU9O1TQVYaom3HCdvauotdyztKAF
	3fHg==
X-Gm-Message-State: AIkVDXJQl+iWeCLyPKtxfAlvTRMpLNv6VAgnzir/ws3bKXofzHFkM99EVlbV5Wmxy1bhnw==
X-Received: by 10.28.139.131 with SMTP id n125mr56505217wmd.116.1483493257921; 
	Tue, 03 Jan 2017 17:27:37 -0800 (PST)
Received: from localhost.localdomain (p579CE4CA.dip0.t-ipconnect.de.
	[87.156.228.202]) by smtp.googlemail.com with ESMTPSA id
	i15sm95427825wjs.16.2017.01.03.17.27.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 17:27:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 02:27:23 +0100
Message-Id: <1483493243-30984-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 2/2] raptor2: initial add 2.0.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2017 01:27:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is it in meta-office for a while. Now I need it in meta-qt5-extra too
* LICENSE.txt summarizes all licenses and explains that ot is user's choice
  which one to use

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-do-additional-checks-on-libxml2-also-wh.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  | 25 ++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb

diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
new file mode 100644
index 0000000..7faeb13
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
@@ -0,0 +1,34 @@
+From 3f97aac5a1f43ef57b02fb9ccdcadd41a6b69fa9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 27 Oct 2015 10:21:24 +0100
+Subject: [PATCH] configure.ac: do additional checks on libxml2 also when
+ detected by pkg-config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Applied [1]
+
+[1] https://github.com/dajobe/raptor/pull/33
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 10ff870..35fa08e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -601,7 +601,7 @@ have_libxml=0
+ need_libxml=0
+ 
+ oCPPFLAGS="$CPPFLAGS"
+-if test "X$XML_CONFIG" != X; then
++if test "X$libxml_source" != X; then
+   CPPFLAGS="$LIBXML_CFLAGS $CPPFLAGS"
+   LIBS="$LIBS $LIBXML_LIBS"
+   AC_CHECK_FUNC(xmlCreatePushParserCtxt, have_xmlCreatePushParserCtxt=yes, have_xmlCreatePushParserCtxt=no)
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
new file mode 100644
index 0000000..8c6d008
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Library for parsing and serializing RDF syntaxes"
+LICENSE = "GPLv2 | LGPLv2.1 | Apache-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.txt;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://LICENSE-2.0.txt;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = "libxml2 libxslt curl yajl"
+
+SRC_URI = " \
+    http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
+    file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
+"
+SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
+SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " \
+    --without-xml2-config \
+    --without-curl-config \
+    --without-xslt-config \
+"
-- 
2.5.5


