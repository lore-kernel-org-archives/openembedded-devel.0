Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 481947718B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:43:30 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u1T8hUAP017525
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 09:43:30 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u1T8hNMY030019;
	Mon, 29 Feb 2016 09:43:30 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Feb 2016 09:43:10 +0100
Message-Id: <1456735391-9764-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456735391-9764-1-git-send-email-pascal.bach@siemens.com>
References: <1456735391-9764-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-oe][PATCH v2 2/3] nginx: add stable version 1.8.1 as alternative to the mainline version 1.9.x
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
X-List-Received-Date: Mon, 29 Feb 2016 08:43:31 -0000

The 1.8 branch is the current stable branch of nginx.
This means the branch doesn't get new features, but is still supported with bugfixes.

Depending on the use case it is more suitable to use on an embedded device
than the 1.9 branch which adds new features with every release.
---
 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
new file mode 100644
index 0000000..ec3aef2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
@@ -0,0 +1,4 @@
+require nginx.inc
+
+SRC_URI[md5sum] = "2e91695074dbdfbf1bcec0ada9fda462"
+SRC_URI[sha256sum] = "8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb4646c27d09f797b7"
-- 
2.1.4


