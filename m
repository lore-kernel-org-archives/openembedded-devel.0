Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 94393761D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:22:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99104474"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:26:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3L57A016775
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:21:05 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:22:57 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:22:50 +0800
Message-ID: <1438312970-16298-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-networking][PATCH v2] vsftpd: upgrade 3.0.2->3.0.3
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
X-List-Received-Date: Fri, 31 Jul 2015 03:22:59 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-destdir.patch      | 0
 .../vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-libs.patch         | 0
 .../vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-strip.patch        | 0
 .../{vsftpd-3.0.2 => vsftpd-3.0.3}/nopam-with-tcp_wrappers.patch      | 0
 .../recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/nopam.patch | 0
 .../vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/vsftpd-2.1.0-filter.patch   | 0
 .../{vsftpd-3.0.2 => vsftpd-3.0.3}/vsftpd-tcp_wrappers-support.patch  | 0
 .../recipes-daemons/vsftpd/{vsftpd_3.0.2.bb => vsftpd_3.0.3.bb}       | 4 ++--
 8 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-destdir.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-libs.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/makefile-strip.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/nopam-with-tcp_wrappers.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/nopam.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/vsftpd-2.1.0-filter.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.2 => vsftpd-3.0.3}/vsftpd-tcp_wrappers-support.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.2.bb => vsftpd_3.0.3.bb} (96%)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
similarity index 100%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
similarity index 96%
rename from meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 9d1c1cc..580dabe 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
-SRC_URI[md5sum] = "8b00c749719089401315bd3c44dddbb2"
-SRC_URI[sha256sum] = "be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56"
+SRC_URI[md5sum] = "da119d084bd3f98664636ea05b5bb398"
+SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7"
 
 
 PACKAGECONFIG ??= "tcp-wrappers"
-- 
1.8.4.2


