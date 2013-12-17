Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB606E58F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:31:31 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id m20so4274220qcx.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=VTUi8uyKs3BfPlhzeb7jT6BTy+/xRNzVqcLvVTetkI4=;
	b=obAefPAdgGqXv9pgTZZsRH4lfPKuJYGD/k4pISKjetyRawY1zS4Y7r+V6zC5rVwjlm
	8qBUsWsbUb5IiTW/JuOz5YqcTrda5/CLXmN5D0YUrdqb0ii7HBOor44IR1qnQbu3QjMy
	K45SDxFs6mAsKHHjSGUr6o9TH+H0HIvMhGO6tRNwbCXOQm4w8lpvpNVufqa3eLjxUupP
	VKs1gwiIjCPoz/tCBDpdVy4RCPjEaXBnnxrwpMWBQ2TRh/9zo/tWtQyjjG0W0cqtdjm3
	t1wSW+wAYv/AIiBm+Oxjrq8wm9Ky5j5I/ZiVplrquY2gVd11CGnS7Mj4uriLwCRg7kbj
	gMDQ==
X-Received: by 10.49.84.105 with SMTP id x9mr37562906qey.65.1387240291708;
	Mon, 16 Dec 2013 16:31:31 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id g10sm50918448qaf.9.2013.12.16.16.31.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 16:31:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 10C9617643BAD; Mon, 16 Dec 2013 22:31:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 22:30:57 -0200
Message-Id: <1387240261-7045-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 2/6] proj: Use 'lib_package' class and add data files
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
X-List-Received-Date: Tue, 17 Dec 2013 00:31:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

 meta-oe/recipes-navigation/proj/proj_4.8.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
index 6784dde..b4bfaf4 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
+SUMMARY = "PROJ.4 - Cartographic Projections library"
 HOMEPAGE = "http://trac.osgeo.org/proj/"
 SECTION = "libs"
 
@@ -9,5 +9,6 @@ SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
 SRC_URI[md5sum] = "d815838c92a29179298c126effbb1537"
 SRC_URI[sha256sum] = "2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig lib_package
 
+FILES_${PN} += "${datadir}/proj"
-- 
1.8.4.3


