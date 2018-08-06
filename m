Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D86B37199E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:11 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdCGG028703
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:12 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:12 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:03 -0700
Message-Id: <20180806103907.37227-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806103907.37227-1-kai.kang@windriver.com>
References: <20180806103907.37227-1-kai.kang@windriver.com>
Subject: [meta-perl][PATCH 1/5] adduser: 3.116 -> 3.117
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
X-List-Received-Date: Mon, 06 Aug 2018 10:39:12 -0000

Upgrade adduser from 3.116 to 3.117.

* remove redefine of S

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-perl/adduser/{adduser_3.116.bb => adduser_3.117.bb}     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.116.bb => adduser_3.117.bb} (91%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.116.bb b/meta-perl/recipes-perl/adduser/adduser_3.117.bb
similarity index 91%
rename from meta-perl/recipes-perl/adduser/adduser_3.116.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.117.bb
index 363f5b117..e5cefd4c6 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.116.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.117.bb
@@ -10,13 +10,11 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.x
            file://adduser-add-M-option-for-useradd.patch \
 "
 
-SRC_URI[md5sum] = "e042a5842b8f24312d6f5a99a1af8f2c"
-SRC_URI[sha256sum] = "72d811ad3ba17d2794b14d19acd1d6b57f9dd31d9250d51e786895dee2daeac0"
+SRC_URI[md5sum] = "9f36d69585e74c022aa8e22a0337507d"
+SRC_URI[sha256sum] = "be01881356e40c4d7dd2ce209fb4a94c0589056ac3ebe7debbbf09a6383c1411"
 
 inherit cpan-base update-alternatives
 
-S = "${WORKDIR}/${BPN}"
-
 do_install() {
     install -d ${D}${sbindir}
     install -m 0755 ${S}/adduser ${D}${sbindir}
-- 
2.11.0


