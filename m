Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id B784179559
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:34:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w5-v6so3177701wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jdBZuNe2QboDqYKRk+Lvt9bvgNPq/Yk0b7jiRB4rsl4=;
	b=UO2fNl/fyvNRlUElgEzPDjO1tl5jLDLi3NXRvJ0EkdQbpJlySXTConXQ23e8eMlHE7
	wwxvSS6Zq7DIgUn7EUd+Mr81mIY8eTBbOiC4VwTdF4kOBZpvawSfTmIU4ki2orc8w1PO
	niDziKsNG6hd7+nuLvVunN9Qz6y7LHNHK7oSkT+w9xhXnrHDRUARm3RSPE0jKneJcg4w
	00BvMfw/9NNhGP00OCmEAPQU4yIKtyyX4ffnAogU65LesXg911B+IZ02uwb7tTt4LPqZ
	6uYFLr8WKEGKfYeW+Qh/jAseHou9TIxCoPyGc7F8D36WdfZNaeh6/kcIn8rIZHOx/yd+
	gk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jdBZuNe2QboDqYKRk+Lvt9bvgNPq/Yk0b7jiRB4rsl4=;
	b=ri6CP74NTSNQQXmnYn6JhjcSDpc8ou20l0fkg4PtwVfv9BDYK4I01RnyIzr5No6D7o
	AP6xHaQq0nqf5yxDOZmM/CYfEtYFQ2bb9omf+IrXA+KL31xRbfMC8HvfMifL01wURAro
	SWkgYW20PXHxFueDtMSW21DrFMWCUyi0gUDvZPJfI+R8LfaGSQdsYXWEitQAUT0rXuyv
	11rToyvsqVwdbZUWCcNNUwz5bw7syZFV1A4i7tWfRhzdvTNoUIDbik5iAEfSGcXtYq3n
	RQEf12dbFnq0TVWs+kboWqCIl4w08G3RO7NzLppTyi/8Cl5I9CekCs1xvfvZX9J5yHYz
	JM+A==
X-Gm-Message-State: ABuFfoi0sWopYeXGUmCvsoj8QmyvMAd3wuHTqj7tNwfXedVbiOcvrxlJ
	kv6Phvi+FEDSC+G2TmfOqJiaSWF9
X-Google-Smtp-Source: ACcGV61LWLAl7cxXhEEOebiNFI4ysN50BheAawdeucs0CgW7NLLfmITpadaLDYdKQr8bujhyjBlJhA==
X-Received: by 2002:a05:6000:100f:: with SMTP id
	a15mr11493968wrx.271.1538501644911; 
	Tue, 02 Oct 2018 10:34:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z89-v6sm38343368wrb.3.2018.10.02.10.34.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 10:34:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:33:59 +0000
Message-Id: <20181002173359.25493-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002173359.25493-1-Martin.Jansa@gmail.com>
References: <20181002173359.25493-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] android-tools: refresh patches with devtool
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
X-List-Received-Date: Tue, 02 Oct 2018 17:34:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* devtool isn't able to regenerate them completely, it generates only
  top level commit which says that submodules were changed, like this:
  From c8fa114325e4e532657499b9bb6fd23cb6536eaa Mon Sep 17 00:00:00 2001
  From: OpenEmbedded <oe.patch@oe>
  Date: Tue, 2 Oct 2018 16:46:55 +0000
  Subject: [PATCH] Committing changes from do_patch

  ---
   external/libselinux | 2 +-
   system/core         | 2 +-
   system/extras       | 2 +-
   3 files changed, 3 insertions(+), 3 deletions(-)
  ..

  but it still creates relatively good commits in each submodule and
  after small manual cleanup they can be exported with
  git format-patch --no-numbered --no-signature

