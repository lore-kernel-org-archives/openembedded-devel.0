Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zd-0006Ft-80
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:41 +0200
Received: (qmail 3047 invoked by uid 813007); 23 Jun 2009 08:57:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:38 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:56 +0200
Message-Id: <1245747417-11163-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230940.05121.marcin@juszkiewicz.com.pl>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 055/125] libsdl-gfx: GNU HASH QA fix.
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:41 -0000

From: Stanislav Brabec <utx@penguin.cz>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/libsdl/libsdl-gfx_2.0.17.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/libsdl/libsdl-gfx_2.0.17.bb b/recipes/libsdl/libsdl-gfx_2.0.17.bb
index 79af40a..b07be45 100644
--- a/recipes/libsdl/libsdl-gfx_2.0.17.bb
+++ b/recipes/libsdl/libsdl-gfx_2.0.17.bb
@@ -10,6 +10,7 @@ S = "${WORKDIR}/SDL_gfx-${PV}"
 inherit autotools
 
 EXTRA_OECONF = "--disable-mmx"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_stage() {
 	autotools_stage_all
-- 
1.6.3.1





