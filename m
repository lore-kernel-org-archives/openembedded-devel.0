Return-Path: <ting.liu@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id DCDEF6CF24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 04:01:21 +0000 (UTC)
Received: from mail174-db8-R.bigfish.com (10.174.8.232) by
	DB8EHSOBE025.bigfish.com (10.174.4.88) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 04:01:22 +0000
Received: from mail174-db8 (localhost [127.0.0.1])	by
	mail174-db8-R.bigfish.com (Postfix) with ESMTP id 5F4F81E00DB	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 04:01:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail174-db8 (localhost.localdomain [127.0.0.1]) by mail174-db8
	(MessageSwitch) id 1389672079453160_5445;
	Tue, 14 Jan 2014 04:01:19 +0000 (UTC)
Received: from DB8EHSMHS015.bigfish.com (unknown [10.174.8.227])	by
	mail174-db8.bigfish.com (Postfix) with ESMTP id 699903C0071;
	Tue, 14 Jan 2014 04:01:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS015.bigfish.com
	(10.174.4.25) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 04:01:19 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 04:00:49 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s0E40ntK009509; Mon, 13 Jan 2014 21:00:49 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2014 22:00:48 -0600
Message-ID: <1389672049-3309-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 1/2] ipsec-tools: fix unrecognised --without-gssapi option
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
X-List-Received-Date: Tue, 14 Jan 2014 04:01:22 -0000
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



