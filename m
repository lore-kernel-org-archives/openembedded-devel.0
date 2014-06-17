Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 753286FEE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 08:26:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H8Qf06001484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 01:26:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 01:26:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jun 2014 16:26:55 +0800
Message-ID: <1402993615-4703-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] dovecot: add the dependency for a C file
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
X-List-Received-Date: Tue, 17 Jun 2014 08:26:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

building rquota_xdr.c depends on a head file, which is generated
when building, so add the dependency to ensure the header file is
generated firstly.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../building-rquota_xdr.c-depend-on-rquota.h.patch |   28 ++++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.2.10.bb      |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch b/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch
new file mode 100644
index 0000000..11d9d8c
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch
@@ -0,0 +1,28 @@
+[PATCH] building rquota_xdr.c depends on rquota.h
+
+Upstream-status: Pending
+
+rquota.h is generated automatically, and building rquota_xdr.c
+needs rquota.h, so add the dependency on rquota.h for rquota_xdr.c
+
+Signed-off-by: rongqing li <rli2@yow-blade4.wrs.com>
+---
+ src/plugins/quota/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/quota/Makefile.am b/src/plugins/quota/Makefile.am
+index 8a6988d..3626d79 100644
+--- a/src/plugins/quota/Makefile.am
++++ b/src/plugins/quota/Makefile.am
+@@ -70,7 +70,7 @@ RQUOTA_XDR = rquota_xdr.c
+ RQUOTA_XDR_LO = rquota_xdr.lo
+ #RQUOTA_X = /usr/include/rpcsvc/rquota.x
+ RQUOTA_X = $(srcdir)/rquota.x
+-rquota_xdr.c: Makefile $(RQUOTA_X)
++rquota_xdr.c: Makefile $(RQUOTA_X) rquota.h
+ 	if [ "$(top_srcdir)" != "$(top_builddir)" ]; then \
+ 	  cp $(RQUOTA_X) $(top_builddir)/src/plugins/quota/; \
+ 	fi; \
+-- 
+1.8.2.1
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
index 8528536..29e54c4 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
 
 SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
+           file://building-rquota_xdr.c-depend-on-rquota.h.patch \
           "
 SRC_URI[md5sum] = "037e9c9e07d9dbff54dcff09f280fc8c"
 SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4d2e09b"
-- 
1.7.10.4


