Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D010673CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:06:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98766965"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 17:10:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N94ckN024432
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 17:04:38 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 17:06:26 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 17:06:20 +0800
Message-ID: <1437642380-4751-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] lmsensors: upgrade 3.3.5 -> 3.4.0
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
X-List-Received-Date: Thu, 23 Jul 2015 09:06:35 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../lm_sensors/{lmsensors_3.3.5.bb => lmsensors_3.4.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.5.bb => lmsensors_3.4.0.bb} (97%)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
similarity index 97%
rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index d2cd317..66e8923 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2
            file://sensord.init \
            file://sensord.service \
 "
-SRC_URI[md5sum] = "da506dedceb41822e64865f6ba34828a"
-SRC_URI[sha256sum] = "5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf"
+SRC_URI[md5sum] = "c03675ae9d43d60322110c679416901a"
+SRC_URI[sha256sum] = "e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f"
 
 inherit update-rc.d systemd
 
-- 
1.8.4.2


