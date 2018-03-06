Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4476878A69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 05:12:49 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 93-v6so11247102plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 21:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aEsAzgla3C58RpjXFgLUZzZsXwrgm2l3jUzXv58YlJk=;
	b=UBh7NYndRFNQ18MzlGWTkqm1IBW/yTbp5RU4qb6VcZTaiFuzMgNYI2ThGjOnSejs8u
	Z3jIJEGWzHWYXYIGI2iY7qCJQCLZbbmcXDuN92EcLEyPCqiv/2J6C698L98vQqGRnrFc
	6TpOaWtQGdN2sII+cHyc07FC1dqDBhyxjQ9N0UhXSnHvcKCKul7+j+XX3dbnprYyYzq0
	9hXNV3tpNpVjJZhrTasOUQtDRS9tue2Y5wU5Pk+O8YmQms5mDfc0DSctx73q4J0tIFKZ
	8XGlaHBwXCzyM4GmOBOgU4WvAeXEprpqRUrnHC+khmgqifQVku/Jqv0HqrscsTlUQMpv
	3z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aEsAzgla3C58RpjXFgLUZzZsXwrgm2l3jUzXv58YlJk=;
	b=TG+llg6lotYequb/MNSarLzsVBNtQkbRr/LrEtqcD+BE7tw3RmipNpXpSOKiUIwGnF
	tNLQhS5FYH4sohFQmdsDHGmOQywOtitET6kzAPZP2UW0GtHX8LBU8OVF1XLLNd4gd2+K
	nkhji2qFnElI7tfWoF+G0dacWbwJKucl+L6Na1OID8RIH6iWNYybHgLEw/6GhKSkIfi5
	soAXz6zRifvi6kAZmutnnyccc9VIMPyRR1XdINY2b1mKoVajjyuY24Kz6UDD3EN/0CTT
	mPVKXKNm93ZI9VVaGNfqt/AY7BCgVPw4oZxjKKqZ8GD8KUfUOS1cJwSysFkbvLvfYeYw
	FEcw==
X-Gm-Message-State: APf1xPAOfa3cUOoE+5e5euMCvUBdXgNL/jBD3uKAVRNu4/QhcoaNjZ6P
	1a3r/fAIKATafVxscH0a61m4Vw==
X-Google-Smtp-Source: AG47ELvxhrUYhQ/6te8bGIQNQJ1j5Yjf1pgYZeYkXIDJSp5Gqso2x+jNYAhqWubeKWJKVcOQfykoUg==
X-Received: by 2002:a17:902:b7c1:: with SMTP id
	v1-v6mr15601401plz.315.1520313170915; 
	Mon, 05 Mar 2018 21:12:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p14sm22091153pgf.75.2018.03.05.21.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 21:12:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 21:12:41 -0800
Message-Id: <20180306051242.21648-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-oe][PATCH 1/2] umip: Fix build incompatibilities
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
X-List-Received-Date: Tue, 06 Mar 2018 05:12:50 -0000

musl exposes some build issues which require portable code.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...GCLD-with-SIGCHLD-and-include-sys-types.h.patch |  49 +++++++
 ...READ_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 143 +++++++++++++++++++++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |   2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
 create mode 100644 meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
