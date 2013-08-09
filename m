Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C98D76B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 17:31:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r79HVMil023218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Aug 2013 10:31:22 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 9 Aug 2013 10:31:22 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2013 10:31:20 -0700
Message-ID: <1376069480-19679-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1376069480-19679-1-git-send-email-jslater@windriver.com>
References: <1376069480-19679-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/1] nostromo: make sure usr/group www-data exist
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
X-List-Received-Date: Fri, 09 Aug 2013 17:31:22 -0000
Content-Type: text/plain

CQID: 422203

nostromo runs as user/group www-data and needs these
to exist when we install it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-httpd/nostromo/nostromo_1.9.5.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-httpd/nostromo/nostromo_1.9.5.bb b/recipes-httpd/nostromo/nostromo_1.9.5.bb
index 94c32d8..98195b1 100644
--- a/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -17,7 +17,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 DEPENDS = "openssl"
 
-inherit update-rc.d
+inherit update-rc.d useradd
 
 INITSCRIPT_NAME = "nostromo"
 INITSCRIPT_PARAMS = "defaults 70"
@@ -26,6 +26,11 @@ do_compile() {
     oe_runmake
 }
 
+# we need user/group www-data to exist when we install
+#
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system -g www-data www-data"
+
 do_install() {
     install -d ${D}/${sbindir}
     install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd
-- 
1.7.3.4


