Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 169BC6B0C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:29 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so2731469eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/Q2SmcxasYmaephsXw3DInM3i2l/nmnZCW6gt6e+ea8=;
	b=LSV0AoZEKeJlCNUqTpe5RD0b/KxzJO3fODOKztDtZbY2x1bm0SW/cWQkMDnKj49n10
	82VQIHszMUyU9qjvYwaki8AMLKiH7e9/vmQWx/hz6RM2FZVequkK6pTwM84RByCWAhKp
	WfYUwUZPn2JlCHHV2GrkPUr/pdgEgrZwJEXdjd32seqVtl46ylGIY5YDKxAsKyUo2WyW
	XmFWR6+Ts+oPuWFxxiVLFC3QyYFsfrNFbtr/9CMKQefrZYrejxhfpCu9PGrg2V+xF0sI
	4VMvEMTmBr3VGFuEAyqG1efHodA9fSIFm7jdlPZfqiO3T2cI/+sYQyttiuDXOmCAwKw3
	ozLA==
X-Received: by 10.15.45.5 with SMTP id a5mr24047711eew.7.1373272890730;
	Mon, 08 Jul 2013 01:41:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm40450180eeu.2.2013.07.08.01.41.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:29 +0200
Message-Id: <1373272893-26013-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] gypsy: add dependency on libxslt-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 08:41:30 -0000

* it's incorrectly used in build (and just "o" is used instead of xslt
  command):
  | o gypsy-discovery.xml ../docs/tools/spec-strip-docs.xsl gypsy-discovery-full.xml
  | /bin/bash: o: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 0c1735e..ba54356 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -6,7 +6,7 @@ client applications, passing the data as simple values for the clients \
 to use."
 LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.8.2.1


