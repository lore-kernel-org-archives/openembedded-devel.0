Return-Path: <ting.liu@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe005.messaging.microsoft.com [216.32.180.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEBB6B269
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:57:07 +0000 (UTC)
Received: from mail61-va3-R.bigfish.com (10.7.14.249) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 03:57:06 +0000
Received: from mail61-va3 (localhost [127.0.0.1])	by mail61-va3-R.bigfish.com
	(Postfix) with ESMTP id A40F9400098	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:57:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail61-va3 (localhost.localdomain [127.0.0.1]) by mail61-va3
	(MessageSwitch) id 1389671824129523_24284;
	Tue, 14 Jan 2014 03:57:04 +0000 (UTC)
Received: from VA3EHSMHS023.bigfish.com (unknown [10.7.14.238])	by
	mail61-va3.bigfish.com (Postfix) with ESMTP id 1A23D3C004A;
	Tue, 14 Jan 2014 03:57:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS023.bigfish.com
	(10.7.99.33) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 03:57:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 03:57:02 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s0E3v11L007725; Mon, 13 Jan 2014 20:57:02 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2014 21:57:00 -0600
Message-ID: <1389671821-3268-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 1/2] ipsec-tools: fix unrecognised --without-gssapi option
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
X-List-Received-Date: Tue, 14 Jan 2014 03:57:07 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../ipsec-tools/ipsec-tools_0.8.1.bb               |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index fc39a55..e931745 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -44,7 +44,6 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --with-readline \
                 --with-openssl=${STAGING_LIBDIR}/.. \
                 --without-libradius \
-                --without-gssapi \
                 --without-libpam \
                 --disable-security-context \
                 --enable-shared \
-- 
1.7.9.7



