Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64E6E60BCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:59:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01D8wfZR010505
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:58:51 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 13 Feb 2020 00:58:30 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Feb 2020 16:58:28 +0800
Message-ID: <20200213085828.3788-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-networking][PATCH] samba: upgrade 4.10.11 -> 4.10.13
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
X-List-Received-Date: Thu, 13 Feb 2020 08:59:00 -0000
Content-Type: text/plain

Changelog:
https://www.samba.org/samba/history/samba-4.10.13.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.11.bb => samba_4.10.13.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.11.bb => samba_4.10.13.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.11.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
index ffdc15ac4..71d8fa2f8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "eebd021de840312d7e08959e8a3d0ba1"
-SRC_URI[sha256sum] = "609f4232e04c6eaad0e3b8e00cd837683a960ebb95c1fe3349e968d1d1dff894"
+SRC_URI[md5sum] = "e7906580bf06dae087e99ef8254f327d"
+SRC_URI[sha256sum] = "49eb6426e97cbf538e416e51ed8535930382512ad2d13d5ffd7f4336aa7faf63"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1


