Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4aCe-0001yi-R9
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 16:52:00 +0100
Received: by bkcjg15 with SMTP id jg15so3484542bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 07:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.204.154.202 as permitted sender)
	client-ip=10.204.154.202; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.204.154.202 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.204.154.202])
	by 10.204.154.202 with SMTP id p10mr10546031bkw.79.1330962206453
	(num_hops = 1); Mon, 05 Mar 2012 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=XXkTWI5I0599i//FeGJPHNjOnBDvFdtK/20BBDKf4Us=;
	b=A5/3kpH9QemASbNyBfA+VwEggq2QbvFxFcJmZHuaysFVffQWBJIJSz1OcYhqvOcVJf
	AO9oMkqQduBpjt0qSD7t8LLSx0oBQ2j58wqwfwu9RVe/mg9LL9E3gKAw3DSMygCnppct
	Y3BwDhKlrv+Z9ucN0UdnDgQekT20wSPttXu86nskttU83aZ7skqLscanpx7IJgMnY+IZ
	tSwV0Ittu9sGAZaIBHZO9hqsx8UYL/dvrGrMh5stCoRuUvTh7xDXgt/yPytOo3ber4W2
	cIMtRgBSXtKUYPK0n/rPbwf2OHfp5nFGkm9LaK8h+QDJziziYlVCYK3dpmEW2hc7isoe
	nKDg==
Received: by 10.204.154.202 with SMTP id p10mr8315009bkw.79.1330962206369;
	Mon, 05 Mar 2012 07:43:26 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190]) by mx.google.com with ESMTPS id
	jr13sm21901631bkb.14.2012.03.05.07.43.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 07:43:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 16:43:24 +0100
Message-Id: <1330962204-2504-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1330962204-2504-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330962204-2504-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/3] networkmanager: cleanup
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
1.7.6.4



