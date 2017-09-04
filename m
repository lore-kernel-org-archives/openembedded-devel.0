Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id D52C0780D9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 05:37:25 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 29dd_b238_f697e51c_7f45_467d_a654_db90b434de07;
	Mon, 04 Sep 2017 14:37:23 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6B11AC0091
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:37:22 +0900 (JST)
Received: from G01JPEXCHKW16.g01.fujitsu.local
	(G01JPEXCHKW16.g01.fujitsu.local [10.0.194.55])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A5DB132869D for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:37:21 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHKW16.g01.fujitsu.local (10.0.194.55) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 14:37:22 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 14:37:20 +0900
Message-ID: <1504503440-24834-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] logcheck: Add HOMEPAGE info into recipe file
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
X-List-Received-Date: Mon, 04 Sep 2017 05:37:26 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb b/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
index ba4c2ab..5f86a5e 100644
--- a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
+++ b/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
@@ -7,6 +7,7 @@ filtering out "normal" entries. \
 Normal entries are entries which match one of the many included regular \
 expression files contain in the database."
 SECTION = "Applications/System"
+HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-- 
2.7.4



