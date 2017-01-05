Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5ABB71B2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:09:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l2so84063wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R3jPJLjR6h3gvxNTdCFcazA2J8X7NSpgl5ckAEJMM+U=;
	b=FH3Gt+mCDwxeazdQV1hdCVHgYr1AJOZ+OFVdtZmBMhYyQCxr1OKXwPtD7soJ83TIaI
	kxA/C6JGOP2IckfcZCYG25eMMIL84Bl4RUdcAOaRJ7tfJvAFu2/b2rvusdHpQx0zQmnS
	AFG0+IaaFju4/WkNj0rhWa/DjibCplJTyl1r6YFv2TJZeRU7NYWiwI7WV7eVzF4pBOYh
	e1vUFkrwlIFLVBKf5pcuduEf/7J5lza5wNFfJAb5PMXGELkvWzZHZbE+Fq5EkyU6LxH6
	qmXItd4xU0bGpfluJZ1TtNmeCFicvp3HRMxNung4xRAL9XO/fZsHQUN6T+fTliQzwPun
	0g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R3jPJLjR6h3gvxNTdCFcazA2J8X7NSpgl5ckAEJMM+U=;
	b=eRKuHISt7XqQxIS3WuLdAF3kp8jCmZf7EDffnsAbMjshTWKV+/lA03jlHrZgZ/+e9F
	xAg9s11jwhGPNMKRkwDNHIV8BvCK+GAuYHUW5ryKGPe6oqW8H13plYKfVUTtyF2mG3mS
	eOcM6irlniYm1fxtqNe3aDMBpy3vd9yyyvVaAXst9j8ccAwpus70IeyhZv2N/zXQJkUS
	Z4WNsodQJ8Uy1feCTVppD22NGyQamQ+uBhJ0OENorzalLKH9Jf9QBtaaraVbapwtjsjw
	0RkB0YpUV6sb9IzAw9b2x+BxIpDaogtzhqa9Vjhu2Iwlq+qcroZdOcmM0/ohMTaEOKYV
	XnYw==
X-Gm-Message-State: AIkVDXIEhKlW8l5FAiWtljQ4fFmfjTh71EuaF0zI4sKqXK4rMrRZ5PVrUGbqBLvs0SfeQQ==
X-Received: by 10.28.60.5 with SMTP id j5mr69531051wma.119.1483646979118;
	Thu, 05 Jan 2017 12:09:39 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm61557wmw.7.2017.01.05.12.09.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 12:09:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 21:09:26 +0100
Message-Id: <1483646966-4946-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH V3] raptor2: initial add 2.0.15
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
X-List-Received-Date: Thu, 05 Jan 2017 20:09:41 -0000
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
index 0000000..dd00c14
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Library for parsing and serializing RDF syntaxes"
+LICENSE = "GPLv2 | LGPLv2.1 | Apache-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.txt;md5=b840e5ae3aeb897f45b473341348cd9c \
+    file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
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


