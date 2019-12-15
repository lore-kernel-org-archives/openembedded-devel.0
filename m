Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 889607D71A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 05:09:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id r67so1532578pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 21:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ruBLTwxuHk7kZsIF54tRBq0+TYUZdwCxdiCK6iwOeAE=;
	b=J5tpd6sH3e3W+HyxjcNm+S0oF36yRUfK/IiunJqzI9QbrnzCXKw/3Hfp+ynEzIWZ6j
	1QgscvQvAf1KW+4z5NhzXXRr0Iql1UUvGmG3+8QAGEDYtoryBKrMiSpsfjZWxjRGoDIw
	Syahum9lwQlGlaec0tJfyhbMYjHlJ2v+v98c4DqaFw4zjEV9S7crnCFL+05naBQwfqDd
	1BmxZmtebUqh006K3Ucv8gMSU9EqUKqp1neg3ao1zhSeGPkkXgbB9e8bdnMYj0gzzBZO
	I8fJyKCHhEOrvyqMsv8RfWpb6VnGYSG4rWXIJnUaeLxSDWL9bj5TyC4139c3oRKzYwmx
	8frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ruBLTwxuHk7kZsIF54tRBq0+TYUZdwCxdiCK6iwOeAE=;
	b=VUehaObZ5NabLlGTBSou+Ql+ymbobxDA6TaOgCA4hbEnhLFOef5i3x9U3YH5TNo2oA
	1RamyHFRI/DvMLsl6xldeB+A/rLkhqfWJ0yCeaK+Orehmr55KkPbLZhQK7gHyMeLMbNI
	uVu/M+UP1aoZVwwgOk0BamNemPF/vBDpkilTTt6qTx4bAt+CtOC/RlhL0EUj+SfFdgLQ
	rJM3/FkE217bhYw1qG0MUuvUcM91XETyPmnZeoqHwgl/D6YIcGfYglKnpRr2b8ywKP8x
	tpjakw6W7QXl/VVabgI7GPil25mzQyQC/8xlAjOHi2qfSgh2PAqcID9eU78/j9rpspgm
	15Rw==
X-Gm-Message-State: APjAAAWEdcgwtp7nVurCtko6kxOn4IwGILCouRr1xYLT20E1ym3H9vpT
	gwZiDbY/YFmMOBerdtq/m7HfLnDa6Q4=
X-Google-Smtp-Source: APXvYqx/qeN/Y87vAFknPp09m4ckCYR3JAA9PDeuiXhcqX5lJ9uXH0fOYAAcWybUB3BH1HMYhdvscw==
X-Received: by 2002:a17:902:442:: with SMTP id 60mr9334826ple.0.1576386587856; 
	Sat, 14 Dec 2019 21:09:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	c8sm16835575pfj.106.2019.12.14.21.09.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 21:09:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Dec 2019 21:09:35 -0800
Message-Id: <20191215050936.25027-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] rdma-core: Replace pthread_yield with sched_yield
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
X-List-Received-Date: Sun, 15 Dec 2019 05:09:47 -0000
Content-Transfer-Encoding: 8bit

Fixes

/usr/src/debug/rdma-core/26.1-r0/git/librdmacm/rsocket.c:3041: undefined reference to `pthread_yield'
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
 ...sched_yield-instead-of-pthread_yield.patch | 30 +++++++++++++++++++
 .../rdma-core/rdma-core_26.1.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
new file mode 100644
index 0000000000..80abd33139
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
@@ -0,0 +1,30 @@
+From 6ac9562d756d42592994aeaac7a5e7b2bbce5cab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Dec 2019 14:07:57 -0800
+Subject: [PATCH] librdmacm: Use sched_yield instead of pthread_yield
+
+glibc redirects pthread_yield to sched_yield additionally we get it
+working with musl on linux
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/635]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librdmacm/rsocket.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/librdmacm/rsocket.c b/librdmacm/rsocket.c
+index 89ae2139..7fc5b266 100644
+--- a/librdmacm/rsocket.c
++++ b/librdmacm/rsocket.c
+@@ -3038,7 +3038,7 @@ static int rs_poll_enter(void)
+ 	pthread_mutex_lock(&mut);
+ 	if (suspendpoll) {
+ 		pthread_mutex_unlock(&mut);
+-		pthread_yield();
++		sched_yield();
+ 		return -EBUSY;
+ 	}
+ 
+-- 
+2.24.1
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb b/meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb
index 1afe496c5a..87710bcf14 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_26.1.bb
@@ -8,6 +8,7 @@ RDEPENDS_${PN} = "bash perl"
 BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            file://0001-Remove-man-files-which-cant-be-built.patch \
+           file://0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch \
            "
 SRCREV = "9f820de9ca7d6e315be92bc830d354afad3e7960"
 S = "${WORKDIR}/git"
-- 
2.24.1


