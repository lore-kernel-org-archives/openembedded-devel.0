Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E63FE6AC00
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:54:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u726sBTZ016538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Aug 2016 23:54:14 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 23:54:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Aug 2016 02:54:10 -0400
Message-ID: <1470120850-43591-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] adduser: upgrade to 3.115
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
X-List-Received-Date: Tue, 02 Aug 2016 06:54:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Update the checksums and the S directory.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-perl/adduser/{adduser_3.114.bb => adduser_3.115.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.114.bb => adduser_3.115.bb} (90%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.114.bb b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
similarity index 90%
rename from meta-perl/recipes-perl/adduser/adduser_3.114.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.115.bb
index fb4c0c4..312bad8 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.114.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
@@ -10,12 +10,12 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.x
            file://adduser-add-M-option-for-useradd-when-no-create-home.patch \
 "
 
-SRC_URI[md5sum] = "3a079dd4e41d5a1fbaccaab03aacd881"
-SRC_URI[sha256sum] = "693b45bb0d27938fff2ecee5442ea2ac1b8804472ff0bb8faffd39616e58211f"
+SRC_URI[md5sum] = "6bb6d93922d281f1b56393a53f8ce5fd"
+SRC_URI[sha256sum] = "e7288281d4d1eec2948ba3687452ca33a8224d40c98d321bc3fbaefcf6d4c0db"
 
 inherit cpan-base update-alternatives
 
-S = "${WORKDIR}/${BPN}-3.113+nmu4"
+S = "${WORKDIR}/${BPN}"
 
 do_install() {
     install -d ${D}${sbindir}
-- 
2.8.1


