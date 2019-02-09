Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 57DE47C5C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Feb 2019 19:04:55 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j18so3236829pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2019 11:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2+k5+z53UV7eDGN3z5MogCivHokon5L/+QcYWnkk9D8=;
	b=T7a3x+4A1MwqL0SkKwcPQbjqpB5SZN5DZGgHZ4J2tgW0jgButBib99wC1W0K6CkuBl
	P65LggvLACroFzfTxl6i7hDtXlf2t5Ho+krQek0qjVuB5enkwcl/bQiBo3qKt70PZLh/
	5ocWFDzNdp9YsegDxG+o0o+uU9UTHmCNCjK8IZqKIBRaPHzuDyfu3n08C/B0ay+SnznG
	cSU4tvxqvtZZYaQGW1O/WcUXj2TZFx9UDHOzMOSG8htrpCr2uUQ8DnshUbDkNEM/0sBj
	EZAoRuJml1oMkXgOB7DynkILNH3B/+ZfjLpumbAs6xQ7hNOH6uRf/6oXpMlDm84JHBg+
	ebMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2+k5+z53UV7eDGN3z5MogCivHokon5L/+QcYWnkk9D8=;
	b=GCebFNKi55fZiVsgjjeDsRASXGf5MyyFDd/l/acImtGSIkbnp82A1oS7dPIqSLcm97
	l1V8hphHDmSRWYlRBwfPWUajvcU5V44H0suaDX9uA0+WJ/u/0BG2oOecwivVPcN3zUwf
	zVKrf4l6wRIqVPfQvYRsCvovGsq31d7aqrHStdI4T8OazmU6PsiUnJgONcXUFtwYK4j9
	syYCaZZ6Y1Q7Ez5Cm77Q0gPNEDHeyUIrmtq1eTcsD5HwxOh5LFbd2PAFHqnhnvLPvpZI
	YNCKIws7/GdNH9jhlGwjGw0Hwju6DBGapeuOtm7A8RCBof6JeTy9o0jLk+MDE5Gcv3aD
	vNrA==
X-Gm-Message-State: AHQUAuZ2KTVAenfXRuXl+vA5k/zPoXK++8PEZKjuitxsZG9mxyS+EFSm
	zBF1qcpVt193Q5x8snE4ptaQwHcj
X-Google-Smtp-Source: AHgI3IYF7rRCrq6aPbzRGwD2xZkPj2fBl93LOboHYeAy1hTj/AqldjXbP3ellQAbCgQgIsDuuVDm3A==
X-Received: by 2002:a62:f517:: with SMTP id n23mr226828pfh.209.1549739095888; 
	Sat, 09 Feb 2019 11:04:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	e21sm27709493pfh.45.2019.02.09.11.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 11:04:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Feb 2019 11:04:47 -0800
Message-Id: <20190209190447.23092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190209190447.23092-1-raj.khem@gmail.com>
References: <20190209190447.23092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] ftgl: Fix build errors with clang
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
X-List-Received-Date: Sat, 09 Feb 2019 19:04:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-to-avoid-implicit-double-to-float-.patch | 38 +++++++++++++++++++
 .../recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch
new file mode 100644
index 0000000000..385bff8dd1
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch
@@ -0,0 +1,38 @@
+From e3bce98a60d6db3b719bbf5d71f732f9b86cb566 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Feb 2019 08:28:09 -0800
+Subject: [PATCH] Explicit typecast to avoid implicit double to float
+ conversion
+
+fixes compile errors e.g.
+
+../../ftgl-2.1.3~rc5/demo/simple.cpp:110:27: error: non-constant-expression cannot be narrowed from type 'double' to
+      'float' in initializer list [-Wc++11-narrowing]
+                          (t3 + 2.0) / 3, 0.3 };
+                          ^~~~~~~~~~~~~~
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ demo/simple.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/demo/simple.cpp b/demo/simple.cpp
+index 532e862..aba55b4 100644
+--- a/demo/simple.cpp
++++ b/demo/simple.cpp
+@@ -105,9 +105,9 @@ static void RenderScene(void)
+     float t2 = sin(n / 50 + 1);
+     float t3 = sin(n / 30 + 2);
+ 
+-    float ambient[4]  = { (t1 + 2.0) / 3,
+-                          (t2 + 2.0) / 3,
+-                          (t3 + 2.0) / 3, 0.3 };
++    float ambient[4]  = { float(t1 + 2.0) / 3,
++                          float(t2 + 2.0) / 3,
++                          float(t3 + 2.0) / 3, 0.3 };
+     float diffuse[4]  = { 1.0, 0.9, 0.9, 1.0 };
+     float specular[4] = { 1.0, 0.7, 0.7, 1.0 };
+     float position[4] = { 100.0, 100.0, 0.0, 1.0 };
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
index 4af3803f1a..b2911595cc 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-use-pkg-config-to-find-freetype2.patch \
     file://0002-Makefile.am-remove-useless-and-breaking-code.patch \
+    file://0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch \
 "
 SRC_URI[md5sum] = "c7879018cde844059495b3029b0b6503"
 SRC_URI[sha256sum] = "521ff7bd62c459ff5372e269c223e2a6107a6a99a36afdc2ae634a973af70c59"
-- 
2.20.1


