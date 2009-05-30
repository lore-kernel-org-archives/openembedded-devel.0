Received: from [65.182.109.75] (helo=mta6.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MANFo-0007ei-2x
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 14:01:36 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta6.brinkster.com (Postfix) with ESMTP id 78802204FA7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 04:52:55 -0700 (MST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.339
X-Spam-Level: 
X-Spam-Status: No, score=-0.339 tagged_above=-10 required=5 tests=[AWL=0.711, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RDNS_DYNAMIC=0.1]
Received: from mta6.brinkster.com ([127.0.0.1])
	by localhost (mta6.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRjyR+aCHkno
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 04:52:41 -0700 (MST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta6.brinkster.com (Postfix) with ESMTP id 56E6F206399
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 04:52:41 -0700 (MST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 30 May 2009 12:51:50 +0100
Message-ID: <002401c9e11d$0adf0920$209d1b60$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcnhHQRvTvuqqXzWQQqStAljKkOF5w==
Subject: [PATCH] usb-gadget-mode: Add defaults for omap3-pandora and fix broken script.
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
X-List-Received-Date: Sat, 30 May 2009 12:01:36 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Add default usb-gadget mode for the omap3-pandora and fix typo in
recipes/usb-gadget-mode/files/usb-gadget that breaks package.

Signed-off-by: John Willis <John.Willis@Distant-earth.com>

---
 .../files/omap3-pandora/usb-gadget.conf            |    3 +++
 recipes/usb-gadget-mode/files/usb-gadget           |    2 +-
 recipes/usb-gadget-mode/usb-gadget-mode.bb         |    2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100755
recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
 mode change 100644 => 100755 recipes/usb-gadget-mode/usb-gadget-mode.bb

diff --git a/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
b/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
new file mode 100755
index 0000000..35ff0d4
--- /dev/null
+++ b/recipes/usb-gadget-mode/files/omap3-pandora/usb-gadget.conf
@@ -0,0 +1,3 @@
+USB_MODE="composite"
+MODULE_OPTIONS=""
+
diff --git a/recipes/usb-gadget-mode/files/usb-gadget
b/recipes/usb-gadget-mode/files/usb-gadget
index c9ff2f0..0e6b39f 100755
--- a/recipes/usb-gadget-mode/files/usb-gadget
+++ b/recipes/usb-gadget-mode/files/usb-gadget
@@ -26,7 +26,7 @@ go() {
 	networking)	setup_usb g_ether "$MODULE_OPTIONS" ;;
 	zero)		setup_usb g_zero "$MODULE_OPTIONS" ;;
 	midi)		setup_usb g_midi "$MODULE_OPTIONS" ;;
-	printer		setup_usb g_printer "$MODULE_OPTIONS" ;;
+	printer)	setup_usb g_printer "$MODULE_OPTIONS" ;;
 	gadgetfs) 	setup_usb gadgetfs "$MODULE_OPTIONS" ;;
 	composite)	setup_usb g_cdc "$MODULE_OPTIONS" ;;
 	storage)	setup_usb g_file_storage "$MODULE_OPTIONS" ;;
diff --git a/recipes/usb-gadget-mode/usb-gadget-mode.bb
b/recipes/usb-gadget-mode/usb-gadget-mode.bb
old mode 100644
new mode 100755
index cc00a88..e6e8e51
--- a/recipes/usb-gadget-mode/usb-gadget-mode.bb
+++ b/recipes/usb-gadget-mode/usb-gadget-mode.bb
@@ -9,7 +9,7 @@ DESCRIPTION = "Manage the default USB gadget mode"
 SECTION = "console/network"
 LICENSE = "GPL"
 PV = "0.0.2"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   file://usb-gadget.conf \
-- 
1.6.3.1





