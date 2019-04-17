Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D74B97D39A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:13:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3H6DdA3023099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 23:13:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 16 Apr 2019 23:13:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 02:13:12 -0400
Message-ID: <20190417061312.120376-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190417061312.120376-1-kai.kang@windriver.com>
References: <20190417061312.120376-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] drbd-utils: fix file conflict with base-files
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
X-List-Received-Date: Wed, 17 Apr 2019 06:13:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

drbd-utils installs directory /var/run but is a link file installed by
package base-files. Remove /var/run to fix the file conflict issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
index a781e2791..70e04b943 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
@@ -47,8 +47,9 @@ do_configure_prepend() {
 
 }
 do_install_append() {
-    # don't install empty /var/lock to avoid conflict with base-files
+    # don't install empty /var/lock and /var/run to avoid conflict with base-files
     rm -rf ${D}${localstatedir}/lock
+    rm -rf ${D}${localstatedir}/run
 }
 
 RDEPENDS_${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
-- 
2.20.0


