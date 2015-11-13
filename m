Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B7D3D77330
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 22:08:28 +0000 (UTC)
Received: by ioc74 with SMTP id 74so111215569ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 14:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kQKqpKEbGhourcOit22pmzXpj9zySnQzYLcr8opovNY=;
	b=ghXQrq6QcryVTIFs2Xc6e1nbiysJijWiKF1pxjxUHFXOXkL9A3DVYkJqWOuld5Awy7
	61Dae6tOstvBzNPNEUB6s63Ldupt9/RZ5DY9OCxJy8OLoAWy6AVjCS15lQi7nT51iWVO
	2l07WSejYT999fPSBSOHDK6FImDgdpcESGBMRKivMrGukrtkgMJwsNLNgh2bWxSK/PVb
	lt//ekwmVdYkX8pzH1nA2qL9Q4eAdNqP2aDEM16ZwVjUWo4BnYrWOVEZUdO39DjiBSW7
	zREYsiMbsAKlrEwX6yQZsVxw2WdxLrq1f3jf9gAr/xjj4fbxyqgzEBgREOEByIHU0iTT
	XnDw==
X-Received: by 10.107.33.203 with SMTP id h194mr16736647ioh.108.1447452508652; 
	Fri, 13 Nov 2015 14:08:28 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j188sm7556763iof.28.2015.11.13.14.08.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 14:08:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Nov 2015 14:08:20 -0800
Message-Id: <1447452500-31031-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] ninja-native: remove from meta-qt5 (moved to meta-oe)
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
X-List-Received-Date: Fri, 13 Nov 2015 22:08:31 -0000

ninja-native is now available in meta-oe (jethro and master):

  http://git.openembedded.org/meta-openembedded/commit/?id=d931801de77a9cbb13c916231583b3526a7d3e11

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-devtools/ninja/ninja-native_git.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 recipes-devtools/ninja/ninja-native_git.bb

diff --git a/recipes-devtools/ninja/ninja-native_git.bb b/recipes-devtools/ninja/ninja-native_git.bb
deleted file mode 100644
index e2deb6b..0000000
--- a/recipes-devtools/ninja/ninja-native_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Ninja is a small build system with a focus on speed."
-LICENSE = "Apache-2"
-
-inherit native
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-PV = "1.5.3+gitr${SRCPV}"
-SRCREV="3309498174411e02e7680ea8b470bb7d1d70bdb8"
-SRCBRANCH="release"
-
-SRC_URI = "git://github.com/martine/ninja.git;branch=${SRCBRANCH}"
-
-S="${WORKDIR}/git"
-
-do_compile() {
-    python ${S}/bootstrap.py
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
-}
-- 
1.9.1


