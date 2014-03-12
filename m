Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B06A6F85B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 03:18:31 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id bj1so466511pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 20:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kcQX4vdnsF9RymM5o7bcQWb3st5U+1emnBb131Ka9fo=;
	b=rRRa0UlQjFAmI75mXBZr1beXXmzuN3+Shh5yASRqcAcHXzr2Usk8cxG5u1Z2iaCauI
	5/6I3BB+ltVnZOkpE5mU3Xc9Ru95CxjynnLXkFT/Zo87qQ9fClzK/Sr2XhWx5mhdvVZL
	Vs8inHmW8q7ctC/z+LTW6MXLVcYBxCZy6X0d2GaEGhe9+P6Mh7dZ2DG32YFpnZXyMrJS
	jVkOzzpPXL1YnH98nHn6G3ZhR7fioRFevNEo+EB2y9+8g269sx8j12YMqe9SPisceLLl
	Y7s9HsDnxpNWcNVk0oMPFp6eWDYDatr0eAbxJqei3INSDT8cNgkwh6yfDSy+g+snrF2E
	SLbQ==
X-Received: by 10.67.2.106 with SMTP id bn10mr1973600pad.38.1394594312829;
	Tue, 11 Mar 2014 20:18:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id zc6sm7031369pab.18.2014.03.11.20.18.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 20:18:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 20:20:07 -0700
Message-Id: <1394594407-11968-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] luajit: Upgrade to 2.0.1 -> 2.0.2
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
X-List-Received-Date: Wed, 12 Mar 2014 03:18:34 -0000

Drop the backported hotfixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../luajit/{luajit_2.0.1.bb => luajit_2.0.2.bb}              |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.1.bb => luajit_2.0.2.bb} (80%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb
similarity index 80%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb
index 6ca5f34..e60d20f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.2.bb
@@ -6,15 +6,11 @@ HOMEPAGE = "http://luajit.org"
 DEPENDS += "lua5.1"
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz;name=tarball \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
-           http://luajit.org/download/v2.0.1_hotfix1.patch;name=hotfix1 \
           "
-SRC_URI_append_fslmachine = " file://ppc-fixplt.patch "
-
-SRC_URI[tarball.md5sum] = "85e406e8829602988eb1233a82e29f1f"
-SRC_URI[tarball.sha256sum] = "2371cceb53453d8a7b36451e6a0ccdb66236924545d6042ddd4c34e9668990c0"
+SRC_URI[tarball.md5sum] = "112dfb82548b03377fbefbba2e0e3a5b"
+SRC_URI[tarball.sha256sum] = "c05202974a5890e777b181908ac237625b499aece026654d7cc33607e3f46c38"
 
-SRC_URI[hotfix1.md5sum] = "5186c5901e37679a3c835d7b7cdac88e"
-SRC_URI[hotfix1.sha256sum] = "143898de3fe84455684fddb92947d36c1a51c6a6e3884813fe5e025bd4652368"
+SRC_URI_append_fslmachine = " file://ppc-fixplt.patch "
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-- 
1.7.10.4


