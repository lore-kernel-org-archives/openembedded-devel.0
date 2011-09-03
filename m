Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzv01-0004ML-Ci
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 20:31:25 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so3342562bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4mpgtq/fMkP7wDWLUC/S/eZCMljBEotGSg1UekC4fw8=;
	b=VQvMtUcMtTFI8ee3XWyrnSu5o7cnvaquQXl1iiuy9iIronHiaiLtDfafQUJm5CVlnu
	8YHKdzJ+Tiybf5ur0Lo4sCxJuCWhme2O6aAqnwxAkAisHWEcydE4XCggTNmhggrCBByd
	zU3xpvNe86otWAweQovgtzVaV3BL7yjJsLeWM=
Received: by 10.204.131.72 with SMTP id w8mr1278282bks.368.1315074388053;
	Sat, 03 Sep 2011 11:26:28 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id z7sm1089936bkt.5.2011.09.03.11.26.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:26:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 22:26:18 +0400
Message-Id: <1315074378-3291-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315074378-3291-1-git-send-email-dbaryshkov@gmail.com>
References: <1315074378-3291-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe 2/2] tcp-wrappers: fix parallel builds
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
X-List-Received-Date: Sat, 03 Sep 2011 18:31:25 -0000

Inparallel builds make can try to rebuild a object file while cflags
file is not yet built. Fix that by providing an explicit cflags
dependency on config-check.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../tcp-wrappers-7.6/fix-cflags-dep.patch          |   18 ++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    1 +
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/fix-cflags-dep.patch

diff --git a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/fix-cflags-dep.patch b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/fix-cflags-dep.patch
new file mode 100644
index 0000000..ef15e9f
--- /dev/null
+++ b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/fix-cflags-dep.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Pending
+
+Fix builds failing as there is no direct rule to rebuild cflags
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: tcp_wrappers_7.6/Makefile
+===================================================================
+--- tcp_wrappers_7.6.orig/Makefile	2011-09-02 03:34:07.000000000 +0400
++++ tcp_wrappers_7.6/Makefile	2011-09-02 03:34:19.000000000 +0400
+@@ -732,6 +732,7 @@
+
+ # Invalidate all object files when the compiler options (CFLAGS) have changed.
+
++cflags: config-check
+ config-check:
+	@set +e; test -n "$(REAL_DAEMON_DIR)" || { make; exit 1; }
+	@set +e; echo $(CFLAGS) >cflags.new ; \
diff --git a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
index c92447e..96448a9 100644
--- a/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://size_t.patch \
            file://tcpdchk_libwrapped.patch \
            file://ldflags.patch \
+           file://fix-cflags-dep.patch \
            \
            file://try-from.8 \
            file://safe_finger.8"
-- 
1.7.2.5



