Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 45F9D734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 19:34:46 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so133557865qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=2VxJURmLuQ5KkxpvjbOtTh2314P3OpEdaIrYAZBetvY=;
	b=kaPyF0tnoWHO1WRnKU75Bt9tmJ+0JjlB0bddZJtCG0pJTfFxZtiu3jos7sLOHuF7eN
	yIJbExVhL6wW50oOqXjftwchpiUsZlWQdgCfDkcAftQgcbisfmUfPz9YpVrz36gW8Rh4
	/gu3kVY5mrO78dKElJ6fUYki/jGzjCPE9SUpiluzaln2VeYSAdM6DRZ166aV8c6wFUok
	MStJNY+Al30FErPvDGWEqgWK4VN6JQesorHXV/f2QVtxUWFbaGZuQ/aQ9Xm+NIVg9zMr
	kZk8Ztswl8MO7nJSCJqqFM1MHJ6dlPLcjF6u0RBvP3BqGvp1fj/k49yDC10IfWBXtucG
	r7dg==
X-Received: by 10.140.231.208 with SMTP id b199mr137759qhc.87.1440617685907;
	Wed, 26 Aug 2015 12:34:45 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([187.23.145.102])
	by smtp.gmail.com with ESMTPSA id 65sm17046616qgo.1.2015.08.26.12.34.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 12:34:45 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:34:32 -0300
Message-Id: <1440617672-7518-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] mariadb: fix tarball fetch URL
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
X-List-Received-Date: Wed, 26 Aug 2015 19:34:49 -0000

http://mirror.stshosting.co.uk/mariadb responds with a 404 error, so
use http://archive.mariadb.org instead.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-support/mysql/mariadb.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index d2418e7..4e2a64c 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
-- 
1.7.10.4


