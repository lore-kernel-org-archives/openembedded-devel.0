Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 369ED770AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 03:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9F30tbd009446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Oct 2015 20:00:55 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 14 Oct 2015 20:00:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Thu, 15 Oct 2015 10:48:48 +0800
Message-ID: <1444877328-24949-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: remove perl-module-sdbm from RDEPENDS
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
X-List-Received-Date: Thu, 15 Oct 2015 03:01:00 -0000
Content-Type: text/plain

Remove 'perl-module-sdbm' from RDEPENDS as perl don't build out this module.
This also fixes the following warning.

  WARNING: QA Issue: webmin rdepends on perl-module-sdbm, but it isn't a build dependency? [build-deps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
index b6fbb0a..3cdb183 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
@@ -114,7 +114,7 @@ INITSCRIPT_PARAMS = "start 99 5 3 2 . stop 10 0 1 6 ."
 RDEPENDS_${PN} += "perl perl-module-socket perl-module-exporter perl-module-exporter-heavy perl-module-carp perl-module-strict"
 RDEPENDS_${PN} += "perl-module-warnings perl-module-xsloader perl-module-posix perl-module-autoloader"
 RDEPENDS_${PN} += "perl-module-fcntl perl-module-tie-hash perl-module-vars perl-module-time-local perl-module-config perl-module-constant"
-RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm perl-module-sdbm-file perl-module-feature"
+RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm-file perl-module-feature"
 
 PACKAGES_DYNAMIC += "webmin-module-* webmin-theme-*"
 RRECOMMENDS_${PN} += "webmin-module-system-status"
-- 
1.9.1


