Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 43A697F8AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943109"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:29:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DF7884B6EC73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:21:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:29:53 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:09:30 +0800
Message-ID: <1573042170-43066-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DF7884B6EC73.AA353
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] byacc: upgrade 20190617 -> 20191103
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
X-List-Received-Date: Wed, 06 Nov 2019 08:29:55 -0000
Content-Type: text/plain

1) Update 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch for new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 35 ++++++++++++----------
 .../byacc/{byacc_20190617.bb => byacc_20191103.bb} |  4 +--
 2 files changed, 21 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20190617.bb => byacc_20191103.bb} (74%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index 24864ea..c7830ed 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -12,16 +12,19 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 Update for 20190617.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+Update for 20191103.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  aclocal.m4 |   1 -
  configure  | 259 -------------------------------------------------------------
  2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 338465f..3311057 100644
+index b90cfe6..413ea9c 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1231,7 +1231,6 @@ CF_GCC_VERSION
+@@ -1232,7 +1232,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -30,20 +33,20 @@ index 338465f..3311057 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index ebb1f0f..a56cb17 100755
+index ec77bba..234f271 100755
 --- a/configure
 +++ b/configure
-@@ -1957,265 +1957,6 @@ esac
+@@ -2059,265 +2059,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : ${CC:=cc}
  
--echo "$as_me:1960: checking \$CFLAGS variable" >&5
+-echo "$as_me:2062: checking \$CFLAGS variable" >&5
 -echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
 -case "x$CFLAGS" in
 -(*-[IUD]*)
--	echo "$as_me:1964: result: broken" >&5
+-	echo "$as_me:2066: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:1966: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-	{ echo "$as_me:2068: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
 -	cf_flags="$CFLAGS"
 -	CFLAGS=
@@ -151,18 +154,18 @@ index ebb1f0f..a56cb17 100755
 -	done
 -	;;
 -(*)
--	echo "$as_me:2074: result: ok" >&5
+-	echo "$as_me:2176: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
--echo "$as_me:2079: checking \$CC variable" >&5
+-echo "$as_me:2181: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:2083: result: broken" >&5
+-	echo "$as_me:2185: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2085: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-	{ echo "$as_me:2187: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
@@ -279,24 +282,24 @@ index ebb1f0f..a56cb17 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2202: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2304: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2206: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2308: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2210: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2312: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2214: result: ok" >&5
+-	echo "$as_me:2316: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2219: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2321: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20190617.bb b/meta-oe/recipes-extended/byacc/byacc_20191103.bb
similarity index 74%
rename from meta-oe/recipes-extended/byacc/byacc_20190617.bb
rename to meta-oe/recipes-extended/byacc/byacc_20191103.bb
index 2834b7c..eae4618 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20190617.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20191103.bb
@@ -7,6 +7,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=3eb7c635434fafe23ef30fc263e63b2f"
 require byacc.inc
 
-SRC_URI[md5sum] = "17b3f7e7ed570d785b145064d99df615"
-SRC_URI[sha256sum] = "f87868167b920bf2cb30fc32b62f63ae15671181ef329226d1063100be02518d"
+SRC_URI[md5sum] = "84ffe59166f67bbe147a6f502c7af309"
+SRC_URI[sha256sum] = "d291fb34816f45079067366b7f7300ffbf9f7e3f1aaf6d509b84442d065d11b9"
 
-- 
2.7.4




