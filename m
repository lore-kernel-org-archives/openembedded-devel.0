Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17F5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:12:41 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.12425.1644333160012332507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wbAX1+N2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644333157; i=@fujitsu.com;
	bh=AoGHr4+1obWyY4kxwVDQek71UUom+xC9Tij1tZQnyWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wbAX1+N2E5E7MtFDyvBT88XbpIhNvAksgyqiPiR+6yJ5a5Ca4rSfY3C2hhDuPX801
	 o70AXbpRNeyWroCQSHfXJ3B56LQ37/Mdh5Yh1Ay0veibs7doDW6+YbZ1AW63On2wPR
	 YEepvpQXYpasZWabH2Nzgisr9ZGhxB914qD/cpHC5j/zzAIr1Wy1kXQp68RwKMmjtw
	 Hlrv0yrzkiMG+BVAi3Ph6sxQntBLUIXU4s0VV9qY/yUFkQ//YPgvTZ3LZMHx8XUejJ
	 CxvsfYtxnz/bdNZ+9zBbo5zKmroKbdULbYUX5lVwoAGgLn98JzRKb6oRxBhh4OqpTF
	 f6ftKfcjxNtFA==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 11/4A-12986-56882026;
 Tue, 08 Feb 2022 15:12:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSTe1gyn
  J4MJxMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOWZOCxb4VHw75NDBOce1i5OQQEnjCKPH4
  JmcXIxeQfYFJ4tqmNYwQznFGiS8/XjKBVLEJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CHx/tklNhCbBSh+/sR5RhCbV8BRYvmRNWBzJAQUJKY8fA/Uy8HBKeAksXo9P8QRjhKdN3
  ugygUlTs58wgIxXkLi4IsXzBCtihKzLzezQNgVErNmtUGNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0SqpKDM9oyQ3MTNH19DAQNfQ0FTXUNfIwFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwfFOKGU/vYNzU91PvEKMkB5OSKO/lUqYkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8hm1AOcGi1PTUirTMHGAswaQlOHiURHiXg6R5iwsSc4sz0yFSpxh1OXaeXryIWYglLz8vVU
  qct6wKqEgApCijNA9uBCyuLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5jVrB5rCk5lXArf
  pFdARTEBHfF30LxHoiJJEhJRUA5N8RkulIfdJnW0HRRee526UzFpf4LWrW7C9l3Vl/Rv7ip+F
  SU3r4yMszTO7c5NiFPi7/5rGNqx9HjprJ/PFk3tYAwTjv2p2b7WdvlcrbYq4dod94w/BYDWlW
  u9uRsXnT/aovmK+rLNe5Eam9pL96R8uWkn3Huia4y8z44i3TO8DozPyNZK7bv2ZpMrFncj1es
  c+lQM/HxXZnz78/zLnic6fbi8PvdgV/jnp+eXZuSFlSTPjf535ev2UYtakSwbXa/52XmiX/9T
  9/5NIVff+AIEjrHXHAjawaz1qO1W7w2P5t28rxPu2Mew+vyOYq9n23rKv+v4PTtQ7xVw/mXb/
  6++TDTdz46vnvX9rLr1of7sSS3FGoqEWc1FxIgAwNYIUZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1644333157!32796!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31663 invoked from network); 8 Feb 2022 15:12:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 15:12:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E917D100450
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 15:12:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DCA8B10044C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 15:12:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 15:12:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 2/2] ntopng: upgrade 5.0 -> 5.2.1
Date: Tue, 8 Feb 2022 23:12:07 +0800
Message-ID: <1644333127-6545-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644333127-6545-1-git-send-email-wangmy@fujitsu.com>
References: <1644333127-6545-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 15:12:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95262

