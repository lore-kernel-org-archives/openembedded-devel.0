Received: from firebug.buglabs.net ([66.80.197.243] helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1OA9FN-0001yv-4R
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 00:08:46 +0200
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id DFBA134056
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 17:55:44 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id F3C6528E002
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 17:57:48 -0400 (EDT)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rrwdn9b+s52I
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 17:57:48 -0400 (EDT)
Received: from [192.168.0.120] (t61.buglabs.net [192.168.0.120])
	by aphid.buglabs.net (Postfix) with ESMTP id BB00028E001
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 17:57:48 -0400 (EDT)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 06 May 2010 17:55:40 -0400
Message-ID: <1273182940.4942.10.camel@T61>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 66.80.197.243
X-SA-Exim-Mail-From: ken@buglabs.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Thu, 06 May 2010 22:08:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
index 0b976fe..746874f 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
@@ -26,4 +26,12 @@ EndSection
 Section "ServerLayout"                                 
         Identifier      "Builtin Default Layout"                                     
         Screen  "Builtin Default fbdev Screen 0"        
+		InputDevice "bmi-lcd-ts" "CorePointer"
 EndSection                                              
+
+Section "InputDevice" 
+		Identifier "bmi-lcd-ts" 
+		Driver "tslib"
+		Option "SwapAxes" "1" 
+    	Option "Device" "/dev/input/touchscreen0" 
+EndSection                                        




