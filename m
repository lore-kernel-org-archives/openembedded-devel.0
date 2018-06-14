Return-Path: <prvs=696aff75f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 431DF76059
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 22:49:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,224,1526335200"; 
   d="scan'208";a="1501074"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jun 2018 00:49:02 +0200
Message-ID: <20180614224904.21590-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 0/2] master-next: fix OpenJDK 8 build
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
X-List-Received-Date: Thu, 14 Jun 2018 22:49:10 -0000
Content-Type: text/plain

OpenJDK 8 in our master-next branch fails to build with current
oe-core/YoctoProject branches. This series fixes the build again.

Richard Leitner (2):
  openjdk-8: fix build for gcc8.x
  ca-certificates-java: update SRC_URI

 .../ca-certificates-java_20170930.bb                |  2 +-
 recipes-core/openjdk/openjdk-8-release-16xbyy.inc   |  1 +
 .../patches-openjdk-8/hotspot_fix_gcc8x_build.patch | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch

-- 
2.11.0