new file mode 100644
index 000000000..8192056d1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
@@ -0,0 +1,49 @@
+From f567740cf64978ac9db014c786b6d0267b244f33 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 4 Mar 2018 22:30:30 -0800
+Subject: [PATCH 1/2] replace SIGCLD with SIGCHLD and include sys/types.h
+
+Fixes
+main.c:129:10: error: 'SIGCLD' undeclared (first use in this function); did you mean 'SIGCHLD'?
+   signal(SIGCLD, sig_child);
+          ^~~~~~
+          SIGCHLD
+
+main.c:125:2: warning: implicit declaration of function 'umask' [-Wimplicit-function-declaration]
+  umask(0);
+  ^~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/main.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index 3cf4072..cd34196 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -31,6 +31,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/wait.h>
+ #include <sys/param.h>
++#include <sys/types.h>
+ #include <pthread.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+@@ -126,9 +127,9 @@ static void daemon_start(int ignsigcld)
+ 
+ 	if (ignsigcld) {
+ #ifdef SIGTSTP
+-		signal(SIGCLD, sig_child);
++		signal(SIGCHLD, sig_child);
+ #else
+-		signal(SIGCLD, SIG_IGN);
++		signal(SIGCHLD, SIG_IGN);
+ #endif
+ 	}
+ }
+-- 
+2.16.2
+
diff --git a/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
new file mode 100644
index 000000000..90d12da14
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
@@ -0,0 +1,143 @@
+From 19b6cf8099e1974b5fc39086fc54103b0cbc2658 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 4 Mar 2018 23:01:25 -0800
+Subject: [PATCH 2/2] replace PTHREAD_MUTEX_FAST_NP with PTHREAD_MUTEX_NORMAL
+
+PTHREAD_MUTEX_FAST_NP is not available on non-posix systems
+e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/ha.c        | 2 +-
+ src/icmp6.c     | 2 +-
+ src/mh.c        | 2 +-
+ src/mn.c        | 2 +-
+ src/movement.c  | 2 +-
+ src/mpdisc_ha.c | 2 +-
+ src/mpdisc_mn.c | 2 +-
+ src/tqueue.c    | 2 +-
+ src/tunnelctl.c | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/ha.c b/src/ha.c
+index fbdcff0..b2f811e 100644
+--- a/src/ha.c
++++ b/src/ha.c
+@@ -1246,7 +1246,7 @@ int ha_init(void)
+ {
+ 	pthread_mutexattr_t mattrs;
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&bu_worker_mutex, &mattrs) ||
+ 	    pthread_cond_init(&cond, NULL))
+ 		return -1;
+diff --git a/src/icmp6.c b/src/icmp6.c
+index 3695135..6460634 100644
+--- a/src/icmp6.c
++++ b/src/icmp6.c
+@@ -243,7 +243,7 @@ int icmp6_init(void)
+ 		return -1;
+ 	/* create ICMP listener thread */
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&icmp6_sock.send_mutex, &mattrs) ||
+ 	    pthread_rwlock_init(&handler_lock, NULL) ||
+ 	    pthread_create(&icmp6_listener, NULL, icmp6_listen, NULL))
+diff --git a/src/mh.c b/src/mh.c
+index 60e345e..7928f4c 100644
+--- a/src/mh.c
++++ b/src/mh.c
+@@ -204,7 +204,7 @@ int mh_init(void)
+ 		return -1;
+ 
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&mh_sock.send_mutex, &mattrs) ||
+ 	    pthread_rwlock_init(&handler_lock, NULL) ||
+ 	    pthread_create(&mh_listener, NULL, mh_listen, NULL))
+diff --git a/src/mn.c b/src/mn.c
+index 092cfcb..8f7f448 100644
+--- a/src/mn.c
++++ b/src/mn.c
+@@ -1478,7 +1478,7 @@ static struct home_addr_info *hai_copy(struct home_addr_info *conf_hai)
+ 	if (hai != NULL) {
+ 		pthread_mutexattr_t mattrs;
+ 		pthread_mutexattr_init(&mattrs);
+-		pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++		pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 
+ 		memcpy(hai, conf_hai, sizeof(struct home_addr_info));
+ 
+diff --git a/src/movement.c b/src/movement.c
+index d985937..6400448 100644
+--- a/src/movement.c
++++ b/src/movement.c
+@@ -2013,7 +2013,7 @@ int md_init(void)
+ 	int val;
+ 
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&iface_lock, &mattrs))
+ 		return -1;
+ 
+diff --git a/src/mpdisc_ha.c b/src/mpdisc_ha.c
+index 40ba05f..fd7a90d 100644
+--- a/src/mpdisc_ha.c
++++ b/src/mpdisc_ha.c
+@@ -559,7 +559,7 @@ int mpd_ha_init(void)
+ {
+ 	pthread_mutexattr_t mattrs;
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&mpa_lock, &mattrs) ||
+ 	    pthread_rwlock_init(&prefix_lock, NULL) ||
+ 	    hash_init(&mpa_hash, DOUBLE_ADDR, MPA_BUCKETS) < 0)
+diff --git a/src/mpdisc_mn.c b/src/mpdisc_mn.c
+index 4873bd6..ada02bd 100644
+--- a/src/mpdisc_mn.c
++++ b/src/mpdisc_mn.c
+@@ -267,7 +267,7 @@ int mpd_mn_init(void)
+ {
+ 	pthread_mutexattr_t mattrs;
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&mps_lock, &mattrs))
+ 		return -1;
+ 	if (hash_init(&mps_hash, DOUBLE_ADDR, MPS_BUCKETS) < 0)
+diff --git a/src/tqueue.c b/src/tqueue.c
+index 2f7aa0b..9c185b8 100644
+--- a/src/tqueue.c
++++ b/src/tqueue.c
+@@ -65,7 +65,7 @@ int taskqueue_init(void)
+ {
+ 	pthread_mutexattr_t mattrs;
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&mutex, &mattrs) ||
+ 	    pthread_cond_init(&cond, NULL) ||
+ 	    pthread_create(&tq_runner, NULL, runner, NULL))
+diff --git a/src/tunnelctl.c b/src/tunnelctl.c
+index 23fc20b..813b8ec 100644
+--- a/src/tunnelctl.c
++++ b/src/tunnelctl.c
+@@ -433,7 +433,7 @@ int tunnelctl_init(void)
+ 		return -1;
+ 
+ 	pthread_mutexattr_init(&mattrs);
+-	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_FAST_NP);
++	pthread_mutexattr_settype(&mattrs, PTHREAD_MUTEX_NORMAL);
+ 	if (pthread_mutex_init(&tnl_lock, &mattrs))
+ 		return -1;
+ 
+-- 
+2.16.2
+
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 2129e379c..0c120bfd8 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/jlanza/umip \
            file://mip6d \
            file://mip6d.service \
            file://0001-Add-format-string-to-fprintf-call.patch \
+           file://0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch \
+           file://0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch \
            "
 SRCREV = "7d67209cd1bba2dd0e183a0fa07eeef07964dd14"
 
-- 
2.16.2