change configure.seed to configure.ac.in
refresh 0001-Makefile.in-don-t-use-the-internal-lua.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...kefile.in-don-t-use-the-internal-lua.patch | 12 +++++-----
 ...configure.ac.in-fix-configure-error.patch} | 10 ++++----
 ...figure.ac.in-fix-host-contamination.patch} | 24 +++++++++----------
 ...igure.ac.in-not-check-clang-on-host.patch} | 10 ++++----
 .../ntopng/{ntopng_5.0.bb => ntopng_5.2.1.bb} | 12 +++++-----
 5 files changed, 34 insertions(+), 34 deletions(-)
 rename meta-networking/recipes-support/ntopng/files/{0001-configure.seed-fix-configure-error.patch => 0001-configure.ac.in-fix-configure-error.patch} (84%)
 rename meta-networking/recipes-support/ntopng/files/{0001-configure.seed-fix-host-contamination.patch => 0001-configure.ac.in-fix-host-contamination.patch} (81%)
 rename meta-networking/recipes-support/ntopng/files/{0001-configure.seed-not-check-clang-on-host.patch => 0001-configure.ac.in-not-check-clang-on-host.patch} (83%)
 rename meta-networking/recipes-support/ntopng/{ntopng_5.0.bb => ntopng_5.2.1.bb} (83%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
index 0f1ca8d324..bb5bcfbd63 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
@@ -15,18 +15,18 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index e67623bec..99cb9f06e 100755
+index d737e74..a611b16 100755
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -31,7 +31,6 @@ MONGOOSE_INC=-I$(MONGOOSE_HOME)
- LUA_PLATFORM=generi
- LUA_HOME=${PWD}/third-party/lua-5.3.5
+@@ -36,7 +36,6 @@ MONGOOSE_INC=-I$(MONGOOSE_HOME)
+ LUA_PLATFORM=generic
+ LUA_HOME=${PWD}/third-party/lua-5.4.3
  LUA_INC=-I$(LUA_HOME)/src
 -LUA_LIB=$(LUA_HOME)/src/liblua.a
  
  ifeq ($(OS),Linux)
  	LUA_PLATFORM=linux
-@@ -123,7 +122,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
+@@ -102,7 +101,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
  RPM_DATA_PKG = $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
  ######
  
@@ -35,5 +35,5 @@ index e67623bec..99cb9f06e 100755
  ifneq ($(HAS_ZEROMQ), 0)
  LIB_TARGETS += $(ZEROMQ_LIB)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
similarity index 84%
rename from meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
rename to meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
index dffab24ca2..d4908e3227 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
@@ -1,7 +1,7 @@
 From 29797dd037009d38e4976249ed21b2076240751e Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 4 Nov 2020 04:36:46 +0000
-Subject: [PATCH] configure.seed: fix configure error
+Subject: [PATCH] configure.ac.in: fix configure error
 
 fix the below error:
 configure: error: cannot run test program while cross compiling
@@ -10,13 +10,13 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.seed | 13 +------------
+ configure.ac.in | 13 +------------
  1 file changed, 1 insertion(+), 12 deletions(-)
 
-diff --git a/configure.seed b/configure.seed
+diff --git a/configure.ac.in b/configure.ac.in
 index a321f9bbf..03f9a31b0 100644
---- a/configure.seed
-+++ b/configure.seed
+--- a/configure.ac.in
++++ b/configure.ac.in
 @@ -642,18 +642,7 @@ if test x$radcli = xtrue; then
    fi
  fi
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
similarity index 81%
rename from meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
rename to meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
index 02cd94a06c..5e1440b3d6 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
@@ -1,7 +1,7 @@
 From d9458227ddb4bbb8c63c607202a6854886d66090 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 4 Nov 2020 06:28:28 +0000
-Subject: [PATCH] configure.seed: fix host contamination
+Subject: [PATCH] configure.ac.in: fix host contamination
 
 Fix below error:
 This autoconf log indicates errors, it looked at host include and/or
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.seed | 43 +++----------------------------------------
+ configure.ac.in | 43 +++----------------------------------------
  1 file changed, 3 insertions(+), 40 deletions(-)
 
-diff --git a/configure.seed b/configure.seed
-index a148c530a..55bd49678 100644
---- a/configure.seed
-+++ b/configure.seed
-@@ -144,31 +144,6 @@ fi
+diff --git a/configure.ac.in b/configure.ac.in
+index 1d6380c..beffc6c 100644
+--- a/configure.ac.in
++++ b/configure.ac.in
+@@ -167,31 +167,6 @@ fi
  #
  REVISION=`git log --pretty=oneline | wc -l`
  
@@ -28,7 +28,7 @@ index a148c530a..55bd49678 100644
 -fi
 -
 -if test -d "/usr/local/lib"; then
--  LDFLAGS="${LDFLAGS} -L/usr/local/lib"
+-  LIBS="${LIBS} -L/usr/local/lib"
 -fi
 -
 -if test -d /opt/local/include; then :
@@ -37,7 +37,7 @@ index a148c530a..55bd49678 100644
 -fi
 -
 -if test -d /opt/local/lib; then :
--  LDFLAGS="${LDFLAGS} -L/opt/local/lib"
+-  LIBS="${LIBS} -L/opt/local/lib"
 -fi
 -
 -if [ test -f /usr/bin/lsb_release ]; then
@@ -50,7 +50,7 @@ index a148c530a..55bd49678 100644
  SHORT_MACHINE=`uname -m | cut -b1-3`
  
  GIT_RELEASE="@GIT_RELEASE@"
-@@ -293,23 +268,11 @@ fi
+@@ -300,23 +275,11 @@ fi
  pkg-config --exists libssl
  if test "$?" -ne 1; then
    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
@@ -76,7 +76,7 @@ index a148c530a..55bd49678 100644
 +  exit -1
  fi
  
- AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LDFLAGS="${LDFLAGS} -lgcrypt"])
+ AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LIBS="${LIBS} -lgcrypt"])
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
similarity index 83%
rename from meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
rename to meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
index 80761abd53..ffb106723c 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
@@ -1,7 +1,7 @@
 From 5867be19e53a3cc09730b83282c83bdd26147cc3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 9 Nov 2020 04:05:25 +0000
