Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 2400 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 May 2019 13:42:27 UTC
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
	[87.98.165.232])
	by mail.openembedded.org (Postfix) with ESMTP id E7FBC7E33A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 13:42:27 +0000 (UTC)
Received: from player746.ha.ovh.net (unknown [10.108.42.168])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id CFCCE217383
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 14:25:03 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 538E1673DAFB;
	Fri, 31 May 2019 12:25:02 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2019 14:24:48 +0200
Message-Id: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
X-Ovh-Tracer-Id: 2098395954910867016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefuddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: piotr.krol@3mdeb.com
Subject: [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 13:42:29 -0000

This patch introduces recipe for the stressapptest utility.
The recipe builds without errors and warnings (tested on thud).
It basically uses autootools to buildm so should build just fine
on the other releases as well.
Basic commands from the project's README were tested on a few
armv7 / armv8 platforms.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../stressapptest/stressapptest_1.0.9.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
new file mode 100644
index 000000000000..3e5748a3a12c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Stressful Application Test"
+DESCRIPTION = "Stressful Application Test (or stressapptest, its unix name) \
+ is a memory interface test. It tries to maximize randomized traffic to memory \
+ from processor and I/O, with the intent of creating a realistic high load \
+ situation in order to test the existing hardware devices in a computer. \
+"
+HOMEPAGE = "https://github.com/stressapptest/stressapptest"
+SECTION = "benchmark"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
+
+SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
+SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
-- 
2.7.4


