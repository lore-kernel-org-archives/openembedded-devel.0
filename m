Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5268.1600305227571543780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:13:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E30448990CB
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 09:13:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:13:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20200330 -> 20200910
Date: Thu, 17 Sep 2020 21:13:41 +0800
Message-ID: <1600348421-4189-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2E30448990CB.AFCC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0001-byacc-do-not-reorder-CC-and-CFLAGS.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...1-byacc-do-not-reorder-CC-and-CFLAGS.patch | 39 ++++++++++---------
 .../{byacc_20200330.bb => byacc_20200910.bb}  |  4 +-
 2 files changed, 23 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20200330.bb => byacc_20200910.bb} (74%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index c7830ed903..5dcc6afdfe 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -15,16 +15,19 @@ Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 Update for 20191103.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+Update for 20200910.
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
  aclocal.m4 |   1 -
- configure  | 259 -------------------------------------------------------------
+ configure  | 259 -----------------------------------------------------
  2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index b90cfe6..413ea9c 100644
+index 1c6a3ee..2f7e9b5 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1232,7 +1232,6 @@ CF_GCC_VERSION
+@@ -1317,7 +1317,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -33,20 +36,20 @@ index b90cfe6..413ea9c 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index ec77bba..234f271 100755
+index 378f27d..8f40229 100755
 --- a/configure
 +++ b/configure
-@@ -2059,265 +2059,6 @@ esac
+@@ -2066,265 +2066,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : ${CC:=cc}
  
--echo "$as_me:2062: checking \$CFLAGS variable" >&5
+-echo "$as_me:2069: checking \$CFLAGS variable" >&5
 -echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
 -case "x$CFLAGS" in
 -(*-[IUD]*)
--	echo "$as_me:2066: result: broken" >&5
+-	echo "$as_me:2073: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2068: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-	{ echo "$as_me:2075: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
 -	cf_flags="$CFLAGS"
 -	CFLAGS=
@@ -154,18 +157,18 @@ index ec77bba..234f271 100755
 -	done
 -	;;
 -(*)
--	echo "$as_me:2176: result: ok" >&5
+-	echo "$as_me:2183: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
--echo "$as_me:2181: checking \$CC variable" >&5
+-echo "$as_me:2188: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:2185: result: broken" >&5
+-	echo "$as_me:2192: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2187: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-	{ echo "$as_me:2194: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
@@ -282,26 +285,26 @@ index ec77bba..234f271 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2304: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2311: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2308: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2315: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2312: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2319: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2316: result: ok" >&5
+-	echo "$as_me:2323: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2321: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2328: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20200330.bb b/meta-oe/recipes-extended/byacc/byacc_20200910.bb
similarity index 74%
rename from meta-oe/recipes-extended/byacc/byacc_20200330.bb
rename to meta-oe/recipes-extended/byacc/byacc_20200910.bb
index 975311c926..b7640ffca6 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20200330.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20200910.bb
@@ -7,5 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=262857ec5923f073fa06a1f1812225ea"
 require byacc.inc
 
-SRC_URI[md5sum] = "decf6e6b82ea2efae6bbad32d7777da8"
-SRC_URI[sha256sum] = "e099e2dd8a684d739ac6b9a0e43d468314a5bc34fd21466502d120b18df51fb0"
+SRC_URI[md5sum] = "5726a5a655c6fd4e8f950552cceeae29"
+SRC_URI[sha256sum] = "0a5906073aeaf23ddc20aaac0ea61cb5ccc18572870b113375dec4ffe85ecf30"
-- 
2.25.1



