Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF6674CE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:16 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdGtY028715
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:16 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:16 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:07 -0700
Message-Id: <20180806103907.37227-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806103907.37227-1-kai.kang@windriver.com>
References: <20180806103907.37227-1-kai.kang@windriver.com>
Subject: [meta-perl][PATCH 5/5] logcheck: 1.3.18 -> 1.3.19
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
X-List-Received-Date: Mon, 06 Aug 2018 10:39:16 -0000

Upgrade logcheck from 1.3.18 to 1.3.19.

* update SRC_URI to replace git repo with tarball that saves some space

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../logcheck/{logcheck_1.3.18.bb => logcheck_1.3.19.bb}            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.18.bb => logcheck_1.3.19.bb} (92%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb
similarity index 92%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb
index 6182c17f9..873ac2b10 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.19.bb
@@ -11,12 +11,11 @@ HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "git://salsa.debian.org/debian/logcheck.git;protocol=https \
+SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRCREV = "0a5865d80fa34c55387a1917a3e6f885bcff7f1d"
-
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "7b50d10da6f185228627c55fdd51f624"
+SRC_URI[sha256sum] = "06294c092b2115eca3d054c57778718c91dd2e0fd1c46650b7343c2a92672ca9"
 
 inherit useradd
 
-- 
2.11.0


