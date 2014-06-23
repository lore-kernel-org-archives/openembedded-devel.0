Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 389E365F1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:27:31 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so6301534wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hsTXVmHHUsS1wGkg1g+5G0gTRrRXWmkVJU8Cp8viPOk=;
	b=kobIYWfSf573FxJSXUmWj2Be90rPsGqU7E2Qle+sZcs2r9G2t+hjOw5LdFkTWCU6Dr
	tDHsU4sM7uFukBlYivAPsv9/axs2W0I4KaMXmpP7o8V+03tEedSC9POlU7tqrsMcQTbO
	20oejbcTyI38ny2qM3AywP25jMST/bqzLnyBtOr770cN/0PzjN8+1ctRaGVO4NG/lgqB
	cnoscxyqujB1+Q9XNebteKK0wqFb4AFRT0q6jEKxBN/iD+RPU94u61QZK3L7WIdXHcZG
	FjSLVNBc0ITpwhDqq0wJgzeh7uYCBIDCxIgW1OCq9t5uQT8zp4sebjlb6yK4NYEZEdX+
	swnA==
X-Received: by 10.194.22.100 with SMTP id c4mr27811891wjf.89.1403530047958;
	Mon, 23 Jun 2014 06:27:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fq2sm33464769wib.2.2014.06.23.06.27.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 06:27:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jun 2014 15:25:32 +0200
Message-Id: <1403529932-12048-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-efl][PATCH] imlib2: upgrade to use pkg-config for freetype2 support
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
X-List-Received-Date: Mon, 23 Jun 2014 13:27:33 -0000

* convert from old svn repo to new (legacy) git repo
* fixed upstream:
  commit fe82b9760c7ceb25747c6e634bc827b4cc8ecabd
  Author: Kim Woelders <kim@woelders.dk>
  Date:   Thu Jul 4 20:08:53 2013 +0200

    Autofoo updates.

    - Eliminate deprecated AC_TRY_CPP.
    - Use pkg-config in stead of freetype-config to get freetype info.
    - Eliminate my_includes/my_libs.
    - Clean up include paths.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{imlib2_svn.bb => imlib2_git.bb} | 12 +++++-------
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb        |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename meta-efl/recipes-efl/efl/{imlib2_svn.bb => imlib2_git.bb} (84%)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_git.bb
similarity index 84%
rename from meta-efl/recipes-efl/efl/imlib2_svn.bb
rename to meta-efl/recipes-efl/efl/imlib2_git.bb
index 9806de7..dc91763 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_git.bb
@@ -1,17 +1,15 @@
 SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-# can also depend on tiff34, ungif or gif, z, bz2, id3tag
+
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
-PV = "1.4.5+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-PNBLACKLIST[imlib2] = "BROKEN: needs to be updated to use freetype2 pkg-config"
+PV = "1.4.6+gitr${SRCPV}"
+SRCREV = "560a58e61778d84953944f744a025af6ce986334"
 
 inherit efl binconfig
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
+SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git"
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index 1a6e4a0..d07b143 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -4,8 +4,6 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
-PNBLACKLIST[mcnavi] = "BROKEN: depends on broken imlib2"
-
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
 SRC_URI[sha256sum] = "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
-- 
2.0.0


