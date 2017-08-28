Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 502C777D30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 14:10:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7SEAoDe019196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Aug 2017 07:10:50 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 28 Aug 2017 07:10:50 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 21:59:13 +0800
Message-ID: <20170828135913.7508-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170828135913.7508-1-kai.kang@windriver.com>
References: <20170828135913.7508-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] mariadb: disable thumb on armv5
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
X-List-Received-Date: Mon, 28 Aug 2017 14:10:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Disable thumb on armv5 for mariadb which causes link error:

| libsql.a(mysqld.cc.o): In function `test_if_case_insensitive(char const*) [clone .constprop.28]':
| /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8276:(.text.unlikely+0xbe):
| relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
| in .glue_7 section in linker stubs
| /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8278:(.text.unlikely+0xd0):
| relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
| in .glue_7 section in linker stubs
| /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8285:(.text.unlikely+0x150):
| relocation truncated to fit: R_ARM_THM_CALL against symbol
| `sql_print_warning(char const*, ...)' defined in .glue_7 section in linker stubs

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 32e3eaa6d..03cded637 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -82,6 +82,8 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 do_configure_append() {
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
-- 
2.14.1


