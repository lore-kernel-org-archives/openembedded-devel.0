Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCBB606B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2019 15:24:56 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q5so5645073pfg.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2019 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e9jFcr9Y/yZy/kM+mAEPWShLS3C3pSmFXPwtKZdntSo=;
	b=J6VWHRxergEEXSWq3X0nanPO2cA4MiVJz3LkqRO90zwGfddfwK9goZhrERNrNzsv+1
	tO9fk5GVtV13kh/F0B/VLjCuFOJCdc+uRWZUdffWzK9/yJQBpcs92dUN4n0evKlnUKzX
	99vGmguuQtX4g2vxJdE01RWWs0e30bbiJK7G8yqGWOEl3py5Q/12Tr0XjFv4MtinLa5q
	B0hQxKbJd7uTcyU0I88TgZAc/Xh/0g83u+XJu1diCjmQdAd7kkmF1LXInrQFwUpT8y6g
	BwfwX/8/NF90ynVOfbFMQp7wEyvMXCXe8cmKF1aajoxJr4hh+748rU3MFZIXJRbq414V
	ATAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e9jFcr9Y/yZy/kM+mAEPWShLS3C3pSmFXPwtKZdntSo=;
	b=EsdsNPCczeGg2MHDV5Nnz4ueZryGz8oEQsjFDwNqp7Ry/AmZz5SyixcX+HB4nm6Bhb
	BOHoF2gxJL4qX/EdfZB4SLK1WngXzZZBQgPHdFPnhZPPTZX4xvBv20GgEG6EOJWJq6bz
	N4Bls34XpZ5NNwuG9GMsPPHpo6IPATS+vKWtLRmyQGcD9CXEqq7EExE2TCy+vRQD1ozv
	ep0VIQREneRSRL7mtLMb+xnwGM8L1a02e53KYYAxCvUANwtBqv0pWQnIGDWw7mtyhVer
	+zB3Ne2shV8D6SPcWI3sYD/YtEtu4z5pMAjRX1tpWzhtovpF1fulqkg/TUUMu6r9z+Q/
	snJA==
X-Gm-Message-State: APjAAAVPXFQO3dACP8tI6OTiYaLKeSullgtbWkWn58dYrpxhNYLa8kDG
	8D9lyUwVsD48BF7yb15ntP4sI8qw
X-Google-Smtp-Source: APXvYqwUK4QhaZU2FIEna5lPXJU3Z/D99O3UTNTczkA2nJS6WVycWgZYye5/3Uj5tNlLggxIwXauqQ==
X-Received: by 2002:a63:798c:: with SMTP id
	u134mr15889134pgc.255.1571498697614; 
	Sat, 19 Oct 2019 08:24:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d127:ede6:77ca:f77d])
	by smtp.gmail.com with ESMTPSA id
	y28sm11965838pfq.48.2019.10.19.08.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Oct 2019 08:24:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2019 08:24:55 -0700
Message-Id: <1571498695-31885-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe[warrior][PATCH] tcpdump: upgrade 4.9.2 -> 4.9.3
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
X-List-Received-Date: Sat, 19 Oct 2019 15:24:57 -0000

From: Peiran Hong <peiran.hong@windriver.com>

This upgrade adds some new features and fixes numerous bugs including
the following CVEs:
CVE: CVE-2017-16808 (AoE)
CVE: CVE-2018-14468 (FrameRelay)
CVE: CVE-2018-14469 (IKEv1)
CVE: CVE-2018-14470 (BABEL)
CVE: CVE-2018-14466 (AFS/RX)
CVE: CVE-2018-14461 (LDP)
CVE: CVE-2018-14462 (ICMP)
CVE: CVE-2018-14465 (RSVP)
CVE: CVE-2018-14881 (BGP)
CVE: CVE-2018-14464 (LMP)
CVE: CVE-2018-14463 (VRRP)
CVE: CVE-2018-14467 (BGP)
CVE: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
CVE: CVE-2018-10105 (SMB - too unreliably reproduced,
                           SMB printing disabled)
CVE: CVE-2018-14880 (OSPF6)
CVE: CVE-2018-16451 (SMB)
CVE: CVE-2018-14882 (RPL)
CVE: CVE-2018-16227 (802.11)
CVE: CVE-2018-16229 (DCCP)
CVE: CVE-2018-16301 (was fixed in libpcap)
CVE: CVE-2018-16230 (BGP)
CVE: CVE-2018-16452 (SMB)
CVE: CVE-2018-16300 (BGP)
CVE: CVE-2018-16228 (HNCP)
CVE: CVE-2019-15166 (LMP)
CVE: CVE-2019-15167 (VRRP)
CVE: CVE-2018-14879 (tcpdump -V)

Deleted patch "0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch"
since the fix is included in the upgrade.

Modified patches "avoid-absolute-path-when-searching-for-libdlpi.patch",
"unnecessary-to-check-libpcap.patch", and "add-ptest.path" since
the upgrade renamed configure.in to configure.ac and made changes
to the file.

Added PACKAGECONFIG for smb. It is disabled by default in
the upgraded version in both the package's configure script and this
bitbake recipe since it is insecure.

