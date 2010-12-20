Received: from mail-vw0-f65.google.com ([209.85.212.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anilm@mistralsolutions.com>) id 1PUgkj-0001CY-GI
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 15:30:17 +0100
Received: by vws7 with SMTP id 7so247973vws.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 06:30:11 -0800 (PST)
Received: by 10.220.193.68 with SMTP id dt4mr1286838vcb.198.1292855410921;
	Mon, 20 Dec 2010 06:30:10 -0800 (PST)
Received: from anilm@mistralsolutions.com ([122.166.150.147])
	by mx.google.com with ESMTPS id q5sm702455vcr.15.2010.12.20.06.30.07
	(version=SSLv3 cipher=RC4-MD5); Mon, 20 Dec 2010 06:30:09 -0800 (PST)
Date: Mon, 20 Dec 2010 20:00:03 +0530
From: Anil kumar M <anilm@mistralsolutions.com>
To: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Message-ID: <4d0f6871.c57bdc0a.47c2.2b20@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com, jdk@ti.com
Subject: [PATCHv4 5/5] sort.sh: add support for am3517-crane machine type
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
X-List-Received-Date: Mon, 20 Dec 2010 14:30:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

    * Add support for the am3517-crane machine type to the
      sort.sh script.
    * For list of armv7a machines break the line for
      allignment of 80 characters.

Signed-off-by: Anil kumar M <anilm@mistralsolutions.com>
---
 contrib/angstrom/sort.sh |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index 3e59466..c88cb3d 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -79,7 +79,11 @@ case "$arch" in
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
-			machines="am3517-evm archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am389x-evm babbage c6a816x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda" ;;
+			machines="am3517-crane am3517-evm archos5 archos5it
+ beagleboard bug20 cm-t35 dm37x-evm am37x-evm am389x-evm babbage c6a816x-evm
+ efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora
+ omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre
+ omap4430-panda" ;;
 	"avr32")
 			machines="at32stk1000 atngw100" ;;
 	"bfin")
-- 
1.7.0.4



