Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgH-0006Ib-Sm
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B9AEA314B862
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aPHoGHj6R16c
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:04 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 340B6314B85D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:03 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:55 +0000
Message-Id: <1291813320-24770-3-git-send-email-obi@opendreambox.org>
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
Subject: [PATCH 3/8] libtheora: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:42 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libtheora/libtheora_0.9+1.0alpha7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libtheora/libtheora_0.9+1.0alpha7.bb b/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
index 2fbce48..952a512 100644
--- a/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
+++ b/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
@@ -1,5 +1,5 @@
 
-DEPENDS = "libogg libvorbis libsdl-x11"
+DEPENDS = "libogg libvorbis virtual/libsdl"
 
 SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-1.0alpha7.tar.gz"
 
-- 
1.7.2.3



