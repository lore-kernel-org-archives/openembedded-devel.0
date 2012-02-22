Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0JHd-00073f-GO
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 21:59:29 +0100
Received: from mail42-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Wed, 22 Feb 2012 19:50:50 +0000
Received: from mail42-db3 (localhost [127.0.0.1])	by mail42-db3-R.bigfish.com
	(Postfix) with ESMTP id 9C6F24C03A1	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 19:50:49 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail42-db3 (localhost.localdomain [127.0.0.1]) by mail42-db3
	(MessageSwitch) id 1329940248134156_30311;
	Wed, 22 Feb 2012 19:50:48 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.244])	by
	mail42-db3.bigfish.com (Postfix) with ESMTP id 1EF3FA0045	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 19:50:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 22 Feb 2012 19:50:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Wed, 22 Feb 2012 13:50:47 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q1MJolsK004710 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:50:47 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Feb 2012 13:50:46 -0600
Message-ID: <1329940246-28769-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
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
X-List-Received-Date: Wed, 22 Feb 2012 20:59:29 -0000
Content-Type: text/plain

This is useful when we want to include meta-oe as is, and also
want to modify the toolchain such that these patches don't apply
cleanly

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 882876e..b0fd3c7 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -1,4 +1,4 @@
-GCC-4_6-BRANCH-LINARO-BACKPORTS = "        \
+GCC-4_6-BRANCH-LINARO-BACKPORTS ?= "        \
 file://linaro/gcc-4.6-linaro-r106720.patch \
 file://linaro/gcc-4.6-linaro-r106733.patch \
 file://linaro/gcc-4.6-linaro-r106737.patch \
-- 
1.7.6.1




