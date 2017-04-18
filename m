Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA1B071CB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:06 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so144598pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0aWktUxpJZ3aSdh1XFqDW9sjkUnS6mRiWE+dqajN8ko=;
	b=eNTO2emg6OPmbG1lJbjDifb3TGNX9rqjCVp/BdUe+EmQwJw2svNuRdq5dnIT0xwYt7
	VSHy5E4JyQjn+3tl8wOYAkHKqcL9HnGMbLIczRhmGZblPhZ998lRS5NqCBq0NhivjzMU
	Qt6b0VZQtBxlEJYXmNJE8xAbSt5JyLf1DxOY/eZUOpuHsqkKWw+aAPkNUueh5On1l9YF
	Jx6HhGiz6bq3n3uTXEcVpFG/Dy43Owex6k3rbqNp4uNRAKGR2XN+JsbwmQkyUzXBkkp0
	fIECHdlfeYIRQMhZAEIDZ+FYEqxFLDDFaPWroHNJHMtwYd1wLlDJv1jNnPLZb2/M7ivo
	nYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0aWktUxpJZ3aSdh1XFqDW9sjkUnS6mRiWE+dqajN8ko=;
	b=ZRtAUlUESn38RN+BVhbgNWuxQm/F537oHDOgb/TtXSLXhdo2cpgoohrO76JtaBpdRZ
	KZhwayLhUBY20ORF5xUDdm/5PDGn+CQf7xCPpDkhQVayeAc5EDGTERgnWlaGVNIMdtbq
	/gME6Oc/ti/x4ncpSKvRnaHn8Yl/ZPUenU0v0v5QvT9XSyX/Ls4XxOeeVY1wqM4m+6sG
	FKygajfEwv5AXks6fg8SrjG4d81hSs3c+STTbH/xMElHhsFndasGeploXR31UpzDQ/6e
	JYpSKB1FOmmGqMadk6ha97ftxZupo+wKs+LzcyvnnOd0+FKz6Ug+qD6ATbNHFOoeos1z
	gMzw==
X-Gm-Message-State: AN3rC/53O/2mPm5vck/kVzQ8Nq2NcZYTP0yvt8GQLiAGQEDvFl2FnGiD
	fGBB5oYJErMfEg==
X-Received: by 10.84.173.67 with SMTP id o61mr25596043plb.46.1492539728514;
	Tue, 18 Apr 2017 11:22:08 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:21 -0700
Message-Id: <20170418182142.27253-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 11/32] mtr: Upgrade 0.87+git
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:07 -0000

Fixes for musl build are not in a release yet
until then switch to using git for SRC_URI

License file changes are here

https://github.com/traviscross/mtr/commit/dd42b2305a94dcbf80847410be0288df29d6a5ef

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/mtr/mtr_0.86.bb | 21 -------------------
 meta-networking/recipes-support/mtr/mtr_0.87.bb | 27 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 21 deletions(-)
 delete mode 100644 meta-networking/recipes-support/mtr/mtr_0.86.bb
 create mode 100644 meta-networking/recipes-support/mtr/mtr_0.87.bb

diff --git a/meta-networking/recipes-support/mtr/mtr_0.86.bb b/meta-networking/recipes-support/mtr/mtr_0.86.bb
deleted file mode 100644
index 92f4f3c0b..000000000
--- a/meta-networking/recipes-support/mtr/mtr_0.86.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Combined traceroute and ping utility"
-DESCRIPTION = "mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool."
-HOMEPAGE = "http://www.bitwizard.nl/mtr/"
-SECTION = "net"
-DEPENDS = "ncurses"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://mtr.c;beginline=5;endline=16;md5=af1fafbbfa1bfd48af839f4bb3221106"
-
-SRC_URI = "ftp://ftp.bitwizard.nl/mtr/mtr-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8d63592c9d4579ef20cf491b41843eb2"
-SRC_URI[sha256sum] = "c5d948920b641cc35f8b380fc356ddfe07cce6a9c6474afe242fc58113f28c06"
-
-inherit autotools
-
-EXTRA_OECONF = "--without-gtk"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/mtr/mtr_0.87.bb b/meta-networking/recipes-support/mtr/mtr_0.87.bb
new file mode 100644
index 000000000..9d3275e2d
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr_0.87.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Combined traceroute and ping utility"
+DESCRIPTION = "mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool."
+HOMEPAGE = "http://www.bitwizard.nl/mtr/"
+SECTION = "net"
+DEPENDS = "ncurses"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://ui/mtr.c;beginline=5;endline=16;md5=af1fafbbfa1bfd48af839f4bb3221106"
+
+PV .= "+git${SRCPV}"
+
+SRCREV = "e6d0a7e93129e8023654ebf58dfa8135d1b1af56"
+SRC_URI = "git://github.com/traviscross/mtr"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--without-gtk"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+PACKAGES += "${PN}-bash-completions"
+
+FILES_${PN}-bash-completions = "${datadir}/bash-completion/"
-- 
2.12.2


