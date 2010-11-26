Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anilm@mistralsolutions.com>) id 1PM0UV-0007Q2-HG
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 16:45:41 +0100
Received: by vws6 with SMTP id 6so611247vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 07:44:23 -0800 (PST)
Received: by 10.220.74.206 with SMTP id v14mr576203vcj.185.1290786262783;
	Fri, 26 Nov 2010 07:44:22 -0800 (PST)
Received: from anilm@mistralsolutions.com ([122.167.86.7])
	by mx.google.com with ESMTPS id e18sm183684vbm.5.2010.11.26.07.44.19
	(version=SSLv3 cipher=RC4-MD5); Fri, 26 Nov 2010 07:44:22 -0800 (PST)
Date: Fri, 26 Nov 2010 21:14:16 +0530
From: Anil Kumar <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4cefd5d6.9259e60a.2e81.093a@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: anilm@mistralsolutions.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com, jdk@ti.com
Subject: [PATCHv2 5/5] sort.sh: add support for am3517-crane machine type
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
X-List-Received-Date: Fri, 26 Nov 2010 15:45:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

        * Add support for the am3517-crane machine type to the
          sort.sh script.
        * For list of armv7a machines break the line for
          allignment of 80 columns per line.

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
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



