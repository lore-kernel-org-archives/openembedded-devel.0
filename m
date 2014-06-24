Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id B679C65D20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 07:54:27 +0000 (UTC)
Received: from localhost (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Tue, 24 Jun 2014
	09:54:26 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jun 2014 09:54:12 +0200
Message-ID: <1b5c27f39444bed435c8c050b2fb6def74a5adb8.1403596416.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1403596416.git.anders@chargestorm.se>
References: <cover.1403596416.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 1/1] webmin: drop allarch
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
X-List-Received-Date: Tue, 24 Jun 2014 07:54:33 -0000
Content-Type: text/plain

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index 7eb1d63..0f8781f 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -20,7 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
 SRC_URI[md5sum] = "e93bc5057a5b7d7e31ecb2bb228d7044"
 SRC_URI[sha256sum] = "3d36153406d8e5d3dcaeadba34dfb5cdbc4060b75c38339174ac97b2277f284b"
 
-inherit allarch perlnative update-rc.d
+inherit perlnative update-rc.d
 
 do_configure() {
     # Remove binaries and plugins for other platforms
-- 
2.0.0


