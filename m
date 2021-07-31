Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.5506.1627749446150745401
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 09:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oYWtFhnM;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so11527335pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wmv/dhqC8mn5XlH/zkyQTcb8iTfsA2ksGtaiworWhgI=;
        b=oYWtFhnMWhzyI0LkxY6Ym097lLQG42BUYbR20UydIykioQrtND/jk35BH8kS+h7Zhf
         q6v5uC7Fo6FeR7S9886Q1Js/91uM4TS+y2hqyif3y61I6efaQGSZ/x9unKKKoUC94Ym2
         IIlRRAkyja6RgANngglve6ChSKdhb0gsKhJgz6vPNaI/Tr9rATv7Y3QMRtwT+a+7GzXA
         sd5lULhDZb3DlyLywn9eUBov19Stvk6sO5rUEMHjVTChXKfhkGZLUm+uRFG/4IRp+G0y
         karknvvPPJI/eMDmZrwZbIZKx8eiQoS9f/uEofKRpKjrLMZXd9OQ5b92JuxBViIXGilc
         TKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wmv/dhqC8mn5XlH/zkyQTcb8iTfsA2ksGtaiworWhgI=;
        b=L7XN8HPhXAnpW8vAFrLIqzBAIzmE8P65jCmlTPyqcjvsoiClU5LjNmHVGLRDKKJA7o
         5bnq40FnrbPtituuHjLcuzNFrljhQc7RQpa8JzEl0uAaozQwAtZm6XCkh2HYRJQsRfGF
         Tp/Xlg91j7jcBMO4IiNEazfW5zXL41hR7jkg1s+Ob1EfuOM93sXMqTk3xzUeIKAfn1Vf
         8x5piQjTDwQuZwMhmMVqliLivEjiyXQQvU2fspgwHr+pdahO5D6I3rDt/6xwo2atVi1m
         ZD3D+W8UBG+2HH7OOTzWDGljHkxxpttSnhk+GkiLx+WP9wKB1nnYkBCKA9rg2Ef9JQBL
         wtSg==
X-Gm-Message-State: AOAM531EgCWvwMgcOjekEWF4ild3ejTSXjdIw39xXj9QTvwH9QAGlqCC
	Fua8Y38ZmN9/jEZALp741dZmcIX0nYALSg==
X-Google-Smtp-Source: ABdhPJzxHHvdX4BbpjBfl0sNd7shxenTaYcy+vSCOCVvFJZENq+rUL8vZ7kfZnucfH7OQ3v2K1+a2w==
X-Received: by 2002:a05:6a00:178f:b029:32b:2092:c3f5 with SMTP id s15-20020a056a00178fb029032b2092c3f5mr8171042pfg.57.1627749445183;
        Sat, 31 Jul 2021 09:37:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id n23sm6859427pgv.76.2021.07.31.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 09:37:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] autofs: Fix build with glibc 2.34+
Date: Sat, 31 Jul 2021 09:37:17 -0700
Message-Id: <20210731163717.3575103-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Define-__SWORD_TYPE-if-undefined.patch |  19 +--
 ...7-use-default-stack-size-for-threads.patch | 110 ++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.1.7.bb    |   1 +
 3 files changed, 116 insertions(+), 14 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
index 117b1e58a9..f16ae5277e 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-if-undefined.patch
@@ -13,8 +13,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  lib/log.c          |  6 +++++-
  3 files changed, 24 insertions(+), 7 deletions(-)

-diff --git a/daemon/automount.c b/daemon/automount.c
-index e476f6b..3a1514b 100644
 --- a/daemon/automount.c
 +++ b/daemon/automount.c
 @@ -1,7 +1,7 @@
@@ -50,7 +48,7 @@ index e476f6b..3a1514b 100644
  #include "automount.h"
  #if defined(LIBXML2_WORKAROUND) || defined(TIRPC_WORKAROUND)
  #include <dlfcn.h>
-@@ -282,7 +290,7 @@ int rmdir_path(struct autofs_point *ap, const char *path, dev_t dev)
+@@ -282,7 +290,7 @@ int rmdir_path(struct autofs_point *ap,
  			     dev, buf, st.st_dev);
  			return -1;
  		}
