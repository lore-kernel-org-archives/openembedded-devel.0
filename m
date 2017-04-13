Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 21FF477E78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so12686902pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0aWktUxpJZ3aSdh1XFqDW9sjkUnS6mRiWE+dqajN8ko=;
	b=gfDK7fRAkLlV9Y2j6Qd82TGHwwH5SeNNgr3T4yvrM6qIsxfDJnoLwzgarzNFn3pGyk
	cIiNrtuVtDR4oLGVz+/4IQGmrB/b1CC6z5eGLGzv5kqZeVWeP2/AZaeRny4qRIxunJqS
	cjgN6v/TFbr7dKC5jDpqqQHqjxFErPboXKL1LGFPkQKmPU1fP9mH0WpiOGHnk2LKZlQ6
	/ysrDq3cWDmdrCGYR5LYIwngauybDLiftW7gpM4nms3x8XggLZan7w1H4x9jCblKIYwB
	x8GJEP2THTbZh16X3G38lLvj7oXLikqwwGC3gvBUeqnO/NA4g9einqhGSPaA0U9gj/Lm
	fV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0aWktUxpJZ3aSdh1XFqDW9sjkUnS6mRiWE+dqajN8ko=;
	b=RXKCKAC+H+rNf473Y6Uc9JG8BLG+Wl7eL7b/9ZUSHfBXe5hxbkHmkUs19kl3BvloKe
	oPNgnD5P6riiVgTh5Y+k6uKIak/WDiyHRkaYulv3YddbNfnwUP040rTLy7D8WjQSGEDR
	T/D/oSmJuOK5UNLwzrfuJBjxWOwGnX43V/i3JJjLG7TpPfXu9HfGIbmDajM13/Irj2Fc
	/TXCFEvzAmUOS2lpeI48/3GtM+LqGoTqFC7bmXNHL3Ab/zvo8rjyN7F+ryCloxyvAlfq
	AZRMK0jXTaKaPqkE4U7v+2XcnWnO9tSB1aMXmG6g0RTUKXctgByXfUmD9cneRvSE+BM1
	wY4w==
X-Gm-Message-State: AN3rC/61Rq+FfKdS1MQD1PPoYfkBcDLxXN/JbaLDbbz8rWlkX/wKWonR
	sD+/cZIQkowf18YN
X-Received: by 10.84.224.70 with SMTP id a6mr5402548plt.25.1492116092438;
	Thu, 13 Apr 2017 13:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:47 -0700
Message-Id: <20170413204106.30679-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-networking][ 10/29] mtr: Upgrade 0.87+git
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:31 -0000

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


