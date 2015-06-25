Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3156C605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:00:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97724506"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 10:04:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P1wsrt024985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:58:55 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 10:00:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 10:00:16 +0800
Message-ID: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-oe][PATCH 0/2] upgrade networkmanager and add new depends.
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
X-List-Received-Date: Thu, 25 Jun 2015 02:00:34 -0000
Content-Type: text/plain

The newer networkmanager depends on libndp,so add it.

Li xin (2):
  networkmanager: upgrade from 0.9.8.10 to 1.0.2
  libndp: add new recipe

 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb  | 12 +++++++++
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------------
 ...manager_0.9.8.10.bb => networkmanager_1.0.2.bb} | 16 +++++-------
 3 files changed, 19 insertions(+), 39 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb} (87%)

-- 
1.8.4.2


