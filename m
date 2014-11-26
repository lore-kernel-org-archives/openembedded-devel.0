Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 402 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Nov 2014 08:41:01 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.104])
	by mail.openembedded.org (Postfix) with ESMTP id 739157211E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:41:01 +0000 (UTC)
Received: from [216.82.254.195] by server-8.bemta-7.messagelabs.com id
	5A/99-03121-A8095745; Wed, 26 Nov 2014 08:34:18 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-200.messagelabs.com!1416990857!21707633!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29381 invoked from network); 26 Nov 2014 08:34:18 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Nov 2014 08:34:18 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.377.0;
	Wed, 26 Nov 2014 02:34:07 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 26 Nov 2014 02:34:17 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Wed, 26 Nov 2014 09:34:15 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 09:34:14 +0100
Message-ID: <1416990854-11188-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.1.3
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-oe][master][dizzy]PATCH v2] xserver-common: disable TCP connections
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
X-List-Received-Date: Wed, 26 Nov 2014 08:41:06 -0000
Content-Type: text/plain

For security reasons disable TCP connections to the xserver.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---

Notes:
    v2:
      * Add upstream-status

 ...15-xserver-common-disable-TCP-connections.patch | 24 ++++++++++++++++++++++
 .../xserver-common/xserver-common_1.34.bb          |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
new file mode 100644
index 000000000000..06df2618bd76
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0015-xserver-common-disable-TCP-connections.patch
@@ -0,0 +1,24 @@
+From: Javier Viguera <javier.viguera@digi.com>
+Date: Wed, 26 Nov 2014 09:24:44 +0100
+Subject: [PATCH] xserver-common: disable TCP connections
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Javier Viguera <javier.viguera@digi.com>
+---
+ X11/xserver-common | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 017e5aee1ab0..4dc48c412741 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -44,7 +44,7 @@ SCREEN_SIZE=`fallback_screen_arg`
+ export USER=root
+ export XSERVER_DEFAULT_ORIENTATION=normal
+ 
+-ARGS="-br -pn $INPUT_EXTRA_ARGS"
++ARGS="-br -pn -nolisten tcp $INPUT_EXTRA_ARGS"
+ DPI="100"
+ MOUSE=""
+ KDRIVEARGS=""
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 12fff9ae9a0d..f5b1984cdde3 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -24,6 +24,7 @@ SRC_URI_append = " \
     file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
     file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
     file://0014-Xserver-Start-Xsession-like-x11-common-does.patch \
+    file://0015-xserver-common-disable-TCP-connections.patch \
 "
 
 do_install_append() {

