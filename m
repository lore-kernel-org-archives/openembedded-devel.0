Received: from mail-yw0-f65.google.com ([209.85.213.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anilm@mistralsolutions.com>) id 1PNJTz-0003f5-BE
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 07:14:31 +0100
Received: by ywo32 with SMTP id 32so1459270ywo.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 22:13:07 -0800 (PST)
Received: by 10.151.11.12 with SMTP id o12mr11789333ybi.435.1291097587782;
	Mon, 29 Nov 2010 22:13:07 -0800 (PST)
Received: from anilm@mistralsolutions.com ([122.167.113.84])
	by mx.google.com with ESMTPS id q41sm3826648ybk.13.2010.11.29.22.13.04
	(version=SSLv3 cipher=RC4-MD5); Mon, 29 Nov 2010 22:13:07 -0800 (PST)
Date: Tue, 30 Nov 2010 11:43:00 +0530
From: Anil Kumar <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4cf495f3.293f970a.3d73.347a@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.65
X-SA-Exim-Mail-From: anilm@mistralsolutions.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com, jdk@ti.com
Subject: [PATCHv3 5/5] sort.sh: add support for am3517-crane machine type
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
X-List-Received-Date: Tue, 30 Nov 2010 06:14:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	* Patch Version updated for latest git tree.

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