@@ -59,7 +57,7 @@ index e476f6b..3a1514b 100644
  		/*
  		 * Last element of path may be a symbolic link; all others
  		 * are directories (and the last directory element is
-@@ -455,7 +463,7 @@ int count_mounts(struct autofs_point *ap, const char *path, dev_t dev)
+@@ -455,7 +463,7 @@ int count_mounts(struct autofs_point *ap

  	counter.count = 0;
  	counter.dev = dev;
@@ -68,7 +66,7 @@ index e476f6b..3a1514b 100644
  	if (walk_tree(path, counter_fn, 1, ap, &counter) == -1)
  		return -1;

-@@ -811,7 +819,7 @@ static char *automount_path_to_fifo(unsigned logopt, const char *path)
+@@ -811,7 +819,7 @@ static char *automount_path_to_fifo(unsi
  	/*
  	 *  An automount path can be made up of subdirectories.  So, to
  	 *  create the fifo name, we will just replace instances of '/' with
@@ -77,7 +75,7 @@ index e476f6b..3a1514b 100644
  	 */
  	p = fifo_name + strlen(fifodir);
  	while (*p != '\0') {
-@@ -1640,7 +1648,7 @@ static void return_start_status(void *arg)
+@@ -1640,7 +1648,7 @@ static void return_start_status(void *ar
  	sc->done = 1;

  	/*
@@ -86,8 +84,6 @@ index e476f6b..3a1514b 100644
  	 * the startup process.
  	 */
  	status = pthread_cond_signal(&sc->cond);
-diff --git a/include/hash.h b/include/hash.h
-index 2447f29..6f0dee6 100644
 --- a/include/hash.h
 +++ b/include/hash.h
 @@ -5,6 +5,11 @@
@@ -102,11 +98,9 @@ index 2447f29..6f0dee6 100644

  /*
   * The "GOLDEN_RATIO_PRIME" is used in ifs/btrfs/brtfs_inode.h and
-diff --git a/lib/log.c b/lib/log.c
-index 0cb47d7..39b1e3b 100644
 --- a/lib/log.c
 +++ b/lib/log.c
-@@ -38,7 +38,11 @@ static char *prepare_attempt_prefix(const char *msg)
+@@ -38,7 +38,11 @@ static char *prepare_attempt_prefix(cons
  	char buffer[ATTEMPT_ID_SIZE + 1];
  	char *prefixed_msg = NULL;

@@ -119,6 +113,3 @@ index 0cb47d7..39b1e3b 100644
  	if (attempt_id) {
  		int len = sizeof(buffer) + 1 + strlen(msg) + 1;

---
-2.32.0
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch
new file mode 100644
index 0000000000..b21e7c03bf
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch
@@ -0,0 +1,110 @@
+autofs-5.1.7 - use default stack size for threads
+
+From: Ian Kent <raven@themaw.net>
+
+autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
+creates.
+
+In two cases it is used to reduce the stack size for long running
+service threads while it's used to allocate a larger stack for worker
+threads that can have larger memory requirements.
+
+In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
+which can lead to unexpectedly different stack sizes on different
+architectures and the autofs assumption it's a constant causes a
+compile failure.
+
+The need to alter the stack size was due to observed stack overflow
+which was thought to be due the thread stack being too small for autofs
+and glibc alloca(3) usage.
+
+Quite a bit of that alloca(3) usage has been eliminated from autofs now,
+particularly those that might be allocating largish amounts of storage,
+and there has been a lot of change in glibc too so using the thread
+default stack should be ok.
+
+Signed-off-by: Ian Kent <raven@themaw.net>
+---
+ CHANGELOG          |    1 +
+ daemon/automount.c |   29 -----------------------------
+ daemon/state.c     |    6 +-----
+ lib/alarm.c        |    6 +-----
+ 4 files changed, 3 insertions(+), 39 deletions(-)
+
+--- a/daemon/automount.c
++++ b/daemon/automount.c
+@@ -92,7 +92,6 @@ static size_t kpkt_len;
+ /* Attributes for creating detached and joinable threads */
+ pthread_attr_t th_attr;
+ pthread_attr_t th_attr_detached;
+-size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
+
+ struct master_readmap_cond mrc = {
+ 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
+@@ -2617,34 +2616,6 @@ int main(int argc, char *argv[])
+ 		if (start_pipefd[1] != -1) {
+ 			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
+ 			close(start_pipefd[1]);
+-		}
+-		release_flag_file();
+-		macro_free_global_table();
+-		exit(1);
+-	}
+-
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-	if (pthread_attr_setstacksize(
+-			&th_attr_detached, detached_thread_stack_size)) {
+-		logerr("%s: failed to set stack size thread attribute!",
+-		       program);
+-		if (start_pipefd[1] != -1) {
+-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
+-			close(start_pipefd[1]);
+-		}
+-		release_flag_file();
+-		macro_free_global_table();
+-		exit(1);
+-	}
+-#endif
+-
+-	if (pthread_attr_getstacksize(
+-			&th_attr_detached, &detached_thread_stack_size)) {
+-		logerr("%s: failed to get detached thread stack size!",
+-		       program);
+-		if (start_pipefd[1] != -1) {
+-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
+-			close(start_pipefd[1]);
+ 		}
+ 		release_flag_file();
+ 		macro_free_global_table();
+--- a/daemon/state.c
++++ b/daemon/state.c
+@@ -1173,12 +1173,8 @@ int st_start_handler(void)
+ 	status = pthread_attr_init(pattrs);
+ 	if (status)
+ 		pattrs = NULL;
+-	else {
++	else
+ 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
+-#endif
+-	}
+
+ 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
+
+--- a/lib/alarm.c
++++ b/lib/alarm.c
+@@ -270,12 +270,8 @@ int alarm_start_handler(void)
+ 	status = pthread_attr_init(pattrs);
+ 	if (status)
+ 		pattrs = NULL;
+-	else {
++	else
+ 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
+-#endif
+-	}
+
+ 	status = pthread_condattr_init(&condattrs);
+ 	if (status)
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
index 019b453c2c..fd49e53bbd 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
@@ -26,6 +26,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
            file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
            file://0001-Define-__SWORD_TYPE-if-undefined.patch \
+           file://autofs-5.1.7-use-default-stack-size-for-threads.patch \
            "
 SRC_URI[sha256sum] = "a18619e5ad18960fe382354eef33f070e57e4e5711d484b010acde080a003312"

--
2.32.0
