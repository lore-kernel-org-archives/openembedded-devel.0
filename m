Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzplQ-0003Mh-8o
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:32 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MaKxXJVU8+hXf1sZiXkIdWKtCwjC9wp2fgbNYk0E75U=;
	b=lVaBWfW18KS6zaw7CzAD06btg8/KaKas/IW2h3XjmYHHOUX8MqXA234GJeQmx6AX+J
	lfykz8i1IEhwhmaYaVPmu1t+L05Nb31cD3Xh+zbRCmifdyOBegMS73Pgpv4zgY2xNFNX
	I8OaWqLGX9mDCmfipbaGMxFFrSK5kioPKX30ZdeNPKYYAE1Jd7JkwlEntIIwzXz5yBqw
	rC3hK1e7DMYr33CbkS2dh6ayk5YMt/+dn9tUkXoOTHYTi2uQNn+UqgA5X24N09pj1S8Q
	bXSzwzkkHLjYg6O8Jilgb4kcFrcQ09N08lVBJqOIaLOASB3Bfy+y/Zkg+KOKeNAet/sB
	2Eww==
Received: by 10.180.89.65 with SMTP id bm1mr7376785wib.1.1344606524790;
	Fri, 10 Aug 2012 06:48:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm11646339wix.6.2012.08.10.06.48.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:32 +0200
Message-Id: <60824cf433a0ecffea75aebbfc8008d61faa5999.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 37/46] ecore: add gnutls to DEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:32 -0000

* we explicitly disable openssl, but gnutls is autodetected
  http://git.shr-project.org/git/?p=buildhistory.git;a=commitdiff;h=7c2972a614cb2811962b95e1f0398cf07aafb7a0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index e2fff0e..1c8da18 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
-DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 \
+DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
            libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxprintutil"
 DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 # optional
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 do_configure_prepend() {
     touch ${S}/po/Makefile.in.in || true
-- 
1.7.8.6



