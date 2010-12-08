Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgQ-0006NW-PF
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9F443314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id i2-tcW8G27Pz
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:10 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 6BE19314B860
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:06 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:06 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:58 +0000
Message-Id: <1291813320-24770-6-git-send-email-obi@opendreambox.org>
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
Subject: [PATCH 6/8] python: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:47 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/python/python-pygame_1.9.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-pygame_1.9.1.bb b/recipes/python/python-pygame_1.9.1.bb
index 90e397e..7f55a54 100644
--- a/recipes/python/python-pygame_1.9.1.bb
+++ b/recipes/python/python-pygame_1.9.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python libSDL Bindings"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.pygame.org"
 LICENSE = "LGPL"
-DEPENDS = "libsdl-x11 libsdl-image libsdl-mixer libsdl-net libsdl-ttf python-numeric"
+DEPENDS = "virtual/libsdl libsdl-image libsdl-mixer libsdl-net libsdl-ttf python-numeric"
 DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'smpeg', d)}"
 RDEPENDS_${PN} = "python-numeric"
 SRCNAME = "pygame"
-- 
1.7.2.3



