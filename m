Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 112C871FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 09:54:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI9suV4015909
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 01:54:56 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 18 Nov 2014 01:54:56 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Tue, 18 Nov 2014 17:54:38 +0800
Message-ID: <1416304478-31307-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
References: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] mariadb: add dependency libevent
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
X-List-Received-Date: Tue, 18 Nov 2014 09:54:57 -0000
Content-Type: text/plain

mariadb failed to build:
| make[2]: *** No rule to make target
  '/.../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libevent.so',
  needed by 'tests/async_queries'.  Stop.
| make[2]: Leaving directory
  '/.../bitbake_build/tmp/work/core2-64-wrs-linux/mariadb/5.5.40-r0/build'
  CMakeFiles/Makefile2:6742: recipe for target 'tests/CMakeFiles/async_queries.dir/all' failed
| make[1]: *** [tests/CMakeFiles/async_queries.dir/all] Error 2

It is an rare case that when configure mariadb, libevent exists in
sysroot. But when do compile for mariadb, libevent is gone somehow. That
causes build fails. Run follow commands could reproduce this error:

$ bitbake libevent
$ bitbake mariadb -c cleansstate
$ bitbake mariadb -c configure
$ bitbake libevent -c clean
$ bitbake mariadb

Add if without libevent, test case tests/async_queries.c will not be built.
The case is helpful to do unit test. So add libevent as a dependency to fix the
error and make sure async_queries.c will be built.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
index f24cb43..8f998a3 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native ncurses zlib readline libaio"
+DEPENDS += "mariadb-native ncurses zlib readline libaio libevent"
 
 PROVIDES += "mysql5"
 
-- 
1.9.1


