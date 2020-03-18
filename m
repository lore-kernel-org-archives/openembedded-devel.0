Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E65FB60ADF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 01:49:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,565,1574092800"; d="scan'208";a="86504534"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 09:49:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 250D549DF125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:39:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 09:49:46 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 09:49:56 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 00:19:52 -0700
Message-ID: <1584515992-22564-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 250D549DF125.A2891
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] ser2net: upgrade 4.1.2 -> 4.1.5
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
X-List-Received-Date: Wed, 18 Mar 2020 01:49:46 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ser2net/{ser2net_4.1.2.bb => ser2net_4.1.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.2.bb => ser2net_4.1.5.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.2.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.1.2.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
index 66985af0a..0df134eca 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.2.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
@@ -9,8 +9,8 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1a42e9605342fd3d6fa41b48be7f564a"
-SRC_URI[sha256sum] = "9bdc33476834bbbdcbfbb77ff8f1b1952fe2e7e19dde7e6f7932cea0cec958c7"
+SRC_URI[md5sum] = "52c5e56d2d54ced0cdeb764a7e8fec92"
+SRC_URI[sha256sum] = "df904d271eb161c265c956f0cb938dd0a375dda4a919a344f73b08bc50b9f308"
 
 inherit autotools pkgconfig
 
-- 
2.17.1




