Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 8399 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Oct 2019 19:14:41 UTC
Received: from 18.mo1.mail-out.ovh.net (18.mo1.mail-out.ovh.net [46.105.35.72])
	by mail.openembedded.org (Postfix) with ESMTP id 486407EE86
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 19:14:41 +0000 (UTC)
Received: from player792.ha.ovh.net (unknown [10.108.35.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 797B7192B24
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 17:38:29 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id E6799AA9A847;
	Fri,  4 Oct 2019 15:38:26 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Oct 2019 17:38:02 +0200
Message-Id: <1570203482-7005-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
X-Ovh-Tracer-Id: 7454864758951259720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-oe][PATCH] smem: package smemcap separately
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
X-List-Received-Date: Fri, 04 Oct 2019 19:14:41 -0000

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>

smemcap is a tiny binary which allows capturing current state of the /proc
for further offline analysis.

Package it seperately so there is no need to install python runtime
dependencies on the embedded system when not required.
---
 meta-oe/recipes-support/smem/smem_1.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
index 519020f3b0d7..702217a33d3e 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -25,3 +25,7 @@ do_install() {
         install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
 }
 RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codecs"
+
+PACKAGES =+ "smemcap"
+
+FILES_smemcap = "${bindir}/smemcap"
-- 
2.7.4


