Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P6odQ-0007J9-A4
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 20:04:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3C68A3149E3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 20:03:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8xNM+S2ow2+Y; Fri, 15 Oct 2010 20:03:26 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 810CD3149E3D;
	Fri, 15 Oct 2010 20:03:25 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Oct 2010 18:03:25 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 18:03:24 +0000
Message-Id: <1287165804-5939-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] oestats-client.bbclass: Fix "AttributeError: 'NoneType' object has no attribute 'startswith'" if OESTATS_SERVER is not set
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
X-List-Received-Date: Fri, 15 Oct 2010 18:04:04 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/oestats-client.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
index 4415461..f521571 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -181,12 +181,13 @@ python oestats_eventhandler () {
 		return
 
 	server = bb.data.getVar('OESTATS_SERVER', e.data, True)
-	if not server.startswith('http://') and not server.startswith('https://'):
-		server = "http://%s" %(server)
 	builder = bb.data.getVar('OESTATS_BUILDER', e.data, True)
 	if not server or not builder:
 		return
 
+	if not server.startswith('http://') and not server.startswith('https://'):
+		server = "http://%s" %(server)
+
 	if getName(e) == 'BuildStarted':
 		oestats_start(server, builder, e.data)
 	elif getName(e) == 'BuildCompleted':
-- 
1.7.1



