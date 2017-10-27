Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1128278262
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:14:34 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 05cf_44f1_65c41dea_b9f6_4e1d_b771_7db1d7ca35a8;
	Fri, 27 Oct 2017 19:14:34 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CDCEAC0197
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 19:14:33 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
	(G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	789ACBD68C1 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 19:14:32 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 19:14:31 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Oct 2017 19:14:30 +0900
Message-ID: <1509099270-1173-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [meta-oe][PATCH] spi-tools: Add version info.
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
X-List-Received-Date: Fri, 27 Oct 2017 10:14:35 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index f808125..2eedf8c 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,11 +4,16 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
+PR = "r0"
+
+BPV = "0.8.1"
+PV = "${BPV}"
+SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
+
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
 
-SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
 
 inherit autotools
 
-- 
2.7.4



