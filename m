Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 26F8377FC7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 01:36:17 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 0516_5672_858dfad2_798c_43aa_933b_3988a6e906fd;
	Mon, 30 Oct 2017 10:36:11 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 9597EAC00E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:36:09 +0900 (JST)
Received: from g01jpexchkw35.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	67B593285F5 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:36:08 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchkw35.g01.fujitsu.local (10.0.193.50) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 30 Oct 2017 10:36:07 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Oct 2017 10:35:56 +0900
Message-ID: <1509327356-19319-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <a52d7476-864f-728c-e115-96967fdce450@balister.org>
References: <a52d7476-864f-728c-e115-96967fdce450@balister.org>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH v2] spi-tools: Add version info
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
X-List-Received-Date: Mon, 30 Oct 2017 01:36:18 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index f808125..6ca6ad7 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,6 +4,9 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
+BPV = "0.8.1"
+PV = "${BPV}"
+
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
-- 
2.7.4



