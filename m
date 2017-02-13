Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB9671DD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4UCq004020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:30 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:16 -0800
Message-ID: <abf3f0e694f9e82a95de8916198967f9d2b1583c.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] postgresql: add gettext-native and tcl-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:32 -0000
Content-Type: text/plain

Fixed:
| checking for msgfmt... no
| configure: error: msgfmt is required for NLS

And:
| checking for tclsh83... no
| configure: error: Tcl shell not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index f720cbc..0c3af0f 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -19,7 +19,7 @@ DESCRIPTION = "\
 "
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
-DEPENDS = "zlib readline tzcode-native"
+DEPENDS = "zlib readline tzcode-native gettext-native"
 INC_PR = "r0"
 
 ARM_INSTRUCTION_SET = "arm"
@@ -61,8 +61,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
-# when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
-PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
+PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
-- 
2.9.0


