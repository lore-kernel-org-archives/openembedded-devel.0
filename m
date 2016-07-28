Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDD960722
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 05:24:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6S5OnbV026672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:24:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 22:24:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Jul 2016 01:24:47 -0400
Message-ID: <1469683487-166640-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mercurial-native: upgrade to 3.8.4
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
X-List-Received-Date: Thu, 28 Jul 2016 05:24:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Upgrade to the latest release to fix some CVEs:
  - CVE-2016-3068: arbitrary code execution with Git subrepos
  - CVE-2016-3069: arbitrary code execution when converting Git repos
  - CVE-2016-3630: remote code execution in binary delta decoding
  - CVE-2016-3105: arbitrary code execution when converting Git repos

* For other changes please see:
  https://www.mercurial-scm.org/wiki/WhatsNew

* Update SRC_URI with the new download link

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{mercurial-native_3.4.1.bb => mercurial-native_3.8.4.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial-native_3.4.1.bb => mercurial-native_3.8.4.bb} (73%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb
similarity index 73%
rename from meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb
index aeec195..0526fc2 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.4.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.8.4.bb
@@ -5,9 +5,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "python-native"
 
-SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
-SRC_URI[md5sum] = "65783a60aefb46a11296b587e9403537"
-SRC_URI[sha256sum] = "7a8acf7329beda38ceea29c689212574d9a6bfffe24cf565015ea0066f7cee3f"
+SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
+SRC_URI[md5sum] = "cec2c3db688cb87142809089c6ae13e9"
+SRC_URI[sha256sum] = "4b2e3ef19d34fa1d781cb7425506a05d4b6b1172bab69d6ea78874175fdf3da6"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.8.1


