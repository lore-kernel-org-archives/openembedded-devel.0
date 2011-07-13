Received: from mail1.matrix-vision.com ([78.47.19.71])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <howard.gray@matrix-vision.de>) id 1Qh3LW-0003oM-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 19:35:38 +0200
Received: from mail1.matrix-vision.com (localhost [127.0.0.1])
	by mail1.matrix-vision.com (Postfix) with ESMTP id 9E1507224F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:00 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail1.matrix-vision.com (Postfix) with ESMTPA id 7212F72219
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:00 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id 816F56F8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:21:59 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id 70C386F9C; Wed, 13 Jul 2011 19:21:59 +0200 (CEST)
Received: from [192.168.65.9] (desmond.intern.matrix-vision.de [192.168.65.9])
	by erinome (Postfix) with ESMTPA id 5D2DE6F8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:21:59 +0200 (CEST)
Message-ID: <4E1DD437.90700@matrix-vision.de>
Date: Wed, 13 Jul 2011 19:21:59 +0200
From: "Howard D. Gray" <howard.gray@matrix-vision.de>
Organization: MATRIX VISION GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.1
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail1)
Subject: [PATCH] usb-gadget-mode: add support for multi gadget
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
X-List-Received-Date: Wed, 13 Jul 2011 17:35:38 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

This adds support for using the multi gadget ("g_multi" kernel module)
as the default USB gadget mode.




Signed-off-by: Howard D. Gray <howard.gray@matrix-vision.de>
---
 recipes/usb-gadget-mode/files/usb-gadget   |    1 +
 recipes/usb-gadget-mode/usb-gadget-mode.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/usb-gadget-mode/files/usb-gadget
b/recipes/usb-gadget-mode/files/usb-gadget
index 8da88ad..aa9c615 100755
--- a/recipes/usb-gadget-mode/files/usb-gadget
+++ b/recipes/usb-gadget-mode/files/usb-gadget
@@ -31,6 +31,7 @@ go() {
 	composite)	setup_usb g_cdc ;;
 	serial)		setup_usb g_serial ;;
 	storage)	setup_usb g_file_storage ;;
+	multi)		setup_usb g_multi ;;
 	hostmode)	unload_usb_gadgets
 			setup_usb ohci_hcd ;;
 	none)		unload_usb_gadgets ;;
diff --git a/recipes/usb-gadget-mode/usb-gadget-mode.bb
b/recipes/usb-gadget-mode/usb-gadget-mode.bb
index aa0f76e..a32c155 100644
--- a/recipes/usb-gadget-mode/usb-gadget-mode.bb
+++ b/recipes/usb-gadget-mode/usb-gadget-mode.bb
@@ -9,7 +9,7 @@ DESCRIPTION = "Manage the default USB gadget mode"
 SECTION = "console/network"
 LICENSE = "GPL"
 PV = "0.0.2"
-PR = "r8"
+PR = "r9"

 SRC_URI = "\
   file://usb-gadget.conf \
-- 
1.7.0.4



MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Erhard Meier


