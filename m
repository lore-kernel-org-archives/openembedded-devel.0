Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3490D60962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 04:13:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98802848"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2015 12:16:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6O4BO6M032519
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:11:24 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 24 Jul 2015 12:13:13 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Jul 2015 12:13:00 +0800
Message-ID: <1437711180-6778-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] ntp: upgrade 4.2.8p2 -> 4.2.8p3
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
X-List-Received-Date: Fri, 24 Jul 2015 04:13:15 -0000
Content-Type: text/plain

4.2.8p3 fixed CVE-2015-5146 and Bugs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p2.bb => ntp_4.2.8p3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p2.bb => ntp_4.2.8p3.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
index c54da43..71e0b19 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "fa37049383316322d060ec9061ac23a9"
-SRC_URI[sha256sum] = "0d69bc0e95caad43ea04fdad410e756bae1a71e67b1c2bd799b76b55e04c9b31"
+SRC_URI[md5sum] = "b98b0cbb72f6df04608e1dd5f313808b"
+SRC_URI[sha256sum] = "818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.8.4.2


