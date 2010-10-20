Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P8otK-0001Zx-81
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 08:44:56 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 382CC491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 08:44:12 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 21 Oct 2010 08:44:12 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 689FD29EAC; Wed, 20 Oct 2010 13:10:19 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 13:10:06 +0200
Message-Id: <1287573007-24350-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CBECD95.1050700@dresearch.de>
References: <4CBECD95.1050700@dresearch.de>
X-OriginalArrivalTime: 21 Oct 2010 06:44:12.0193 (UTC)
	FILETIME=[5EE5B910:01CB70EB]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] ca-certificates: unbreak do_configure of packages depending on ca-bundle.pem
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
X-List-Received-Date: Thu, 21 Oct 2010 06:44:56 -0000

just create an empty ca-bundle file to satisfy build time
dependencies in do_configure of other packages (e.g. epiphany),
content is updated later in postinst

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 .../ca-certificates_20090814+nmu2.bb               |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb b/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
index c8e4dbd..a37b01a 100644
--- a/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
+++ b/recipes/ca-certificates/ca-certificates_20090814+nmu2.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 PRIORITY = "optional"
 LICENSE = "GPL"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://remove-c-rehash.patch"
@@ -27,13 +28,21 @@ do_install_append() {
                 crt=$(echo $crt | sed -e 's/\.\///')
                 echo $crt >> ${D}/etc/ca-certificates.conf
         done
+
+	# update-ca-certificates is not able to deal with pathes,
+	# so just create an empty ca-bundle file to satisfy build time
+	# dependencies in do_configure of other packages (e.g. epiphany),
+	# content is updated later (see pkg_postinst)
+	touch ${D}/etc/ssl/ca-bundle.pem
 }
 
 PACKAGE_ARCH = "all"
 PACKAGES = "${PN}"
 
 pkg_postinst_${PN} () {
+if test -z "$D"; then
         /usr/sbin/update-ca-certificates
+fi
 }
 
 CONFFILES_${PN} = "/etc/ca-certificates.conf"
-- 
1.7.1



