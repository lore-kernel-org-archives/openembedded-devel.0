Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id B472C6A9DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:29 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so5975778eak.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=h6Y/Q3wLw3sfa5tFAbbVhjiBgujz6+PdN4D9O9FjmUc=;
	b=CKGa0ypOfepIk7ZqzCCb+UaUq1XkI2dySuvU3glAT/thigpGmKUh5uwbGop+96FqCx
	VpOVh+Ez0gkE2XAcVRtvG7WTosOZcpypVVGCNg5I9L7p+cHvMxShQxWeCTrYnHvnbdGY
	XrGrqTx5sXvCWsW7Tzy77PbkEKC1iFUBoWbKAppv0EAhjXhErQyv+zWtoBAlYUG3Vst+
	X36nSQZNBI/Te+ivi7S0nMeXsk8HdjkvMPj8AOZ3ToUByizHMOxpmhZ6kRJAaFhYo7At
	ntwnPYaeRZwix4isDLGCHX+Th2pg4OnobM1niaI4EVSegmM06BjHEmwPbSNF94oonxxa
	7tlw==
X-Received: by 10.15.42.129 with SMTP id u1mr14538421eev.116.1370929050495;
	Mon, 10 Jun 2013 22:37:30 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:32 +0200
Message-Id: <1370928876-14423-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 11/15] networkmanager: rework settings/dependencies for polkit/consolekit
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

make system-wide settings available too

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.8.0.bb       |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 5b53f7f..ef686cf 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -4,8 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools gnutls util-linux ppp"
 
 inherit gnome gettext systemd
 
@@ -33,7 +32,14 @@ EXTRA_OECONF = " \
     --with-tests \
 "
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG[systemd] = " \
+    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit --enable-modify-system, \
+    --without-systemdsystemunitdir=, \
+    polkit \
+"
+# consolekit is not picked by shlibs, so add it to RDEPENDS too
+PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
-- 
1.7.6.5


