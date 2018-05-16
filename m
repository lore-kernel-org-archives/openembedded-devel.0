Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13840745D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 03:13:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4G3DCia014360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 May 2018 20:13:27 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 May 2018 20:13:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Wed, 16 May 2018 11:22:13 +0800
Message-ID: <1526440933-11769-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2/sthttpd: add alternatives for doc
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
X-List-Received-Date: Wed, 16 May 2018 03:13:54 -0000
Content-Type: text/plain

There is a failure to install both of sthttpd-doc and
apache2-doc to rootfs.
...
|Error: Transaction check error:
|  file /usr/share/man/man1/htpasswd.1 conflicts
between attempted installs of sthttpd-doc-2.27.1
-r0.0.armv7ahf_neon and apache2-doc-2.4.27
-r0.0.armv7ahf_neon
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb | 5 ++++-
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
index f0298b9..c422092 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
@@ -29,7 +29,10 @@ SRC_URI[sha256sum] = "777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b63999
 
 S = "${WORKDIR}/httpd-${PV}"
 
-inherit autotools update-rc.d pkgconfig systemd
+inherit autotools update-rc.d pkgconfig systemd update-alternatives
+
+ALTERNATIVE_${PN}-doc = "htpasswd.1"
+ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
 SYSTEMD_SERVICE_${PN} = "apache2.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 37bd753..81815d6 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -19,7 +19,11 @@ UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
 S = "${WORKDIR}/sthttpd-${PV}"
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d systemd update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-doc = "htpasswd.1"
+ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
 SRV_DIR ?= "${servicedir}/www"
 
-- 
2.7.4


