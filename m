Received: from firebug.buglabs.net ([66.80.197.243] helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@buglabs.net>) id 1OCDsV-0003dC-Pb
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 17:29:44 +0200
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id D382B34049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:18:59 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id EF2D428E002
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:19:04 -0400 (EDT)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyDZviBHLSpZ
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:19:04 -0400 (EDT)
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by aphid.buglabs.net (Postfix) with ESMTP id 466A628E001
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:19:04 -0400 (EDT)
Date: Wed, 12 May 2010 10:19:04 -0500 (GMT-05:00)
From: John Connolly <john@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <1497291088.961273677544100.JavaMail.root@aphid.buglabs.net>
In-Reply-To: <12736765713704-git-send-email-john@buglabs.net>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.104]
X-Mailer: Zimbra 5.0.18_GA_3011.UBUNTU8_64 (ZimbraWebClient - SAF3
	(Linux)/5.0.18_GA_3011.UBUNTU8_64)
X-SA-Exim-Connect-IP: 66.80.197.243
X-SA-Exim-Mail-From: john@buglabs.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] conf/machine/bug20.conf, add xf86-input-tslib for BUG2.0 touchscreen
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
X-List-Received-Date: Wed, 12 May 2010 15:29:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

*BUG20 is using tslib for xorg touchscreen.
*would like this to get into stable
*tested on BUG2.0
---
 conf/machine/bug20.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index dbc1faf..42c2c12 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -9,6 +9,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-extension-glx \
            xf86-input-evdev \
            xf86-input-mouse \
+           xf86-input-tslib \
            xf86-video-omapfb \
            xf86-input-keyboard"
 
-- 
1.7.0.4

John Connolly
Software Developer
Bug Labs
598 Broadway, 4th Floor
New York, NY 10012-3206
646.723.9258
jconnolly @ irc.freenode.net/#buglabs



