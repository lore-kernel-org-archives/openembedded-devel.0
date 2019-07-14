Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 834457D34E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jul 2019 06:29:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y15so6028971pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2019 23:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XUfv5GIysxHU6rAjlOzyn/mzFE5xsjnQpTdsBqJq2dE=;
	b=gAh59pUJTa0unBYkuawuGZgqO8tMNvQ8R5guMRkVz95tcCPvz02BJekswrzQDm7YFT
	6erPY5u5kk35l/hg9hFXyQ1jnIviDIulbwV+z2VeI8OBYw8oRSlSIJr152egTi4gIH/b
	o+CHEXELHXRYEKvkW+qyh/fIJ4+AIKdkwqGuyLgBAIUp2QAWHgi2HbEg+JHfrhIKBzne
	FWVbXrdGxlg+pn4DaXp/Hhqcc7tclVpseutgm7IjqiL1kkVbyvV9zUL4fK38XolpXDQ/
	BuTDHatY9vVi0lNdDUX2FqAcRtoxDYtJC0rdci2KYDhCMMyfbA4KBOPDKdkZ4keUSd3i
	I33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XUfv5GIysxHU6rAjlOzyn/mzFE5xsjnQpTdsBqJq2dE=;
	b=nRKnN1lsHv7ZbUXTvgo+t4VIVYUHN5AlOowwrp0xU7zB3KJvUJdaX+GdSSqAGuKkIt
	60YKusDih6RfXcfv2MZektbwtTJbZYzUKLxnJHjSkiBbIBX9qjSzep2kDLqBNbQXI/6d
	8bF6koCiRaTsFrcC4yClgXG2nRZtFCEzl7eRIQWjEpRqZxkjJ4dovZHiPsrCo2S//hx6
	zRmLdMI/tvgyQF4aDQzmZl3BrQ2063X+QD3rgP2vAy0VEylBhczI6pYl5sYMBL+AdMXL
	vuXEDSRYvgZYVY3VwharJDsywnolsNR081mOFgVT0nRM6L63L+KY9Y4TORqztWfj5gIQ
	8QWQ==
X-Gm-Message-State: APjAAAXOBqkWdYnEG2BSKbkTrXpIfkISUozF9LdmY1m1Onh3zOHBgzUH
	a/TCjfXZB+zs5VgJB6WYPYmna85o7n4=
X-Google-Smtp-Source: APXvYqyACmJMThgrQGbeng/ghINNXf8JzJ2I8pYtR/JLA+LriLDWowPTimVUawyi4sNs6mx+G+In3A==
X-Received: by 2002:a63:6904:: with SMTP id e4mr20042678pgc.321.1563085741845; 
	Sat, 13 Jul 2019 23:29:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	11sm14567157pfw.33.2019.07.13.23.29.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 13 Jul 2019 23:29:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2019 23:28:52 -0700
Message-Id: <20190714062852.39619-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wvdial: Fix build with musl
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
X-List-Received-Date: Sun, 14 Jul 2019 06:29:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wvdial/wvdial/musl-support.patch          | 25 +++++++++++++++++++
 .../wvdial/wvdial_1.61.bb                     |  6 +----
 2 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvdial/musl-support.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial/musl-support.patch b/meta-oe/recipes-connectivity/wvdial/wvdial/musl-support.patch
new file mode 100644
index 0000000000..b5ad4823a0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial/musl-support.patch
@@ -0,0 +1,25 @@
+Drop support for glibc < 2.10, in master we are at 2.28
+in process get it working with musl as well.
+
+Upstream-Status: Inappropriate [No upstream]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/wvmodemscan.cc
++++ b/wvmodemscan.cc
+@@ -495,16 +495,8 @@ static int fileselect(const struct diren
+ 	// (no internal ISDN support)   || !strncmp(e->d_name, "ttyI", 4);
+ }
+ 
+-#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 10)
+ static int filesort(const dirent **e1, const dirent **e2)
+-#else
+-static int filesort(const void *_e1, const void *_e2)
+-#endif
+ {
+-#if !(defined(__GLIBC__) && __GLIBC_PREREQ(2, 10))
+-    dirent const * const *e1 = (dirent const * const *)_e1;
+-    dirent const * const *e2 = (dirent const * const *)_e2;
+-#endif
+     const char *p1, *p2;
+     int diff;
+     
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 5154208175..36580952f1 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -11,8 +11,8 @@ RDEPENDS_${PN} = "ppp"
 
 SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.bz2 \
            file://typo_pon.wvdial.1.patch \
+           file://musl-support.patch \
           "
-
 SRC_URI[md5sum] = "37e9a2d664effe4efd44c0e1a20136de"
 SRC_URI[sha256sum] = "99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82"
 
@@ -21,8 +21,6 @@ export WVLINK="${LD}"
 
 PARALLEL_MAKE = ""
 
-BUILD_CPPFLAGS += "-I${STAGING_INCDIR}/wvstreams"
-
 do_configure() {
     sed -i 's/LDFLAGS+=-luniconf/LIBS+=-luniconf/' ${S}/Makefile
 }
@@ -30,5 +28,3 @@ do_configure() {
 do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
-# http://errors.yoctoproject.org/Errors/Details/186959/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
-- 
2.22.0


