Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E41E70018
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 08:24:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9O8O1uh021591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 01:24:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Oct 2017 01:24:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Oct 2017 16:22:34 +0800
Message-ID: <7f70d314d65c5d959e63739e5577348cc34a28e9.1508833120.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508833120.git.jackie.huang@windriver.com>
References: <cover.1508833120.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] samba: add missing RDEPENDS
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
X-List-Received-Date: Tue, 24 Oct 2017 08:24:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* samba-tool requires the python modules from samba-python
  or it fails with:

  Traceback (most recent call last):
    File "/usr/bin/samba-tool", line 33, in <module>
      from samba.netcmd.main import cmd_sambatool
  ImportError: No module named samba.netcmd.main

* Provisioning with samba-tool requires samba-dsdb-modules
  or it fails with:

  Setting up secrets.ldb
  ldb: unable to stat module /usr/lib64/samba/ldb : No such file or directory
  WARNING: Module [samba_secrets] not found - do you need to set LDB_MODULES_PATH?
  Unable to load modules for /var/lib/samba/private/secrets.ldb: (null)
  ERROR(ldb): uncaught exception - None

* samba-python requires pytalloc and python-tdb or it fails with:

  TypeError: pytalloc: unable to get talloc.BaseObject type
  ERROR(<type 'exceptions.ImportError'>): uncaught exception - No module named tdb

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.6.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
index 59d7425c8..2b227c95d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
@@ -186,7 +186,8 @@ python samba_populate_packages() {
 
 PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
 
-RDEPENDS_${PN} += "${PN}-base"
+RDEPENDS_${PN} += "${PN}-base ${PN}-python ${PN}-dsdb-modules"
+RDEPENDS_${PN}-python += "pytalloc python-tdb"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
-- 
2.11.0


