Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA2AF7E916
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:20:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E3KnR1004312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:20:50 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 20:20:49 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jun 2019 11:20:42 +0800
Message-ID: <1560482443-5210-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560482443-5210-1-git-send-email-yi.zhao@windriver.com>
References: <1560482443-5210-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-webserver][PATCH 2/3] xdebug: upgrade 2.7.0RC2 -> 2.7.2
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
X-List-Received-Date: Fri, 14 Jun 2019 03:20:48 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-php/xdebug/{xdebug_2.7.0RC2.bb => xdebug_2.7.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.7.0RC2.bb => xdebug_2.7.2.bb} (86%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb
similarity index 86%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb
index 7be62cb..32d52a6 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.7.2.bb
@@ -6,8 +6,8 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "e8cabe003d6990b157d0d8caee374844"
-SRC_URI[sha256sum] = "5aa6d1772937e9f11b91ad8ced586aa0e16281dc178c405ac380d45d4731f8b0"
+SRC_URI[md5sum] = "5d1a8ca3101df93938d283933f256493"
+SRC_URI[sha256sum] = "b0f3283aa185c23fcd0137c3aaa58554d330995ef7a3421e983e8d018b05a4a6"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.7.4


