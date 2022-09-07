Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BEAC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.2769.1662594069926655663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8jGItwQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 65so5925712pfx.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5/QQNPqc6nPXVeAa1S95H1tXh4OVxnwOAZ6/j7gilOw=;
        b=m8jGItwQW1nlAZL6JeiQdJJUL38jkt3iry6aF4INNc7vL0FzrzoqXE/h34RXGSzUMO
         LUq0ZMoRyiaoa59Ol3ujmdWblgQYxZymTyAXmi1uVpZ82FuLhRD5gj43r7S+8jfc1w0d
         Zqq7eX0Ot+YBFyWNZJ+eaMvXjJAYO8b5odwZUtLnAJYE5M1fuDo/pywAvP7tdDaOBctX
         O7Q0vJt+N6FFbERjJNvViUJHCV7nCFude2dBmqxO3b/lZDftIwAHE4sLAwq4J2HGnrIO
         vUz9PZs5KH5hr6KX6WfZ0Ln2NzqDqw3oE8wgA+NBROXL9DVT5TgD0BTX7B4lWnlMFZon
         oS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5/QQNPqc6nPXVeAa1S95H1tXh4OVxnwOAZ6/j7gilOw=;
        b=mquHFGdDeS26LD4QHeAXAdQQmXYOjCIk/+xqpBF6mW9CfgXA06+Y6i9awweUpLK5+u
         uWao57Gdz/OqabmPZDkpbBMSa2HBH/zTH75504CNZRpKSXNzxUy7W/xKUkvbSaAxLM4o
         iU4UPKo+erWk4PmLMz7tfAj/VSmYrffcQtjmV3u8RGA+xiuY47mecWFz/YaxacNFZY1n
         0EuilbxHKsJ772LObZe8/S+aXHLu5Srjd4djlWEAnNUxQJ1lLvlxyCPDjMgafciMGVdr
         CmCP+iO6UpvbSh+c+E3JqGLSvYUvC7J2qmg43NTlUVyFvFO85CR956N+KiFI0YNJd76R
         5iBw==
X-Gm-Message-State: ACgBeo2mtIQjJO2rZ0DjwZ0K8Yz+pQDOQu8gz43nktfaY7gtHbyn1Ga7
	oztcg+sKJ1BpFf06Tarn2Oiz3i5g5+uF3Q==
X-Google-Smtp-Source: 
 AA6agR4ssZIh0QhZmsfOoiBEws8dB2pvMqtXyO4GDA14hiqJk/FTmo9uPtJUsWEtZZ0WYRIZcqvLtw==
X-Received: by 2002:a05:6a00:21c8:b0:52e:3404:eba5 with SMTP id
 t8-20020a056a0021c800b0052e3404eba5mr6273240pfj.67.1662594075042;
        Wed, 07 Sep 2022 16:41:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/22] lmbench: Fix build time tests and use the
 scripts/build
Date: Wed,  7 Sep 2022 16:40:53 -0700
Message-Id: <20220907234102.3312797-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98703

scripts/build does some configure like work before handing of
compilation to make, and these tests are essential for OE builds too
e.g. socklen_t differs between musl and glibc and this script can detect
that well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-guard-before-redefining-sockle.patch |  27 --
 ...-Fix-the-tests-to-build-with-clang15.patch | 239 ++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |  10 +-
 3 files changed, 245 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
