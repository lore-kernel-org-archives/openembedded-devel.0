Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEQbU-00032B-9d
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:33:48 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QEQZ6-0004zH-VG from Tom_Rini@mentor.com ;
	Mon, 25 Apr 2011 11:31:21 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 11:31:20 -0700
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Apr 2011 12:31:19 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 11:31:12 -0700
Message-Id: <1303756273-22385-3-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 25 Apr 2011 18:31:19.0777 (UTC)
	FILETIME=[F88AC510:01CC0376]
Cc: koen@dominion.thruhere.net
Subject: [PATCH 2/3] bluez4.inc: List 4.90 as the maxver for applying a patch
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
X-List-Received-Date: Mon, 25 Apr 2011 18:33:48 -0000

After 4.89 we don't need to apply sbc-thumb.patch anymore as upstream
has made a similar change.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/bluez/bluez4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/bluez/bluez4.inc b/recipes/bluez/bluez4.inc
index d5b30be..12989d0 100644
--- a/recipes/bluez/bluez4.inc
+++ b/recipes/bluez/bluez4.inc
@@ -14,7 +14,7 @@ RPROVIDES_bluez4-dev = "bluez-libs-dev"
 SRC_URI = "\
   http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
   file://fix-dfutool-usb-declaration-mismatch.patch \
-  file://sbc-thumb.patch \
+  file://sbc-thumb.patch;maxver=4.90 \
   file://bluetooth.conf \
 "
 S = "${WORKDIR}/bluez-${PV}"
-- 
1.7.0.4



