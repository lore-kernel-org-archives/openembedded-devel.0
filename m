Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DF7A570276
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:02:01 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so7458518wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SF5d72LMZ/g/7d6mpL1dYtNagkaKkeMNH1cIKqrFiRM=;
	b=wWZazl8wPjEdnfyCOASpsBKLcNK5F/sNCM9gB8FQNxvwjK5sYVEGx/rWmGURFa02F0
	bmDaOpIDPbjc/+HR+1/bV1TiNs5FC1LAj6EWvYrK3MWQQ0xR5v8G2b1yyoyGY3WA1Fvx
	Cv4afsS3I9AGPFbuW0xZ2R+UXsULZBpoRcUPo9Loj3yy/w76VIWonuZAo3SP+/DgbdpQ
	4CRuWUN3mcfXN9lvPD6PLuUoLXlyKtVinEgXvsDthC/6Bt8c/jztpTTmcv2v9jbu30qU
	L7z3gNYwSK47yjAIr4pgPg8GkK8AEM8Afop+yKs5qJCMx7PORSdpN9MqSDp9jd5kO4Bs
	C75g==
X-Received: by 10.194.91.228 with SMTP id ch4mr46486526wjb.59.1407679322383;
	Sun, 10 Aug 2014 07:02:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e3sm32314455wjp.4.2014.08.10.07.02.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:02:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:24 +0200
Message-Id: <1407679345-31695-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/7] efl, expedite: explicitly add some packages, add libsdl dependency
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
X-List-Received-Date: Sun, 10 Aug 2014 14:02:02 -0000

* expedite has runtime dependency on them and insane_qa check doesn't see
  them as provided by evas dependency and shows following warnings:
  expedite-1.7.9: expedite rdepends on evas-engine-software-generic, but it isn't a build dependency? [build-deps]
  expedite-1.7.9: expedite rdepends on evas-engine-fb, but it isn't a build dependency? [build-deps]
  expedite-1.7.9: expedite rdepends on evas-loader-png, but it isn't a build dependency? [build-deps]
* always use libsdl dependency instead of PACKAGECONFIG, because
  there is also software-sdl engine, which isn't controlled by
  any configure option

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc      | 1 +
 meta-efl/recipes-efl/efl/expedite.inc | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 7ccb634..648c5b6 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -104,6 +104,7 @@ python populate_packages_prepend () {
         allow_dirs=True, recursive=False, extra_depends="" )
 }
 
+PACKAGES += "evas-loader-png evas-engine-software-generic evas-engine-fb"
 PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
 
 # PACKAGES_DYNAMIC + do_split_packages isn't used for all libe libs,
diff --git a/meta-efl/recipes-efl/efl/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
index 0a1f725..30ba063 100644
--- a/meta-efl/recipes-efl/efl/expedite.inc
+++ b/meta-efl/recipes-efl/efl/expedite.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
-DEPENDS = "eet evas"
+DEPENDS = "eet evas libsdl"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d70bc65d46237e4ef386beebe7d0fe5b"
 
@@ -7,9 +7,6 @@ INC_PR = "r0"
 
 inherit e
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[sdl] = "--enable-opengl-sdl,--disable-opengl-sdl,libsdl"
-
 EXTRA_OECONF = "\
     --x-includes=${STAGING_INCDIR}/X11 \
     --x-libraries=${STAGING_LIBDIR} \
-- 
2.0.4


