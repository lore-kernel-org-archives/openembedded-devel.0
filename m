Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBD965E99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 07:16:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3E7Gg1B005346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 00:16:42 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Apr 2014 00:16:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Apr 2014 15:16:38 +0800
Message-ID: <bbac515278f9507ebb997506af418a1b8fe02753.1397459226.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397459226.git.Chong.Lu@windriver.com>
References: <cover.1397459226.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] mariadb: use /bin/false as the login shell
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
X-List-Received-Date: Mon, 14 Apr 2014 07:16:45 -0000
Content-Type: text/plain

Use /bin/false as the login shell, just like what Ubuntu does,
otherwise there might be secure issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 100b3a7..37a0f0c 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -35,7 +35,7 @@ INITSCRIPT_NAME = "mysqld"
 INITSCRIPT_PARAMS = "start 45 5 . stop 45 0 6 1 ."
 
 USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g nogroup mysql"
+USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g nogroup --shell /bin/false mysql"
 
 
 export ac_cv_path_PS="/bin/ps"
-- 
1.8.1.2


