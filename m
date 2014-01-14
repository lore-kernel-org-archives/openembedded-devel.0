Return-Path: <ting.liu@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id BC2216A566
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:30:23 +0000 (UTC)
Received: from mail113-co1-R.bigfish.com (10.243.78.251) by
	CO1EHSOBE038.bigfish.com (10.243.66.103) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:30:25 +0000
Received: from mail113-co1 (localhost [127.0.0.1])	by
	mail113-co1-R.bigfish.com (Postfix) with ESMTP id D7792C02D0	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:30:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail113-co1 (localhost.localdomain [127.0.0.1]) by mail113-co1
	(MessageSwitch) id 1389691822707562_17175;
	Tue, 14 Jan 2014 09:30:22 +0000 (UTC)
Received: from CO1EHSMHS030.bigfish.com (unknown [10.243.78.231])	by
	mail113-co1.bigfish.com (Postfix) with ESMTP id A7A86B80047;
	Tue, 14 Jan 2014 09:30:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS030.bigfish.com
	(10.243.66.40) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:30:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:30:21 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9UIY0016636;	Tue, 14 Jan 2014 02:30:20 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:30:18 +0800
Message-ID: <1389691818-4764-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] netcf: hardcode --with-driver=redhat for target build
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
X-List-Received-Date: Tue, 14 Jan 2014 09:30:25 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

The configure script of netcf checks the HOST setup to identify the
network interface. This means it checks for Red Hat, SuSE, debian,
Ubuntu, etc. As this is an embedded cross build, it doesn't seem to
make sense to check the HOST in the first place to determine info for
the TARGET.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 60d82d1..93f8c70 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -18,6 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit gettext autotools
 
+EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 do_configure_prepend() {
 	cd ${S}
 	./bootstrap
-- 
1.7.3.4



