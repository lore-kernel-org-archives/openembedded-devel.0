Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 10DF67210C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 09:18:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43491359"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 17:15:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAH9I2g2012920
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 17:18:02 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 17:18:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 17:15:38 +0800
Message-ID: <1416215740-36026-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/2] Poring esmtp and dependence from opemembedded
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
X-List-Received-Date: Mon, 17 Nov 2014 09:18:26 -0000
Content-Type: text/plain

Poring esmtp and libesmtp which depended by esmtp from openembedded.

Bian Naimeng (2):
  Porting libesmtp from openembedded.
  Porting esmtp from openembedded.

 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 32 +++++++++++++++
 .../libesmtp/libesmtp/include-topdir.patch         | 48 ++++++++++++++++++++++
 .../recipes-support/libesmtp/libesmtp_1.0.6.bb     | 37 +++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 meta-networking/recipes-support/esmtp/esmtp_1.2.bb
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb

-- 
1.9.1


