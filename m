Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4aCe-0001yh-33
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 16:52:00 +0100
Received: by bkcjg15 with SMTP id jg15so3484525bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 07:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.204.173.11 as permitted sender)
	client-ip=10.204.173.11; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.204.173.11 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.204.173.11])
	by 10.204.173.11 with SMTP id n11mr10864979bkz.120.1330962205710
	(num_hops = 1); Mon, 05 Mar 2012 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZLCPRu5DNbvxcYnEwehVpuYh2vbdBKlPYkFLawNaKy4=;
	b=sI0x3P+OHg0Ggkz998QMHXmzf8nTYf5Qn4gxx+RxgyCMJqcf9zeHi/YbpAjQsp09s8
	hr672b5AAMsZH0KPQpQz+UZAGNvJOCdCoto87OIFSGdqgO5MYKWWl/DT/HoQy/NTdglK
	XCNKTCNZPzUgMhxWWyHzwkntgMFuTA/E+HeS3OhMGgKC7lSAWZK8UCri0LTHc+jiGbaO
	s0mw3IfXu6gzaBV8mRkWen6VAgmZ6L9Is1aZOjHiRyTZGa9/iISQBPGfiabrmb9wC4ey
	gLcK2uIvF51OaXyGbwTEsQ/fJbo6SoefOZsD3+bWSwGcMhbLpShu7lIkwGhUgATvMjP0
	Hnmw==
Received: by 10.204.173.11 with SMTP id n11mr8593754bkz.120.1330962205459;
	Mon, 05 Mar 2012 07:43:25 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190]) by mx.google.com with ESMTPS id
	jr13sm21901631bkb.14.2012.03.05.07.43.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 07:43:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 16:43:23 +0100
Message-Id: <1330962204-2504-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1330962204-2504-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330962204-2504-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/3] networkmanager: inherit systemd
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
X-List-Received-Date: Mon, 05 Mar 2012 15:52:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

networkmanager-systemd was not yet created to avoid fallout in images. The
warning for this created at parse time is our reminder.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |   30 ++++----------------
 1 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 45f98be..6bbbce5 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,10 +4,10 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
-inherit gnome gettext
+inherit gnome gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
@@ -56,14 +56,15 @@ do_install_append () {
 	install -d ${D}/etc/NetworkManager/VPN
 }
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE = "NetworkManager.service"
+
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" 
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
 FILES_libnmglib += "${libdir}/libnm_glib.so.*"
 FILES_libnmglib-vpn += "${libdir}/libnm_glib_vpn.so.*"
 
-systemd_unitdir = "${base_libdir}/systemd/system"
-
 FILES_${PN} += " \
 		${libexecdir} \
 		${libdir}/pppd/*/nm-pppd-plugin.so \
@@ -71,7 +72,7 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
-        ${systemd_unitdir} \
+                ${systemd_unitdir}/system/NetworkManager-wait-online.service \
 "
 
 RRECOMMENDS_${PN} += "iptables"
@@ -95,22 +96,3 @@ FILES_${PN}-tests = "${bindir}/nm-tool \
                      ${bindir}/nm-online \
                      ${bindir}/nm-supplicant \
                      ${bindir}/nm-testdevices"
-
-
-pkg_postinst_${PN}() {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    
-    systemctl enable NetworkManager.service
-}
-
-pkg_prerm_${PN}() {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    systemctl disable NetworkManager.service
-}
-- 
1.7.6.4



