Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9717E6B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:19:58 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id b20so7202009ljj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+8SZVcvv6VHvpM3N1gY2/MqBjILDZfFD3DXh3+bJmdM=;
	b=BVNSdcOXedgQ0Q2xSm1m56qkwUmw4SyfdWZOGTJS0vktjIpeGSTB0jCcGmRSvDoGwd
	uYwu6vpfxL51kt3l7lwDO0lAd75A678xcZ10gRKjcJA/9YJJK/knitN/M73w4EWzLl1E
	AV5/ncjpAzbzLe69k1Pbozfa14CIDGatT7HKrd0VlHortIytumVLmpz08DLXJd/dQqgb
	HZ4djl6udm+Z7d6rQfOh6L1S+ekIQptkOR6XUiKLip8IpsJAUFma+QlBpUEhJ/d/9fPz
	zkjosFSwMc3xQGWHg8nzoOjQWDIT+/I9FCfCzJ/kbYNnaQUuFDPR9fD1jcUsgdr+Aulx
	7oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+8SZVcvv6VHvpM3N1gY2/MqBjILDZfFD3DXh3+bJmdM=;
	b=RJgm7l3Ao7cGG5x32ogijv7P9YPdyCGWly3Q8EdVmOUTUa+HkR2vN+9UO+gB4XsQ6y
	pOU5ONgmoe/rHLaOjGUNj/NWooxIXWHqx192ETtJKVXNJcePgr8U8SJ+tceTotpKRQDM
	3fdskV9/wD2JrmvUVhR98gGz4anafCYpcPXk/zKXQy/qVyjgmnmIcg85o7M2Ln9ym3/M
	SH+0RRKNHnypY02nM+PQVqOZzmd+SzsVvrh4DxD7xzD0cx6encogi0NXchlgS0/9xlwy
	4X7b1R5DV4xwMsLkHCP+ycysHffg5ZiqF7guqS+x1lZ/ZRSOFEjjrgZyLuLdTdpmSHx2
	fb5w==
X-Gm-Message-State: APjAAAVPK7nWyVjxbB7RpdpOD2Kgmm68xo8+NkAPhxtTKE52AF7TDWx0
	4Xyy8+6PSemh9nlCgeGtlYECzeC+ZRE=
X-Google-Smtp-Source: APXvYqxHgk7x6NeUIvArZ2oIkj8gFq+p3XMLo1K51aUAymlrgtxtHTpqxXNRkh76bSMb+pprsVRTSg==
X-Received: by 2002:a2e:9a83:: with SMTP id p3mr248639lji.136.1569446398523;
	Wed, 25 Sep 2019 14:19:58 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	g26sm1515153lje.80.2019.09.25.14.19.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:19:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:19:55 +0200
Message-Id: <20190925211955.16228-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] sanlock: update to 3.6.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:19:58 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1-fix-compile-failure-with-libc-musl.patch | 80 -------------------
 .../{sanlock_3.6.0.bb => sanlock_3.8.0.bb}    |  6 +-
 2 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.6.0.bb => sanlock_3.8.0.bb} (86%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
deleted file mode 100644
index e4bde80a0..000000000
--- a/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From c51c2c543f3c78b2a68acc61f786f903f2e0fec8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sun, 9 Sep 2018 07:28:09 -0400
-Subject: [PATCH] fix compile failure with libc musl
-
-The lack of random_r in musl:
-[snip]
-|main.c:1393:7: warning: implicit declaration of function 'random_r';
-did you mean 'random'? [-Wimplicit-function-declaration]
-|  rv = random_r(&rand_data, &val);
-|       ^~~~~~~~
-|       random
-|main.c:1408:30: error: invalid application of 'sizeof' to incomplete
-type 'struct random_data'
-|  memset(&rand_data, 0, sizeof(rand_data));
-[snip]
-
-s/random_r/random/, s/initstate_r/initstate/ and remove `static struct
-random_data rand_data'
-
-Here is the man of `random_r()':
-[snip]
-The random_r() function is like random(3), except that instead of using
-state information maintained in a global variable
-[snip]
-
-So use random without state information is OK.
-
-Upstream-Status: Submitted [sanlock-devel@lists.fedorahosted.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/main.c | 12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index f60b4d3..602c400 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -84,7 +84,6 @@ static char command[COMMAND_MAX];
- static int cmd_argc;
- static char **cmd_argv;
- static struct thread_pool pool;
--static struct random_data rand_data;
- static char rand_state[32];
- static pthread_mutex_t rand_mutex = PTHREAD_MUTEX_INITIALIZER;
- static const char *run_dir = NULL;
-@@ -1386,16 +1385,15 @@ int get_rand(int a, int b);
- 
- int get_rand(int a, int b)
- {
--	int32_t val;
--	int rv;
-+	long int rv;
- 
- 	pthread_mutex_lock(&rand_mutex);
--	rv = random_r(&rand_data, &val);
-+	rv = random();
- 	pthread_mutex_unlock(&rand_mutex);
- 	if (rv < 0)
- 		return rv;
- 
--	return a + (int) (((float)(b - a + 1)) * val / (RAND_MAX+1.0));
-+	return a + (int) (((float)(b - a + 1)) * rv / (RAND_MAX+1.0));
- }
- 
- static void setup_host_name(void)
-@@ -1405,9 +1403,7 @@ static void setup_host_name(void)
- 	uuid_t uu;
- 
- 	memset(rand_state, 0, sizeof(rand_state));
--	memset(&rand_data, 0, sizeof(rand_data));
--
--	initstate_r(time(NULL), rand_state, sizeof(rand_state), &rand_data);
-+	initstate(time(NULL), rand_state, sizeof(rand_state));
- 
- 	/* use host name from command line */
- 
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
similarity index 86%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index c51bccce3..9f7ce9c57 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -11,10 +11,8 @@ SECTION = "utils"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
-SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
-           file://0001-fix-compile-failure-with-libc-musl.patch \
-          "
-SRCREV = "90b2ffa77edd46bea007b7bb39bfd4d2db2ff7af"
+SRC_URI = "git://pagure.io/sanlock.git;protocol=http"
+SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
 S = "${WORKDIR}/git"
 
 DEPENDS = "libaio util-linux"
-- 
2.17.1


