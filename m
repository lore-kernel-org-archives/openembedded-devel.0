Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3F956061B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 10:55:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01HAtSoO002278
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:55:28 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 17 Feb 2020 02:55:27 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Feb 2020 18:55:25 +0800
Message-ID: <20200217105525.28919-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-oe][PATCH] libgphoto2: remove executable permission bits of udev rule file
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
X-List-Received-Date: Mon, 17 Feb 2020 10:55:28 -0000
Content-Type: text/plain

Fixes systemd-udevd warning:
systemd-udevd[156]: Configuration file /etc/udev/rules.d/40-libgphoto2.rules
is marked executable. Please remove executable permission bits. Proceeding anyway.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
index a3bdf9cea..a012c499c 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
@@ -34,7 +34,7 @@ do_configure_append() {
 
 do_install_append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
-    install -m 0755 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
 PACKAGES =+ "libgphotoport libgphoto2-camlibs"
-- 
2.17.1


