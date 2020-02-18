Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED016157C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:11 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g3so10230017pgs.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 21:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0d+sbPLOCRngyX+JfAlsRTb9HJ9k4PXsOO1zglhpRZc=;
	b=Nbs7P6K5n8KMslocxzXFoPYPuOfDxkf6IHcXcoK7YyuKzo22F79DlLnerH+2Nlwc14
	GsF5Ha0b5LPYwYuDUwO6p9lB07a5CAilpsqe7uP2U1lbYzyGWpR0rTDI7pWd67alpET0
	gqJ591+Q5PKJSaIaX/OnmdpUEbRzoImZlyWsQHGxV9sc39QFr+NxAEhZT+Pm4i+g0uMR
	8yGELbEobqJY1Ox79lKkFpYlYp6kaXHEffL2Px1shfDUy2l+kwqPG39vztFU2Ibsk2i/
	i4dCCtO/1EdaRL/kqWWYBZw1wUs47vbsV/jT0mC4KCbAhrfwA0rZBZrCJrcgqWwa2DxA
	Vhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0d+sbPLOCRngyX+JfAlsRTb9HJ9k4PXsOO1zglhpRZc=;
	b=Sfhnvfy2IZ5iRwJ0xi/lh9q3R42CAeTxYdkjCzKscV19AA88GAJd1yb3SdC+5MCHtd
	uC2oT0dFoXtCOumWm4Z1Ru+QXOieeGeodYwWWSoMnbQyeKsTZ4qcF/AxpwbMLFokjZud
	xp2loq980fmuruBPZJl2BjANCIvMArzqNsxUoL9IIPzagOaDdmIlooH856iR6I7gHSf6
	xiZ0fmwfys3ekNEfZT84A7ZDJa0ayLEapPavFuNgJRunWooJuQXO0Crm4aiq0wYRsFoU
	69O+eNPQb38Ch9C/LTkkwEibH9JRvfAJijYEkK9tZyruW2+eIan3f5nYhwO8A9gZCUto
	2ahQ==
X-Gm-Message-State: APjAAAWoFi1/mR26fYbuViwSSxbdhM5u9MeDjKp626u/IhZpIJL8G5hS
	4k9Tv08YpfGCj7uWIYZYI0JX5jm6LtkRKQ==
X-Google-Smtp-Source: APXvYqxFnm6ijbPilP0QGVPP3AsRl2rnfGzcUhQxxjLzjl+OlB+j+Gxt6gs7dsiIVQfyoODwdzRqow==
X-Received: by 2002:a63:f20a:: with SMTP id v10mr20756158pgh.420.1582003572980;
	Mon, 17 Feb 2020 21:26:12 -0800 (PST)
Received: from localhost.localdomain (li1441-214.members.linode.com.
	[45.118.134.214])
	by smtp.gmail.com with ESMTPSA id z4sm2214427pfn.42.2020.02.17.21.26.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 21:26:12 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 18 Feb 2020 13:25:41 +0800
Message-Id: <20200218052544.9467-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218052544.9467-1-leo.yan@linaro.org>
References: <20200218052544.9467-1-leo.yan@linaro.org>
Subject: [meta-oe][PATCH v1 1/4] Ply: Add recipe for git version
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
X-List-Received-Date: Tue, 18 Feb 2020 05:26:12 -0000

Ply is a light-weight eBPF tool which compiles ply script or one-liner
to Linux BPF programs and attaches to kprobes and tracepoints.  It
doesn't require external dependencies except libc, so it's very friendly
for embedded system usage.

This patch adds the recipe to support ply building for git version.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
new file mode 100644
index 000000000..b8295386c
--- /dev/null
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -0,0 +1,27 @@
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
+do_configure_prepend() {
+    ( cd ${S}; ./autogen.sh; cd - )
+}
+
+do_configure() {
+    ( cd ${S}; ./configure --host=${TARGET_SYS} --prefix=${D}${prefix}; cd - )
+}
+
+do_compile() {
+    ( cd ${S}; oe_runmake; cd - )
+}
+
+do_install() {
+    ( cd ${S}; oe_runmake install; cd - )
+}
-- 
2.17.1


