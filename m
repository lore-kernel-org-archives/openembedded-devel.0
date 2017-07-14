Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21669780C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:31 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id t186so40550522pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3c4HluRjVYKvNp88+WNtyDcjGB6Kq22wCwgjVUzHxOI=;
	b=krc1PNGBwcyP1wLSV0AZEWTOj9ez0OE6LpMUGTKaWkr+bSYUQlH1RxwrRa79ZNkCi3
	I8Tjd/BOeDvxdfwZzwHQ+tKx0EWjnboOdg0BOAvgna/bM8HHUXW9gn4eU5uMmiB/ZW9x
	K2tMhnfprRiBUUvM12+M2VHacLiNOwb0oezh6luIX7VcAS2bxJuoOxH/esi9Zp3TqG/d
	RzHh1jndFOlpXVnLTJ1ItAnONIEGKKI67Fad8XWP5GsH8EbxzjRBBVcE7MoegApuvGec
	BU6Jbw9QUpNe9BosZIgH12sv1MaPCC5cZF7Zj7CZ7k27mvhUs55qXKtgMNRoMMcUg/lj
	6/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3c4HluRjVYKvNp88+WNtyDcjGB6Kq22wCwgjVUzHxOI=;
	b=SwHWLhIMvvSXRZCe5pZXeEmIsUAH/PkcM6ZTeFRPkuj5fqY6SMWEafyTPq2u3bN2CP
	ELaNrqptLug4XMmNJvAjnGIHqSvRzBo2D3Rsh2bU4xCdE8YYusnyImfAgWFsqcc267PV
	8xvaoft8K7rJZ1rNqwug28ide6AAurJqoV9GFzO3j5u85ocMcqTuUX/SSQPn+VMC8o8L
	bns+moyA7v7oVvNhySNZL03jqqtdDGtAfOdGHkmvbfxFHXu1dFngvvyYVzQvIfLLccTV
	fP6+dc4mkiEvx6bL/+/rXmLwMXw8wsB/dDjbYx3N4Ez9MG4WpeJCWMpoIaf9fjPPvVal
	hCew==
X-Gm-Message-State: AIVw1129Kzt111jt0Ug8lM+tMvwtMADm/MPmK8bp7i+LKlXwmutV7iAX
	GKbrnv/VZuh5tITv
X-Received: by 10.98.102.85 with SMTP id a82mr3466354pfc.82.1500010832980;
	Thu, 13 Jul 2017 22:40:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:01 -0700
Message-Id: <20170714054013.34458-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-efl][PATCH 06/18] lightmediascanner: Define comparison_fn_t if undefined
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-comparison_fn_t-for-non-glibc-systems.patch | 33 ++++++++++++++++++++++
 .../lightmediascanner/lightmediascanner_0.5.1.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch b/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
new file mode 100644
index 000000000..15d4b3f0e
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
@@ -0,0 +1,33 @@
+From 5bc5b8c5dad3edec6736fd7e7ce61250c4ce3725 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 17:13:19 -0700
+Subject: [PATCH] Define comparison_fn_t for non-glibc systems
+
+lightmediascanner.c:324:12: error: 'comparison_fn_t' undeclared (first use in this function)
+           (comparison_fn_t)_plugin_sort);
+            ^~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/lightmediascanner.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/lib/lightmediascanner.c b/src/lib/lightmediascanner.c
+index 344b247..b866883 100644
+--- a/src/lib/lightmediascanner.c
++++ b/src/lib/lightmediascanner.c
+@@ -37,6 +37,11 @@
+ #define DEFAULT_SLAVE_TIMEOUT 1000
+ #define DEFAULT_COMMIT_INTERVAL 100
+ 
++#if !defined(__GLIBC__)
++typedef int (*__compar_fn_t) (const void*, const void*);
++typedef __compar_fn_t comparison_fn_t;
++#endif
++
+ #ifdef HAVE_MAGIC_H
+ static magic_t _magic_handle;
+ 
+-- 
+2.13.2
+
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
index d8c6dbb73..f2158760f 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
@@ -12,6 +12,7 @@ PV = "0.5.1+git${SRCPV}"
 SRCREV = "adfddb3486276a5ed2f5008c9e43a811e1271cc9"
 SRC_URI = "git://github.com/profusion/lightmediascanner.git \
            file://id3-plugin-support-out-of-tree-build.patch \
+           file://0001-Define-comparison_fn_t-for-non-glibc-systems.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.13.2


