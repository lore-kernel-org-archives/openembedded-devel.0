Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O48wI-0003oC-OP
	for Openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 10:36:15 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9A0F3EA58B;
	Tue, 20 Apr 2010 04:32:34 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 20 Apr 2010 04:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id; s=smtpout;
	bh=95HttcgNH+R533tDYRPrwq3AiMQ=;
	b=U11s1bXCMGorjodMMZMLDS0UcyQZbK6FKKThPGBr+VqfWJM/KKP7bPH1abZlUSGT0x/n851JDjsGBCYDhUos+UD6Y16mSihVQZdxUjPStFheWJYqqLE2548AiCuh6OhDbyHmNBLI5KhSWX5rQYT9S7u5m34MbBJc3DzpQx2fXRc=
X-Sasl-enc: /AFTWo4+1muzMEO/uky/YydTQpx/OnWHyMVm9+MiUpU3 1271752354
Received: from localhost.localdomain (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id F26E44D78E7;
	Tue, 20 Apr 2010 04:32:33 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Tue, 20 Apr 2010 10:32:22 +0200
Message-Id: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH] base.bbclass: base_do_compile() accepts GNUmakefile as Makefile
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
X-List-Received-Date: Tue, 20 Apr 2010 08:36:15 -0000

GNU make will look for GNUmakefile, makefile and Makefile.  GNUmakefile
isn't recommended but used by some programs, e.g. canutils.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index d3bfa76..e738693 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -310,7 +310,7 @@ base_do_configure() {
 addtask compile after do_configure
 do_compile[dirs] = "${S} ${B}"
 base_do_compile() {
-	if [ -e Makefile -o -e makefile ]; then
+	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 		oe_runmake || die "make failed"
 	else
 		oenote "nothing to compile"
-- 
1.5.6.5



