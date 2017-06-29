Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5360B77F79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:53:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d5so11562537pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h8Ne7VC8/umdS3jF9GfhnB9veV//wv/yJTbI0C1qqKg=;
	b=gr2f946toSgg6GwTdufROGrpaMlPZKh+LBipb56XNGyJR2Z9g/WDVZ8CVNMGfgh/FP
	qnbR4ULNEJj8W20c3FP7BWQysGpOZb1UazSksQGTyfdDqMgMF6Bqjj2/phP3bj28F0I5
	tq70OFisg87N7rsF8U1tzpulJUniY181TrNDbbCSct7lJV8jQHNKBkXM6xLDjnguFlr/
	xg5BXr6w/Zdcx4JsyfsxICVEDNQTC3DIZGOuae3YdkLZ8QQCWWH9cL+PiYhVkp8HBXCZ
	u2PEpN3J+o16u+Rn5XGhddL4slybONJMlJttIiY+G2C+2byNJDApzYtbXVjR2v1iPUax
	tSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h8Ne7VC8/umdS3jF9GfhnB9veV//wv/yJTbI0C1qqKg=;
	b=dTxEjOIs230vcKOAqB0aBuQu66w0yF73VkvWk1xLMvFB9u3FyBYphiO4XjLf2SM3hz
	FRPywNfeaaNxoNkH5w2Tcb6gfYzc/uw8pwdQ7hALPcqeWk0+Fl+MfEGJXc+BDKIC4OFm
	yFpZ0kLW6O3QdgpilYBvzoAE4S3+3dZcaVDbOf2HBdjbMhsNxANtmE5AydAKpaQHvVxY
	bGGlifuJQxUrY7zGT5HjHdqFtlME9mbyrWa6aOOCiZJRsYeyEnQij12SQbQNhwAFJJTV
	/5EY93p1SV9/JJEObc5bxVNyXwtXZ+D/ayiLMr4jfAuL/ZM6nbB19istMMvQ75kBnUA5
	UIAQ==
X-Gm-Message-State: AKS2vOzqQnvwMoOQ9mwr3rKXDWFJuwXaLdoAg+sfA/VtweI9Zzw26Uxc
	fybW8dWSRKAEiQTN
X-Received: by 10.84.135.1 with SMTP id 1mr16261016pli.185.1498711989054;
	Wed, 28 Jun 2017 21:53:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id 3sm8068423pfp.11.2017.06.28.21.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:53:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:52:54 -0700
Message-Id: <20170629045254.22351-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170629045254.22351-1-raj.khem@gmail.com>
References: <20170629045254.22351-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] hddtemp: Replace struct ucontext with ucontext_t
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
X-List-Received-Date: Thu, 29 Jun 2017 04:53:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Replace-struct-ucontext-with-ucontext_t.patch | 37 ++++++++++++++++++++++
 .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch
new file mode 100644
index 000000000..cfffa2ed0
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch
@@ -0,0 +1,37 @@
+From d195f8cfe41991573128ccdcd3a0ed0267aa5e33 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 19:44:46 -0700
+Subject: [PATCH] backtrace: Replace struct ucontext with ucontext_t
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/backtrace.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/backtrace.c b/src/backtrace.c
+index 69bee99..dc35f8f 100644
+--- a/src/backtrace.c
++++ b/src/backtrace.c
+@@ -42,7 +42,7 @@
+ #define MAX_BTSIZE 64
+ 
+ void backtrace_handler(int n, siginfo_t *ist, void *extra) {
+-  static struct ucontext *puc;
++  static ucontext_t *puc;
+   static void *btinfo[MAX_BTSIZE];
+   static char **messages = NULL;
+   static size_t btsize = 0;
+@@ -58,7 +58,7 @@ void backtrace_handler(int n, siginfo_t *ist, void *extra) {
+ 
+ #define SIC_CASE(c) case c: strerr = #c
+ 
+-  puc = (struct ucontext *)extra;
++  puc = (ucontext_t *)extra;
+   switch(n) {
+   case SIGSEGV:
+     switch(ist->si_code) {
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 601b7b115..4a871bf4f 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-no-nls-support.patch \
            file://hddtemp_0.3-beta15-52.diff \
            file://hddtemp-0.3-beta15-autodetect-717479.patch \
+           file://0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch \
            file://hddtemp.db \
            file://init \
 "
-- 
2.13.2


