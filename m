Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5E156FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 17:02:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so49267419wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 09:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tdOYqZadrjBU0Wa6fTWUk1vhsrEpmnn6ecWvk7JSHns=;
	b=eCKr3YgAtvpmr6srGMQOfZl6T3d2G2FoabZrfGuxOgCNXwugnfNGH88yaLKYr7YSO6
	5mur1YrCOzNFXFrlvOzWoBLSDSukzjGVHy+JQgBbG8YpZC4VN1YSCznVNF0ozwamOUS6
	Bu8vEkd5jrWhXjOmkye0pVAdfJ1HHFNeoEjjPLUEu4DniXY1UdBhRpAcVDH80lwBJfFx
	99UCz9mSk930/GFj+GFROAWjU2s/uKU6paZrXLG7s2DnviQi9aXaJsWnUDNih0yWbZP0
	/9OmhX2cjZWFOLGy6CPKwMCgutROY0KQnGVjnXAaDGZaHOeigWeSEqJZzNpBJM5CvQUg
	x9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tdOYqZadrjBU0Wa6fTWUk1vhsrEpmnn6ecWvk7JSHns=;
	b=YgnkwE7YsiPQwol/Ux3IHKe2tUaDnTf08oN6hXDtvbpikjJVd5MDGhf+dRuoRWcI/Q
	jEMHt0OhcXVYsVkmPFR+2flyBYUj0tX/O83cXrnv5w+mEJjIujqlp8ube7H6zej4+mss
	7vrKx+9N9E/5vU4FcRWQ7YFFPDGxL75oKsWg1kIcEqaI6o+ovokr/nWKOra7HDd6AYvN
	TFtDigRlQmVjdvH8MWT41VD7IR+6Qe4H9+48D0xkxQG2a3ejlHqcU/Gsp8Mgay2OkWKm
	BO1aduAyf6JvK/JSpH/rFvNvBOsLS0+o99FvdSQkH7LeEHfz71+yR5cH14aUGHSlo63v
	OyUw==
X-Gm-Message-State: AIkVDXI0Eucsn1A11nj9FrqzfxspD+DBVF6mLo/ZCOL7qq5CmbVdaXZHg2ea89kOikn9LQ==
X-Received: by 10.28.23.137 with SMTP id 131mr52970452wmx.121.1483462927299;
	Tue, 03 Jan 2017 09:02:07 -0800 (PST)
Received: from localhost.localdomain (p579CE4CA.dip0.t-ipconnect.de.
	[87.156.228.202]) by smtp.googlemail.com with ESMTPSA id
	kq6sm60398452wjc.7.2017.01.03.09.02.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 09:02:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2017 18:01:50 +0100
Message-Id: <1483462910-24912-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483462910-24912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483462910-24912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] raptor2: initial add 2.0.15
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
X-List-Received-Date: Tue, 03 Jan 2017 17:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is it in meta-office for a while. Now I need it in meta-qt5-extra too.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-do-additional-checks-on-libxml2-also-wh.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  | 23 +++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb

diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
new file mode 100644
index 0000000..ee3a033
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
+Upstream-Status: Submitted [1]
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
index 0000000..1f5f8de
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Library for parsing and serializing RDF syntaxes"
+LICENSE = "GPLv2 | LGPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
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


