Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F78A79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:42:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U8fr5m006938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:42:45 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:42:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:59:26 +0800
Message-ID: <20181030075927.23175-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030075927.23175-1-kai.kang@windriver.com>
References: <20181030075927.23175-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 3/4] adduser: 3.118 -> 3.119
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
X-List-Received-Date: Tue, 30 Oct 2018 08:42:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade adduser from 3.118 to 3.119.

* set S

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../adduser/{adduser_3.117.bb => adduser_3.118.bb}          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.117.bb => adduser_3.118.bb} (91%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.117.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
similarity index 91%
rename from meta-perl/recipes-perl/adduser/adduser_3.117.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.118.bb
index ca96e11e4..660a7f777 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.117.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -10,8 +10,10 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${
            file://adduser-add-M-option-for-useradd.patch \
 "
 
-SRC_URI[md5sum] = "9f36d69585e74c022aa8e22a0337507d"
-SRC_URI[sha256sum] = "be01881356e40c4d7dd2ce209fb4a94c0589056ac3ebe7debbbf09a6383c1411"
+SRC_URI[md5sum] = "44ba2475ebdaafc9613236bdda321c97"
+SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
+
+S = "${WORKDIR}/${BPN}"
 
 inherit cpan-base update-alternatives
 
-- 
2.18.0


