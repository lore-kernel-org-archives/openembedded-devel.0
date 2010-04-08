Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1NzrFz-0002Vn-S7
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 14:54:53 +0200
Received: from lilith.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Thu, 08 Apr 2010 14:54:34 +0000
	id 000000000002ECD2.000000004BBDEE2A.00006BFF
To: Openembedded Development List <openembedded-devel@lists.openembedded.org>
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
Date: Thu, 8 Apr 2010 14:51:29 +0200
MIME-Version: 1.0
Message-Id: <201004081451.29421.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Changing Xserver-script for using Xorg on htcdream (trout) in the future
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
X-List-Received-Date: Thu, 08 Apr 2010 12:54:53 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello.
The following patch is intended to make htcdream use Xorg
in order for taking profit of the new enhanced xf86-video-msm driver.

---
 .../xserver-kdrive-common/Xserver                  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index e2566bb..d00be86 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -61,8 +61,8 @@ fi
 # start off server in conventional location.
 case `module_id` in
 	"trout")
-		ARGS="$ARGS -mouse tslib"
-		XSERVER=/usr/bin/Xfbdev
+		ARGS=""
+		XSERVER=/usr/bin/Xorg
 		;;
         "AML M8050")
                 ARGS="$ARGS -dpi 100 -screen 320x240@270" ;;
-- 
1.5.6.5



