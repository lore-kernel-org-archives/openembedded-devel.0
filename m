Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1EBl-0006su-CZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 11:49:49 +0100
Received: from mail116-tx2-R.bigfish.com (10.9.14.238) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:03:51 +0000
Received: from mail116-tx2 (localhost [127.0.0.1])	by
	mail116-tx2-R.bigfish.com (Postfix) with ESMTP id 2F9BC1C01F1	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail116-tx2 (localhost.localdomain [127.0.0.1]) by mail116-tx2
	(MessageSwitch) id 1359713029198669_9779;
	Fri,  1 Feb 2013 10:03:49 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.243])	by
	mail116-tx2.bigfish.com (Postfix) with ESMTP id 2B3CE2C0052	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:03:48 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:02:53 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11A2o9Y030747;	Fri, 1 Feb 2013 03:02:51 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:02:44 +0800
Message-ID: <1359712968-22554-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-java][for denzil] 0/4] patches to work with poky/meta-oe denzil
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
X-List-Received-Date: Fri, 01 Feb 2013 10:49:52 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

This patchset is targeted to work with poky/meta-oe denzil branch. It is 
based on the commit:
f5f49c8 openjdk6: apply same fix for ucontext for cacao on arm to openjdk6 too
 
Tests for openjdk-6 had been done using poky (denzil) + meta-oe (denzil) + 
meta-java, on beagleboard and mpc8315e-rdb.

Ting Liu (4):
  openjdk: not use update-alternatives class
  llvm: not use pythonnative class
  Revert "llvm: use spaces for python functions"
  openjdk-6: Remove the Xp header and library configure checks

 recipes-core/llvm/llvm.inc                         |   69 ++++++++++----------
 ...the-autoconf-Xp-header-and-library-checks.patch |   21 ++++++
 recipes-core/openjdk/openjdk-6-common.inc          |   20 +++++-
 recipes-core/openjdk/openjdk-7-common.inc          |   19 +++++-
 recipes-core/openjdk/openjdk-postinst.inc          |   11 ---
 5 files changed, 91 insertions(+), 49 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b24/Remove-the-autoconf-Xp-header-and-library-checks.patch

-- 
1.7.5.4




