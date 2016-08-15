Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F121770EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so10341002wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6XDLEB86aq672N09sPaNXfByp/TpblNHlDZ0XifojS8=;
	b=UJQRDKlzoNYxhOpC/h6gJkXXmB2cyRix/wR5xRAvT2gL4Yv+vEve3vMo+C9imf89ak
	vI64r63nXPy+O0SdyeJNpeZn4iOPwQOo1/R8hydBLDhFiieKTxZxnFR10X9OqQGuiiab
	KheiCK6Q3GmfVEgfbeCA75Scsjhtw0rbNKWeLe7lsixXFA4d/QGQ2/mZ4n8vz8uvYlZ2
	ShY4XJorB3h6WST6/bwJHgsQ79ml3mQ77yIcKnK8oSCztW1EP8Qe5joYaIY6QvZA3jUq
	eidlkmFFZ1Luuw6F8AFbkuahEzJBbEWEaXv16KV8KMTZL2fNv8Tpe5+g9pC2n55DVONb
	2VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6XDLEB86aq672N09sPaNXfByp/TpblNHlDZ0XifojS8=;
	b=LiVIlomcxEVOhyV98gk8xHMGMPq1V+vlIB4t2bBeFqHShY4GnK6y0iWj0sP8b8sBoq
	6B6qZH3FcZsq86fLb7LTx3rx01rs9KAxM1NSoI8Yuj85HzORfIKsXJ9Th1WhgkQsG2k5
	1+i/QgiR6udcS4NaLeUfNg0yCDhdZrRBwQXldEsbdwkBvg4tm0UcGXGXCi6L10/yLOR0
	m+C6s1wXr7Uzkcsq9c5nuIaNyY5a4wBl8Ltsv5Gx4Zuxo3+er5K0zyg4jGruLb039bn+
	DdphyY7w3rXPesVHSKU+AiC2rysPm+28umiovr26vEj9JYHP2NJBQdbP5k2e+k/F77y3
	GKTA==
X-Gm-Message-State: AEkoouvVNEK1Fk4R89S1z9mMJF1zjOARELoj7DwDaNzzGiEymZ3RPiUMb005QzTBkOh8jA==
X-Received: by 10.28.198.6 with SMTP id w6mr14971933wmf.63.1471256456169;
	Mon, 15 Aug 2016 03:20:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm20722456wjc.49.2016.08.15.03.20.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:42 +0200
Message-Id: <20160815102049.3291-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/11] gegl: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:20:56 -0000

* fixes:
  | ../gegl-0.3.4/configure: line 18668: syntax error near unexpected token `0.40.1'
  | ../gegl-0.3.4/configure: line 18668: `IT_PROG_INTLTOOL(0.40.1)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
index 15c1b64..9de8489 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib"
+DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib intltool-native"
 
 EXTRA_OECONF = "--disable-docs"
 
-- 
2.9.2


