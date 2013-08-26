Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0248.outbound.messaging.microsoft.com [213.199.154.248])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1026B4BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:25:12 +0000 (UTC)
Received: from mail76-db9-R.bigfish.com (10.174.16.245) by
	DB9EHSOBE021.bigfish.com (10.174.14.84) with Microsoft SMTP Server id
	14.1.225.22; Mon, 26 Aug 2013 03:25:11 +0000
Received: from mail76-db9 (localhost [127.0.0.1])	by mail76-db9-R.bigfish.com
	(Postfix) with ESMTP id 86D4D300267	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:25:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzc8kzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah186068h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail76-db9 (localhost.localdomain [127.0.0.1]) by mail76-db9
	(MessageSwitch) id 1377487508560869_21888;
	Mon, 26 Aug 2013 03:25:08 +0000 (UTC)
Received: from DB9EHSMHS018.bigfish.com (unknown [10.174.16.240])	by
	mail76-db9.bigfish.com (Postfix) with ESMTP id 83927140057	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:25:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS018.bigfish.com
	(10.174.14.28) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 26 Aug 2013 03:25:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Mon, 26 Aug 2013 03:25:06 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7Q3P24Q000677;	Sun, 25 Aug 2013 20:25:04 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2013 11:24:59 +0800
Message-ID: <1377487499-31434-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 4/4] barnyard: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2013 03:25:12 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *Barnyard is a output system for Snort

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/licenses/QPL                               |   99 ++++++++++++++++++++
 .../barnyard/barnyard_0.2.0.bb                     |   22 +++++
 2 files changed, 121 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/licenses/QPL
 create mode 100644 meta-oe/recipes-connectivity/barnyard/barnyard_0.2.0.bb

diff --git a/meta-oe/licenses/QPL b/meta-oe/licenses/QPL
new file mode 100644
index 0000000..af39932
--- /dev/null
+++ b/meta-oe/licenses/QPL
@@ -0,0 +1,99 @@
+			     THE Q PUBLIC LICENSE
+				  version 1.0
+
+		   Copyright (C) 1999 Troll Tech AS, Norway.
+		       Everyone is permitted to copy and
+		       distribute this license document.
+
+The intent of this license is to establish freedom to share and change the
+software regulated by this license under the open source model.
+
+This license applies to any software containing a notice placed by the
+copyright holder saying that it may be distributed under the terms of
+the Q Public License version 1.0.  Such software is herein referred to as
+the Software.  This license covers modification and distribution of the
+Software, use of third-party application programs based on the Software,
+and development of free software which uses the Software.
+
+				 Granted Rights
+
+1. You are granted the non-exclusive rights set forth in this license
+   provided you agree to and comply with any and all conditions in this
+   license.  Whole or partial distribution of the Software, or software
+   items that link with the Software, in any form signifies acceptance of
+   this license.
+
+2. You may copy and distribute the Software in unmodified form provided
+   that the entire package, including - but not restricted to - copyright,
+   trademark notices and disclaimers, as released by the initial developer
+   of the Software, is distributed.
+
+3. You may make modifications to the Software and distribute your
+   modifications, in a form that is separate from the Software, such as
+   patches. The following restrictions apply to modifications:
+
+     a. Modifications must not alter or remove any copyright notices in
+        the Software.
+
+     b. When modifications to the Software are released under this
+        license, a non-exclusive royalty-free right is granted to the
+        initial developer of the Software to distribute your modification
+        in future versions of the Software provided such versions remain
+        available under these terms in addition to any other license(s) of
+        the initial developer.
+
+4. You may distribute machine-executable forms of the Software or
+   machine-executable forms of modified versions of the Software, provided
+   that you meet these restrictions:
+
+     a. You must include this license document in the distribution.
+
+     b. You must ensure that all recipients of the machine-executable forms
+        are also able to receive the complete machine-readable source code
+        to the distributed Software, including all modifications, without
+        any charge beyond the costs of data transfer, and place prominent
+        notices in the distribution explaining this.
+
+     c. You must ensure that all modifications included in the
+        machine-executable forms are available under the terms of this
+        license.
+
+5. You may use the original or modified versions of the Software to
+   compile, link and run application programs legally developed by you
+   or by others.
+
+6. You may develop application programs, reusable components and other
+   software items that link with the original or modified versions of the
+   Software.  These items, when distributed, are subject to the following
+   requirements:
+
+     a. You must ensure that all recipients of machine-executable forms of
+        these items are also able to receive and use the complete
+        machine-readable source code to the items without any charge
+        beyond the costs of data transfer.
+
+     b. You must explicitly license all recipients of your items to use
+        and re-distribute original and modified versions of the items in
+        both machine-executable and source code forms. The recipients must
+        be able to do so without any charges whatsoever, and they must be
+        able to re-distribute to anyone they choose.
+
+
+     c. If the items are not available to the general public, and the
+        initial developer of the Software requests a copy of the items,
+        then you must supply one.
+
+			    Limitations of Liability
+
+In no event shall the initial developers or copyright holders be liable
+for any damages whatsoever, including - but not restricted to - lost
+revenue or profits or other direct, indirect, special, incidental or
+consequential damages, even if they have been advised of the possibility
+of such damages, except to the extent invariable law, if any, provides
+otherwise.
+
+			          No Warranty
+
+The Software and this license document are provided AS IS with NO WARRANTY
+OF ANY KIND, INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE.
diff --git a/meta-oe/recipes-connectivity/barnyard/barnyard_0.2.0.bb b/meta-oe/recipes-connectivity/barnyard/barnyard_0.2.0.bb
new file mode 100644
index 0000000..a13ebdc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/barnyard/barnyard_0.2.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Barnyard is a output system for Snort."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "QPL"
+LIC_FILES_CHKSUM = "file://LICENSE.QPL;md5=1b8ff8c0012b5a2d647357699bf44b41"
+
+DEPENDS = "libpcap"
+RDEPENDS_${PN} = "libpcap"
+
+SRC_URI = " ${GENTOO_MIRROR}/${P}.tar.gz;name=tarball \
+          "
+SRC_URI[tarball.md5sum] = "be3283028cf414b52b220308ceb411e9"
+SRC_URI[tarball.sha256sum] = "09e0f8e095e79cfe70ea069d13e7d02521a504a1f400a45556a634dccfd31a3a"
+
+
+S = "${WORKDIR}/${P}"
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+	#fix hardcoded include path
+	sed -i -e 's:extra_incl=-I/usr/include/pcap::g' ${S}/configure.in
+}
+
-- 
1.7.5.4



