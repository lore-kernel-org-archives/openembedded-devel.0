Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD6AC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 11:19:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.80971.1675768758257777087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 03:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QGqfsgke;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675768756; i=@fujitsu.com;
	bh=vyDknLF19ZVkcFFYMVJYP/fqXALJ09h0w5TABw5zWlI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QGqfsgkelAE+ya03s2XdZIDY4J1YziTywh7w4YD7HidfJ6BHWJVpnzdpkmOEAs2yg
	 zzZj16ABPGbA5Opf5HuB5mehVLoGKf89PC6Xp7+CQmZA4r01r3pTEjtF70Ww8tSbqq
	 3hOpZwBGLA8usnyYYEVdYhXXaZZyzbE7Rf6Jd0RsWvu+/doo9ZDkDsNibHFWhmkPXE
	 i9Z6kTBJLOtgpthhvvYZQIxA4Gj/Cj5gct+17baYXEHLaSB+E9+cx5xbbGOd5uIoxm
	 i+PorBSz0Rj/jlIhjNwj2DM3fTLTRO+aFPgQRvVkcSRI+KfM369sWWTST6C3Ctrn0F
	 uP8mhOdZdDptQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpLvZ+FG
  ywY12dYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNEr0PBA92Ki9M2sjQw/lHvYuTiEBJ4yChx
  qPU4M4RzlUniyccVUM4eRomNvZ1sXYycHGwCUhI37v8Hs0UE9CWWzt7DDGIzC6hIvPjdw97Fy
  MEhLOAs8aBfCMRkAQqv22sLUsEr4Cgxs+EPC4gtIaAgMeXhe2aIuKDEyZlPWCCmSEgcfPGCGa
  JGUWL25Wao+kqJ1g+/oGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdA0t9ZKKMtMzSnI
  TM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECAzGlWGndDsYlfX/1DjFK
  cjApifLeV3mULMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC18sIKCdYlJqeWpGWmQOMCpi0BAePk
  gjvPZBW3uKCxNzizHSI1ClGY46Pfy7uZebYdPjKXmYhlrz8vFQpcV5XkEkCIKUZpXlwg2DReo
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG+CHtAUnsy8Erh9r4BOYQI6JUT1IcgpJYkIKak
  GpnUhDe+Pqv9PCcrljUzV5ggRPyVxyESkvL2ZKeghd8HCqcsZJFi5tnjppHpf7838nqLLUehs
  9DBz1qpT2Q12S9O8L17OXurBs33KU60NkioPrFMDvhcsm1RwdfmKwINvb3TZbP3bNr/9lGXxJ
  QMVNrmLZ85t919+9NiDlWtmbX4q11DJtrR1stHGVymPj1+8/dGut6TTOfFW2vkvt6LXH/7Uzs
  0xr+Ov6/PzKeIfvearXazn6572xPNf+322d884D7VznToTGdJw+/tT7iVleo/evZJ5f3binJO
  7zbKmXX1i9ojZoeiW+RXOtdd5J4ny7zW2+vJry9ULepO3Kv39dNLt77FVa9XPtio6Z7z7reaq
  xFKckWioxVxUnAgAwzRLFVEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1675768755!152121!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27465 invoked from network); 7 Feb 2023 11:19:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 11:19:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5748C1AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:15 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4B3961AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 11:19:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20221229 -> 20230201
Date: Tue, 7 Feb 2023 19:19:00 +0800
Message-ID: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 11:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100956

From: Wang Mingyu <wangmy@fujitsu.com>

License update: Copyright year updated to 2023.

0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
updated for new version.

Changelog:
==========
* configure: regen
* configure.in: initialize $ac_includes_default
* VERSION, package/byacc.spec, package/debian/changelog,
  package/debian/copyright, package/mingw-byacc.spec,
  package/pkgsrc/Makefile: bump
* aclocal.m4: resync with my-autoconf

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-byacc-do-not-reorder-CC-and-CFLAGS.patch | 37 ++++++++++---------
 .../{byacc_20221229.bb => byacc_20230201.bb}  |  4 +-
 2 files changed, 22 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20221229.bb => byacc_20230201.bb} (65%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index 8365da0f9..f761ccbdc 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -21,16 +21,19 @@ Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 
 Update for 20210808.
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+Update for 20210201
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  aclocal.m4 |   1 -
  configure  | 259 -----------------------------------------------------
  2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 7a9a8fb..108b6cc 100644
+index 832d0c8..63b03f2 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1401,7 +1401,6 @@ CF_GCC_VERSION
+@@ -1421,7 +1421,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -39,20 +42,20 @@ index 7a9a8fb..108b6cc 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index 5b98a03..e3a4237 100755
+index cb47b4c..c72b6e4 100755
 --- a/configure
 +++ b/configure
-@@ -2146,265 +2146,6 @@ esac
+@@ -2144,265 +2144,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : "${CC:=cc}"
  
--echo "$as_me:2149: checking \$CFLAGS variable" >&5
+-echo "$as_me:2147: checking \$CFLAGS variable" >&5
 -echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
 -case "x$CFLAGS" in
 -(*-[IUD]*)
--	echo "$as_me:2153: result: broken" >&5
+-	echo "$as_me:2151: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2155: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-	{ echo "$as_me:2153: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
 -	cf_flags="$CFLAGS"
 -	CFLAGS=
@@ -160,18 +163,18 @@ index 5b98a03..e3a4237 100755
 -	done
 -	;;
 -(*)
--	echo "$as_me:2263: result: ok" >&5
+-	echo "$as_me:2261: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
--echo "$as_me:2268: checking \$CC variable" >&5
+-echo "$as_me:2266: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:2272: result: broken" >&5
+-	echo "$as_me:2270: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2274: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-	{ echo "$as_me:2272: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
@@ -288,26 +291,26 @@ index 5b98a03..e3a4237 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2391: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2389: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2395: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2393: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2399: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2397: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2403: result: ok" >&5
+-	echo "$as_me:2401: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2408: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2406: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20221229.bb b/meta-oe/recipes-extended/byacc/byacc_20230201.bb
similarity index 65%
rename from meta-oe/recipes-extended/byacc/byacc_20221229.bb
rename to meta-oe/recipes-extended/byacc/byacc_20230201.bb
index f7f75b02c..409212e69 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20221229.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20230201.bb
@@ -4,7 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=62c37a10a2faf90235ee64280ad72737"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=b56b7454f5f865de2e6e35ee2185b461"
 require byacc.inc
 
-SRC_URI[sha256sum] = "1316c6f790fafa6688427f1ff91267b61d8b7873b443c620eef69a6eff0503bc"
+SRC_URI[sha256sum] = "576cc9d9ae5e22503ed5e3582498cf2cccacef401969106420547b4d05c87d76"
-- 
2.34.1


