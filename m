Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QAVwB-0003nt-Da
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 01:26:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BF3C93150228
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 01:24:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NcEdeCIzJQIx
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 01:24:38 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id D239B3150221
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 01:24:37 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 14 Apr 2011 23:24:37 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 23:24:37 +0000
Message-Id: <1302823477-10855-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] streamripper: fix depends and license
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
X-List-Received-Date: Thu, 14 Apr 2011 23:26:59 -0000

- Prefer the shared libmad over the one included in streamripper.
- glib-2.0 is required to build streamripper.
- libfaad2 will get picked up if built before streamripper. Make
  builds consistent.
- No need to set RDEPENDS_${PN} (already set by shlibdeps).

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/streamripper/streamripper_1.64.6.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/streamripper/streamripper_1.64.6.bb b/recipes/streamripper/streamripper_1.64.6.bb
index 342d92e..39fae01 100644
--- a/recipes/streamripper/streamripper_1.64.6.bb
+++ b/recipes/streamripper/streamripper_1.64.6.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "StreamRipper lets you record streaming mp3 to your hard drive."
 SECTION = "console/multimedia"
-LICENSE = "GPL"
-DEPENDS = "libogg libvorbis"
-RDEPENDS_${PN} = "libogg libvorbis"
+LICENSE = "GPLv2+"
+DEPENDS = "faad2 glib-2.0 libmad libogg libvorbis"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/streamripper/streamripper-${PV}.tar.gz;name=src"
 SRC_URI[src.md5sum] = "a37a1a8b8f9228522196a122a1c2dd32"
-- 
1.7.2.5



