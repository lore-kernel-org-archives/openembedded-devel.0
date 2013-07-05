Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe002.messaging.microsoft.com [207.46.163.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7974B6AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:54:54 +0000 (UTC)
Received: from mail20-co9-R.bigfish.com (10.236.132.237) by
	CO9EHSOBE020.bigfish.com (10.236.130.83) with Microsoft SMTP Server id
	14.1.225.22; Fri, 5 Jul 2013 09:54:54 +0000
Received: from mail20-co9 (localhost [127.0.0.1])	by mail20-co9-R.bigfish.com
	(Postfix) with ESMTP id 63D2560351	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:54:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail20-co9 (localhost.localdomain [127.0.0.1]) by mail20-co9
	(MessageSwitch) id 1373018092791408_14835;
	Fri,  5 Jul 2013 09:54:52 +0000 (UTC)
Received: from CO9EHSMHS026.bigfish.com (unknown [10.236.132.251])	by
	mail20-co9.bigfish.com (Postfix) with ESMTP id B520B3A00FF	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:54:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS026.bigfish.com
	(10.236.130.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 5 Jul 2013 09:54:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 5 Jul 2013 09:54:51 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r659slc5023967;	Fri, 5 Jul 2013 02:54:49 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jul 2013 17:54:44 +0800
Message-ID: <1373018084-5555-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-oe][PATCH] samba:Add /run into package
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
X-List-Received-Date: Fri, 05 Jul 2013 09:54:55 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index d0fa8e6..6cead01 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -20,6 +20,7 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/*.dat \
                 ${libdir}/auth/*.so \
                 ${libdir}/security/pam_smbpass.so \
+                /run \
 "
 
 FILES_${PN}-dbg += "${libdir}/vfs/.debug/*.so \
-- 
1.7.5.4



