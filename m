Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.3418.1620958359879136290
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WcEWIxli;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958357; i=@fujitsu.com;
	bh=/whbxGhgxiybpKpHSLVhgtwKxFTAKLAACOh2phCQvrg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WcEWIxliNxE4Lfke3pPadh6zG/a38DisbBsMC9pC1YB5bjS2VEaGzRmMdP+1iCD1t
	 6c6pKZ0R/znkq9uqbqPwfL7HP23+iV9UPt6+bWVOJ1D29P1IJkQ/aIi+p2Ohp61tjh
	 tbCsg9yH6IuRpbBF8B2Wl+25mt6fb7FinYMqTXq0tP8+9v4IiFw8C3CND1/EwD3fzk
	 2Mi/DGNF00JFTbDwMCr6t3m+x+Pgg0peC+8PLqvX0N6bGpCIvU+7cPipbbtDoDwjdO
	 nKCIHwt+SsQg4ZWtL4go2iQytxM4mVNf6by+cwIBEvt9DjKcI3FwMgheYhFJq8mngt
	 OnW2+M5QS1lmA==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 91/01-27560-59CDD906; Fri, 14 May 2021 02:12:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxRXfKnbk
  JBlOXW1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlL521kKzilWLFm032mBsYnsl2MXBxCArOZ
  JI42bGWGcI4zShzsWcHWxcjJwSagI9HxopsFxBYR0JdYOnsPM4gtLOAn0b3tIzuIzSKgKvF79
  xKwGl4BN4k395czgdgSAgoSUx6+Z4aIC0qcnPkErIZZQELi4IsXzBA1ihLbd55hgbArJGbM2M
  Y2gZFnFpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0BGIjM73EKt1EvdRS3fLU4hJ
  dQ73E8mK94src5JwUvbzUkk2MwEBKKThQt4PxwesPeocYJTmYlER5T3rOThDiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwfv91twEIcGi1PTUirTMHGBQw6QlOHiURHj/gKR5iwsSc4sz0yFSpxjDO
  d6sXbKImeMtmGy7dxdItoPJmQsOrmbmmAUm77cfApIPQKQQS15+XqqUOK/wbaBxAiDjMkrz4J
  bBovYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeqyBH8WTmlcDd9AroXCagc29MnwVybkk
  iQkqqgSl57zlfkW2xz542Pt7M/3Dl1FcJre82NR2pM3tw3K7S1Kh4nXPn2pvXwqaHbT/f991P
  ZUHQXvU2b51/aaGiq45UTu44m35oJV/b1FvFW65vkugoNY9YY5P598fC9pKSBbeD+aojlz34d
  65JecHvWxkHly5fHM287cGTgJkntnEuuXgy5dXE9dOW/1JnYTv6dseXg8cua//37s/jXW1qKz
  IjVGdOaenLwm/5njPXvJBJkDU6923ltevV11k2FEQf+7o8Wmf+3RWKQj2RWilO+2bud1tuv3P
  1r+jl5nKyrM8n5Eu7V/8qnruvXVLjp0bGpuemyzMWOn3lE635IeMQs1iMW9V694En3/iYDy3f
  8ya6S4mlOCPRUIu5qDgRAB4SqItVAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-265.messagelabs.com!1620958356!350905!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31721 invoked from network); 14 May 2021 02:12:36 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:12:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2Cagu010182
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:12:36 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:12:34 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] lksctp-tools: upgrade 1.0.18 -> 1.0.19
Date: Fri, 14 May 2021 10:12:28 +0800
Message-ID: <1620958348-7853-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
Removed since this is included in 1.0.19.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ....m4-make-conpatible-to-autoconf-2.70.patch | 89 -------------------
 ...tools_1.0.18.bb => lksctp-tools_1.0.19.bb} |  5 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.18.bb => lksctp-tools_1.0.19.bb} (91%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
deleted file mode 100644
index 484af4e0fa..0000000000
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From d6d7130f0a2e3b81880fca29966e42c1b2be40a7 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Fri, 8 Jan 2021 22:22:52 +0000
-Subject: [PATCH] m4/sctp.m4: make conpatible to autoconf-2.70
-
-On recently released `autoconf-2.70` generated `./configure`
-fails as:
-
-```
-$ ./configure
-...
-checking for struct sctp_event_subscribe.sctp_stream_reset_event... yes
-checking for gcc options needed to detect all undeclared functions... none needed
-./configure: line 16464: syntax error: unexpected end of file
-```
-
-This happens becuase new autoconf generates less whitespace:
-
-```
-{
-if ...
-...
-fi}
-```
-
-It requires at least whitespace between `fi` and `}`.
-
-As input already has newlines the change just drops extra `{}`.
-
-Tested on `autoconf-2.69` and `autoconf-2.70`.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-
-Upstream-Status: Backport [git://github.com/sctp/lksctp-tools.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- m4/sctp.m4 | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/m4/sctp.m4 b/m4/sctp.m4
-index 6593517..94527a6 100644
---- a/m4/sctp.m4
-+++ b/m4/sctp.m4
-@@ -6,7 +6,7 @@
- 
- # Macros to assist on probing kernel features
- #   Probes if a type is defined
--AC_DEFUN([LKSCTP_CHECK_TYPE], [{
-+AC_DEFUN([LKSCTP_CHECK_TYPE], [
- AC_CHECK_TYPE([$1],
- 	AC_DEFINE([$2], 1,
- 		  [Define if $1 is present.])
-@@ -22,10 +22,10 @@ AC_CHECK_TYPE([$1],
- #ifdef HAVE_LINUX_SCTP_H
- # include <linux/sctp.h>
- #endif
--])}])
-+])])
- 
- #   Probes if a struct has a given member
--AC_DEFUN([LKSCTP_CHECK_MEMBER], [{
-+AC_DEFUN([LKSCTP_CHECK_MEMBER], [
- AC_CHECK_MEMBER([$1],
- 	AC_DEFINE([$2], 1,
- 		  [Define if $1 is present.])
-@@ -41,10 +41,10 @@ AC_CHECK_MEMBER([$1],
- #ifdef HAVE_LINUX_SCTP_H
- # include <linux/sctp.h>
- #endif
--])}])
-+])])
- 
- #   Probes if a declaration is present
--AC_DEFUN([LKSCTP_CHECK_DECL], [{
-+AC_DEFUN([LKSCTP_CHECK_DECL], [
- AC_CHECK_DECL([$1],
- 	AC_DEFINE([$2], 1,
- 		  [Define if $1 is present.])
-@@ -60,4 +60,4 @@ AC_CHECK_DECL([$1],
- #ifdef HAVE_LINUX_SCTP_H
- # include <linux/sctp.h>
- #endif
--])}])
-+])])
--- 
-2.27.0
-
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
similarity index 91%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
index f481ffee1d..5eea5c2089 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "12c74404e09755561dee40cf194954f7ff5afd60"
+SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
 
 PV .= "+git${SRCPV}"
-LK_REL = "1.0.18"
+LK_REL = "1.0.19"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git \
-    file://0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
-- 
2.25.1

