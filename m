Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgL-0006J6-Ii
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 67EBB314B85E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CkcRaraPvFBK
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:03 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 1FBD7314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:02 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:54 +0000
Message-Id: <1291813320-24770-2-git-send-email-obi@opendreambox.org>
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
Subject: [PATCH 2/8] libsdl: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:43 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsdl/pushover_0.0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libsdl/pushover_0.0.1.bb b/recipes/libsdl/pushover_0.0.1.bb
index fb81279..c73b145 100644
--- a/recipes/libsdl/pushover_0.0.1.bb
+++ b/recipes/libsdl/pushover_0.0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Pushover is a fun puzzle game originally published by Ocean in 1992. In this game you control an ant that can walk along platforms that are connected with ladders. On those platforms are dominos that need to fall according to some rules."
 LICENSE = "GPLv3"
-DEPENDS = "lua5.1 libsdl-x11 libsdl-mixer libsdl-ttf"
+DEPENDS = "lua5.1 virtual/libsdl libsdl-mixer libsdl-ttf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pushover/pushover-${PV}.tar.gz"
 
-- 
1.7.2.3



