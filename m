Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TCVgq-0005Py-Lm
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 15:12:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2882; q=dns/txt; s=iport;
	t=1347627580; x=1348837180;
	h=from:to:cc:subject:date:message-id;
	bh=np9IiHG1OXlfl7KkIfIFRkmp9F3vcgNRx4ULF2hp/Ao=;
	b=AU/KHGH6+TvudwmnvSUvHjUOk8+ctZzjafMNJGB0XtvgL6pI8lLWCa5K
	Bay4uKJgUtEwTwkwzQZAkni77D8zfKBsVtgNzs2qFgVEazIULVlBEe1Ml
	Y7Exa6a69ITjQ4wuPS9lnNnmvic2X/f2mS9X8gD9THrmBZpnpmgn2ngsb g=;
X-IronPort-AV: E=Sophos;i="4.80,422,1344211200"; 
   d="scan'208";a="8038742"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 14 Sep 2012 12:59:37 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q8ECxbnU021112;
	Fri, 14 Sep 2012 12:59:37 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2012 14:54:18 +0200
Message-Id: <1347627258-5952-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-systemd][PATCH] systemd: Add patch so we can compile without xz.
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
X-List-Received-Date: Fri, 14 Sep 2012 13:12:12 -0000

A compilation bug in systemd is fixed by this patch. journal-verify.c calls uncompress_blob, in
uncompress.c. uncompress.c is, however, not compiled if you don't compile with xz support. To avoid
GPLv3, one have to turn of this support in systemd, which in turn will cause systemd to fail during linking,
as there is no definition of compress_blob.
---
 .../add-HAVE_XZ-check-to-avoid-build-failure.patch |   32 ++++++++++++++++++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/add-HAVE_XZ-check-to-avoid-build-failure.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/add-HAVE_XZ-check-to-avoid-build-failure.patch b/meta-systemd/recipes-core/systemd/systemd/add-HAVE_XZ-check-to-avoid-build-failure.patch
new file mode 100644
index 0000000..8e0bd45
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/add-HAVE_XZ-check-to-avoid-build-failure.patch
@@ -0,0 +1,32 @@
+commit 70f09301d5d47577cfa4fe70c7b3cba336529cdf
+Author: Yin Kangkai <kangkai.yin@intel.com>
+Date:   Fri Aug 24 16:52:58 2012 +0800
+
+    journal: add HAVE_XZ check to avoid build failure
+    
+    Without this, build fail with --disable-xz or xz not installed.
+
+    status: Applied upstream
+
+diff --git a/src/journal/journal-verify.c b/src/journal/journal-verify.c
+index 2401293..5d134bd 100644
+--- a/src/journal/journal-verify.c
++++ b/src/journal/journal-verify.c
+@@ -63,6 +63,7 @@ static int journal_file_object_verify(JournalFile *f, Object *o) {
+                 h1 = le64toh(o->data.hash);
+ 
+                 if (o->object.flags & OBJECT_COMPRESSED) {
++#ifdef HAVE_XZ
+                         void *b = NULL;
+                         uint64_t alloc = 0, b_size;
+ 
+@@ -73,6 +74,9 @@ static int journal_file_object_verify(JournalFile *f, Object *o) {
+ 
+                         h2 = hash64(b, b_size);
+                         free(b);
++#else
++                        return -EPROTONOSUPPORT;
++#endif
+                 } else
+                         h2 = hash64(o->data.payload, le64toh(o->object.size) - offsetof(Object, data.payload));
+ 
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 09bc635..95f4eee 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -27,6 +27,7 @@ SRCREV = "38a60d7112d33ffd596b23e8df53d75a7c09e71b"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
+           file://add-HAVE_XZ-check-to-avoid-build-failure.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
-- 
1.7.8.6



