Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51B1C7562E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 09:42:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t549geUN006343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 02:42:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 4 Jun 2015 02:42:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 17:36:27 +0800
Message-ID: <1433410587-20478-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] proftpd: upgrade to 1.3.5a
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
X-List-Received-Date: Thu, 04 Jun 2015 09:42:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1.3.5a includes the fix for CVE-2015-3306:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3306

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-daemons/proftpd/{proftpd_1.3.5.bb => proftpd_1.3.5a.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.5.bb => proftpd_1.3.5a.bb} (96%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
similarity index 96%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index 13c9410..9a1852c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://proftpd.service \
            "
 
-SRC_URI[md5sum] = "aff1bff40e675244d72c4667f203e5bb"
-SRC_URI[sha256sum] = "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2ea2cc4e08ccb87715"
+SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
+SRC_URI[sha256sum] = "a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67fae5696"
 
 inherit autotools-brokensep useradd update-rc.d systemd
 
-- 
1.9.1


