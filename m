Return-Path: <lukasz.laguna@3mdeb.com>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Jun 2019 11:44:13 UTC
Received: from 17.mo6.mail-out.ovh.net (17.mo6.mail-out.ovh.net
	[46.105.36.150])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5437E7B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 11:44:13 +0000 (UTC)
Received: from player797.ha.ovh.net (unknown [10.109.146.168])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id E67DD1D0937
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 13:27:17 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: lukasz.laguna@3mdeb.com)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id 4AEF16E78F26;
	Thu, 13 Jun 2019 11:27:14 +0000 (UTC)
From: =?UTF-8?q?=C5=81ukasz=20=C5=81aguna?= <lukasz.laguna@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2019 13:26:55 +0200
Message-Id: <20190613112655.26547-1-lukasz.laguna@3mdeb.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3680848272486479944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehledgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: maciej.pijanowski@3mdeb.com, piotr.krol@3mdeb.com
Subject: [meta-oe][PATCH] gsl: update to version 2.5
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
X-List-Received-Date: Thu, 13 Jun 2019 11:44:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current gsl recipe's PV is 1.15 which is already quite dated. The 1.15 was
released back in the 2011. The most recent one is 2.5 released in June 2018.

There are no dependencies on gsl in the oe-core / meta-oe so upgrading major
from 1 to 2 should not break anything.

Signed-off-by: Łukasz Łaguna <lukasz.laguna@3mdeb.com>
---
 meta-oe/recipes-support/gsl/gsl_1.15.bb | 7 -------
 meta-oe/recipes-support/gsl/gsl_2.5.bb  | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_1.15.bb
 create mode 100644 meta-oe/recipes-support/gsl/gsl_2.5.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_1.15.bb b/meta-oe/recipes-support/gsl/gsl_1.15.bb
deleted file mode 100644
index 620e7804c4fc..000000000000
--- a/meta-oe/recipes-support/gsl/gsl_1.15.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "494ffefd90eef4ada678c306bab4030b"
-SRC_URI[sha256sum] = "85b907e57902e2b7606ef3aef960302ffdd13bd9dc5b8fcbfa75e4f0bf340ea3"
-
diff --git a/meta-oe/recipes-support/gsl/gsl_2.5.bb b/meta-oe/recipes-support/gsl/gsl_2.5.bb
new file mode 100644
index 000000000000..4e8541812577
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_2.5.bb
@@ -0,0 +1,6 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "52fcbe147ba413d78841084cb43c95fb"
+SRC_URI[sha256sum] = "0460ad7c2542caaddc6729762952d345374784100223995eb14d614861f2258d"
-- 
2.17.1


