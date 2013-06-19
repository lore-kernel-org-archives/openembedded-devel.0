Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 915496AD56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:57 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3355224eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=v9a/ywC8wzOvsxWWhmgmUagtaFYRR0rfMhZlvMCtZM0=;
	b=K9p5Sg0luHwqZZfT5G3rKa2HJSJNGyXa2uNDCLALp76kxcMH0aq9XMHqV61ixT4XB3
	8XhOz7Ylqc4ZM+uWBgNKTw06x5/eahYvGqBf5p2VDHbUt4CzGK971gsKGszxC5DMyTdl
	sRCgymdwGKaPpQ3fZlz8ikCS484SuhkX2Lf/wjYNvB8cqGlXrvg58IVMR2gY9bLs+z1X
	2KL+8GRBJp3YVp3YVCYbxQcEqZhcXy5u+hl8HC3nkV9l6m889/UgxP1arouTAWOUz894
	LSMWdeJGT9x5Jl0S/qaVSc2GwwuL6lJCyuhCNjnoJz+bXw6tGNjuaJ/VyWkuuwdln+B+
	wSEw==
X-Received: by 10.15.95.4 with SMTP id bc4mr3589700eeb.40.1371662996856;
	Wed, 19 Jun 2013 10:29:56 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:18 +0200
Message-Id: <1371662967-31734-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 11/20] networkmanager: rework dependencies/configure-option and use PACKAGECONFIG
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.8.0.bb       |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 5b53f7f..6957f35 100644
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
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+PACKAGECONFIG[systemd] = " \
+    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
+    --without-systemdsystemunitdir=, \
+    polkit \
+"
+# consolekit is not picked by shlibs, so add it to RDEPENDS too
+PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
-- 
1.7.4.4


