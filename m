Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TjRfC-0000IP-IE
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 10:34:40 +0100
Received: from mail45-db3-R.bigfish.com (10.3.81.230) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 14 Dec 2012 08:19:48 +0000
Received: from mail45-db3 (localhost [127.0.0.1])	by mail45-db3-R.bigfish.com
	(Postfix) with ESMTP id 06AA73C01A4	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:19:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail45-db3 (localhost.localdomain [127.0.0.1]) by mail45-db3
	(MessageSwitch) id 1355473187398179_13054;
	Fri, 14 Dec 2012 08:19:47 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.253])	by
	mail45-db3.bigfish.com (Postfix) with ESMTP id 5B7C83E018C	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:19:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 14 Dec 2012 08:19:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 14 Dec 2012 08:19:45 +0000
Received: from b28495.ap.freescale.net (udp143739uds.ap.freescale.net
	[10.192.208.202])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qBE8JfDP017160;	Fri, 14 Dec 2012 01:19:43 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Dec 2012 16:19:41 +0800
Message-ID: <1355473181-4279-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-oe] samba: Fix build on Fedora 17
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
X-List-Received-Date: Fri, 14 Dec 2012 09:34:40 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fedora 17 has /bin/perl, this causes samba build to put perl interpreter
path as /bin/perl But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation:
| error: Failed dependencies:
| 	/bin/perl is needed by samba-3.6.8-r3.ppce5500

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc      |    1 +
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index d39a84a..28ecc69 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -89,6 +89,7 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
 
 	rmdir ${D}${base_sbindir}
+        sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
 }
 
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 7985199..517160d 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.3.4




