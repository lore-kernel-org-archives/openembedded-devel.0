Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.12796.1600940196169322255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 02:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08O9aEmD024901
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 02:36:24 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 02:35:46 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] crda: rdepends on wireless-regdb-static
Date: Thu, 24 Sep 2020 17:35:39 +0800
Message-ID: <20200924093539.23693-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The wireless-regdb has been moved to oe-core. According the commit
message:

wireless-regdb-static should be used with kernel >= 4.15.
wireless-regdb can be used with older kernels and is mostly
irrelevant here, but keeping it in meta-networking would
create needless recipe duplication.

it should replace runtime dependency wireless-regdb with
wireless-regdb-static.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index b380eaf94..e59d2f437 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -35,4 +35,4 @@ do_install() {
     oe_runmake SBINDIR=${sbindir}/ install
 }
 
-RDEPENDS_${PN} = "udev wireless-regdb"
+RDEPENDS_${PN} = "udev wireless-regdb-static"
-- 
2.17.1