* rename .gitignore to prevent git ignoring the changes in .patch files
  in meta-oe already (we want to use it only later during the build)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-adb-remove-selinux-extensions.patch} | 19 +++++--
 ...Use-local-sockets-where-appropriate.patch} | 20 +++++---
 .../0003-adb-define-shell-command.patch}      | 16 ++++--
 ...adb-Fix-build-on-big-endian-systems.patch} | 12 +++--
 .../0005-adb-add-base64-implementation.patch} | 13 ++---
 .../0006-adb-Musl-fixes.patch}                | 15 +++---
 ...b_linux.c-fix-build-with-glibc-2.28.patch} |  6 +--
 ...08-adb-Allow-adbd-to-be-ran-as-root.patch} | 11 ++--
 ...dd-dt-parameter-to-specify-DT-image.patch} | 14 +++---
 ...x-capability.h-on-linux-systems-too.patch} | 10 ++--
 .../0011-Remove-bionic-specific-calls.patch}  | 48 ++++++++++--------
 ...aration-of-stlcat-strlcopy-function.patch} | 38 ++++++++------
 ...xt4_utils-remove-selinux-extensions.patch} | 19 +++++--
 ...dd-o-argument-to-preserve-ownership.patch} | 21 ++++----
 .../android-tools/{.gitignore => gitignore}   |  0
 .../0001-Remove-bionic-specific-calls.patch}  | 13 ++++-
 .../android-tools/android-tools_5.1.1.r37.bb  | 50 +++++++++----------
 17 files changed, 192 insertions(+), 133 deletions(-)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{remove-selinux-android.patch => core/0001-adb-remove-selinux-extensions.patch} (51%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{use-local-socket.patch => core/0002-adb-Use-local-sockets-where-appropriate.patch} (73%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{define-shell-command.patch => core/0003-adb-define-shell-command.patch} (39%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{fix-big-endian-build.patch => core/0004-adb-Fix-build-on-big-endian-systems.patch} (74%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{0001-add-base64-implementation.patch => core/0005-adb-add-base64-implementation.patch} (98%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{0002-adb-Musl-fixes.patch => core/0006-adb-Musl-fixes.patch} (92%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{0001-usb_linux.c-fix-build-with-glibc-2.28.patch => core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch} (76%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{0001-Allow-adbd-to-be-ran-as-root.patch => core/0008-adb-Allow-adbd-to-be-ran-as-root.patch} (64%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{mkbootimg-Add-dt-parameter-to-specify-DT-image.patch => core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch} (89%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{use-capability.patch => core/0010-Use-linux-capability.h-on-linux-systems-too.patch} (49%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{remove-bionic-android.patch => core/0011-Remove-bionic-specific-calls.patch} (59%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{implicit-declaration-function-strlcat-strlcopy.patch => core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch} (55%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{remove-selinux-android-extras.patch => extras/0001-ext4_utils-remove-selinux-extensions.patch} (41%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{preserve-ownership.patch => extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch} (82%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{.gitignore => gitignore} (100%)
 rename meta-oe/recipes-devtools/android-tools/android-tools/{remove-bionic-android-libselinux.patch => libselinux/0001-Remove-bionic-specific-calls.patch} (38%)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
similarity index 51%
rename from meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
index bc0dd4a2e9..7d20c50680 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
@@ -1,10 +1,21 @@
-Subject: drop useless includes of Android SELINUX extensions; avoids having to clone another module; this should be sent upstream
-Author: Sergio Schvezov <sergio.schvezov@canonical.com>
+From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00 2001
+From: Sergio Schvezov <sergio.schvezov@canonical.com>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] adb: remove selinux extensions
+
+* drop useless includes of Android SELINUX extensions
+* avoids having to clone another module
+* this should be sent upstream
 
 Upstream-Status: Inappropriate
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- adb/file_sync_service.c         |    3 ---
+ adb/file_sync_service.c | 3 ---
+ 1 file changed, 3 deletions(-)
 
+diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c
+index 7933858516..3cbd0cd863 100644
 --- a/adb/file_sync_service.c
 +++ b/adb/file_sync_service.c
 @@ -26,7 +26,6 @@
@@ -23,7 +34,7 @@ Upstream-Status: Inappropriate
          }
          *x++ = '/';
      }
-@@ -251,7 +249,6 @@ static int handle_send_file(int s, char
+@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path, uid_t uid,
      if(fd >= 0) {
          struct utimbuf u;
          adb_close(fd);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
similarity index 73%
rename from meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
index 0ff37e0380..3627110ad8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
@@ -1,13 +1,17 @@
-Subject: adb: Use local sockets where appropriate
-Author: Hilko Bengen <bengen@debian.org>
+From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00 2001
+From: Hilko Bengen <bengen@debian.org>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] adb: Use local sockets where appropriate
 
 Upstream-Status: Inappropriate
 ---
- adb/adb.c             |    6 +++++-
- adb/adb_client.c      |    5 +++--
- adb/transport_local.c |    3 ++-
+ adb/adb.c             | 6 +++++-
+ adb/adb_client.c      | 5 +++--
+ adb/transport_local.c | 3 ++-
  3 files changed, 10 insertions(+), 4 deletions(-)
 
+diff --git a/adb/adb.c b/adb/adb.c
+index 10a1e0da26..027edd9359 100644
 --- a/adb/adb.c
 +++ b/adb/adb.c
 @@ -1230,7 +1230,11 @@ int launch_server(int server_port)
@@ -23,6 +27,8 @@ Upstream-Status: Inappropriate
  }
  
  #if !ADB_HOST
+diff --git a/adb/adb_client.c b/adb/adb_client.c
+index eb1720d22c..a383faefe3 100644
 --- a/adb/adb_client.c
 +++ b/adb/adb_client.c
 @@ -185,12 +185,12 @@ int _adb_connect(const char *service)
@@ -48,9 +54,11 @@ Upstream-Status: Inappropriate
      if(writex(fd, tmp, 4) || writex(fd, service, len)) {
          strcpy(__adb_error, "write failure during connection");
          adb_close(fd);
+diff --git a/adb/transport_local.c b/adb/transport_local.c
+index 948cc15812..71582a8c88 100644
 --- a/adb/transport_local.c
 +++ b/adb/transport_local.c
-@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int co
+@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int console_port, int adb_port)
      }
  #endif
      if (fd < 0) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
similarity index 39%
rename from meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
index 64edd0d119..cf1d9cbc3d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
@@ -1,15 +1,21 @@
-Description: we intend to run on Linux system so the shell is always /bin/sh,
-             for the host or the target.
-Author: Fathi Boudra <fabo@debian.org>
+From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] adb: define shell command
+
+we intend to run on Linux system so the shell is always /bin/sh,
+for the host or the target.
 
 Upstream-Status: Inappropriate
 ---
- adb/services.c |    4 ----
+ adb/services.c | 4 ----
  1 file changed, 4 deletions(-)
 
+diff --git a/adb/services.c b/adb/services.c
+index 21b08dc201..d44b0c5068 100644
 --- a/adb/services.c
 +++ b/adb/services.c
-@@ -299,11 +299,7 @@ static int create_subproc_raw(const char
+@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd, const char *arg0, const char *arg
  }
  #endif  /* !ABD_HOST */
  
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
similarity index 74%
rename from meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
index 2b91c3baf8..79e9d4d3b2 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
@@ -1,4 +1,7 @@
-Fix build on big endian systems
+From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 21 Feb 2017 19:46:24 +0100
+Subject: [PATCH] adb: Fix build on big endian systems
 
 The usb_linux_client.c file defines cpu_to_le16/32 by using the C
 library htole16/32 function calls. However, cpu_to_le16/32 are used
@@ -14,9 +17,12 @@ To solve this, we simply open-code cpu_to_le16/32 in a way that allows
 them to be used when initializing structures.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ adb/usb_linux_client.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
 
-Index: b/adb/usb_linux_client.c
-===================================================================
+diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
+index 8426e0ea14..6e8b5bbbd2 100644
 --- a/adb/usb_linux_client.c
 +++ b/adb/usb_linux_client.c
 @@ -34,8 +34,15 @@
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
similarity index 98%
rename from meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
index fa7253a2b5..fcd4ae2388 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
@@ -1,19 +1,19 @@
-From bbeb72f11c64f190b23abbed5f44311bd021bdc9 Mon Sep 17 00:00:00 2001
+From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Sep 2017 15:46:38 -0700
-Subject: [PATCH 1/2] add base64 implementation
+Subject: [PATCH] adb: add base64 implementation
 
 musl needs it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  adb/adb_auth_client.c |   2 +-
- adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++
+ adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 316 insertions(+), 1 deletion(-)
  create mode 100644 adb/base64.c
 
 diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
-index 55e9dca..104b413 100644
+index 55e9dcad19..104b413b8b 100644
 --- a/adb/adb_auth_client.c
 +++ b/adb/adb_auth_client.c
 @@ -75,7 +75,7 @@ static void read_keys(const char *file, struct listnode *list)
@@ -27,7 +27,7 @@ index 55e9dca..104b413 100644
              free(key);
 diff --git a/adb/base64.c b/adb/base64.c
 new file mode 100644
-index 0000000..95da284
+index 0000000000..95da284d0d
 --- /dev/null
 +++ b/adb/base64.c
 @@ -0,0 +1,315 @@
@@ -346,6 +346,3 @@ index 0000000..95da284
 +	return (tarindex);
 +}
 +
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
similarity index 92%
rename from meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
index 23feaba81e..b5d383f383 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
@@ -1,7 +1,7 @@
-From f8653ed0ede4aa781ab758fcd44fdc05ffbe0b0a Mon Sep 17 00:00:00 2001
+From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Sep 2017 15:50:57 -0700
-Subject: [PATCH 2/2] adb: Musl fixes
+Subject: [PATCH] adb: Musl fixes
 
 __nonnull is gcc specific
 include sys/types.h for size_t
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 20 insertions(+), 14 deletions(-)
 
 diff --git a/adb/adb.h b/adb/adb.h
-index 44e5981..bcdc49f 100644
+index 44e5981bdc..bcdc49f63c 100644
 --- a/adb/adb.h
 +++ b/adb/adb.h
 @@ -18,7 +18,9 @@
@@ -30,7 +30,7 @@ index 44e5981..bcdc49f 100644
  #include "transport.h"  /* readx(), writex() */
  
 diff --git a/adb/disable_verity_service.c b/adb/disable_verity_service.c
-index ed3da52..29fa3d6 100644
+index ed3da52108..29fa3d65a9 100644
 --- a/adb/disable_verity_service.c
 +++ b/adb/disable_verity_service.c
 @@ -14,25 +14,28 @@
@@ -68,7 +68,7 @@ index ed3da52..29fa3d6 100644
  {
      char buffer[256];
 diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
-index 8cbe840..8f0ccfb 100644
+index 8cbe8403cc..8f0ccfb7aa 100644
 --- a/adb/framebuffer_service.c
 +++ b/adb/framebuffer_service.c
 @@ -14,6 +14,10 @@
@@ -93,7 +93,7 @@ index 8cbe840..8f0ccfb 100644
  #include <sys/ioctl.h>
  #include <sys/mman.h>
 diff --git a/adb/sysdeps.h b/adb/sysdeps.h
-index cc1f839..ea39ac3 100644
+index cc1f839e9f..ea39ac39cc 100644
 --- a/adb/sysdeps.h
 +++ b/adb/sysdeps.h
 @@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
@@ -129,6 +129,3 @@ index cc1f839..ea39ac3 100644
  
  static __inline__  int    adb_unlink(const char*  path)
  {
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
similarity index 76%
rename from meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
index 15401d1524..e02a95687f 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
@@ -1,7 +1,7 @@
-From cb80906bd3869bba370a088e4634ae4a8093fdd8 Mon Sep 17 00:00:00 2001
+From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 11 Aug 2018 13:23:37 +0000
-Subject: [PATCH] usb_linux.c: fix build with glibc-2.28
+Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
 
 * include sysmacros for major, minor
 
@@ -11,7 +11,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/adb/usb_linux.c b/adb/usb_linux.c
-index f16bdd036..c8a773244 100644
+index f16bdd0361..c8a7732441 100644
 --- a/adb/usb_linux.c
 +++ b/adb/usb_linux.c
 @@ -22,6 +22,7 @@
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
similarity index 64%
rename from meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
index d8f0d48692..7d223e05f1 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
@@ -1,17 +1,17 @@
-From 3237f335c5b559c68749173f4343e6475f9eb8c7 Mon Sep 17 00:00:00 2001
+From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00 2001
 From: Florent Revest <revestflo@gmail.com>
 Date: Mon, 30 Oct 2017 21:05:46 +0100
-Subject: [PATCH] Allow adbd to be ran as root
+Subject: [PATCH] adb: Allow adbd to be ran as root
 
 ---
  adb/adb.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/adb/adb.c b/adb/adb.c
-index 10a1e0d..a88641f 100644
+index 027edd9359..e0f7ecde45 100644
 --- a/adb/adb.c
 +++ b/adb/adb.c
-@@ -1267,6 +1267,7 @@ static int should_drop_privileges() {
+@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {
      int secure = 0;
      char value[PROPERTY_VALUE_MAX];
  
@@ -19,6 +19,3 @@ index 10a1e0d..a88641f 100644
     /* run adbd in secure mode if ro.secure is set and
      ** we are not in the emulator
      */
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
similarity index 89%
rename from meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
index 76624d4060..a4dc6e1e35 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
@@ -1,19 +1,19 @@
-From cc5e7b02a3be57709a1aed6e34be100b82a71620 Mon Sep 17 00:00:00 2001
+From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00 2001
 From: David Ng <dave@codeaurora.org>
 Date: Fri, 27 Jul 2012 17:15:03 -0700
-Subject: [PATCH 1/2] mkbootimg: Add --dt parameter to specify DT image
+Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image
 
 New optional --dt parameter to specify a kernel device
 tree image.
 
-Change-Id: Ie29a11cbf4138426bfd19ae486d69a5fcbd8f442
-
 Upstream-Status: Inappropriate
 ---
- mkbootimg/bootimg.h   |    7 +++++--
- mkbootimg/mkbootimg.c |   21 +++++++++++++++++++++
+ mkbootimg/bootimg.h   |  7 +++++--
+ mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++
  2 files changed, 26 insertions(+), 2 deletions(-)
 
+diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h
+index 9171d85a7b..308c537d6b 100644
 --- a/mkbootimg/bootimg.h
 +++ b/mkbootimg/bootimg.h
 @@ -41,8 +41,8 @@ struct boot_img_hdr
@@ -41,6 +41,8 @@ Upstream-Status: Inappropriate
  **
  ** 0. all entities are page_size aligned in flash
  ** 1. kernel and ramdisk are required (size != 0)
+diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c
+index fc92b4dc30..658052cdf2 100644
 --- a/mkbootimg/mkbootimg.c
 +++ b/mkbootimg/mkbootimg.c
 @@ -65,6 +65,7 @@ int usage(void)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
similarity index 49%
rename from meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
index aef2ac2c1c..2c607ff67c 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
@@ -1,11 +1,15 @@
-Subject: use linux/capability.h on linux systems too
-Author: Loïc Minier <loic.minier@ubuntu.com>
+From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@ubuntu.com>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] Use linux/capability.h on linux systems too
 
 Upstream-Status: Inappropriate
 ---
- include/private/android_filesystem_config.h |    2 +-
+ include/private/android_filesystem_config.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/include/private/android_filesystem_config.h b/include/private/android_filesystem_config.h
+index 2f528b95c8..3e0b00928e 100644
 --- a/include/private/android_filesystem_config.h
 +++ b/include/private/android_filesystem_config.h
 @@ -27,7 +27,7 @@
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
similarity index 59%
rename from meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
index 93b30cab68..5b18f461a3 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
@@ -1,13 +1,17 @@
-Description: remove bionic specific calls
-Author: Fathi Boudra <fabo@debian.org>
+From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] Remove bionic specific calls
 
 Upstream-Status: Inappropriate
 ---
- include/cutils/properties.h |    1 -
- libcutils/properties.c      |    2 +-
- liblog/logd_write.c         |    5 +++++
+ include/cutils/properties.h | 1 -
+ libcutils/properties.c      | 2 +-
+ liblog/logd_write.c         | 5 +++++
  3 files changed, 6 insertions(+), 2 deletions(-)
 
+diff --git a/include/cutils/properties.h b/include/cutils/properties.h
+index 798db8b36f..7d01f28d6e 100644
 --- a/include/cutils/properties.h
 +++ b/include/cutils/properties.h
 @@ -19,7 +19,6 @@
@@ -18,6 +22,24 @@ Upstream-Status: Inappropriate
  #include <stdint.h>
  
  #ifdef __cplusplus
+diff --git a/libcutils/properties.c b/libcutils/properties.c
+index b283658aa4..4151e7882c 100644
+--- a/libcutils/properties.c
++++ b/libcutils/properties.c
+@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key, int32_t default_value) {
+     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_value);
+ }
+ 
++#undef HAVE_LIBC_SYSTEM_PROPERTIES
+ #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
+ 
+ #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
+-#include <sys/_system_properties.h>
+ 
+ int property_set(const char *key, const char *value)
+ {
+diff --git a/liblog/logd_write.c b/liblog/logd_write.c
+index b2668cedb7..f5a44fe901 100644
 --- a/liblog/logd_write.c
 +++ b/liblog/logd_write.c
 @@ -23,6 +23,7 @@
@@ -28,7 +50,7 @@ Upstream-Status: Inappropriate
  #include <sys/types.h>
  #if (FAKE_LOG_DEVICE == 0)
  #include <sys/socket.h>
-@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_
+@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t log_id, struct iovec *vec, size_t nr)
      realtime_ts.tv_nsec = ts.tv_nsec;
  
      log_id_buf = log_id;
@@ -40,17 +62,3 @@ Upstream-Status: Inappropriate
  
      newVec[0].iov_base   = (unsigned char *) &log_id_buf;
      newVec[0].iov_len    = sizeof_log_id_t;
---- a/libcutils/properties.c
-+++ b/libcutils/properties.c
-@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *k
-     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_value);
- }
- 
-+#undef HAVE_LIBC_SYSTEM_PROPERTIES
- #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
- 
- #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
--#include <sys/_system_properties.h>
- 
- int property_set(const char *key, const char *value)
- {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
similarity index 55%
rename from meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
index f26e5d0cfc..b0feb65921 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
@@ -1,13 +1,29 @@
-Description: fix implicit declaration of stlcat/strlcopy functions.
-Author: Fathi Boudra <fabo@debian.org>
+From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy functions
 
 Upstream-Status: Inappropriate
 ---
- adb/adb.c                |    1 +
- fs_mgr/fs_mgr_fstab.c    |    2 +-
- include/cutils/sockets.h |    2 +-
+ adb/adb.c                | 1 +
+ fs_mgr/fs_mgr_fstab.c    | 2 +-
+ include/cutils/sockets.h | 2 +-
  3 files changed, 3 insertions(+), 2 deletions(-)
 
+diff --git a/adb/adb.c b/adb/adb.c
+index e0f7ecde45..aaefd9b401 100644
+--- a/adb/adb.c
++++ b/adb/adb.c
+@@ -41,6 +41,7 @@
+ #include <sys/prctl.h>
+ #include <getopt.h>
+ #include <selinux/selinux.h>
++#include <grp.h>
+ #else
+ #include "usb_vendors.h"
+ #endif
+diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c
+index edd9591164..9ddb4643b5 100644
 --- a/fs_mgr/fs_mgr_fstab.c
 +++ b/fs_mgr/fs_mgr_fstab.c
 @@ -17,7 +17,7 @@
@@ -19,6 +35,8 @@ Upstream-Status: Inappropriate
  #include <sys/mount.h>
  
  #include "fs_mgr_priv.h"
+diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h
+index daf43ec944..d3270c69e7 100644
 --- a/include/cutils/sockets.h
 +++ b/include/cutils/sockets.h
 @@ -19,7 +19,7 @@
@@ -30,13 +48,3 @@ Upstream-Status: Inappropriate
  #include <stdbool.h>
  
  #ifdef HAVE_WINSOCK
---- a/adb/adb.c
-+++ b/adb/adb.c
-@@ -41,6 +41,7 @@
- #include <sys/prctl.h>
- #include <getopt.h>
- #include <selinux/selinux.h>
-+#include <grp.h>
- #else
- #include "usb_vendors.h"
- #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
similarity index 41%
rename from meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
index c52d935f57..4a19a5d65a 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
@@ -1,11 +1,20 @@
-Subject: drop useless includes of Android SELINUX extensions; avoids having to clone another module; this should be sent upstream
-Author: Sergio Schvezov <sergio.schvezov@canonical.com>
+From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00 2001
+From: Sergio Schvezov <sergio.schvezov@canonical.com>
+Date: Tue, 2 Oct 2018 16:36:54 +0000
+Subject: [PATCH] ext4_utils: remove selinux extensions
+
+* drop useless includes of Android SELINUX extensions
+* avoids having to clone another module
+* this should be sent upstream
 
 Upstream-Status: Inappropriate
 ---
- ext4_utils/make_ext4fs.c      |    1 -
- ext4_utils/make_ext4fs_main.c |    1 -
+ ext4_utils/make_ext4fs.c      | 1 -
+ ext4_utils/make_ext4fs_main.c | 1 -
+ 2 files changed, 2 deletions(-)
 
+diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
+index 2f89ae8a0..732afbed7 100644
 --- a/ext4_utils/make_ext4fs.c
 +++ b/ext4_utils/make_ext4fs.c
 @@ -62,7 +62,6 @@
@@ -16,6 +25,8 @@ Upstream-Status: Inappropriate
  
  #define O_BINARY 0
  
+diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
+index a6c5f6160..f8e7b9da9 100644
 --- a/ext4_utils/make_ext4fs_main.c
 +++ b/ext4_utils/make_ext4fs_main.c
 @@ -32,7 +32,6 @@
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
similarity index 82%
rename from meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
index 5c90397194..3b50ffbf36 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
@@ -1,24 +1,21 @@
-From aa669312a380611d280d126cb509fa282080707e Mon Sep 17 00:00:00 2001
+From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00 2001
 From: Markus Mayer <mmayer@mmayer.net>
 Date: Wed, 7 Sep 2016 12:58:47 +0300
-Subject: [PATCH] android-tools: add recipe from AOSP tag android-5.1.1_r37
-
-Description: add -o argument to preserve ownership
+Subject: [PATCH] ext4_utils: add -o argument to preserve ownership
 
 See also https://android-review.googlesource.com/#/c/100312/
 
 Upstream-Status: Inappropriate
-
 ---
  ext4_utils/make_ext4fs.c      |  6 ++++++
  ext4_utils/make_ext4fs_main.c | 10 ++++++++--
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
-index 2f89ae8a..cc41d623 100644
+index 732afbed7..2cbf04399 100644
 --- a/ext4_utils/make_ext4fs.c
 +++ b/ext4_utils/make_ext4fs.c
-@@ -68,6 +68,8 @@
+@@ -67,6 +67,8 @@
  
  #endif
  
@@ -27,7 +24,7 @@ index 2f89ae8a..cc41d623 100644
  /* TODO: Not implemented:
     Allocating blocks in the same block group as the file inode
     Hash or binary tree directories
-@@ -186,6 +188,10 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+@@ -185,6 +187,10 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
  		} else {
  			dentries[i].mtime = fixed_time;
  		}
@@ -39,10 +36,10 @@ index 2f89ae8a..cc41d623 100644
  		if (fs_config_func != NULL) {
  #ifdef ANDROID
 diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
-index a6c5f616..7af0dddf 100644
+index f8e7b9da9..e82d43277 100644
 --- a/ext4_utils/make_ext4fs_main.c
 +++ b/ext4_utils/make_ext4fs_main.c
-@@ -48,13 +48,15 @@ struct selabel_handle;
+@@ -47,13 +47,15 @@ struct selabel_handle;
  extern struct fs_info info;
  
  
@@ -59,7 +56,7 @@ index a6c5f616..7af0dddf 100644
  	fprintf(stderr, "    <filename> [<directory>]\n");
  }
  
-@@ -80,7 +82,7 @@ int main(int argc, char **argv)
+@@ -79,7 +81,7 @@ int main(int argc, char **argv)
  	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
  #endif
  
@@ -68,7 +65,7 @@ index a6c5f616..7af0dddf 100644
  		switch (opt) {
  		case 'l':
  			info.len = parse_num(optarg);
-@@ -143,6 +145,10 @@ int main(int argc, char **argv)
+@@ -142,6 +144,10 @@ int main(int argc, char **argv)
  			}
  #endif
  			break;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/.gitignore b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
similarity index 100%
rename from meta-oe/recipes-devtools/android-tools/android-tools/.gitignore
rename to meta-oe/recipes-devtools/android-tools/android-tools/gitignore
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
similarity index 38%
rename from meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
index 7bfb98c44b..9de2593df8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
@@ -1,8 +1,17 @@
-Description: remove bionic specific calls
-Author: Fathi Boudra <fabo@debian.org>
+From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Tue, 2 Oct 2018 16:36:54 +0000
+Subject: [PATCH] Remove bionic specific calls
 
 Upstream-Status: Inappropriate
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
+ src/procattr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/procattr.c b/src/procattr.c
+index f350808..761cf8e 100644
 --- a/src/procattr.c
 +++ b/src/procattr.c
 @@ -8,7 +8,7 @@
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 1478c1205e..2604f65e1f 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -11,11 +11,6 @@ DEPENDS = "libbsd libpcre zlib libcap"
 DEPENDS_append_class-target = " openssl10"
 
 ANDROID_MIRROR = "android.googlesource.com"
-CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
-EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
-LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/hardware/libhardware"
-LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
-BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
 
 # matches with android-5.1.1_r37
 SRCREV_core = "2314b110bdebdbfd2d94c502282f9e57c849897e"
@@ -25,28 +20,28 @@ SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
 SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
 
 SRC_URI = " \
-    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
-    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
-    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
-    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
-    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build \
-    file://remove-selinux-android.patch;patchdir=system/core \
-    file://use-capability.patch;patchdir=system/core \
-    file://use-local-socket.patch;patchdir=system/core \
-    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;patchdir=system/core \
-    file://remove-bionic-android.patch;patchdir=system/core \
-    file://define-shell-command.patch;patchdir=system/core \
-    file://implicit-declaration-function-strlcat-strlcopy.patch;patchdir=system/core \
-    file://fix-big-endian-build.patch;patchdir=system/core \
-    file://0001-add-base64-implementation.patch;patchdir=system/core \
-    file://0002-adb-Musl-fixes.patch;patchdir=system/core \
-    file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
-    file://0001-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
-    file://remove-selinux-android-extras.patch;patchdir=system/extras \
-    file://preserve-ownership.patch;patchdir=system/extras \
-    file://remove-bionic-android-libselinux.patch;patchdir=external/libselinux \
+    git://${ANDROID_MIRROR}/platform/system/core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
+    git://${ANDROID_MIRROR}/platform/system/extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
+    git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
+    git://${ANDROID_MIRROR}/platform/external/libselinux;name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
+    git://${ANDROID_MIRROR}/platform/build;name=build;protocol=https;nobranch=1;destsuffix=git/build \
+    file://core/0001-adb-remove-selinux-extensions.patch;patchdir=system/core \
+    file://core/0002-adb-Use-local-sockets-where-appropriate.patch;patchdir=system/core \
+    file://core/0003-adb-define-shell-command.patch;patchdir=system/core \
+    file://core/0004-adb-Fix-build-on-big-endian-systems.patch;patchdir=system/core \
+    file://core/0005-adb-add-base64-implementation.patch;patchdir=system/core \
+    file://core/0006-adb-Musl-fixes.patch;patchdir=system/core \
+    file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
+    file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
+    file://core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;patchdir=system/core \
+    file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;patchdir=system/core \
+    file://core/0011-Remove-bionic-specific-calls.patch;patchdir=system/core \
+    file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch;patchdir=system/core \
+    file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
+    file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
+    file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
     file://android-tools-adbd.service \
-    file://.gitignore;subdir=git \
+    file://gitignore \
     file://adb.mk;subdir=${BPN} \
     file://adbd.mk;subdir=${BPN} \
     file://ext4_utils.mk;subdir=${BPN} \
@@ -54,6 +49,7 @@ SRC_URI = " \
     file://mkbootimg.mk;subdir=${BPN} \
 "
 
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/${BPN}"
 
@@ -76,6 +72,8 @@ TOOLS_class-native = "fastboot ext4_utils mkbootimg"
 TOOLS_class-nativesdk = "fastboot ext4_utils mkbootimg"
 
 do_compile() {
+    cp ${WORKDIR}/gitignore ${S}/.gitignore
+
     # Setting both variables below causing our makefiles to not work with
     # implicit make rules
     unset CFLAGS
-- 
2.17.1


