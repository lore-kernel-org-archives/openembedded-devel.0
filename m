Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 503E4744AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 05:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9H5YYQA022636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 22:34:34 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 16 Oct 2018 22:34:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 13:21:25 +0800
Message-ID: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: upgrade to 5.7.1
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
X-List-Received-Date: Wed, 17 Oct 2018 05:34:34 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../strongswan/{strongswan_5.6.3.bb => strongswan_5.7.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.6.3.bb => strongswan_5.7.1.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
index 297f0e7..c8bb17c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "a6a28eeb22aa58080a7581771a5b63f9"
-SRC_URI[sha256sum] = "c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24"
+SRC_URI[md5sum] = "86b7e9321cde075cf382268fd282e0b0"
+SRC_URI[sha256sum] = "006f9c9126e2a2f4e7a874b5e1bd2abec1bbbb193c8b3b3a4c6ccd8c2d454bec"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


