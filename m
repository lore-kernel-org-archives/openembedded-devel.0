Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8R2x-00021g-Ob
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 08:58:33 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so4594991pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=y1cXjck0NG2FTlRCQzHLBDZVeh1+Z/HdkLiXsaZsnRU=;
	b=Gbs9ox9yYXnOC5Eu1jrCRBgzlS0p8xY8AkEu9uSf+T8jP7Hgys8zQQK/R2V8+BbHDE
	mMAhWiY+vMKYp6hNJTfA/TFAwGaajTcnD1KA9MPeM4MdY4cwGOho0dlk/QqvwNbYbFn/
	LToVYBviTSVvA029jgg34Xw5r3AFxQaA2OzgbjDGl2hTF6IsvIjpjzvnTLxSwUEscYKa
	U1OkPFTGS0na/NpW1tAu0BBaEnr4noJsMRlUeWA/cyzxC9NwLgsdHB38SepKuHnDFpUt
	lWQ91D/7ImdB/z6QJDNWkvXMcvjbwqhdtel9j2OU1H4VlE61/tXEJ9mEqJuj5AHmJJYX
	+8vg==
X-Received: by 10.68.231.70 with SMTP id te6mr53570577pbc.159.1361432535393;
	Wed, 20 Feb 2013 23:42:15 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id in5sm24472753pbc.20.2013.02.20.23.42.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 23:42:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 23:42:04 -0800
Message-Id: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] kdepimpi: Fix multiline comments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 07:58:33 -0000

Makes parsing go through

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qtopia/kdepimpi/kdepimpi-base.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qtopia/kdepimpi/kdepimpi-base.inc b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
index 27cc237..5d6bb0d 100644
--- a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
+++ b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
@@ -33,7 +33,7 @@ LIBS+=-lz \
 # That changes will be needed for KMicroMail/PI to get it build with OE libs
 #
 #             LIBS-=-lkmicromailwrapper LIBS+=-lmailwrapper LIBS+=-lopiecore2 \
-
+#
 QMAKE_PROFILES= "all.pro"
 
 SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde libkcal libkdepim \
@@ -47,7 +47,7 @@ SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde libkcal lib
 #        pwmanager/libcrypt/cipher  \
 #        pwmanager/libcrypt/zlib \
 #        pwmanager/pwmanager \
-
+#
 inherit palmtop
 
 do_configure_prepend() {
-- 
1.7.9.5



