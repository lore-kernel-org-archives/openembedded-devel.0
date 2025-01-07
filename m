Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71612C02188
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.16412.1736240517633665354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=giP1GLIN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240518; x=1767776518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G3lFdYVoTClucKaAGiNc9M5C7eZ2M2rpJLzt+ErOfa0=;
  b=giP1GLINgWu98BrJZRlEh4P4vbp05KD28wsw786o1ot3V8gl5PBEYAEk
   yhsO6CuPIGSl1UJsVMGk1U16YsYBkzlPg27+2BmqQHBuwuVvPyZuw+4t9
   sAcwJibtNQWR5ovF8n/aN4IpgDpumnWOnoUJELbUeFf9qprpx2aXhONnQ
   SdFpC9qrXRXh2wvmwieI0sYiRhC83ucxPmvJOUCZ5lWGSFKVoqjojKS/B
   G25EZ7q+WhcPFu2WIiPaiL5tqu09RSrC7ULsd4vwmkLpy8QFf4HmI+AqA
   WqzvMu4i2Y9/V8GDdv50YEMEDTeia++uGoCjg0FdC+dD1W4DDsg/2CcHC
   w==;
X-CSE-ConnectionGUID: EvzhOKMgQpaw1QPsop8h5Q==
X-CSE-MsgGUID: hHk+PALlR423Iyns+s2Bmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="164742123"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="164742123"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AAC5D4C39
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43B50D4BCF
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 895DF41185
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4470E1A0071;
	Tue,  7 Jan 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/18] byacc: upgrade 20230219 -> 20241231
Date: Tue,  7 Jan 2025 17:01:31 +0800
Message-Id: <1736240504-5315-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--3.093400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yTo39wOA02Lh07hVxuupa6rFXntfxA7JmNnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2X1q8KGwQuoo2ei
	q5HAdjcECBvE1eIcYKv5nNXbGUpdQXlJqiTX99kKJJ72DuZB0nGvaomg0i4KNwbH+areOI2cGp0
	VGMd0huIY6rvd2gSeIgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyPkEYQ/dIPlqjdLXBSNaMEcdV6
	q8Z1R/fikFQoZphBrR82UMFdI7AoV4KNbLEV44ZEPdsYdI6HCA3oaZqGKoVGFiYJ9uzUDWQ/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114680

From: Wang Mingyu <wangmy@fujitsu.com>

0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
refreshed for 20241231

Licese-Update: copyright year updated to 2024

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-byacc-do-not-reorder-CC-and-CFLAGS.patch | 39 ++++++++++---------
 .../{byacc_20230219.bb => byacc_20241231.bb}  |  4 +-
 2 files changed, 23 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20230219.bb => byacc_20241231.bb} (65%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index f761ccbdc8..53aabd6035 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -24,16 +24,19 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 
 Update for 20210201
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+Update for 20241231
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  aclocal.m4 |   1 -
  configure  | 259 -----------------------------------------------------
  2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 832d0c8..63b03f2 100644
+index 5c83bbd..ab3ffe7 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1421,7 +1421,6 @@ CF_GCC_VERSION
+@@ -1762,7 +1762,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -42,20 +45,20 @@ index 832d0c8..63b03f2 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index cb47b4c..c72b6e4 100755
+index da9a5c5..65ee092 100755
 --- a/configure
 +++ b/configure
-@@ -2144,265 +2144,6 @@ esac
+@@ -2152,265 +2152,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : "${CC:=cc}"
  
--echo "$as_me:2147: checking \$CFLAGS variable" >&5
+-echo "$as_me:2155: checking \$CFLAGS variable" >&5
 -echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
 -case "x$CFLAGS" in
 -(*-[IUD]*)
--	echo "$as_me:2151: result: broken" >&5
+-	echo "$as_me:2159: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2153: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-	{ echo "$as_me:2161: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
 -	cf_flags="$CFLAGS"
 -	CFLAGS=
@@ -163,22 +166,22 @@ index cb47b4c..c72b6e4 100755
 -	done
 -	;;
 -(*)
--	echo "$as_me:2261: result: ok" >&5
+-	echo "$as_me:2269: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
--echo "$as_me:2266: checking \$CC variable" >&5
+-echo "$as_me:2274: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:2270: result: broken" >&5
+-	echo "$as_me:2278: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2272: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-	{ echo "$as_me:2280: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
--	cf_flags=`echo "$CC" | ${AWK:-awk} -v prog="$cf_prog" '{ printf("%s", substr($0,1+length(prog))); }'`
+-	cf_flags=`echo "$CC" | sed -e "s%^$cf_prog%%"`
 -	CC="$cf_prog"
 -	for cf_arg in $cf_flags
 -	do
@@ -291,26 +294,26 @@ index cb47b4c..c72b6e4 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2389: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2397: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2393: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2401: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2397: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2405: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2401: result: ok" >&5
+-	echo "$as_me:2409: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2406: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2414: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
-2.34.1
+2.43.0
 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20230219.bb b/meta-oe/recipes-extended/byacc/byacc_20241231.bb
similarity index 65%
rename from meta-oe/recipes-extended/byacc/byacc_20230219.bb
rename to meta-oe/recipes-extended/byacc/byacc_20241231.bb
index 614bcaf646..8d74dbb83e 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20230219.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20241231.bb
@@ -4,7 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=b56b7454f5f865de2e6e35ee2185b461"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=6a728308869d7a7901618a5bcb970f7e"
 require byacc.inc
 
-SRC_URI[sha256sum] = "36b972a6d4ae97584dd186925fbbc397d26cb20632a76c2f52ac7653cd081b58"
+SRC_URI[sha256sum] = "192c2fae048d4e7f514ba451627f9c4e612765099f819c19191f9fde3e609673"
-- 
2.43.0


