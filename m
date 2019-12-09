Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6607FC1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z3so15175584wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FKcHi7VerrnD3lNshaizC0YqN3RmPkvfSlY4bAUaFQE=;
	b=kI9YB2tP1ZM2ADavpkjlBoCLKzegCFr40iRfyW27R/iF+FkGMtvrmQCZzlAn5cQK4X
	jLGmsaSG6Ne5WnDGTGYggkfQwUBIHPKgA34Te6HEhQnN+0jhtinycpDk9qUKSC6wB6nY
	EY4MdyVdGys2EROyvv4mJQA3LuwKEVqgw1KcLZ8lW5kimum8dgUfymD/9vE5mdqi7pnT
	EBn9HcZniIfR2ZsGlZ+8vrEtg4Cx7AOwIxDEuV/V24cYoRg3Gqc2U0cG6YOlNvLQO00N
	jMOG4DbFD9ifJCynCK1PuRkKXc2qROOYLb6TtNzeRZkxHq2WW+RypoBUaG7SbV4CjePW
	OlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FKcHi7VerrnD3lNshaizC0YqN3RmPkvfSlY4bAUaFQE=;
	b=KdTRuEYG6i8JTeYLZBSdqua9Uk3WtAmubNBTqGDag8muRZu+ulOtWy9DFdjmLVMHWQ
	SLxS/YyN98pyzbecNy6Ychu2Cf8rF1eQpHuz3aIWtBEy8GiPtOHKQOZXYpf6y2va+Rgo
	PZZgjTIMqHH3Fwd1pyu+NTprAq/9Ov3JyfEkFYspk5JmxeX7v3TwUZ+HXJeEIx+AmKsT
	zHVKvY/0kfsOwyKmTznThdPIG5HeecaQLV+IJtlEDPoWGrw3jJU3f5Bnv/SDHZ9XHZd7
	uU1IpbwEDhqiWiOhp6NXHB34ckyQweT+Ab/Zit28BPeuFreT8KZA5Cx5W4MOSB2VG7dq
	fixQ==
X-Gm-Message-State: APjAAAWNMMoupZP7740W/Ni6j0qyYKYnc9yqGsE7tsjGdPbQE/NK8Vbf
	dNuyuHzb9Cy4aP/oCGy+h8eFys54
X-Google-Smtp-Source: APXvYqypHCRNzCLX2NDa6d7Rl59S+IPD8n7MRlt1DaEzZG4iftWK2oeedGZ1X4pg5QilfZEuMce5VA==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr681788wrr.21.1575880587960;
	Mon, 09 Dec 2019 00:36:27 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:58 +0100
Message-Id: <20191209083612.23922-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 06/20] rest: initial add 0.8.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is an optional dependency for upcoming gnome-online-accounts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
new file mode 100644
index 000000000..33b8744eb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "library to access web services that claim to be "RESTful""
+HOMPAGE = "https://wiki.gnome.org/Projects/Librest"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+DEPENDS = " \
+    libxml2-native \
+    glib-2.0-native \
+    glib-2.0 \
+    libsoup-2.4 \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.md5sum] = "ece4547298a81105f307369d73c21b9d"
+SRC_URI[archive.sha256sum] = "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
+
+# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
+# * libsoup-gnome support was removed upstream three years ago [1]
+# [1] https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf2f1ecad17e9a720
+EXTRA_OECONF = "--without-gnome"
+
+do_configure_prepend() {
+    # rest expects introspection.m4 at custom location (see aclocal.m4).
+    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build
+}
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/rest/.libs"
+}
+
-- 
2.21.0


