Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85177607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 07:02:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6272e3Y024228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Jul 2015 00:02:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 00:02:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Liezhi.Yang@windriver.com>
Date: Thu, 2 Jul 2015 15:02:14 +0800
Message-ID: <1435820534-32452-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] hiawatha: fix the installation failure due to no /var/run dir
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
X-List-Received-Date: Thu, 02 Jul 2015 07:02:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

after cmake is upgrade to 3.2.2, the /var/run dir is not created, so
not need to remove it.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
index b9fa5cd..31293e4 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
@@ -53,7 +53,6 @@ do_install_append() {
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
-    rmdir "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
-- 
1.9.1


