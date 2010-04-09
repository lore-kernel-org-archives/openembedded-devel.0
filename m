Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1O0Fde-0005et-T6
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 16:56:55 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id DD2EC68278;
	Fri,  9 Apr 2010 18:53:20 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1O0FZR-0001Or-Pt; Fri, 09 Apr 2010 18:52:33 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 18:52:33 +0400
Message-Id: <1270824753-5361-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <4BBF3920.1000702@mwester.net>
References: <4BBF3920.1000702@mwester.net>
X-Altell-MailScanner-ID: DD2EC68278.731CC
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] update-rc.d.bbclass: add dependency on update-rc.d-native
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
X-List-Received-Date: Fri, 09 Apr 2010 14:56:55 -0000

Recipes are using update-rc.d to do postinst and postinst scripts are being
ran on build hosts where native version is needed to run properly. It is
needed only at image build stage, but it's easier to have it in DEPENDS,
build time for it is almost zero anyway.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/update-rc.d.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/update-rc.d.bbclass b/classes/update-rc.d.bbclass
index b6491ed..4594d0f 100644
--- a/classes/update-rc.d.bbclass
+++ b/classes/update-rc.d.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_append = " update-rc.d"
+DEPENDS_append = " update-rc.d update-rc.d-native"
 RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
 INITSCRIPT_PARAMS ?= "defaults"
-- 
1.5.6.5



