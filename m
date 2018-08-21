Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABC474586
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:03:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id e13-v6so8030727pff.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0u+LYfnVV10qJYtvYvLHKM2plUKu7HFhvS4BOgQAMtQ=;
	b=lblQ0f7Wlcb0kIUzmD/wtxIeCgpK7d0PZBsVbez96ucoaHhQ0urmJvBLxeXTpmZrlw
	2J9Lz+jZ2JYFGB43Mv5+EhRkefcnBjYw6GXgMGr83/cR8rFIO4VPs38iuCThc8xrdC3u
	ejOfTaGSu03byDU0xg/QnlV2gTmkRq+YxQHS+PNM04L5OH6B3Y9K42BWkaXv3UYYy5et
	Q7rl1TZrrkyihUJMLsnEjFGP7D/J4xzckuwov2lCo0boXXvzwjPMeohSQJsKXwO4S+7D
	c0mzPziqQlZGGvkfiD5RTbLRSFZwBKDo7bOZ1v2Bomm8I57mjsluUYjF2cLy6L5AjHW4
	vP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0u+LYfnVV10qJYtvYvLHKM2plUKu7HFhvS4BOgQAMtQ=;
	b=LJxHrw4qIqDuis/pRIV1LZB39pXU4nQWXCIdEjHM+YZETRMDIb++clPlHhtkR1nojO
	dQS7PyorxnfADNMO8awUA4kxja6O1CBAARgrMD+GTC0BJiTlMZWmheGJWJyD6zLu00CD
	l97Iqr+F6EVsvHE2R3jr5/GsOIKmAnjoQ3Ti7TdKGVgXJf1UC0XPc+i1r5qGYbEPrOn0
	rymEJItbQTPoJJFlEjGBLDHtKwbuie/naHf038Qa5HycsXwAc8WD9GELuTih/VKk+yqy
	xW3IL06PkvD+IwbEt56bHcAUHbxjGly45dMWXaORkgGK94kE7Gm99EbEX92731z2hP0z
	RXMQ==
X-Gm-Message-State: AOUpUlExKVSmBo1TIXO0G6dyTaTCvLqbt+ro2Q4WkUd8ZwFYZUEtNOAz
	LNJkIkZ3JVoFUM3NOvq0Sx2n4npg
X-Google-Smtp-Source: AA+uWPzW/oyUGgQd8WHM6mbsK8QjLGvpafLw6lC6O5VqC5xrmOllBikPHP+Cof34QKe2jfaIKu3Kqw==
X-Received: by 2002:a63:9a42:: with SMTP id
	e2-v6mr19986457pgo.263.1534835007718; 
	Tue, 21 Aug 2018 00:03:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm21214669pfg.3.2018.08.21.00.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 00:03:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 00:03:16 -0700
Message-Id: <20180821070319.36295-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821070319.36295-1-raj.khem@gmail.com>
References: <20180821070319.36295-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] stress-ng: Fix build on musl
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
X-List-Received-Date: Tue, 21 Aug 2018 07:03:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-don-t-enable-TARGET_CLONES-for-musl.patch | 30 +++++++++++++++++++
 .../stress-ng/stress-ng_0.09.37.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
new file mode 100644
index 0000000000..cd9131df50
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
@@ -0,0 +1,30 @@
+From 59f5ff72768f228cd530bb18a5fc3e8c4772857a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Aug 2018 21:43:14 -0700
+Subject: [PATCH] stress-ng: don't enable TARGET_CLONES for musl
+
+musl does not support gnu ifuncs
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/27]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ stress-ng.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stress-ng.h b/stress-ng.h
+index b9359a4..f228808 100644
+--- a/stress-ng.h
++++ b/stress-ng.h
+@@ -1090,7 +1090,7 @@ extern void pr_fail_dbg__(const args_t *args, const char *msg);
+ #endif
+ 
+ /* GCC5.0+ target_clones attribute */
+-#if defined(__GNUC__) && NEED_GNUC(5,5,0) && STRESS_X86 && \
++#if defined(__GNUC__) && defined(__GLIBC__) && NEED_GNUC(5,5,0) && STRESS_X86 && \
+     !defined(__gnu_hurd__) && !defined(__FreeBSD_Kernel__)
+ #define TARGET_CLONES	__attribute__((target_clones("sse","sse2","ssse3", "sse4.1", "sse4a", "avx","avx2","default")))
+ #else
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
index 19ce641924..a6c327e38e 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
@@ -7,6 +7,7 @@ DEPENDS = "zlib libaio"
 
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch \
+           file://0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch \
            "
 SRC_URI_append_libc-musl = " \
     file://0001-Several-changes-to-fix-musl-build.patch \
-- 
2.18.0


