Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABE16A9F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2084390eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=MGJQOg2Ry45VthLkp5GCvVYAf1PKSLtFi2R5Gz8Qbus=;
	b=BLHHAhoOkpixWifAEgDkNZ1YHN9EClRgbxQvmMEDkmSb6PE3FqUc44xGqn8PyTtqjg
	p8sz9nePyYBrrulfTTWliqas/9CXGpmaPr3EBbrZwkO6D5w/9DM/EbZEt/VcGSvtyw6z
	RD21mdTqHckhKsnkrKWYJ5WulvpnCI5Q2cl3LUF7og2DF5CO57mNex2232eT1R/WzRp4
	qQK3+iRU0PNRM3Cu3omWCnOGAWZCTA//RY42F5yi513RxLs1+85XrVeBr4nriHSK64V8
	YyU1KD+0h1EB5t5vtvyjMeLiGOGElzTXFxzUHVQV56fdC6+0Sf3T3ZmcwhidbuQ0WYZr
	ikAg==
X-Received: by 10.15.55.132 with SMTP id v4mr14663208eew.19.1370929051784;
	Mon, 10 Jun 2013 22:37:31 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:33 +0200
Message-Id: <1370928876-14423-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 12/15] networkmanager: add group 'network' allowing members to change settings
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../50-org.freedesktop.NetworkManager.rules        |    8 ++++++++
 .../networkmanager/networkmanager_0.9.8.0.bb       |   10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/50-org.freedesktop.NetworkManager.rules

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/50-org.freedesktop.NetworkManager.rules b/meta-oe/recipes-connectivity/networkmanager/networkmanager/50-org.freedesktop.NetworkManager.rules
new file mode 100644
index 0000000..d771a17
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/50-org.freedesktop.NetworkManager.rules
@@ -0,0 +1,8 @@
+# give group 'network' rights to change settings
+# taken from https://wiki.archlinux.org/index.php/NetworkManager#Set_up_PolicyKit_permissions
+
+polkit.addRule(function(action, subject) {
+  if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
+    return polkit.Result.YES;
+  }
+});
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index ef686cf..ea91c84 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -6,12 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
 DEPENDS = "libnl dbus dbus-glib udev wireless-tools gnutls util-linux ppp"
 
-inherit gnome gettext systemd
+inherit gnome gettext systemd useradd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-NetworkManager.service-remove-reference-to-NetworkMa.patch \
+    file://50-org.freedesktop.NetworkManager.rules \
 "
 SRC_URI[md5sum] = "38d28f6bd9220d85dfff47210706195c"
 SRC_URI[sha256sum] = "c366bcded6354d8186ad93c05d26d6a20bc550aa0391f974704e7a60e9f6096b"
@@ -58,6 +59,10 @@ do_install_append () {
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
     install -d ${D}/etc/NetworkManager/VPN
+
+    # polkit
+    install -m 700 -d ${D}/etc/polkit-1/rules.d
+    install -m 0755 ${WORKDIR}/50-org.freedesktop.NetworkManager.rules ${D}/etc/polkit-1/rules.d
 }
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
@@ -104,3 +109,6 @@ FILES_${PN}-tests = " \
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system network"
-- 
1.7.6.5


