Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TbqAG-0006kZ-0e
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 11:07:16 +0100
Received: from mail55-co9-R.bigfish.com (10.236.132.242) by
	CO9EHSOBE037.bigfish.com (10.236.130.100) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Nov 2012 09:07:47 +0000
Received: from mail55-co9 (localhost [127.0.0.1])	by mail55-co9-R.bigfish.com
	(Postfix) with ESMTP id 31DCF9401AF	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 09:07:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail55-co9 (localhost.localdomain [127.0.0.1]) by mail55-co9
	(MessageSwitch) id 1353661664970586_8252;
	Fri, 23 Nov 2012 09:07:44 +0000 (UTC)
Received: from CO9EHSMHS013.bigfish.com (unknown [10.236.132.247])	by
	mail55-co9.bigfish.com (Postfix) with ESMTP id EA688DC004B	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 09:07:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS013.bigfish.com
	(10.236.130.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Nov 2012 09:07:44 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 23 Nov 2012 09:07:43 +0000
Received: from fedora1764.ap.freescale.net (fedora1764.ap.freescale.net
	[10.193.20.36])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qAN97cDY009637;	Fri, 23 Nov 2012 02:07:40 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Nov 2012 17:07:32 +0800
Message-ID: <1353661652-29949-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.11.7
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
X-List-Received-Date: Fri, 23 Nov 2012 10:07:16 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fedora 17 has /bin/perl, this causes samba build to put perl interpreter
path as /bin/perl But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation:
| error: Failed dependencies:
| 	/bin/perl is needed by samba-3.6.8-r1.ppce5500

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc      | 2 ++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index faa2be0..c4430d1 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -88,6 +88,8 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
         install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
 
+        sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
+
 }
 
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index cc09a48..7c54dae 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.11.7




