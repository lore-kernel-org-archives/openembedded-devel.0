Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B47A71A3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 04:46:06 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 69e2_7e88_71325cd7_dbd5_4bd5_ba12_20887dbaa96d;
	Mon, 30 Oct 2017 13:46:03 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id A46D7AC00E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:46:02 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	6A20D6D664E for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:46:01 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 30 Oct 2017 13:46:01 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Oct 2017 13:45:53 +0900
Message-ID: <1509338753-23099-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1sohPCP07Hx-aHdoKDqtrTXWO+3atWDX-MMLP80RsdxRNg@mail.gmail.com>
References: <CAMKF1sohPCP07Hx-aHdoKDqtrTXWO+3atWDX-MMLP80RsdxRNg@mail.gmail.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH v3] spi-tools: Add version info
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
X-List-Received-Date: Mon, 30 Oct 2017 04:46:08 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index f808125..168f0f3 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -4,6 +4,8 @@ AUTHOR = "Christophe BLAESS"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
+PV = "0.8.1"
+
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
-- 
2.7.4



