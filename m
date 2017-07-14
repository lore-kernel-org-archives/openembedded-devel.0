Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 02C4C78199
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:37 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e199so9719950pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=guP+cF5mudGOi3NqB3ZdK3mooi0eMNa9/LD3EDt6yYo=;
	b=T//k+XQDokKA2LOni9xtm4CRNkQv47cBPjQIhgghTx/iGObxZcqrghFH4tW9oHAczD
	KVGF9IbYT7KYTsskDCYM5cR4RIBxw0qe1Vwcc2o1WzwKclXpZEu7qKqka7oHiWCzdOTP
	3bmrfUVRRxsiikuCA518TpTQ/GlN/1r0Yszeeb3XtTezgwSzOJq/ytENef2hMctkuo+H
	9tqZCAPBJHJFuXy9LFE7n8OTz2S8AvvGwWKvza8CgQdK90LlLWV8jJdbky3g4Ys+JbXF
	I2tZ9+gvbN4yhHOKBcNOU2gfhSzlc1Zqzg363wJq0NECFBarceha7wl2SOWwjuc/gIXx
	4aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=guP+cF5mudGOi3NqB3ZdK3mooi0eMNa9/LD3EDt6yYo=;
	b=juBPYn9ZF1tFV20HP79+Gv+RRPge780ctHerosL4sB4fAtBkuyTerJziTYEPTykQ4n
	bdir7YaCeTF92joKwv4b4nDpAyMd2D7VIxWcW3OYaF1SexloPCuMY6UKQF54cm7txmeg
	3t4DaufaypQfxeD49nbwPTfGVeBJ47hsNLQhfL1iFNXWFulumMRb+RelsGZww/H3cTgS
	NrW0gTJF52PxC5e/oKsAEgS75qFqoGb/fmostwSvcZ8UsqD3tHvn+0st1vn0OTCVuFHY
	9YgjSp3NF3d95N7TixXQPGv+1qL8UuQVhL7kLOynN6RAg0S54Ak62Dk1rtaIcae/lme0
	snxw==
X-Gm-Message-State: AIVw111YMWsp0gUSwY4hHzExdJzUeYpVAB0f/cNmnXfJ1xLBGCgmLcGl
	fBcSm3uS+OUItgib
X-Received: by 10.99.246.69 with SMTP id u5mr12859122pgj.173.1500010838255;
	Thu, 13 Jul 2017 22:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:05 -0700
Message-Id: <20170714054013.34458-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 10/18] gedit: Define ACCESSPERMS if not defined already
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:37 -0000

Fixes build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ent-saver.c-Define-ACCESSPERMS-if-not-def.patch | 31 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     | 11 ++++----
 2 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch

diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch b/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
new file mode 100644
index 000000000..11afe75ce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
@@ -0,0 +1,31 @@
+From ee43bcc3c8d69fe56a64c3487e2d3c780ea5d25e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 06:53:35 -0700
+Subject: [PATCH] tests/document-saver.c: Define ACCESSPERMS if not defined
+ already
+
+Helps compile with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/document-saver.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/document-saver.c b/tests/document-saver.c
+index 9f44d5a..811ade6 100644
+--- a/tests/document-saver.c
++++ b/tests/document-saver.c
+@@ -41,6 +41,10 @@
+ #define UNOWNED_GROUP_LOCAL_URI "/tmp/gedit-document-saver-unowned-group.txt"
+ #define UNOWNED_GROUP_REMOTE_URI "sftp://localhost/tmp/gedit-document-saver-unowned-group.txt"
+ 
++#if !defined(ACCESSPERMS)
++#define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO) /* 0777 */
++#endif
++
+ static gboolean test_completed;
+ static gboolean mount_completed;
+ static gboolean mount_success;
+-- 
+2.13.2
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 03d7fa4e5..4352b5e11 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -8,11 +8,12 @@ DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-c
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit gnome gettext pythonnative
-SRC_URI+= " \
-    file://0001-workaround-void-pointer-arithmetic.patch \
-    file://0001-Remove-help-directory-from-build.patch \
-    file://0002-suppress-string-format-literal-warning-to-fix-build-.patch \
-"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://0001-workaround-void-pointer-arithmetic.patch \
+           file://0001-Remove-help-directory-from-build.patch \
+           file://0002-suppress-string-format-literal-warning-to-fix-build-.patch \
+           file://0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch \
+           "
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
 GNOME_COMPRESS_TYPE="bz2"
-- 
2.13.2


