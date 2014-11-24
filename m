Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B160C721D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872911"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:44:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6luvM003463
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:47:57 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:14 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:20 +0800
Message-ID: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/6] Port some recipes from openembedded and upgrade
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:21 -0000
Content-Type: text/plain

Port some recipes from openembedded and upgrade

Bian Naimeng (6):
  evieext: Port evieext from openembedded.
  fontcacheproto: Port fontcacheproto from openembedded.
  libxfontcache: Port libxfontcache from openembedded.
  printproto: Port printproto from openembedded.
  libxp: Port libxp from openembedded.
  corosync: Port corosync from openembedded and upgrade to 1.4.7

 .../xorg-lib/libxfontcache_1.0.5.bb                | 15 ++++++++
 .../xorg-lib/libxp/fix-cast-error.patch            | 42 ++++++++++++++++++++++
 meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb   | 22 ++++++++++++
 .../recipes-graphics/xorg-proto/evieext_1.1.1.bb   | 14 ++++++++
 .../xorg-proto/fontcacheproto_0.1.3.bb             | 16 +++++++++
 .../xorg-proto/printproto_1.0.5.bb                 | 16 +++++++++
 meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31 ++++++++++++++++
 .../corosync/files/config-site.corosync            |  4 +++
 meta-oe/recipes-support/corosync/files/groff.patch | 12 +++++++
 9 files changed, 172 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb
 create mode 100644 meta-oe/recipes-support/corosync/corosync_1.4.7.bb
 create mode 100644 meta-oe/recipes-support/corosync/files/config-site.corosync
 create mode 100644 meta-oe/recipes-support/corosync/files/groff.patch

-- 
1.9.1


