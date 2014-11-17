Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F3CFD72154
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 11:01:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43496597"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 18:57:43 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAHB0gIQ018893
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 19:00:42 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 19:00:59 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 19:00:03 +0800
Message-ID: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH 0/5] Adding some recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Nov 2014 11:01:31 -0000
Content-Type: text/plain

Adding some recipes

Li xin (5):
  rarpd : add recipe
  nicstat : add recipe
  sblim-sfcb : add new recipe
  sblim-sfcc : add recipe
  sgpio : add new recipe

 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb   |  25 +
 .../rarpd/files/1000rarpd-ss981107.patch           | 592 +++++++++++++++++++++
 .../rarpd/files/1001rarpd-norun.patch              |  13 +
 .../rarpd/files/1002rarpd-initscript.patch         |  77 +++
 .../rarpd/files/1003rarpd-fd-leak.patch            |  25 +
 .../rarpd/files/1004rarpd-sprintf.patch            |  31 ++
 .../rarpd/files/1005rarpd-initLSB.patch            |  85 +++
 .../rarpd/files/1006rarpd-configurableInit.patch   |  23 +
 meta-oe/recipes-extended/rarpd/files/ethers.sample |   1 +
 meta-oe/recipes-extended/rarpd/files/rarpd.service |  14 +
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  50 ++
 .../recipes-extended/sblim-sfcb/files/sfcb.service |  11 +
 ...000sblim-sfcb-disable_auto_service_start1.patch |  19 +
 .../sblim-sfcb-1.3.4/cimv217Final-MOFs.zip.org     | Bin 0 -> 1259176 bytes
 .../sblim-sfcb-1.3.4/config-site.sblim-sfcb-1.3.4  |   2 +
 .../sblim-sfcb/sblim-sfcb_1.3.4.bb                 |  83 +++
 .../1000sblim-sfcc-2.1.0-initialization1.patch     | 498 +++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.5.bb                 |  29 +
 .../0001-Makefile-modify-some-parameters.patch     |  51 ++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  28 +
 20 files changed, 1657 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1000rarpd-ss981107.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1001rarpd-norun.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1002rarpd-initscript.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1003rarpd-fd-leak.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1004rarpd-sprintf.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1005rarpd-initLSB.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/1006rarpd-configurableInit.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/ethers.sample
 create mode 100644 meta-oe/recipes-extended/rarpd/files/rarpd.service
 create mode 100644 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.3.4/1000sblim-sfcb-disable_auto_service_start1.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.3.4/cimv217Final-MOFs.zip.org
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.3.4/config-site.sblim-sfcb-1.3.4
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.3.4.bb
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc-2.1.0/1000sblim-sfcc-2.1.0-initialization1.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.5.bb
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio-1.2.0.10/0001-Makefile-modify-some-parameters.patch
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb

-- 
1.8.4.2


