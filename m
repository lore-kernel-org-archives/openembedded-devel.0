Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFT-0007tx-PN
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157397fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6p5P5T16FruRxHUkEAUGHTAqI/2/JfeVKsXwfwIm+iQ=;
	b=l+Z1l1s0Mg4hw2zOZD4J7/F15S9K8z/AvJcSdXczkrKHLzoKFLso1HkCuHBDiEs9vC
	D1a1kCo8EdB4pnDUjSfxXps/HSmiZCPxpTbz8PEJmq1w2qM5KsQ/GMyJyJiC0fzsgm3u
	kojVK9N3SEuMo2t5QrWlMsPIgTC3fHIHBVeJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OeYq27+xRGsS6HPrv/OtfJSH93miN3FWZMZ0liwBezHbsSoTq1srMzR43/BLMPYOF0
	5QM35JyV3bSlPMiFHVVWW4sHY47h9M2pnJybd7Oluml8YoCsi3pHLAacrMQKHjLD2AaU
	cWP/jHghRGKeheRqw7wWr3A9mtG0F8v0cVxlI=
Received: by 10.223.121.19 with SMTP id f19mr7583643far.73.1280852510661;
	Tue, 03 Aug 2010 09:21:50 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.47
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:49 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:23 -0500
Message-Id: <1280852605-3524-9-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/11][v2] xserver-common: xilinx virtex support
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:53 -0000

* Add xilinx virtex platforms support
* Set xserver args
* Bump PR
* v2 reorder patch set

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/xserver-common/files/Xserver-virtex.patch |   14 ++++++++++++++
 recipes/xserver-common/xserver-common_1.33.bb     |    5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 recipes/xserver-common/files/Xserver-virtex.patch

diff --git a/recipes/xserver-common/files/Xserver-virtex.patch b/recipes/xserver-common/files/Xserver-virtex.patch
new file mode 100644
index 0000000..c7d6cc2
--- /dev/null
+++ b/recipes/xserver-common/files/Xserver-virtex.patch
@@ -0,0 +1,14 @@
+Index: xserver-common-1.13/X11/xserver-common
+===================================================================
+--- xserver-common-1.13.orig/X11/xserver-common
++++ xserver-common-1.13/X11/xserver-common
+@@ -181,6 +181,9 @@ else
+             # this is to rotate X display properly, tested with display TX09D71VM1CCA
+             ronetix*pm9261*  | ronetix*pm9263*)
+                  ARGS="$ARGS -screen 240/54x320/81@90x16" ;;
++        "Xilinx Virtex"*)
++            DPI="96"
++            ARGS="$ARGS" ;;
+         # This is a fallback for PCs
+         "")
+             if [ -f $BINDIR/Xvesa ]; then
diff --git a/recipes/xserver-common/xserver-common_1.33.bb b/recipes/xserver-common/xserver-common_1.33.bb
index cb644a4..71fa231 100644
--- a/recipes/xserver-common/xserver-common_1.33.bb
+++ b/recipes/xserver-common/xserver-common_1.33.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPL"
 SECTION = "x11"
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
-PR = "r4"
+PR = "r5"
 
 PACKAGE_ARCH = "all"
 DEFAULT_PREFERENCE = "-1"
@@ -19,7 +19,8 @@ SRC_URI[sha256sum] = "4576ccca80730f1860a273df38b9f917cf906eca9865e108d76fc5460e
 SRC_URI_append = " file://loop.patch;striplevel=3 \
                    file://rgba.diff \
                    file://setDPI.sh \
-                   file://89xdgautostart.sh"
+                   file://89xdgautostart.sh \
+                   file://Xserver-virtex.patch"
 
 SRC_URI_append_angstrom = " file://xtscal-fix.patch "
 RDEPENDS_${PN}_append_angstrom = " tslib-calibrate "
-- 
1.7.2



