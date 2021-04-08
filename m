Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.3795.1617858680511309277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v70TYp3+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617858678; i=@fujitsu.com;
	bh=dmWyGWCtH1A6Kt8lUSYMtj8Xz+nwv2D8AhvYeSdF810=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v70TYp3+NDT3tbGwE+rJxdqTnTAaTRFRIp6B39wdBXyAz8OmLHBnffTcoiOMw2uNl
	 Q8tocCAtaKSXYSIpk7jTSK0nHTrV0TxvMP1kmwSQjLpt+UNKKvd1bRsDfpC+IS+xgk
	 NjSpXCqJzpdIfNWfmf+LgCIOCkkDKmJEnzdAKaUs/r3aHaHPcu7vIA13cVTlYOiUMh
	 0bBoA7NWqGt3Ej2y1WfCFnDnZ4RtHq1hfbsT9wVN9MC39SDMKLsgURtd/eO82z5doc
	 MjYgMTs6jD+2P9S2TgUTmufxKmoIAa6AQYw20hwCRodx0sN/x2qaEH6z6ob5jpBTXx
	 s4Aqh4n3C104A==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 3A/04-41911-6709E606; Thu, 08 Apr 2021 05:11:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRqls6IS/
  BYPUSC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePNpPPMBXelK65Of8/cwLhAoouRi0NIYCuT
  xJWJ59khnOOMEn3PLgE5nBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICNhJLO28ygtgsAioSO9cdA
  qvhFXCTmL/tOlivhICCxJSH75kh4oISJ2c+AathFpCQOPjiBTNEjaLE9p1nWCDsKomzs78wTW
  DkmYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXUNdY2MzPQSq3QT9VJLdZNT80qKEoG
  yeonlxXrFlbnJOSl6eaklmxiBoZRSyPhoB+Pp1x/0DjFKcjApifLaPclNEOJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTBe6EtL0FIsCg1PbUiLTMHGNYwaQkOHiUR3qxeoDRvcUFibnFmOkTqFKMux
  +Xr8xYxC7Hk5eelSonzSoMUCYAUZZTmwY2AxdglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSs
  K8u/qApvBk5pXAbXoFdAQT0BElB3NBjihJREhJNTAtOb7mD+PF3TyHNS7JHVQWPCX6I3P6HSZ
  ntz/T2ua4NSUY/d62X1k++lDM6yNzdF03Ho18G9Oa189ecvHcm4gVe5c99os6otbRsNDEjnPb
  dn3W2u+t5bVXz/bEmql7xar67098X/1KYr3sqr1aqb4nr02Itio+qPprpapAcolKnYVzls3vd
  9NcG+1euV0+fCryh6Z6XcXnc1sSV9/Xu39P6qeNwjleb6ZvW13kjf6XmeV5qDnt7/rxIbL9/x
  qWLdfLj854lbryh7FPTX+J6ccFX7dc2x/5yUbovt0kIZtWploX6VexD9oy7EVe2H4uqtqwdfn
  hWRqNHuuCzRTWHZyo7nciT4DlxNZJEsW3Lz9QYinOSDTUYi4qTgQAKw7ETiwDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-28.tower-228.messagelabs.com!1617858677!936958!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6660 invoked from network); 8 Apr 2021 05:11:17 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-28.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:11:17 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385B92w021727
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:11:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:11:08 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v3] xterm: upgrade 366 -> 367
Date: Fri, 9 Apr 2021 01:10:59 +0800
Message-ID: <1617901859-4838-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Refresh the following patch:
0001-Add-configure-time-check-for-setsid.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../0001-Add-configure-time-check-for-setsid.patch     | 10 +++++-----
 .../xorg-app/{xterm_366.bb => xterm_367.bb}            |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
index d3beea8be..92ecdac22 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
@@ -18,7 +18,7 @@ diff --git a/configure b/configure
 index 0aafefc..03e8df0 100755
 --- a/configure
 +++ b/configure
-@@ -5411,6 +5411,7 @@ for ac_func in \
+@@ -5605,6 +5605,7 @@ for ac_func in \
  	unsetenv \
  	sched_yield \
  	setpgid \
@@ -42,7 +42,7 @@ diff --git a/main.c b/main.c
 index 5e60589..b81d2be 100644
 --- a/main.c
 +++ b/main.c
-@@ -2868,7 +2868,7 @@ main(int argc, char *argv[]ENVP_ARG)
+@@ -2903,7 +2903,7 @@ main(int argc, char *argv[]ENVP_ARG)
      }
  }
  
@@ -51,7 +51,7 @@ index 5e60589..b81d2be 100644
  #define USE_OPENPTY 1
  static int opened_tty = -1;
  #endif
-@@ -4040,7 +4040,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
+@@ -4074,7 +4074,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
  	    /*
  	     * now in child process
  	     */
@@ -64,14 +64,14 @@ diff --git a/xtermcfg.hin b/xtermcfg.hin
 index 1dbc3b8..4f3ff5b 100644
 --- a/xtermcfg.hin
 +++ b/xtermcfg.hin
-@@ -96,6 +96,7 @@
+@@ -95,6 +95,7 @@
  #undef HAVE_PUTENV		/* AC_CHECK_FUNCS(putenv) */
  #undef HAVE_SCHED_YIELD		/* AC_CHECK_FUNCS(sched_yield) */
  #undef HAVE_SETPGID		/* AC_CHECK_FUNCS(setpgid) */
 +#undef HAVE_SETSID		/* AC_CHECK_FUNCS(setsid) */
  #undef HAVE_STDINT_H		/* AC_PROG_CC_STDC */
  #undef HAVE_STDLIB_H		/* AC_CHECK_HEADERS(stdlib.h) */
- #undef HAVE_STRFTIME		/* AC_CHECK_FUNCS(strftime) */
+ #undef HAVE_STDNORETURN_H	/* CF_C11_NORETURN */
 -- 
 2.24.1
 
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
index 969159bc5..e0d3dcec1 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
+SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1

