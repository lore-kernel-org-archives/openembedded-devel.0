Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFJI-0002m8-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:05:52 +0100
Received: from mail165-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:35 +0000
Received: from mail165-ch1 (localhost [127.0.0.1])	by
	mail165-ch1-R.bigfish.com (Postfix) with ESMTP id D5E025C0205	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:06 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(z98bRzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail165-ch1 (localhost.localdomain [127.0.0.1]) by mail165-ch1
	(MessageSwitch) id 1324447146770664_12439;
	Wed, 21 Dec 2011 05:59:06 +0000 (UTC)
Received: from CH1EHSMHS017.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail165-ch1.bigfish.com (Postfix) with ESMTP id
	B71C880047 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS017.bigfish.com
	(10.43.70.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:35 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:43 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWZ015654;
	Tue, 20 Dec 2011 23:58:41 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:42 +0800
Message-ID: <1324447304-4874-5-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 meta-oe 5/7] libnfnetlink: add version 1.0.0
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
X-List-Received-Date: Wed, 21 Dec 2011 06:05:52 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    libnfnetlink is the low-level library for netfilter related kernel/userspace
    communication. It provides a generic messaging infrastructure for in-kernel
    netfilter subsystems (such as nfnetlink_log, nfnetlink_queue, nfnetlink_conntrack)
    and their respective users and/or management tools in userspace.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../libnfnetlink/libnfnetlink_1.0.0.bb             |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb

diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
new file mode 100644
index 0000000..1ce5912
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
+kernel/userspace communication. It provides a generic messaging \
+infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
+nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
+management tools in userspace."
+HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
+SECTION = "devel/libs"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://Makefile.in;endline=13;md5=a44bb8f4c22793d55c5e879eec256702"
+
+SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
+SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
+SRC_URI[libnfnetlink-1.0.0.sha256sum] = "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"
+
+inherit autotools pkgconfig
-- 
1.7.0.4




