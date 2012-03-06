Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4io4-0002SF-DW
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 02:03:12 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so1348012eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 16:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.112.130 as permitted sender)
	client-ip=10.213.112.130; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.112.130 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.112.130])
	by 10.213.112.130 with SMTP id w2mr2802903ebp.252.1330995279671
	(num_hops = 1); Mon, 05 Mar 2012 16:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hg/i9TtlzIf3r5NzDej0Q+lYuO7eVCTudVPkUyQTW3o=;
	b=DDsvsyQheGmiA3O1UyWiuZXsHRrm+hDgf/byMcsl4k12BmddNIAj+0Ey0GaXcLNc0Y
	Mhrgh1NTnWsloQtXfZSWAr0lneF6ulllpGEiU3HBSpTccuHuMW3GNVtWq+p7WDt+hq9v
	XJpBjx3KxXFKqNsl7CJQ7ayUbrYQNP9HFS5IINfZcnc3rqR15l8XV919lmEZkXD7HlEC
	xWnG4tgcRpr248s1k+nswgHro7RnF9tnEG/CpGiG2qsiAfMf7abHRNH6IcZlvF932g7e
	IHGPg3bGw5mCyfMQmsRRZ4uPfPfS21VUgawFBTCit8y7mN/eI9im/rmMqfRS+gxSN68F
	eT1g==
Received: by 10.213.112.130 with SMTP id w2mr2124006ebp.252.1330995279564;
	Mon, 05 Mar 2012 16:54:39 -0800 (PST)
Received: from localhost.localdomain (p4FDF114E.dip.t-dialin.net.
	[79.223.17.78])
	by mx.google.com with ESMTPS id s48sm67842976eem.0.2012.03.05.16.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 16:54:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 01:58:17 +0100
Message-Id: <1330995497-10440-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330995497-10440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330995497-10440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, v2 3/3] networkmanager: cleanup
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
X-List-Received-Date: Tue, 06 Mar 2012 01:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tested with buildhistory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 6bbbce5..474d98a 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -23,8 +23,9 @@ EXTRA_OECONF = " \
 		--with-distro=debian \
 		--with-crypto=gnutls \
 		--disable-more-warnings \
-        --with-dhclient=${base_sbindir}/dhclient \
-        --with-iptables=${sbindir}/iptables \
+                --with-dhclient=${base_sbindir}/dhclient \
+                --with-iptables=${sbindir}/iptables \
+                --with-tests \
 "
 
 do_configure_prepend() {
@@ -37,17 +38,14 @@ do_configure_prepend() {
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
 	sed -i -e s:deny:allow:g ${S}/src/NetworkManager.conf
-	sed -i -e s:deny:allow:g ${S}/system-settings/src/nm-system-settings.conf || true
 	sed -i -e s:deny:allow:g ${S}/callouts/nm-dispatcher.conf
 }
 
 do_install_append () {
 	install -d ${D}/etc/dbus-1/event.d
-	# Test binaries
+	# Additional test binaries
 	install -d ${D}/usr/bin
-	install -m 0755 ${S}/test/.libs/nm-tool ${D}/usr/bin
 	install -m 0755 ${S}/test/.libs/libnm* ${D}/usr/bin
-	install -m 0755 ${S}/test/.libs/nm-online ${D}/usr/bin
 
 	install -d ${D}/etc/NetworkManager/
 
@@ -85,14 +83,9 @@ FILES_${PN}-dbg += "${libdir}/NetworkManager/.debug/ \
 		    ${libdir}/pppd/*/.debug/ "
 
 FILES_${PN}-dev += "${datadir}/NetworkManager/gdb-cmd \
-                    ${libdir}/pppd/*/*.a \
                     ${libdir}/pppd/*/*.la \
-                    ${libdir}/NetworkManager/*.a \
                     ${libdir}/NetworkManager/*.la"
 
 FILES_${PN}-tests = "${bindir}/nm-tool \
                      ${bindir}/libnm_glib_test \
-                     ${bindir}/nminfotest \
-                     ${bindir}/nm-online \
-                     ${bindir}/nm-supplicant \
-                     ${bindir}/nm-testdevices"
+                     ${bindir}/nm-online"
-- 
1.7.4.4



