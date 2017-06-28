Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC7B78088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:52 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id s66so25386749pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Udc/iIuAOncRBVm+++CftmRd96Epp+rpwGlVUQDwv0w=;
	b=X64/aIQD9ILnB9rd42bsIQvYVG1ngScvNIDjUgTSiAM7qdk4RYsRsEWa6LcUhSeIAy
	A4VQqX60fQUqFBXzaEEZPUUW14dgl/iproSapMy2XaR7hYWCig47BPiSGPE8uD/vYyd0
	2vGW29ecWDS6O/l1uWG3/2qaIwa7njmP5Oe7BlzpI2NycwNb290K+Yyo4BN4AnOMjEo/
	iS3ztDgD8785bcfCIGNMlkxrQOo9r9yz95fxhcR9inB3V25o5GGLUfBZlUTcd5MDwEUh
	k3Ebmf6qpLe1DxwxOy1+kcQMnzJDplomrC4KzcmeUAS/APoqsv/QY0yKr9fFnJFg63EB
	hADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Udc/iIuAOncRBVm+++CftmRd96Epp+rpwGlVUQDwv0w=;
	b=GgxNnlsULSppzxtZN9ExYU5NRoGoHbpvSObpg42ehroj/CGNhbNnRgbx7tX1Lsg08a
	gHPfuHlzzPPXFA7LOODnFBuuJ5X4W1XabKMxaJ9+dG76thDtbTBMl+W16MRHVJ+cGrC+
	X15PhSAuTPDNqIT85kx2Kat7C3cMqVePMo5x0vHq9ovMhpfizgiT+XHPwHYcSeK6ZVX2
	l3QeIl7BFaDivahGs61mHAmCdCh/F5wBP9aXc3t52YS0vwzgKunalOLAS67/RUUOAxY6
	URNLj08fqESCT5g8m1kbDUNw1rnV1cFUKgenRGPR8RG4Coa1CmNYI4e6XN+58w4zzK8H
	AOGw==
X-Gm-Message-State: AKS2vOzJkBr9jVR4ZCKxBHzENb5LymtZUr3eWSJyZgTVkZ2hB3kOdwjR
	3K+0vOExjsir0gxV
X-Received: by 10.98.78.88 with SMTP id c85mr8379897pfb.17.1498615734117;
	Tue, 27 Jun 2017 19:08:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:16 -0700
Message-Id: <20170628020819.17047-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/13] lmbench: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-lat_http.c-Add-printf-format.patch        | 26 ++++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
new file mode 100644
index 000000000..18ed43d06
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
@@ -0,0 +1,26 @@
+From 6faa6acdf20aa6f738eed1483b7dceed94286adb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 14:39:10 -0700
+Subject: [PATCH] lat_http.c: Add printf format
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lat_http.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lat_http.c b/src/lat_http.c
+index c630d59..28d04f7 100644
+--- a/src/lat_http.c
++++ b/src/lat_http.c
+@@ -27,7 +27,7 @@ http(char *server, char *file, int prog)
+ 	sock = tcp_connect(server, prog, SOCKOPT_REUSE);
+ 	sprintf(buf, "GET /%s HTTP/1.0\r\n\r\n\n", file);
+ 	if (debug) {
+-		printf(buf);
++		printf("%s", buf);
+ 	}
+ 	write(sock, buf, strlen(buf));
+ 	while ((n = read(sock, buf, XFERSIZE)) > 0) {
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 62906fd68..43ac1d038 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -19,7 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://lmbench_result_html_report.patch \
            file://fix-lmbench-memory-check-failure.patch \
            file://0001-avoid-gcc-optimize-away-the-loops.patch \
-"
+           file://0001-lat_http.c-Add-printf-format.patch \
+           "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
-- 
2.13.2


