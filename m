Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6159971AC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 10:45:02 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4AAj3uX003641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 12:45:03 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.78.61])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v4AAj3Ek006558;
	Wed, 10 May 2017 12:45:03 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 May 2017 12:45:01 +0200
Message-Id: <1494413101-15189-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-multimedia][PATCH] miniupnpd: improve recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 May 2017 10:45:04 -0000

- Produce a clean download tarball
- ./genconfig.sh is not necessary as it is called by make if necessary
- Enable the possible to do vendor configuration in the supplied .conf file


Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
index bb361a1..c6f36e1 100644
--- a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
+++ b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
@@ -11,7 +11,7 @@ inherit autotools gettext pkgconfig
 
 DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
-SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz \
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
 "
 SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
 SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
@@ -20,8 +20,7 @@ IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
 do_compile() {
     cd ${S}
-    CONFIG_OPTIONS="${IPV6} --leasefile" ./genconfig.sh
-    oe_runmake -f Makefile.linux
+    CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
 }
 
 do_install() {
-- 
2.1.4


