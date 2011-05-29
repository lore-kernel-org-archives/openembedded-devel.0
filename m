Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo2D-00039A-Se
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:33 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=clPSgcglQi+0WMPNQm8JJ9IYGE6/jf1Vf+tVnuIxHk4=;
	b=k0lCF2DfpWhsuadRFffjKmB4tmLUxsxTBf70POTngBGy4d/CuJBGbEfy2VSiHo/53I
	//N9MY9NaOaqiowYbM9yLNnWNKc3lL9fU7RrnPskaKTI3Fj5RMXY/BTln4eeAfMMwIUE
	aa4dODSNW8h0k76B8p7mj2npS+//qVGa7grF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uTAbi3Cs+Bb/ZOb5RkmOoxbJR3bDpPSJSIvS1CGetJS76aF/1+a7byEmoGjZJP2HAT
	+A8Yb1BgN4JIljkY7We6M4KUrYDtCMV7m//9BTLfsH5iZ+LZRAqwY+MP3OPql7V3zgC6
	xcC3KY0+CDejIE/ir5eaxPIptRYDN/K8cc0vc=
Received: by 10.223.98.4 with SMTP id o4mr2608337fan.120.1306706248728;
	Sun, 29 May 2011 14:57:28 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q21sm525342fan.40.2011.05.29.14.57.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:35 +0200
Message-Id: <090f54bcd9c2210c98aa06786ca581aded9a2b1b.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/14] serial-utils: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:00:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../serial-utils/pty-forward-native.bb             |   21 ++++++++++++++++++++
 .../serial-utils/serial-forward_git.bb             |   13 ++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/serial-utils/pty-forward-native.bb
 create mode 100644 meta-oe/recipes-support/serial-utils/serial-forward_git.bb

diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
new file mode 100644
index 0000000..72dfa22
--- /dev/null
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Receive a forwarded serial from serial-forward and provide a PTY"
+AUTHOR = "Holger 'Zecke' Freyther"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
+SECTION = "console/network"
+SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
+PV = "1.1+gitr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git"
+S = "${WORKDIR}/git/tools/serial_forward"
+
+inherit autotools native
+
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_deploy() {
+    install -d ${DEPLOY_DIR_IMAGE}
+    install -m 0755 ${S}/src/pty_forward ${DEPLOY_DIR_IMAGE}/pty-forward
+}
+
+addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
new file mode 100644
index 0000000..0e4ec44
--- /dev/null
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Forward a serial using TCP/IP"
+AUTHOR = "Holger 'Zecke' Freyther'"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
+SECTION = "console/devel"
+SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
+PV = "1.1+gitr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git/;protocol=git"
+S = "${WORKDIR}/git/tools/serial_forward"
+
+inherit autotools
-- 
1.7.5.rc3