deleted file mode 100644
index d7169495fa..0000000000
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ac1657e11cbb0545bdf4d1124def8c013958ed7e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jul 2017 18:08:51 -0700
-Subject: [PATCH] Check for musl define guard before redefining socklen_t
-
-musl uses __DEFINED_socklen_t so check for that as well
-along with HAVE_socklen_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/bench.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bench.h b/src/bench.h
-index 597d068..2ebdf5a 100644
---- a/src/bench.h
-+++ b/src/bench.h
-@@ -77,7 +77,7 @@ typedef long long int64;
- #endif /* HAVE_int64_t */
- #endif /* HAVE_int64 */
- 
--#ifndef HAVE_socklen_t
-+#if !defined(HAVE_socklen_t) && !defined(__DEFINED_socklen_t)
- typedef int socklen_t;
- #endif
- 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch
new file mode 100644
index 0000000000..f07cef6b38
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch
@@ -0,0 +1,239 @@
+From bcc6816b92ecf409357865589069a82883d589f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 22:53:51 -0700
+Subject: [PATCH] scripts/build: Fix the tests to build with clang15
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/build | 50 +++++++++++++++++++++++++-------------------------
+ 1 file changed, 25 insertions(+), 25 deletions(-)
+
+--- a/scripts/build
++++ b/scripts/build
+@@ -21,7 +21,7 @@ trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BA
+ LDLIBS="$LDLIBS -lm"
+ 
+ # check for HP-UX's ANSI compiler
+-echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
++echo "int main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL}
+ then
+ 	true;
+@@ -39,7 +39,7 @@ arch=`echo $OS | awk -F- '{print $1;}'`
+ if [ "X$CC" = "Xcc" -a "X$arch" = "Xia64" ]
+ then
+ 	echo "#include <stdlib.h>" > ${BASE}$$.c
+-	echo "main(int ac, char *av[])" >> ${BASE}$$.c
++	echo "int main(int ac, char *av[])" >> ${BASE}$$.c
+ 	echo "{ long* p = (long*)malloc(sizeof(long));" >> ${BASE}$$.c
+ 	echo "*p = 0; exit((int)*p); }" >> ${BASE}$$.c
+ 	${CC} ${CFLAGS} +DD64 -o ${BASE}$$ ${BASE}$$.c 1>${NULL} 2>${NULL} \
+@@ -51,14 +51,14 @@ fi
+ 
+ # check for bcopy (optionally set the SYS5 flag)
+ echo "#include <string.h>" > ${BASE}$$.c
+-echo "main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
++echo "int main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	|| CFLAGS="${CFLAGS} -DSYS5"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check for valloc
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+-echo "main() { char* buf = valloc(123); }" >> ${BASE}$$.c
++echo "int main() { char* buf = valloc(123); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	|| CFLAGS="${CFLAGS} -Dvalloc=malloc"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -67,7 +67,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+-echo "main() { off64_t off; }" >> ${BASE}$$.c
++echo "int main() { off64_t off; }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_off64_t"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -76,7 +76,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+-echo "main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
++echo "int main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_lseek64"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -88,7 +88,7 @@ echo "#include <sys/resource.h>" >> ${BA
+ echo "#ifndef RUSAGE_SELF" >> ${BASE}$$.c
+ echo "#define RUSAGE_SELF 0" >> ${BASE}$$.c
+ echo "#endif /* RUSAGE_SELF */" >> ${BASE}$$.c
+-echo "main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
++echo "int main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DRUSAGE"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -125,24 +125,24 @@ fi
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check for -lrpc (cygwin/Windows)
+-echo "extern int pmap_set(); main() { pmap_set(); }" >${BASE}$$.c
++echo "extern int pmap_set(void); int main() { pmap_set(); }" >${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+        true;
+-else
+-       ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} -lrpc 1>${NULL} 2>${NULL} \
+-               && LDLIBS="${LDLIBS} -lrpc"
++elif ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} -lrpc 1>${NULL} 2>${NULL}; then
++      LDLIBS="${LDLIBS} -lrpc"
++else ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} -ltirpc 1>${NULL} 2>${NULL} && LDLIBS="${LDLIBS} -ltirpc"
+ fi
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check for OSs that have S_IFFIFO instead of S_IFIFO
+ echo "#include <sys/stat.h>" > ${BASE}$$.c
+-echo "main() { return (S_IFIFO); }" >> ${BASE}$$.c
++echo "int main() { return (S_IFIFO); }" >> ${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	true;
+ else
+ 	rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 	echo "#include <sys/stat.h>" > ${BASE}$$.c
+-	echo "main() { return (S_IFFIFO); }" >> ${BASE}$$.c
++	echo "int main() { return (S_IFFIFO); }" >> ${BASE}$$.c
+ 	${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 		|| CFLAGS="${CFLAGS} -DS_IFIFO=S_IFFIFO"
+ fi
+@@ -151,7 +151,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ # check that we have uint
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+-echo "main() { uint i = 0; return (i); }" >> ${BASE}$$.c
++echo "int main() { uint i = 0; return (i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -161,7 +161,7 @@ HAVE_uint64=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <rpc/types.h>" >> ${BASE}$$.c
+-echo "main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
++echo "int main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint64=1" && HAVE_uint64=1;
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -170,7 +170,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ if [ ${HAVE_uint64} = 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+     echo "#include <sys/types.h>" >> ${BASE}$$.c
+-    echo "main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
++    echo "int main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint64_t=1";
+     rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -181,7 +181,7 @@ HAVE_int64=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <rpc/types.h>" >> ${BASE}$$.c
+-echo "main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
++echo "int main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_int64=1" && HAVE_int64=1;
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -190,7 +190,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ if [ ${HAVE_int64} = 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+     echo "#include <sys/types.h>" >> ${BASE}$$.c
+-    echo "main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
++    echo "int main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_int64_t=1";
+     rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -209,7 +209,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/socket.h>" >> ${BASE}$$.c
+-echo "main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
++echo "int main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_socklen_t"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -217,7 +217,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ # check that we have drand48 and srand48
+ HAVE_RANDOM=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+-echo "main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
++echo "int main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_DRAND48"
+ 	HAVE_RANDOM=1
+@@ -226,7 +226,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ if [ ${HAVE_RANDOM} -eq 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+-    echo "main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
++    echo "int main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_RAND"
+ 	HAVE_RANDOM=1
+@@ -236,7 +236,7 @@ fi
+ 
+ if [ ${HAVE_RANDOM} -eq 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+-    echo "main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
++    echo "int main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_RANDOM"
+ 	HAVE_RANDOM=1
+@@ -247,7 +247,7 @@ fi
+ # check that we have sysmp
+ echo "#include <sys/types.h>" > ${BASE}$$.c
+ echo "#include <sys/sysmp.h>" >> ${BASE}$$.c
+-echo "main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
++echo "int main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_SYSMP=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -257,7 +257,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/processor.h>" >> ${BASE}$$.c
+-echo "main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
++echo "int main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -267,16 +267,17 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/processor.h>" >> ${BASE}$$.c
+ echo "#include <sys/procset.h>" >> ${BASE}$$.c
+-echo "main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
++echo "int main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check that we have sched_setaffinity
+-echo "#include <stdlib.h>" > ${BASE}$$.c
++echo "#define _GNU_SOURCE" > ${BASE}$$.c
++echo "#include <stdlib.h>" >> ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+ echo "#include <sched.h>" >> ${BASE}$$.c
+-echo "main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
++echo "int main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -285,4 +286,4 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR}; fi
+ 
+ # now go ahead and build everything!
+-${MAKE} OS="${OS}" CC="${CC}" CFLAGS="${CFLAGS}" LDLIBS="${LDLIBS}" O="${BINDIR}" $*
++${MAKE} OS="${OS}" CC="${CC}" CFLAGS="${CFLAGS}" LDLIBS="${LDLIBS}" O="${BINDIR}" ${EXTRA_OEMAKE} $*
+--- a/src/lib_sched.c
++++ b/src/lib_sched.c
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ #include "bench.h"
+ 
+ /* #define _DEBUG */
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 492ea4b10b..d74c28f3f6 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -9,7 +9,6 @@ inherit autotools-brokensep update-alternatives
 
 DEPENDS += "libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LDLIBS += " -ltirpc "
 
 PR = "r2"
 
@@ -23,7 +22,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://fix-lmbench-memory-check-failure.patch \
            file://0001-avoid-gcc-optimize-away-the-loops.patch \
            file://0001-lat_http.c-Add-printf-format.patch \
-           file://0001-Check-for-musl-define-guard-before-redefining-sockle.patch \
            file://0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch \
            file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
            file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
@@ -31,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-lat_fifo-Fix-cleanup-sequence.patch \
            file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
            file://0001-bench.h-Fix-typo-in-specifying-string.h.patch \
+           file://0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
@@ -38,8 +37,11 @@ SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lmbench/files/development/"
 UPSTREAM_CHECK_REGEX = "lmbench-(?P<pver>\d+(\.\d+)+-[a-z]+\d+)"
 
+export OS = "${TARGET_SYS}"
+export TARGET = "${TARGET_OS}"
+
 EXTRA_OEMAKE = 'CC="${CC}" AR="${AR}" RANLIB="${RANLIB}" CFLAGS="${CFLAGS}" \
-                LDFLAGS="${LDFLAGS}" LDLIBS="${LDLIBS}" LD="${LD}" OS="${TARGET_SYS}" \
+                LDFLAGS="${LDFLAGS}" LD="${LD}" OS="${TARGET_SYS}" \
                 TARGET="${TARGET_OS}" BASE="${prefix}" MANDIR="${mandir}"'
 
 do_configure() {
@@ -54,7 +56,7 @@ do_compile () {
         CFLAGS="${CFLAGS} -DHAVE_uint"
     fi
     install -d ${S}/bin/${TARGET_SYS}
-    oe_runmake -C src
+    ${S}/scripts/build
 }
 
 do_install () {
-- 
2.37.3


