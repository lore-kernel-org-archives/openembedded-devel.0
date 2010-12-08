Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgR-0006Nv-Hs
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 62507314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id m+uMNFiiTNJX
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:11 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 805DC314B861
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:07 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:07 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:59 +0000
Message-Id: <1291813320-24770-7-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
References: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/8] quake: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:48 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/quake/quake1_0.0.1.bb   |    2 +-
 recipes/quake/quake2_svn.bb     |    2 +-
 recipes/quake/quetoo_0.6.1.bb   |    2 +-
 recipes/quake/sdlquake_1.0.9.bb |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/quake/quake1_0.0.1.bb b/recipes/quake/quake1_0.0.1.bb
index 0fc1101..1a2072b 100644
--- a/recipes/quake/quake1_0.0.1.bb
+++ b/recipes/quake/quake1_0.0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Quake 1"
 SECTION = "x11/games"
 PRIORITY = "optional"
-DEPENDS = "libsdl-x11 libsdl-mixer libsdl-net zlib libxau"
+DEPENDS = "virtual/libsdl libsdl-mixer libsdl-net zlib libxau"
 LICENSE = "GPL"
 PR = "r2"
 
diff --git a/recipes/quake/quake2_svn.bb b/recipes/quake/quake2_svn.bb
index ff01b06..0c481c3 100644
--- a/recipes/quake/quake2_svn.bb
+++ b/recipes/quake/quake2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Icculus.org quake2 engine"
 LICENSE = "GPL"
 
-DEPENDS = "libsdl-x11 libxxf86dga" 
+DEPENDS = "virtual/libsdl libxxf86dga" 
 
 SRCREV = "205"
 PV = "0.16.1+svnr${SRCPV}"
diff --git a/recipes/quake/quetoo_0.6.1.bb b/recipes/quake/quetoo_0.6.1.bb
index f209cc3..8e2142b 100644
--- a/recipes/quake/quetoo_0.6.1.bb
+++ b/recipes/quake/quetoo_0.6.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Initially a fork of the Quake2Forge project, this engine aims to provide security and performance enhancements."
 LICENSE = "GPLv2"
 
-DEPENDS = "libsdl-x11 zlib virtual/libgl"
+DEPENDS = "virtual/libsdl zlib virtual/libgl"
 SRC_URI = "http://tastyspleen.net/~jdolan/quetoo-${PV}.tar.bz2"
 
 PR = "r1"
diff --git a/recipes/quake/sdlquake_1.0.9.bb b/recipes/quake/sdlquake_1.0.9.bb
index bfaf2e8..f5e64cf 100644
--- a/recipes/quake/sdlquake_1.0.9.bb
+++ b/recipes/quake/sdlquake_1.0.9.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Quake 1"
 SECTION = "x11/games"
 PRIORITY = "optional"
-DEPENDS = "libsdl-x11 libsdl-mixer libsdl-net zlib libxau"
+DEPENDS = "virtual/libsdl libsdl-mixer libsdl-net zlib libxau"
 LICENSE = "GPL"
 
 SRC_URI = "http://www.libsdl.org/projects/quake/src/sdlquake-${PV}.tar.gz \
-- 
1.7.2.3



