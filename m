Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A08EB71DCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1DA4bnG000376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 02:04:37 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:23 -0800
Message-ID: <88ccd3cade1dbb968a10ba5c4e56cdcc48d0e8b3.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] nostromo: add base-passwd to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:37 -0000
Content-Type: text/plain

Fixed:
chown: invalid user: www-data:www-data
WARNING: tmp/work/i586-wrs-linux/nostromo/1.9.6-r0/temp/run.do_install.33423:1 exit 1 from 'chown -R www-data:www-data tmp/work/i586-wrs-linux/nostromo/1.9.6-r0/image//var/nostromo'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index 5493c12..16f45ce 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f4
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-DEPENDS = "openssl groff-native"
+DEPENDS = "openssl groff-native base-passwd"
 
 inherit update-rc.d
 
-- 
2.9.0


