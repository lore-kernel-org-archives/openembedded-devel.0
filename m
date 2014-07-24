Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0179370249
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 08:51:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O8pGvC016259
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:51:17 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 01:51:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jul 2014 16:51:23 +0800
Message-ID: <1406191883-25637-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ipsec-tools: several fixes
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
X-List-Received-Date: Thu, 24 Jul 2014 08:51:22 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. use PACKAGECONFIG
2. add three patches which will add the address check, to avoid SEGFAULT

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...y-avoid-potential-null-pointer-dereferenc.patch |   33 +++++++++++
 .../ipsec-tools/racoon-check-invalid-ivm.patch     |   26 +++++++++
 .../racoon-check-invalid-pointers.patch            |   61 ++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.1.bb               |    8 ++-
 4 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-ivm.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-pointers.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch
new file mode 100644
index 0000000..d5602c0
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch
@@ -0,0 +1,33 @@
+From 738a9857be9c92ad2f70be88ccee238e3154a936 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe.macdonald@windriver.com>
+Date: Wed, 2 Oct 2013 14:20:37 -0400
+Subject: [PATCH] racoon/pfkey: avoid potential null-pointer dereference
+
+Building with -Werror=maybe-uninitialized revealed that 'remote' from
+pk_recvmigrate() could be used with uninitialized data in
+migrate_sp_ike_addresses().  Ensure it is always at a minimum assigned
+NULL.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
+---
+ src/racoon/pfkey.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/racoon/pfkey.c b/src/racoon/pfkey.c
+index d00b166..e0dc1db 100644
+--- a/src/racoon/pfkey.c
++++ b/src/racoon/pfkey.c
+@@ -3352,7 +3352,7 @@ pk_recvmigrate(mhp)
+ 	struct sockaddr *old_saddr, *new_saddr;
+ 	struct sockaddr *old_daddr, *new_daddr;
+ 	struct sockaddr *old_local, *old_remote;
+-	struct sockaddr *local, *remote;
++	struct sockaddr *local, *remote = NULL;
+ 	struct sadb_x_kmaddress *kmaddr;
+ 	struct sadb_x_policy *xpl;
+ 	struct sadb_x_ipsecrequest *xisr_list;
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-ivm.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-ivm.patch
new file mode 100644
index 0000000..e272bc2
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-ivm.patch
@@ -0,0 +1,26 @@
+Subject: [PATCH] ipsec-tools: racoon: check several invalid ivm
+
+Upstream-Status: Pending
+
+Add checking for invalid ivm, or it will crash racoon.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ isakmp_cfg.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff -urpN a/src/racoon/isakmp_cfg.c b/src/racoon/isakmp_cfg.c
+--- a/src/racoon/isakmp_cfg.c
++++ b/src/racoon/isakmp_cfg.c
+@@ -171,6 +171,11 @@ isakmp_cfg_r(iph1, msg)
+ 	    iph1->mode_cfg->last_msgid != packet->msgid )
+ 		iph1->mode_cfg->ivm = 
+ 		    isakmp_cfg_newiv(iph1, packet->msgid);
++	if(iph1->mode_cfg->ivm == NULL) {
++		plog(LLV_ERROR, LOCATION, NULL, 
++		    "failed to create new IV\n");
++		return;
++	}
+ 	ivm = iph1->mode_cfg->ivm;
+ 
+ 	dmsg = oakley_do_decrypt(iph1, msg, ivm->iv, ivm->ive);
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-pointers.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-pointers.patch
new file mode 100644
index 0000000..de1bdb4
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-check-invalid-pointers.patch
@@ -0,0 +1,61 @@
+Subject: [PATCH] ipsec-tools: racoon: check several invalid pointers
+
+Upstream-Status: Pending
+
+Add checking for invalid pointers, or it will crash racoon.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ ipsec_doi.c    |    5 +++--
+ isakmp_cfg.c   |    7 +++++++
+ isakmp_quick.c |    6 ++++--
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+
+diff -urpN a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
+--- a/src/racoon/ipsec_doi.c
++++ b/src/racoon/ipsec_doi.c
+@@ -3374,8 +3374,9 @@ ipsecdoi_chkcmpids( idt, ids, exact )
+ 
+ 	/* handle wildcard IDs */
+ 
+-	if (idt == NULL || ids == NULL)
+-	{
++	if (idt == NULL || ids == NULL ||
++	    idt->v == NULL || idt->l == 0 ||
++	    ids->v == NULL || ids->l == 0) {
+ 		if( !exact )
+ 		{
+ 			plog(LLV_DEBUG, LOCATION, NULL,
+diff -urpN a/src/racoon/isakmp_cfg.c b/src/racoon/isakmp_cfg.c
+--- a/src/racoon/isakmp_cfg.c
++++ b/src/racoon/isakmp_cfg.c
+@@ -1138,6 +1138,13 @@ isakmp_cfg_newiv(iph1, msgid)
+ 		return NULL;
+ 	}
+ 
++	if (iph1->ivm == NULL || iph1->ivm->iv == NULL ||
++	    iph1->ivm->iv->v == NULL || iph1->ivm->iv->l == 0) {
++		plog(LLV_ERROR, LOCATION, NULL,
++		    "isakmp_cfg_newiv called with invalid IV management\n");
++		return NULL;
++	}
++
+ 	if (ics->ivm != NULL)
+ 		oakley_delivm(ics->ivm);
+ 
+diff -urpN a/src/racoon/isakmp_quick.c b/src/racoon/isakmp_quick.c
+--- a/src/racoon/isakmp_quick.c
++++ b/src/racoon/isakmp_quick.c
+@@ -2243,8 +2243,10 @@ get_proposal_r(iph2)
+ 	int error = ISAKMP_INTERNAL_ERROR;
+ 
+ 	/* check the existence of ID payload */
+-	if ((iph2->id_p != NULL && iph2->id == NULL)
+-	 || (iph2->id_p == NULL && iph2->id != NULL)) {
++	if ((iph2->id_p != NULL &&
++	    (iph2->id == NULL || iph2->id->v == NULL || iph2->id->l == 0)) ||
++	    (iph2->id != NULL &&
++	    (iph2->id_p == NULL || iph2->id_p->v == NULL || iph2->id_p->l == 0))) {
+ 		plog(LLV_ERROR, LOCATION, NULL,
+ 			"Both IDs wasn't found in payload.\n");
+ 		return ISAKMP_NTYPE_INVALID_ID_INFORMATION;
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index 2e5c0a4..b27eb0f 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -11,6 +11,9 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://0001-Fix-warning-with-gcc-4.8.patch \
            file://0002-Don-t-link-against-libfl.patch \
            file://configure.patch \
+           file://0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch \
+           file://racoon-check-invalid-pointers.patch \
+           file://racoon-check-invalid-ivm.patch \
           "
 SRC_URI[md5sum] = "d38b39f291ba2962387c3232e7335dd8"
 SRC_URI[sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
@@ -46,10 +49,13 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --with-readline \
                 --with-openssl=${STAGING_LIBDIR}/.. \
                 --without-libradius \
-                --without-libpam \
                 --disable-security-context \
                 --enable-shared \
                 ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
 CFLAGS += "-fno-strict-aliasing"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,"
+PACKAGECONFIG[selinux] = "--enable-security-context,--disable-security-context,libselinux,"
-- 
1.7.10.4


