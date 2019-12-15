Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id B03F46BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 07:34:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q9so3199036wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 23:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wGLP+1LJtGlySWHsp83vn8+2kGsD6t4sAAnHHWUhxmg=;
	b=ZYY17DvmVaLyu2irjzWUsj7yMypcefFpbEj+36rWZexIYWj2QE/JJwgcC5yCn34zSO
	dXv13hrOs0IZKlQyZedUHRwu3kdDTmyWbdLR+UOlA49il5PhmMICE8pU1J5kw88WgK7X
	KLg9gL9R0ckcjzv9XtDrMTFkxC9GTXVol2IGQsNQN22woQ78JXRSXfCoox3+FH5GseT+
	GrX4tq8nr39j/bLMAISZ+9k+NVd0Df3a7HxtyTa4anRXPJcHOqwHhaJUVAt+jQHcAuVM
	Atl5ZA/HMQ6yKzGP1lOJ6qxZKi6Z5ABpqw+FWd7WvjTvaXeb0T+4sbkbPGZMqhs+zh8U
	g6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wGLP+1LJtGlySWHsp83vn8+2kGsD6t4sAAnHHWUhxmg=;
	b=TaANq5U/ECxdkFzF26qjTZ2FBEukNLfAfGspgbQWSVhbrdcovIsdm9VHghM2+9bneQ
	TJzDKvjLt/AWB1cqRP6Jdw4yH4p6tsM3NSjmAhK3rl10mlDQ4GhDmWQip09lH1sYr17e
	Yf08mENkllvdc5vJ3u6hF8kzdrzdrz7jujlL6goZzqbsWSXWvY5pnX21QixMP5e9VFea
	qsnBhXtN+6NTqR3wPV4ilnWWGZqsIXue+GBdv535U3TNGt4p3iOQXZkjuqAr/izu3juZ
	3Tubsd+jhZ+yijtCgKkX9Kf7oyxGPujX6uBW8OyFkIQ73mc9rx6EluD7g1Ye3fcfm6Wz
	d2kQ==
X-Gm-Message-State: APjAAAWi1NV1ueDrJnfIRsV7zgiLiOKOYNMga3fY8wJ7vTb/xScKeNIe
	HOPtUe5fA00LaCP8b6xSw3jgEDcq
X-Google-Smtp-Source: APXvYqwwFiLkL/gqo4ERJR4zxlghKcYwVWIMm682VbOcZk+VANC+cmUIn4scAhJvLg9EcI1lTcJqbA==
X-Received: by 2002:a05:600c:210b:: with SMTP id
	u11mr7558398wml.43.1576395267983; 
	Sat, 14 Dec 2019 23:34:27 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f12sm16961525wmf.28.2019.12.14.23.34.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 23:34:27 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 07:34:22 +0000
Message-Id: <20191215073423.89510-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] nftables: upgrade 0.9.2 -> 0.9.3
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
X-List-Received-Date: Sun, 15 Dec 2019 07:34:28 -0000

Also fill out PACKAGECONFIG options for json, mini-gmp, readline and
xtables whilst matching existing behaviour. Drop PACKAGECONFIG to weak
default. Fix upstream version matching so the very old 0.099 is rejected
as the newest version.

Drop seemingly redundant ASNEEDED which was added in 5477d5bcb727
("nftables: Upgrade to 0.7") without explanation.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-filter/nftables/nftables_0.9.2.bb | 28 ----------------
 .../recipes-filter/nftables/nftables_0.9.3.bb | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 28 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
 create mode 100644 meta-networking/recipes-filter/nftables/nftables_0.9.3.bb

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
deleted file mode 100644
index 0c57e7255eaf..000000000000
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Netfilter Tables userspace utillites"
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
-
-DEPENDS = "libmnl libnftnl readline gmp bison-native"
-
-UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
-
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "dfe130724d7c998eb26b56447e932899"
-SRC_URI[sha256sum] = "5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf7165513f5"
-
-inherit autotools manpages pkgconfig
-
-PACKAGECONFIG ?= "python"
-PACKAGECONFIG[manpages] = ", --disable-man-doc, asciidoc-native"
-PACKAGECONFIG[python] = "--with-python-bin=${PYTHON}, --with-python-bin="", python3"
-
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
-
-ASNEEDED = ""
-
-RRECOMMENDS_${PN} += "kernel-module-nf-tables"
-
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir_native}/${PYTHON_DIR}"
-RDEPENDS_${PN}-python = "python3-core python3-json"
diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
new file mode 100644
index 000000000000..47cbf3a4b240
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Netfilter Tables userspace utillites"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
+
+DEPENDS = "libmnl libnftnl bison-native \
+           ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
+
+# Ensure we reject the 0.099 version by matching at least two dots
+UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
+
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
+SRC_URI[md5sum] = "9913b2b46864394d41916b74638e0875"
+SRC_URI[sha256sum] = "956b915ce2a7aeaff123e49006be7a0690a0964e96c062703181a36e2e5edb78"
+
+inherit autotools manpages pkgconfig
+
+PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
+PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
+PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
+PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
+PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
+PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+
+RRECOMMENDS_${PN} += "kernel-module-nf-tables"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/${PYTHON_DIR}"
+RDEPENDS_${PN}-python = "python3-core python3-json"
-- 
2.17.1


