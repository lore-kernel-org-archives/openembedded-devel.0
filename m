Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5819.1587043007822239487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 06:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03GDGPu5016806
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 06:16:36 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Apr 2020
 06:16:15 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 2891C900D7F;
 Thu, 16 Apr 2020 06:16:15 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH v2 1/2] apache2: upgrade 2.4.41 -> 2.4.43
Date: Thu, 16 Apr 2020 06:16:14 -0700
Message-ID: <20200416131615.164341-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain

LICENSE file was updated due to a typo fix.

Note that this upgrade fixes two CVES affecting versions
2.4.41 and earlier:

CVE: CVE-2020-1927
CVE: CVE-2020-1934

See:
https://nvd.nist.gov/vuln/detail/CVE-2020-1927
https://nvd.nist.gov/vuln/detail/CVE-2020-1934

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-httpd/apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index a34734c20..2fff153fc 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -24,9 +24,9 @@ SRC_URI_append_class-target = " \
            file://volatiles.04_apache2 \
            "
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
-SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
+SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
+SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.13.3

