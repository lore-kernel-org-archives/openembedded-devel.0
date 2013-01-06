Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmX9-000364-7R
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:48 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so8147600dak.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YJ0Qx04hhKLKj33L1omH4VtKIr0+Q4/NNL3IBtaePN8=;
	b=PMHTYm6Y41zq6mkkT/PCsSYkiVONMI/tBv31wmWOm8VMYDcrzSkN9k+pQC5J2cp+xk
	Ogn3P/5WjotJaS3dltCBTHN0zZznlQkHb9cTbs9GkkYKPABfCUe1NInIbNaAw803cF+V
	wBawQtH82kuEycrp9k8I8Dwwzd3Fdygn0LQ3U3ucGyk+8GIjKISELByr9NShCh+bz/BE
	PcH7nHbifOMA570Al4BVP8vyHyvzLHvzBMbaBLvM5XqqkvX9Bo+hSpKzPFErlRTT+Vy0
	0qQ6Lwd0lXLB68aC4aasffVrXGEvz5S56JFYdOcKPb6wOxeY9aRVHhFUr08n8XJxQp/V
	xyQQ==
X-Received: by 10.68.130.226 with SMTP id oh2mr134458186pbb.157.1357463618975; 
	Sun, 06 Jan 2013 01:13:38 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:28 -0800
Message-Id: <1357463568-26241-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 05/25] ndisc6: Forward port recipe from OE classic
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |   62 ++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
new file mode 100644
index 0000000..3920c1a
--- /dev/null
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
@@ -0,0 +1,62 @@
+SECTION = "console/network"
+DESCRIPTION = "This package includes some useful diagnostics tools for \
+IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute6."
+SECTION = "console/network"
+HOMEPAGE = "http://www.remlab.net/ndisc6/"
+LICENSE = "GPL-2.0"
+
+# The tcptraceroute6 and tracert6 commands depend on rltraceroute6 to
+# perform the actual trace operation.
+RDEPENDS_${PN}-tcptraceroute6 = "${PN}-rltraceroute6"
+RDEPENDS_${PN}-tracert6 = "${PN}-rltraceroute6"
+
+SRC_URI = "http://www.remlab.net/files/ndisc6/ndisc6-${PV}.tar.bz2 \
+          "
+SRC_URI[md5sum] = "50cb4c19606cf6ff2b7388e71832f579"
+SRC_URI[sha256sum] = "6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad62ca7a"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+inherit autotools gettext
+
+# Split into seperate packages since we normal don't want them all
+# The main package is left empty and therefore not created.
+PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
+	     ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
+             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
+FILES_${PN}			= ""
+FILES_${PN}-ndisc6		= "${bindir}/ndisc6"
+FILES_${PN}-tcpspray6 		= "${bindir}/tcpspray6"
+FILES_${PN}-rdisc6		= "${bindir}/rdisc6"
+FILES_${PN}-tcptraceroute6	= "${bindir}/tcptraceroute6"
+FILES_${PN}-rltraceroute6	= "${bindir}/rltraceroute6"
+FILES_${PN}-tracert6		= "${bindir}/tracert6"
+FILES_${PN}-rdnssd		= "${sbindir}/rdnssd ${sysconfdir}/rdnssd"
+FILES_${PN}-misc                = "${bindir}/dnssort ${bindir}/name2addr ${bindir}/tcpspray ${bindir}/addr2name"
+
+DESCRIPTION_${PN}-ndisc6	= "ICMPv6 Neighbor Discovery tool. \
+Performs IPv6 neighbor discovery in userland. Replaces arping from the \
+IPv4 world."
+DESCRIPTION_${PN}-rdisc6	= "ICMPv6 Router Discovery tool. \
+Queries IPv6 routers on the network for advertised prefixes. Can be used \
+to detect rogue IPv6 routers, monitor legitimate IPv6 routers."
+DESCRITPION_${PN}-tcpspray6	= "Performs bandwidth measurements of TCP \
+sessions between the local system and a remote echo server in either IPv6 \
+or IPv4."
+
+DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
+servers through slateless IPv6 autoconfiguration."
+
+do_install_append () {
+	rm -rf ${D}${localstatedir}
+}
+# Enable SUID bit for applications that need it
+pkg_postinst_${PN}-rltraceroute6 () {
+	chmod 4555 ${bindir}/rltraceroute6
+}
+pkg_postinst_${PN}-ndisc6 () {
+	chmod 4555 ${bindir}/ndisc6
+}
+pkg_postinst_${PN}-rdisc6 () {
+	chmod 4555 ${bindir}/rdisc6
+}
-- 
1.7.9.5



