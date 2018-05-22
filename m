Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1FBE748A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 02:31:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4M2VEDe017803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 19:31:41 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 21 May 2018 19:31:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 May 2018 10:00:29 +0800
Message-ID: <20180522020029.21392-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: remove *_config from SSTATE_SCAN_FILES
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
X-List-Received-Date: Tue, 22 May 2018 02:31:50 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run command pg_config with segment fault. The root cause is
function sstate_hardcode_path takes elf file pg_config as a configure
file and edits it with 'sed'.

And then file pg_config is corrupt:
$ readelf -a package/usr/bin/pg_config >/dev/null
readelf: Error: Unable to read in 0x700 bytes of section headers
readelf: Error: Section headers are not available!

There is not other '*_config' file installed by postgresql except
pg_config, so remove '*_config' from SSTATE_SCAN_FILES for postgresql.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 5462332c5..1301060ee 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -202,6 +202,7 @@ do_install_append() {
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
+SSTATE_SCAN_FILES_remove = "*_config"
 
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
     libecpg-compat-dbg libecpg-compat libecpg-compat-dev \
-- 
2.14.1


