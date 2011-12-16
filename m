Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUc6-000202-Gp
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:02:02 +0100
Received: from mail1-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 09:39:34 +0000
Received: from mail1-db3 (localhost [127.0.0.1])	by mail1-db3-R.bigfish.com
	(Postfix) with ESMTP id 6CB264804EA	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:43 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail1-db3 (localhost.localdomain [127.0.0.1]) by mail1-db3
	(MessageSwitch) id 1324028373759289_11369;
	Fri, 16 Dec 2011 09:39:33 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.246])	by
	mail1-db3.bigfish.com (Postfix) with ESMTP id AB455280042	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 09:39:24 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 16 Dec 2011 03:39:20 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG9dDji008853;
	Fri, 16 Dec 2011 03:39:19 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 17:41:56 +0800
Message-ID: <1324028520-16474-4-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324028520-16474-1-git-send-email-b19537@freescale.com>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe v2 4/8] libnfnetlink: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:02:02 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    libnfnetlink is the low-level library for netfilter related kernel/userspace
    communication. It provides a generic messaging infrastructure for in-kernel
    netfilter subsystems (such as nfnetlink_log, nfnetlink_queue, nfnetlink_conntrack)
    and their respective users and/or management tools in userspace.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../libnfnetlink/libnfnetlink.inc                  |   13 +++++++++++++
 .../libnfnetlink/libnfnetlink_1.0.0.bb             |    6 ++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc
 create mode 100644 meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb

diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc
new file mode 100644
index 0000000..e79c1a9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
+kernel/userspace communication. It provides a generic messaging \
+infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
+nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
+management tools in userspace."
+SECTION = "devel/libs"
+LICENSE = "GPLv2+"
+HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
+
+SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
+
+inherit autotools pkgconfig
+
diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
new file mode 100644
index 0000000..cea4195
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
@@ -0,0 +1,6 @@
+include libnfnetlink.inc
+
+LIC_FILES_CHKSUM = "file://Makefile.in;endline=13;md5=a44bb8f4c22793d55c5e879eec256702"
+
+SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
+SRC_URI[libnfnetlink-1.0.0.sha256sum] = "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"
-- 
1.7.0.4