Modified the parsing of ptest result to align with the new output
format.

With core-image-minimal on qemux86-64/kvm:
Recipe         | Passed      | Failed   | Skipped   | Time(s)
Before         | 408         | 0        | 2         | 4
After          | 431         | 11       | 2         | 10

11 test failed after the upgrade since libpcap is not upgraded
alongside with tcpdump.

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71535e2f0ea76d39d2911e022905ec8ee9843872)
[Upgrade is a resonable path do to the # of patches needed to address
 all this issues]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/tcpdump/tcpdump/add-ptest.patch   |  9 +++++----
 ...oid-absolute-path-when-searching-for-libdlpi.patch | 19 ++++++++++---------
 .../recipes-support/tcpdump/tcpdump/run-ptest         |  4 ++--
 .../tcpdump/unnecessary-to-check-libpcap.patch        | 15 ++++++++-------
 .../tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb}    | 12 +++++++++---
 5 files changed, 34 insertions(+), 25 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.2.bb => tcpdump_4.9.3.bb} (74%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index b71435a..f8ff354 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -1,18 +1,19 @@
-From 8ee1ab1ac89557d48ac1ab7ddcc3c51be9b734ad Mon Sep 17 00:00:00 2001
+From 8c9c728757f89ebe6c4019114b83a63c63596f69 Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
-Date: Wed, 22 Oct 2014 10:02:48 +0800
+Date: Wed, 2 Oct 2019 16:57:06 -0400
 Subject: [PATCH] Add ptest for tcpdump
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
 
 ---
  Makefile.in | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 0941f0e..3ce40c6 100644
+index 3b589184..7b10e38c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -437,9 +437,17 @@ distclean:
@@ -23,7 +24,7 @@ index 0941f0e..3ce40c6 100644
 +buildtest-TESTS: tcpdump
 +
 +runtest-PTEST:
- 	(cd tests && ./TESTrun.sh)
+	(mkdir -p tests && SRCDIR=`cd ${srcdir}; pwd` && export SRCDIR && $$SRCDIR/tests/TESTrun.sh )
  
 +install-ptest:
 +	cp -r tests                     $(DESTDIR)
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
index d82c160..977ab95 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
@@ -1,6 +1,6 @@
-From a2bfd28034d9aa48d8ff109c1314e53bc9779752 Mon Sep 17 00:00:00 2001
+From 02085028cdaf075943c27ebc02bb6de0289ec1d3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 24 Oct 2018 22:26:08 -0700
+Date: Wed, 2 Oct 2019 16:43:48 -0400
 Subject: [PATCH] avoid absolute path when searching for libdlpi
 
 Let the build environment control library search paths.
@@ -8,15 +8,16 @@ Let the build environment control library search paths.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
 ---
- configure.in | 2 +-
+ configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index c882909..52aefd6 100644
---- a/configure.in
-+++ b/configure.in
-@@ -542,7 +542,7 @@ don't.])
+diff --git a/configure.ac b/configure.ac
+index 3401a7a3..6a52485a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -528,7 +528,7 @@ don't.])
  fi
  
  # libdlpi is needed for Solaris 11 and later.
@@ -26,5 +27,5 @@ index c882909..52aefd6 100644
  dnl
  dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
index c03a8b8..2bfb226 100755
--- a/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
 make -k runtest-PTEST | sed -e '/: passed/ s/^/PASS: /g' \
-			-e '/: failed/ s/^/FAIL: /g' \
+			-e '/: TEST FAILED.*/ s/^/FAIL: /g' \
 			-e 's/: passed//g' \
-			-e 's/: failed//g'
+			-e 's/: TEST FAILED.*//g'
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
index 69d68ba..8793bf7 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
@@ -15,15 +15,16 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
 ---
- configure.in | 4 +++-
+ configure.ac | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index b2305a5..c882909 100644
---- a/configure.in
-+++ b/configure.in
-@@ -418,7 +418,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
+diff --git a/configure.ac b/configure.ac
+index 56e2a624..3401a7a3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -404,7 +404,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
  AC_SEARCH_LIBS(getrpcbynumber, nsl,
      AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
  
@@ -35,5 +36,5 @@ index b2305a5..c882909 100644
  #
  # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
similarity index 74%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 9bd861c..3cd12ae 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -6,17 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
 
 DEPENDS = "libpcap"
 
+RDEPENDS_${PN}-ptest += " make perl \
+	perl-module-file-basename \
+	perl-module-posix \
+	perl-module-carp"
+
 SRC_URI = " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://unnecessary-to-check-libpcap.patch \
     file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
-    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
 "
 
-SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
-SRC_URI[sha256sum] = "798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79"
+SRC_URI[md5sum] = "a4ead41d371f91aa0a2287f589958bae"
+SRC_URI[sha256sum] = "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410"
 
 inherit autotools-brokensep ptest
 
@@ -25,6 +29,8 @@ PACKAGECONFIG ?= "openssl"
 PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
 PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
 PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
+# Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
 
 EXTRA_AUTORECONF += "-I m4"
 
-- 
2.7.4


