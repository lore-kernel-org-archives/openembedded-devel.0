Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PEUkw-0005PT-1p
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:27:34 +0100
Received: by eya28 with SMTP id 28so2128250eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 15:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lvDOCM3XdxmJMVvG+I/l+YYUMuNsI97N+xH0JctKKSk=;
	b=xqBppvGOyqQjnTUTfUBqRtf+Pl/9faLy6UCMeOdxFTX20gJs5NxAfANfXCDISwmcIz
	S/F/R4oBOCNpsEa509mQR+tPyaOLK7GDRQLH9fKId9hQM3ZnGMHPWnczjf0csKdRGZ9P
	4GYjLthxiPOhPlRBiF1uIQEs6syq5PAqY3JS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XTa8SuEmOeB5eUkiQMZTHglwL8jkC5LexIXWhFrduFGSr999Hkw/yVPzXheYbXjZ6J
	YlDbjEUvjWSr0+uXXHIFx5HMS1leIS7g4bUQU6ig2cove0gPLT+3Paui26dS6jPo9TsQ
	YwXDTfin4EpzfnAdtpNujtEB9U9rU0C7EnV7w=
Received: by 10.213.32.204 with SMTP id e12mr533457ebd.43.1288996002145;
	Fri, 05 Nov 2010 15:26:42 -0700 (PDT)
Received: from localhost.localdomain ([80.249.90.154])
	by mx.google.com with ESMTPS id v51sm1518814eeh.22.2010.11.05.15.26.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 15:26:40 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 00:25:32 +0200
Message-Id: <1288995932-16009-1-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1288864227-8685-1-git-send-email-anarsoul@gmail.com>
References: <1288864227-8685-1-git-send-email-anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 1/2] eglibc: fix build issue with make-3.82
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
X-List-Received-Date: Fri, 05 Nov 2010 22:27:35 -0000

Add patch to fix this error when building eglibc-2.11, eglibc-2.12
with make-3.82:

make[2]: Entering directory `eglibc-2_12/libc/manual'
Makefile:246: *** mixed implicit and normal rules.  Stop.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
Add fixed eglibc versions to patch comment

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



