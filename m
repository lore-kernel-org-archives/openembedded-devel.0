Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D0FCD60049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 07:14:16 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4A7EDEx018087
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 09:14:13 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.78.61])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v4A7EDE7022373;
	Wed, 10 May 2017 09:14:13 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 May 2017 09:14:09 +0200
Message-Id: <1494400449-21486-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH] nginx: use consistent pid file location accross recipe and init scripts
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
X-List-Received-Date: Wed, 10 May 2017 07:14:18 -0000

The recipe and the systemd service file use /run/nginx/nginx.pid,
while the sys v init script used /var/run/nginx/nginx.pid

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 meta-webserver/recipes-httpd/nginx/files/nginx.init

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.init b/meta-webserver/recipes-httpd/nginx/files/nginx.init
old mode 100755
new mode 100644
index 0f38b9c..1a2bd7d
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.init
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.init
@@ -3,7 +3,7 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DAEMON=/usr/sbin/nginx
 NAME=nginx
 DESC=nginx
-PID=/var/run/nginx/nginx.pid
+PID=/run/nginx/nginx.pid
 
 test -x $DAEMON || exit 0
 
-- 
2.1.4