-Subject: [PATCH] configure.seed: not check clang on host
+Subject: [PATCH] configure.ac.in: not check clang on host
 
 Don't check clang on host to avoid host contamination.
 
@@ -9,13 +9,13 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.seed | 16 ----------------
+ configure.ac.in | 16 ----------------
  1 file changed, 16 deletions(-)
 
-diff --git a/configure.seed b/configure.seed
+diff --git a/configure.ac.in b/configure.ac.in
 index 55bd49678..94bc0bc48 100644
---- a/configure.seed
-+++ b/configure.seed
+--- a/configure.ac.in
++++ b/configure.ac.in
 @@ -90,22 +90,6 @@ if test $SYSTEM = "FreeBSD" || test $SYSTEM = "Darwin"; then
              CFLAGS="-fno-color-diagnostics $CFLAGS"
        fi
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.0.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
similarity index 83%
rename from meta-networking/recipes-support/ntopng/ntopng_5.0.bb
rename to meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index c4b8db3889..63046e730e 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -11,15 +11,15 @@ RDEPENDS:${PN} = "bash redis"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "85867090d92df4365c0af8d47f54ab3106117e59"
-SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.0-stable \
-           file://0001-configure.seed-fix-configure-error.patch \
-           file://0001-configure.seed-fix-host-contamination.patch \
+SRCREV = "d3ce78948e8d81dc1e2c5298ce556f9f2247aac1"
+SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
+           file://0001-configure.ac.in-fix-configure-error.patch \
+           file://0001-configure.ac.in-fix-host-contamination.patch \
            file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
            file://0001-autogen.sh-generate-configure.ac-only.patch \
-           file://0001-configure.seed-not-check-clang-on-host.patch \
+           file://0001-configure.ac.in-not-check-clang-on-host.patch \
            file://ntopng.service \
-"
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


