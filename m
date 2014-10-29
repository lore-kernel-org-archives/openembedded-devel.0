Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5181660169
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 03:20:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T3K1ic001434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 20:20:03 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 20:20:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Oct 2014 23:20:00 -0400
Message-ID: <1414552800-27703-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] samba: make build deterministic by adding PACKAGECONFIG for valgrind
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
X-List-Received-Date: Wed, 29 Oct 2014 03:20:11 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* No configure option for valgrind, use the ac_cv_header_*
* The PACKAGECONFIG for valgrind is disabled by default

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 4392821..a95f163 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -51,6 +51,8 @@ PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
 PACKAGECONFIG[talloc] = "--enable-external-libtalloc --with-libtalloc, --disable-external-libtalloc --without-libtalloc, talloc"
+PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_valgrind_h=yes ac_cv_header_valgrind_memcheck_h=yes, \
+                           ac_cv_header_valgrind_valgrind_h=no ac_cv_header_valgrind_memcheck_h=no, valgrind"
 
 INITSCRIPT_PACKAGES = "samba winbind"
 INITSCRIPT_NAME_samba = "samba"
-- 
2.0.0


