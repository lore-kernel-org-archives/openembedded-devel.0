Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5B0260030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:19:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C7JJhY008159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 00:19:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 00:19:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 15:19:20 +0800
Message-ID: <1407827960-927-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ipsec-tools: uprev it to 0.8.2
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
X-List-Received-Date: Tue, 12 Aug 2014 07:19:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove 0001-Fix-warning-with-gcc-4.8.patch, it has been in 0.8.2

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-Fix-warning-with-gcc-4.8.patch            |   36 --------------------
 .../{ipsec-tools_0.8.1.bb => ipsec-tools_0.8.2.bb} |    5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
 rename meta-networking/recipes-support/ipsec-tools/{ipsec-tools_0.8.1.bb => ipsec-tools_0.8.2.bb} (93%)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
deleted file mode 100644
index 61f39d1..0000000
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fc230d5ded73fe4049aa586eacbe4098aeff912f Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Wed, 12 Jun 2013 17:39:06 +0100
-Subject: [PATCH] Fix warning with gcc 4.8.
-
-The line "memset(pair, 0, sizeof(pair));" was causing the following warning:
-
-	error: argument to 'sizeof' in 'memset' call is the same expression as
-	the destination; did you mean to dereference
-
-Compiling with -Werror (as specified in configure.ac) was causing this warning
-to become an error. The line itself is not needed as memory is allocated via
-calloc which performs zero initialization. Therefore, the line is removed to fix
-the warning and does not need replacing anything.
----
- src/racoon/ipsec_doi.c | 1 -
- 1 file changed, 1 deletion(-)
-
-Upstream-Status: Accepted
-	(in CVS HEAD and 0_8-stable, expected to be present in next release)
-
-diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
-index 2b48d49..4e9d3a8 100644
---- a/src/racoon/ipsec_doi.c
-+++ b/src/racoon/ipsec_doi.c
-@@ -1183,7 +1183,6 @@ get_proppair_and_doi_sit(sa, mode, doitype, sittype)
- 			"failed to get buffer.\n");
- 		goto bad;
- 	}
--	memset(pair, 0, sizeof(pair));
- 
- 	bp = (caddr_t)(sab + 1);
- 	tlen = sa->l - sizeof(*sab);
--- 
-1.8.3
-
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
similarity index 93%
rename from meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index c0c22a2..208268f 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -8,15 +8,14 @@ LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7
 DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
-           file://0001-Fix-warning-with-gcc-4.8.patch \
            file://0002-Don-t-link-against-libfl.patch \
            file://configure.patch \
            file://0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch \
            file://racoon-check-invalid-pointers.patch \
            file://racoon-check-invalid-ivm.patch \
           "
-SRC_URI[md5sum] = "d38b39f291ba2962387c3232e7335dd8"
-SRC_URI[sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
+SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
+SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
 
 inherit autotools
 
-- 
1.7.10.4


