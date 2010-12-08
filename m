Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgL-0006JV-VP
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C9691314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sagxoi-j1xHY
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:08 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 59842314B85F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:05 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:05 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:57 +0000
Message-Id: <1291813320-24770-5-git-send-email-obi@opendreambox.org>
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
Subject: [PATCH 5/8] nogravity: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:44 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/nogravity/nogravity_2.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/nogravity/nogravity_2.0.bb b/recipes/nogravity/nogravity_2.0.bb
index 0d7c15f..88cfdd1 100644
--- a/recipes/nogravity/nogravity_2.0.bb
+++ b/recipes/nogravity/nogravity_2.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "3D arcade space shooter"
 HOMEPAGE = "http://www.realtech-vr.com/nogravity/"
 LICENSE = "GPL"
 SECTION = "x11/games"
-DEPENDS = "libsdl-x11 zlib libpng libsdl-mixer libogg libvorbis"
+DEPENDS = "virtual/libsdl zlib libpng libsdl-mixer libogg libvorbis"
 PR = "r1"
 
 SRC_URI = "http://zaurus.vivaphp.net/nogravity.tar.bz2;name=archive \
-- 
1.7.2.3



