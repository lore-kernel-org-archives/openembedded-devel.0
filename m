Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDF6D6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:35:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0QLZvBI022071
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 13:35:58 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 26 Jan 2015 13:35:57 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jan 2015 13:35:57 -0800
Message-ID: <1422308157-13925-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] geoip-perl: change local tarfile name
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
X-List-Received-Date: Mon, 26 Jan 2015 21:36:02 -0000
Content-Type: text/plain

Use a better filename for the local copy of the
source.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/geoip/geoip-perl_1.45.bb       |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
index 01ce11d..1778412 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
@@ -9,7 +9,9 @@ SECTION = "network"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;md5=b0fa745303912bd2d64430f7ae69487d"
 
-SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz \
+# Note that we do not want to use the upstream file name locally.
+#
+SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downloadfilename=${BPN}-${PV}.tar.gz \
            file://run-ptest \
           "
 
-- 
1.7.9.5


