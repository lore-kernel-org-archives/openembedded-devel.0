Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1E0B785F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 01:11:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G1B8po031565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 18:11:09 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 18:11:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Aug 2017 09:10:32 +0800
Message-ID: <20170816011032.14328-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] freeradius: Upgrade to 3.0.15
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
X-List-Received-Date: Wed, 16 Aug 2017 01:11:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Upgrade to 3.0.15 to fix many CVE issues.
* There is a defect for disabling dhcp feature:
  https://github.com/FreeRADIUS/freeradius-server/issues/2039
  We don't need the dhcp feature but it's harmless
  to enable it, so enable it as the default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../freeradius/{freeradius_3.0.14.bb => freeradius_3.0.15.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.14.bb => freeradius_3.0.15.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb
index 6971b0379..4155a4059 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.14.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb
@@ -30,8 +30,8 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-SRC_URI[md5sum] = "7d98dfafffac81f19cadccea5af89cea"
-SRC_URI[sha256sum] = "2771f6ecd6c816ac4d52b66bb8ae6781ca20e1e4984c5804fc4e67de3a807c59"
+SRC_URI[md5sum] = "0c81a4464ccf1d04f7ef1218a029d37a"
+SRC_URI[sha256sum] = "23267d8505e7b2909f5bdbf3938ca077c1fe122290dc969304d4f3b594f7e3ba"
 
 PARALLEL_MAKE = ""
 
@@ -58,7 +58,6 @@ EXTRA_OECONF = " --enable-strict-dependencies \
         --without-rlm_sql_oracle \
         --without-rlm_sql_sybase \
         --without-rlm_sqlhpwippool \
-        --without-dhcp \
         ac_cv_path_PERL=${bindir}/perl \
         ax_cv_cc_builtin_choose_expr=no \
         ax_cv_cc_builtin_types_compatible_p=no \
-- 
2.11.0


