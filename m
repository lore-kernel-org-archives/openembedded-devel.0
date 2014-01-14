Return-Path: <ting.liu@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id 434C56A566
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:10:19 +0000 (UTC)
Received: from mail48-co1-R.bigfish.com (10.243.78.233) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:10:19 +0000
Received: from mail48-co1 (localhost [127.0.0.1])	by mail48-co1-R.bigfish.com
	(Postfix) with ESMTP id ABE40A4026B	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:10:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail48-co1 (localhost.localdomain [127.0.0.1]) by mail48-co1
	(MessageSwitch) id 138969061879419_32332;
	Tue, 14 Jan 2014 09:10:18 +0000 (UTC)
Received: from CO1EHSMHS032.bigfish.com (unknown [10.243.78.227])	by
	mail48-co1.bigfish.com (Postfix) with ESMTP id 0F71530004F;
	Tue, 14 Jan 2014 09:10:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS032.bigfish.com
	(10.243.66.42) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:10:17 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:10:15 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9AB0v003871;	Tue, 14 Jan 2014 02:10:14 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:10:10 +0800
Message-ID: <1389690610-4230-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1389690610-4230-1-git-send-email-b28495@freescale.com>
References: <1389690610-4230-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 2/2] inetutils: not hard coded libreadline path
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
X-List-Received-Date: Tue, 14 Jan 2014 09:10:20 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Avoid below QA issues:
| ERROR: QA Issue: package inetutils-ftp contains bad RPATH
| ERROR: QA Issue: package inetutils-telnet contains bad RPATH
| ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
| ERROR: QA run found fatal errors. Please consider fixing them.
| ERROR: Function failed: do_package_qa

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../inetutils/inetutils_1.9.1.bb                   |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 97fc6a1..03b8e65 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -37,7 +37,6 @@ PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         ${noipv6} \
-        --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
 "
 
 do_configure_prepend () {
-- 
1.7.3.4



