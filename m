Return-Path: <ting.liu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id DE7A16A463
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:36:17 +0000 (UTC)
Received: from mail59-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE022.bigfish.com (10.43.70.79) with Microsoft SMTP Server id
	14.1.225.22; Wed, 15 Jan 2014 07:36:17 +0000
Received: from mail59-ch1 (localhost [127.0.0.1])	by mail59-ch1-R.bigfish.com
	(Postfix) with ESMTP id 7AC7B3400C6	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:36:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail59-ch1 (localhost.localdomain [127.0.0.1]) by mail59-ch1
	(MessageSwitch) id 1389771375248870_13927;
	Wed, 15 Jan 2014 07:36:15 +0000 (UTC)
Received: from CH1EHSMHS004.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail59-ch1.bigfish.com (Postfix) with ESMTP id
	3868DA0047; Wed, 15 Jan 2014 07:36:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS004.bigfish.com
	(10.43.70.4) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 15 Jan 2014 07:36:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 15 Jan 2014 07:36:14 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s0F7aD6Y025871; Wed, 15 Jan 2014 00:36:14 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2014 01:36:13 -0600
Message-ID: <1389771373-5181-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH v2] inetutils: fix libreadline path to fix QA errors
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
X-List-Received-Date: Wed, 15 Jan 2014 07:36:18 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

If wrong path set, inetutils configure script will add a absolute
rpath, which result in the below QA errors:
| ERROR: QA Issue: package inetutils-ftp contains bad RPATH
| ERROR: QA Issue: package inetutils-telnet contains bad RPATH
| ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
| ERROR: QA run found fatal errors. Please consider fixing them.
| ERROR: Function failed: do_package_qa

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../inetutils/inetutils_1.9.1.bb                   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 97fc6a1..80022c7 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         ${noipv6} \
-        --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
+        --with-libreadline-prefix=${STAGING_LIBDIR} \
 "
 
 do_configure_prepend () {
-- 
1.7.9.7



