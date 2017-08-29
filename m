Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8124877CEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 03:06:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T36WTE010643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 20:06:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 28 Aug 2017 20:06:31 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>, <armccurdy@gmail.com>
Date: Tue, 29 Aug 2017 10:54:50 +0800
Message-ID: <20170829025450.27201-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] mariadb: disable thumb on armv4 and armv5
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
X-List-Received-Date: Tue, 29 Aug 2017 03:06:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Disable thumb on armv4 and armv5 for mariadb which causes link error:

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
 meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 32e3eaa6d..16dd9f9d5 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -82,6 +82,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 do_configure_append() {
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
-- 
2.14.1


