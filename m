Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F137F75D22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 03:20:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9M3KsZ6014112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 20:20:54 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 20:20:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Oct 2015 11:20:06 +0800
Message-ID: <1445484006-2015-1-git-send-email-hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 22 Oct 2015 03:20:56 -0000
Content-Type: text/plain

There is a QA Warning while build webmin:
...
|WARNING: QA Issue: webmin rdepends on perl-module-sdbm,
but it isn't a build dependency? [build-deps]
...

The perl-module-sdbm did not exist, so remove it
from webmin's RDEPENDS.
...
ls tmp/deploy/rpm/corei7_64/perl-module-sdbm*
tmp/deploy/rpm/corei7_64/perl-module-sdbm-file-5.22.0-r0.0.corei7_64.rpm
...

So perl-module-sdbm-file exists, not perl-module-sdbm.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
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


