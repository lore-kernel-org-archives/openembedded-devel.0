Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PDwU6-0000Nn-Rk
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 10:51:56 +0100
Received: by ewy2 with SMTP id 2so836616ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0Gi4U1Bh96yvsaVjdyjken0elyoEn/Ya8S9jRuSw3mk=;
	b=dyg0L+WHWp2iqmgnAFbFAjJ4YdfAhjvKGafDhGIEIkMCl99rQJjvGrg2l/o57r7CHa
	gYqsiIwjMAjTKaQJVyoAvqNvrB6FQfNuDgJUsnF+YbHTw094FTu+7ABp6n3OiI1riJPQ
	JB6GaeuRb2WBcJh0suGx/u9OBmxDDWEqtSX24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ow/hFyghBX/poMeFnDpZkbJ1OsE2IUXHe70JKKo7KpYs51jdV0W/txIeOysfAdk3rb
	pGb2isXhSeb1Cj1WlpFMKvJnZzX32ZylEU2hX4qnumEBP5XsivIgRACQDAlkrrpO3QyG
	tYVLPHZLJB+5pKoOximrRL0PgOSYHr561RfZc=
Received: by 10.14.37.142 with SMTP id y14mr338980eea.26.1288864264929;
	Thu, 04 Nov 2010 02:51:04 -0700 (PDT)
Received: from localhost.localdomain ([86.57.155.118])
	by mx.google.com with ESMTPS id w20sm7571839eeh.6.2010.11.04.02.51.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 02:51:03 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 11:50:26 +0200
Message-Id: <1288864227-8685-1-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] eglibc: fix build issue with make-3.82
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Nov 2010 09:51:56 -0000

Add patch to fix this error when building eglibc-2.12
with make-3.82:

make[2]: Entering directory `eglibc-2_12/libc/manual'
Makefile:246: *** mixed implicit and normal rules.  Stop.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 recipes/eglibc/eglibc_2.11.bb              |    3 ++-
 recipes/eglibc/eglibc_2.12.bb              |    3 ++-
 recipes/eglibc/files/eglibc-make-382.patch |   15 +++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 recipes/eglibc/files/eglibc-make-382.patch

diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 3763124..89742b6 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10690"
 EGLIBC_BRANCH="eglibc-2_11"
@@ -14,6 +14,7 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
            file://sh4_local-fpscr_values.patch \
+           file://eglibc-make-382.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 40ab65c..956f64b 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12"
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 PR_append = "+svnr${SRCPV}"
 SRCREV="11762"
 EGLIBC_BRANCH="eglibc-2_12"
@@ -16,6 +16,7 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://sh4_local-fpscr_values.patch \
            file://eglibc-dont-cache-slibdir.patch \
            file://armv4-eabi-compile-fix.patch \
+           file://eglibc-make-382.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/files/eglibc-make-382.patch b/recipes/eglibc/files/eglibc-make-382.patch
new file mode 100644
index 0000000..5ecad90
--- /dev/null
+++ b/recipes/eglibc/files/eglibc-make-382.patch
@@ -0,0 +1,15 @@
+http://git.frugalware.org/gitweb/gitweb.cgi?p=frugalware-current.git;a=blob_plain;f=source/base/glibc/make-3.82-fix.patch;hb=8217c32ecc2e14962847ba3d8a272eb64a3dba4f
+
+--- libc/manual/Makefile
++++ libc/manual/Makefile
+@@ -232,7 +232,9 @@
+ .PHONY: stubs
+ stubs: $(objpfx)stubs
+ endif
+-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
++$(objpfx)stubs ../po/manual.pot:
++	touch $@
++$(objpfx)stamp%:
+ 	$(make-target-directory)
+ 	touch $@
+ 
-- 
1.7.3.2



