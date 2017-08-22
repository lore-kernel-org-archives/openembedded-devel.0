Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B679378240
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 03:09:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M39xA8002172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:10:00 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 21 Aug 2017 20:09:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 11:10:43 +0800
Message-ID: <1503371443-13516-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-webserver][PATCH] sthttpd: update to 2.27.1
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
X-List-Received-Date: Tue, 22 Aug 2017 03:09:59 -0000
Content-Type: text/plain

* Fix CVE-2017-10671: Heap-based buffer overflow in the de_dotdot
  function in libhttpd.c

* Update SRC_URI because the original site can not access.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-httpd/sthttpd/{sthttpd_2.27.0.bb => sthttpd_2.27.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/sthttpd/{sthttpd_2.27.0.bb => sthttpd_2.27.1.bb} (88%)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
similarity index 88%
rename from meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
rename to meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 2125b24..c9fe55b 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dc
 
 DEPENDS += "base-passwd"
 
-SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+SRC_URI = "https://github.com/blueness/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://thttpd.service \
            file://thttpd.conf \
            file://init"
 
-SRC_URI[md5sum] = "f7dd2d506dc5fad2ad8794b1800d2634"
-SRC_URI[sha256sum] = "97d660a881331e93818e872ce11536f461105d70a18dfc5de5895851c4b2afdb"
+SRC_URI[md5sum] = "3cda1b6c8c8542b1510eadb8e540d8b6"
+SRC_URI[sha256sum] = "a1ee2806432eaf5b5dd267a0523701f9f1fa00fefd499d5bec42165a41e05846"
 
 S = "${WORKDIR}/sthttpd-${PV}"
 
-- 
2.7.4


