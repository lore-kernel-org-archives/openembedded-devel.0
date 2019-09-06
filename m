Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E4DE67F43B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:32:54 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id u17so3780480pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IygpkDQ34UBatYPzsQRWJO9tlwmIHZUz1spQC4CpX4I=;
	b=BYMcvhOQjJ/w+C09j8MAwAej7avRkz8tynGGz90L5J08uXPs7+pkOxaGaj8HO1PFdh
	Zu3LPjaEqAOc4L332nZaC/aKigg6C9rIg+8tiGVhniI1d2ILEptmr006uYjCYjjzhvJl
	JRgMS6v0ctOU5CbLIOxuCTVLWPVD32WYmNEXnEMdnh9aYLrjYbEHt+I6TmeNWecE5NDx
	zGlY0T+heiVH0TCfvzFdefzPl3lcyZ4soSnSWWa4QFTqCCrwkEYFfxdwsbo8VWMnYT8C
	V1OdkhjwcSbYpNDM4ClJp9Ph5hYKAp8bUVkohLak8z1QTEIpMp1lFT5enwDxU99tCNsW
	kBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IygpkDQ34UBatYPzsQRWJO9tlwmIHZUz1spQC4CpX4I=;
	b=jVhl18rtPP8YIufrS5MRigIleaF4waNI3OQU7JN3L9atr8Pi0k1wT+OmXhX/0aWeQE
	baHsv2Lr6qV4LzaHJ9oHYeIPERex5vy9tIQWOVOMxptX7WF4NsgZbe0fqVQ+ucQUNKl+
	Q3EFav7g1rbnG55ZLmYDBor8o/N4/JmRudS9pXuKWkeGQ3xKhq9zKJenUMVGe/YdzZ0Y
	pXsHdNB1KCHd7tfv2jWmlBjjQHryl1R8fol43Txq9JlRYlmTrgsEA0B1AorUZWTO+8S1
	K8xYmJmq4CSyVXtR1yWcpMFzTjOX/PbSkFxz3HPFu2T+PTeK2aS815i01ku3C0QEz7qI
	LSyw==
X-Gm-Message-State: APjAAAV1LHxBDtMTV8rxdjlyuxtmsCIiOkXDDvtOVzssSgx4JFrQpU6c
	p7pVxr9hwY/nMLe0nAW9JizUOTytgh4=
X-Google-Smtp-Source: APXvYqyA7WXa0yr2ysnuXHDu33wxRjoiw8mHnFfUTPO9kqqqsT8pq0Q8Xj5HcVUiU0ZxRQHuIP0prg==
X-Received: by 2002:a63:a011:: with SMTP id r17mr8877221pge.219.1567787575252; 
	Fri, 06 Sep 2019 09:32:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id t8sm2218205pjq.30.2019.09.06.09.32.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 09:32:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 09:32:42 -0700
Message-Id: <20190906163242.4770-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906163242.4770-1-raj.khem@gmail.com>
References: <20190906163242.4770-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] samba: Fix configure tests to work with clang
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
X-List-Received-Date: Fri, 06 Sep 2019 16:32:55 -0000
Content-Transfer-Encoding: 8bit

Do not use nested functions ( main inside main )
Use global scope for __thread variables

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ipt-Avoid-generating-nested-main-fun.patch | 30 ++++++++++
 ...ve-__thread-variable-to-global-scope.patch | 58 +++++++++++++++++++
 .../samba/samba_4.10.7.bb                     |  2 +
 3 files changed, 90 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch b/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
new file mode 100644
index 0000000000..de7f311834
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
@@ -0,0 +1,30 @@
+From 3a935c638605bfb392ca7780d22c08c1a0a71e71 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Sep 2019 21:37:33 -0700
+Subject: [PATCH 1/2] lib/replace/wscript: Avoid generating nested main
+ function
+
+clang is not happy when it sees another main nested inside the main
+function and fails the test for prctl syscall, therefore avoid adding
+implicit main() here
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/replace/wscript | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index a7fd25d..d6767fc 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -137,6 +137,7 @@ def configure(conf):
+                     }
+                     ''',
+                     'HAVE_PRCTL',
++                    addmain=False,
+                     headers='sys/prctl.h',
+                     msg='Checking for prctl syscall')
+ 
+-- 
+2.23.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch b/meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
new file mode 100644
index 0000000000..6fc849337c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
@@ -0,0 +1,58 @@
+From c62a6f32ab965de2ec77a614f20f04568116835b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Sep 2019 21:39:05 -0700
+Subject: [PATCH 2/2] util_sec.c: Move __thread variable to global scope
+
+Make clang happy otherwise it complains about variable scope
+
+fixes
+
+source3/./lib/util_sec.c:470:4: error: '__thread' variables must have global storage
+        } __thread cache;
+          ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ source3/lib/util_sec.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/source3/lib/util_sec.c b/source3/lib/util_sec.c
+index 9408269..7390318 100644
+--- a/source3/lib/util_sec.c
++++ b/source3/lib/util_sec.c
+@@ -444,6 +444,17 @@ void become_user_permanently(uid_t uid, gid_t gid)
+ 	assert_gid(gid, gid);
+ }
+ 
++#ifdef HAVE___THREAD
++	struct cache_t {
++		bool active;
++		uid_t uid;
++		gid_t gid;
++		size_t setlen;
++		uintptr_t gidset;
++	};
++
++static __thread struct cache_t cache;
++#endif
+ /**********************************************************
+  Function to set thread specific credentials. Leave
+  saved-set uid/gid alone.Must be thread-safe code.
+@@ -461,14 +472,6 @@ int set_thread_credentials(uid_t uid,
+ 	 * available.
+ 	 */
+ #ifdef HAVE___THREAD
+-	static struct {
+-		bool active;
+-		uid_t uid;
+-		gid_t gid;
+-		size_t setlen;
+-		uintptr_t gidset;
+-	} __thread cache;
+-
+ 	if (cache.active &&
+ 	    cache.uid == uid &&
+ 	    cache.gid == gid &&
+-- 
+2.23.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
index d13a6b4dbb..1b2bc087d5 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
@@ -24,6 +24,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
            file://0001-waf-add-support-of-cross_compile.patch \
+           file://0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch \
+           file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
-- 
2.23.0


