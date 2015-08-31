Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 2092 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Aug 2015 20:15:35 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AA87574197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 20:15:35 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7VJedoD004467 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:40:43 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015083114404311-965470 ;
	Mon, 31 Aug 2015 14:40:43 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2015 14:40:36 -0500
Message-Id: <1441050036-27596-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.4.5
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/31/2015 02:40:43 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/31/2015 02:40:43 PM,
	Serialize complete at 08/31/2015 02:40:43 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-31_02:, , signatures=0
Subject: [meta-security] [PATCH] tripwire: Fix path to nano in default twcfg.txt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Aug 2015 20:15:39 -0000

Nano is installed under /usr/bin/, not /bin/.

Installed Tripwire on a Fido image and successfully ran
`tripwire --update` to invoke text editor.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 recipes-security/tripwire/files/twcfg.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/tripwire/files/twcfg.txt b/recipes-security/tripwire/files/twcfg.txt
index 131b097..224e920 100644
--- a/recipes-security/tripwire/files/twcfg.txt
+++ b/recipes-security/tripwire/files/twcfg.txt
@@ -4,7 +4,7 @@ DBFILE                 =/var/lib/tripwire/$(HOSTNAME).twd
 REPORTFILE             =/var/lib/tripwire/report/$(HOSTNAME)-$(DATE).twr
 SITEKEYFILE            =/etc/tripwire/site.key
 LOCALKEYFILE           =/etc/tripwire/$(HOSTNAME)-local.key
-EDITOR                 =/bin/nano
+EDITOR                 =/usr/bin/nano
 LATEPROMPTING          =false
 LOOSEDIRECTORYCHECKING =false
 MAILNOVIOLATIONS       =true
-- 
2.4.5


