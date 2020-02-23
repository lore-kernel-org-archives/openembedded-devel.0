Return-Path: <leo.yan@linaro.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id EA0CD61602
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:55:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z12so3141949wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 04:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kJVXsuLSefA/CAmy1cBFJUUMWLwiNpst74Q2yRvjOug=;
	b=GBmF4Ft/tM4FwEP7p2nz815RCXGr9TYrzDXvSXWvIjj9PatgkcEDcFy496gTy4Ycl7
	eqkdcgBCFWJ3IEUDaRJUmZswkoGe21x7ccShbPmnOi9vKHvrjnBSN0feS0usN9zc9+QN
	iVXpxWw/LT/zy3y+btkFblo9/RKZYkFpm7Df4fyQl2OVC0RJ3Ej3BuVmGoaEIx+S4sDp
	EFAo0PhvcpmjZqrvvUx6LdyBm8nUA8bev/v1ppmxd6v9fTxVC8MqnhiLVbO6qTAKNWlo
	ZY255QHMTUbbAv2U2lKiH+ukk1+mdUrYdeaWMopj+pzxfHutRNMf9tKrNZQz04ItPGiW
	I02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kJVXsuLSefA/CAmy1cBFJUUMWLwiNpst74Q2yRvjOug=;
	b=rhN+XmeCJgJb6XY0eUfbZzrWDo5NUy5DMQvY/Y8zYvjKl94k4RLuxT3ZLxDWDkFU3L
	U1QYXO8xTC4CQoi9YyRFvkjpDZn/0XzqQfDmhkIEL91nY9L4YpjcO7qXjtXgYc9kw0l8
	1aKMJtXvF1rN5/Adsncf3qA8yqzHsj+MLpSmM7N0Gdo2Z4Njx9vhqF3j9M9H3wgTn/uA
	6tIna7KeTV4cm1K3I2/mAZnoGIyYruRy5O1ZJrNc0Gd2tzuS3PH4zu0ajAptisi1KMap
	PgbvWVEBoOIMDlKu6v+cQijvZINqsgGN9aXx2nBh5mlh3ttXKkdP/elPW0iIjXaVHOnU
	Wxrg==
X-Gm-Message-State: APjAAAVpJUsI6dNExadTS5iUhdpJNiuMy8agDYVu7YlPpbDxeLN08A4E
	hr9a2XW/Rvg1hce31lgzcLZ+Rn60yqWU3A==
X-Google-Smtp-Source: APXvYqyOQFw1kXusBozrgdImJzsvWhmCxKfkuWPUdPKRg8gCnh/RQiztn8aFWrTcfNNynAz3uZLR6g==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr15812691wmm.98.1582462525287; 
	Sun, 23 Feb 2020 04:55:25 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	133sm14295204wmd.5.2020.02.23.04.55.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 04:55:24 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Sun, 23 Feb 2020 12:55:14 +0000
Message-Id: <20200223125514.19467-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3] Ply: Add recipe for git version
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
X-List-Received-Date: Sun, 23 Feb 2020 12:55:25 -0000

Ply is a light-weight eBPF tool which compiles ply script or one-liner
to Linux BPF programs and attaches to kprobes and tracepoints.  It
doesn't require external dependencies except libc, so it's very friendly
for embedded system usage.

This patch adds the recipe to support ply building for git version.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
new file mode 100644
index 000000000..7d693b36d
--- /dev/null
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Ply: A light-weight dynamic tracer for eBPF"
+HOMEPAGE = "https://github.com/iovisor/ply"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "bison-native"
+
+SRC_URI = "git://github.com/iovisor/ply"
+SRCREV = "aa5b9ac31307ec1acece818be334ef801c802a12"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*|arm.*|powerpc.*)-linux"
-- 
2.17.1


