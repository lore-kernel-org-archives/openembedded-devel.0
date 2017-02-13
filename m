Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B534671DCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4arj004026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:36 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:22 -0800
Message-ID: <28bffa52634fe38d797555dc8f6355692e89ad8a.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] sthttpd: add base-passwd to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:36 -0000
Content-Type: text/plain

Fixed:
chgrp www-data tmp/work/i586-wrs-linux/sthttpd/2.27.0-r0/image/usr/sbin/makeweb
chgrp: invalid group: www-data
make[3]: *** [install-exec-hook] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
index efa533a..860c986 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
 
+DEPENDS += "base-passwd"
+
 SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
            file://thttpd.service \
            file://thttpd.conf \
-- 
2.9.0


