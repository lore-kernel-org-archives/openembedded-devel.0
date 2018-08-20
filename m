Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 134B7748D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:14:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; d="scan'208";a="11913553"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:14:36 +0200
Message-ID: <20180820211443.32757-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 0/7] openjdk include cleanup
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
X-List-Received-Date: Mon, 20 Aug 2018 21:14:14 -0000
Content-Type: text/plain

Remove duplicated code in openjdk includes by moving it to the
openjdk-build-helper class. Furthermore make the naming of files in
recipes-core/openjdk/ consistent again.

Richard Leitner (7):
  openjdk-build-helper: add get_*_arch functions
  openjdk-8: use openjdk_build_helper's ARCH translation functions
  openjdk-7: use openjdk_build_helper's ARCH translation functions
  icedtea7-native: use openjdk_build_helper's ARCH translation functions
  openjdk-7: remove version dependent stuff from openjdk-common
  openjdk-8: use openjdk-common
  openjdk-7: merge postinst into openjdk-7-common

 classes/openjdk-build-helper.bbclass      |  51 +++++++++++
 recipes-core/icedtea/icedtea7-native.inc  |  42 +--------
 recipes-core/openjdk/openjdk-7-common.inc | 141 +++++++++++++++++++++++++++++-
 recipes-core/openjdk/openjdk-8-common.inc |  44 +---------
 recipes-core/openjdk/openjdk-common.inc   |  77 +---------------
 recipes-core/openjdk/openjdk-postinst.inc | 100 ---------------------
 6 files changed, 194 insertions(+), 261 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-postinst.inc

-- 
2.11.0


