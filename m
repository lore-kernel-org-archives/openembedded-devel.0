Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 734806FF56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2016 23:45:05 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so17272168pfr.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2016 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=brmYkshtXI1abSNtPZFYA1rIC9fBWqOe+j6waZ3bWio=;
	b=0Zo78cGLOYDPGTOp8pmDUSlIuluDDSpUE3gpt16mEq/0dQTrimYyBTwBieogoSt5hF
	Na/FjtEPOPAACaz7CVJV4UkFTTmFTSct+dvNWS0WP+BKeAIDEin2L2HO+NpNHz2x+79h
	lJMRgN6INAzO36gl+qTSYlZ85o2kOPAHEc5+hvlH3oaxHno2POwkuWm55DaFikkNELrN
	eKF9kqkHgMbW94uAggBLUGdq5XfnzK4uyhcJ+reAlvFsFasUAFUJy3zj+X8UAXPpoN2C
	QOR1wxwzsjTBUyc4EppX5QnOElmxUetJ4UyWVqaagq49Nhud47yu3BO/ZzcD8gSMzS7Z
	Lclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=brmYkshtXI1abSNtPZFYA1rIC9fBWqOe+j6waZ3bWio=;
	b=R5h0HFck0ypGcN0j2R7jLp3uad5R8o+860M7BmXDtpG0S15UaNvTdflzYdWP+fioNr
	2+VULa//3+nl4Ck3M0fyj4CUaDQT2cGNkHwzvf+C7F0R6Y85MbIZQgIxTYiOKjCPZJgZ
	VV/OTS1L/I80tD75tSsPAlnU4NwtBbjNZOFZdyqJf+iNEJWSbQLw5XXrcK8vZdvlJ9D1
	P7ijGFlk0KZOZH5k6n15+cizPt1LRZ7m6ybBJHX8HAM+OsOuEfBNtU3Oai/3xmvztbaj
	42xknXSSGnNmGWvH3+tcjr1GC8NOqhJ3x/z6siK7WWPs1M24GQZ229BZlHVuAZaohL/T
	0uyQ==
X-Gm-Message-State: AOPr4FXYBI00N+txbu7IUjSZmjo9mXknWyKIP30vgoXYB23VGYg7z5fV2UU8RSx/aIcTvg==
X-Received: by 10.98.80.196 with SMTP id g65mr13823594pfj.91.1462751106850;
	Sun, 08 May 2016 16:45:06 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 1sm35782528pah.7.2016.05.08.16.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 May 2016 16:45:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 May 2016 16:45:02 -0700
Message-Id: <1462751102-8941-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-gnome][master][krogoth][PATCH] libwnck: fix WARNING
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
X-List-Received-Date: Sun, 08 May 2016 23:45:07 -0000

WARNING: libwnck-2.31.0-r0 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index c939a49..d273e6c 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/libs"
-DEPENDS = "gtk+ gdk-pixbuf-native libxres"
+DEPENDS = "intltool-native gtk+ gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-- 
2.3.5


