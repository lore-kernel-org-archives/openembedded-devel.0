Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id CEA767459D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 04:17:53 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g2-v6so887176pgu.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 21:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xOip9iZoWLjMGQBTCYxPPHtbhqGLyBaqR88+EtIcSHA=;
	b=VOv9cM1AYmOGaVoFL/ByoUTWEb+jUiteap/1dQU/1OxTIdvBzkohcR615+qcLtkHoM
	w5ieCI30gyZkpN9hLRTn//HgxiGg22QfFtHy0bHof9Ya0PKI3N6nqWUY1h58gPQ83Irc
	pFEGVS0nmJdmZtrFeWl5zzI43gT8+QhMP5lkb/dGysKJhV7tmK/CAb5ZXxFqAuuS8IhH
	dcaJ9lCJkd6VKi6ZGpR5RcISMt6CvK/FogKfQ9+0JLc+diN55i5k8xRY4PcIhBzKnB/h
	IaHYS6mw3KZlo74AUhHMinYOMScG5iZvKZOfboLXLZYO2Yh95VkFQ1Df8RhAqLqY6V1J
	Wpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xOip9iZoWLjMGQBTCYxPPHtbhqGLyBaqR88+EtIcSHA=;
	b=DDDHo0Es0m8nqxNPAvIxx7O9CgXU5nEs5wyEB+rItpbv2oQ5h64rHLTqV6+cWQVgC5
	EVe5MVsYXpmiyw3rDLsaZPZXmRaotk3JGS8fSelhbYEGEMsLDJLMcezBRQIughBFroJT
	CwyoD7BGpEJxcJTT/0BDvyq6ljYAc8n75Fv6UNMq8yLoXt2E0/3G//uuLYXlAAO0arWO
	M+40xOmgcU9X/YCKByJjej0PyIhalmT5DehzGa7x5ee7drFwhcjTFZQUZcxQwB9kw4j/
	GkFB1TQ37Luz97MdZKCXrE3N6ZwQRKv8KEjdtDZD9IEHxc7DthShWQN/OaD3jesuu9Dl
	0qEg==
X-Gm-Message-State: ABuFfoiHioFj8gXzBzoeP+BmS/zr6VHxoo18mfIa2f88JQde7q05f4QX
	9KbPqDpMY82zkGKGXyB7gSp9QtuQ
X-Google-Smtp-Source: ACcGV62+1W0/aWv3055ULllIGeYl7kvAcKIg5ODCgBnFcrhf0wPh6pwqktwPyWbDoXUE2gxk/0cFcw==
X-Received: by 2002:a63:ad44:: with SMTP id
	y4-v6mr8201870pgo.138.1538021874551; 
	Wed, 26 Sep 2018 21:17:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	l85-v6sm1021774pfk.34.2018.09.26.21.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 21:17:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 21:17:43 -0700
Message-Id: <20180927041743.2769-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180927041743.2769-1-raj.khem@gmail.com>
References: <20180927041743.2769-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netperf: Fix build error on musl
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
X-List-Received-Date: Thu, 27 Sep 2018 04:17:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve-including-sched.h-out-og-function.patch | 50 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    | 10 ++--
 2 files changed, 56 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-netlib.c-Move-including-sched.h-out-og-function.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-netlib.c-Move-including-sched.h-out-og-function.patch b/meta-networking/recipes-support/netperf/files/0001-netlib.c-Move-including-sched.h-out-og-function.patch
new file mode 100644
index 0000000000..515737c8e5
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-netlib.c-Move-including-sched.h-out-og-function.patch
@@ -0,0 +1,50 @@
+From 51a092ebb36dcc6180ceb93a9777258e826d9990 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Sep 2018 18:11:10 -0700
+Subject: [PATCH] netlib.c: Move including sched.h out og function
+
+The shutdown_control() has this code where system headers are being
+included inside function body and this results in compile errors on musl
+especially when sched.h is included because sched.h defines a macro
+which defines a static function. This means it ends up being a static
+function inside another function and compiler calls it out
+
+In function 'bind_to_specific_processor':
+|
+/mnt/a/yoe/build/tmp/work/i586-yoe-linux-musl/netperf/2.7.0+git999-r0/recipe-sysroot/usr/include/sched.h:102:1:
+error: invalid storage class for function '__CPU_AND_S'
+|  __CPU_op_func_S(AND, &)
+|  ^~~~~~~~~~~~~~~
+
+Moving the definition out of function definition fixes the problem
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/netlib.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/netlib.c b/src/netlib.c
+index 9258424..60b032d 100644
+--- a/src/netlib.c
++++ b/src/netlib.c
+@@ -2262,6 +2262,10 @@ shutdown_control()
+ 
+ }
+ 
++#if HAVE_SCHED_SETAFFINITY
++#include <sched.h>
++#endif
++
+ /*
+   bind_to_specific_processor will bind the calling process to the
+   processor in "processor"  It has lots of ugly ifdefs to deal with
+@@ -2308,7 +2312,6 @@ bind_to_specific_processor(int processor_affinity, int use_cpu_map)
+      value will not tell you if you are bound vs unbound. */
+   bindprocessor(BINDPROCESS,getpid(),(cpu_t)mapped_affinity);
+ #elif HAVE_SCHED_SETAFFINITY
+-#include <sched.h>
+   /* in theory this should cover systems with more CPUs than bits in a
+      long, without having to specify __USE_GNU.  we "cheat" by taking
+      defines from /usr/include/bits/sched.h, which we ass-u-me is
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index f0e0f9cf1f..8921ea7460 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -8,10 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
 
 PV = "2.7.0+git${SRCPV}"
 
-SRC_URI="git://github.com/HewlettPackard/netperf.git \
-         file://cpu_set.patch \
-         file://vfork.patch \
-         file://init"
+SRC_URI = "git://github.com/HewlettPackard/netperf.git \
+           file://cpu_set.patch \
+           file://vfork.patch \
+           file://init \
+           file://0001-netlib.c-Move-including-sched.h-out-og-function.patch \
+           "
 
 SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
 
-- 
2.19.0


