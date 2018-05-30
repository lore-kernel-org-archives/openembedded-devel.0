Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2758606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:40:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6errJ006798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:40:53 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:40:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:40:50 +0800
Message-ID: <1527662450-31992-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] xdebug: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Wed, 30 May 2018 06:40:52 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
index 6516988..2b8d1ef 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 SRC_URI[md5sum] = "ed3545852e6f4a00fb8730362d0431ee"
 SRC_URI[sha256sum] = "b5264cc03bf68fcbb04b97229f96dca505d7b87ec2fb3bd4249896783d29cbdc"
 
+UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
+
 inherit autotools
 
 EXTRA_OECONF += "--enable-xdebug -with-php-config=${STAGING_BINDIR_CROSS}/php-config"
-- 
2.7.4


