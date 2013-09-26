Return-Path: <B28495@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id E72E561105
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:20:40 +0000 (UTC)
Received: from mail195-db8-R.bigfish.com (10.174.8.240) by
	DB8EHSOBE007.bigfish.com (10.174.4.70) with Microsoft SMTP Server id
	14.1.225.22; Thu, 26 Sep 2013 09:20:42 +0000
Received: from mail195-db8 (localhost [127.0.0.1])	by
	mail195-db8-R.bigfish.com (Postfix) with ESMTP id ED52E34034F	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:20:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail195-db8 (localhost.localdomain [127.0.0.1]) by mail195-db8
	(MessageSwitch) id 1380187239747432_22531;
	Thu, 26 Sep 2013 09:20:39 +0000 (UTC)
Received: from DB8EHSMHS022.bigfish.com (unknown [10.174.8.249])	by
	mail195-db8.bigfish.com (Postfix) with ESMTP id B189CA00041	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:20:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS022.bigfish.com
	(10.174.4.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 26 Sep 2013 09:20:39 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 26 Sep 2013 09:20:37 +0000
Received: from NETWORKudp177383uds.ap.freescale.net ([10.193.20.27])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id r8Q9KZ6w027107;
	Thu, 26 Sep 2013 02:20:36 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Sep 2013 17:20:31 +0800
Message-ID: <1380187231-23854-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64 to support large files
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
X-List-Received-Date: Thu, 26 Sep 2013 09:20:43 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Without this patch, netperf2.6 can only
support files smaller than 2GB with TCP_SENDFILE item.

Signed-off-by: Ting Liu <b28495@freescale.com>
Tested-by: Jianhua Xie<jianhua.xie@freescale.com>
---
 .../recipes-support/netperf/netperf_2.6.0.bb       |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index eda7859..1d9ba20 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -23,6 +23,10 @@ S = "${WORKDIR}/netperf-${PV}"
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 
+# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files 
+# larger than 2GB
+CFLAGS_append = " -D_FILE_OFFSET_BITS=64"
+
 # autotools.bbclass attends to include m4 files with path depth <= 2 by
 # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
 do_configure_prepend() {
-- 
1.7.3.4



