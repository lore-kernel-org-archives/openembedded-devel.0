Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57548C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:14:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.13398.1678428839257607904
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K3TCXUoj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428837; i=@fujitsu.com;
	bh=P8UuLKTo2U6gVB9NfoWcrAmoWULy1eEiMbBaZxbVdVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K3TCXUojd5ad4N2y4r0URbXiYAbajfpGip0LGQmfK0x7sDbaWjdAZF4bktcEzhO1A
	 Sw2U6fUily+HHVnpM9tOL69xabVnXPdE83qDZ9QAm0wkQ8hwPBUrlEypAoEvOat4YT
	 M9ReWtdoCpzMOf5DGILEOFMGdWyVmxG/t1ubRMDXmBPDFfU9wTANAoVWMNieSF+fCr
	 Z7DBGrUeySxnPDvozDSIrjWxg7KkY3/P4Dl6g0vOIqjSc0WRgEAHihLkRgvfZts7Zp
	 XSiZYcP+yKoARTxZsiJPEZNj5yFXaW31IbLvKSCuVcZSslUa3P+15c5KE8S0PJSkkV
	 Nki6j3V/wh/Og==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqLvkFFe
  Kwex9+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atR0+ZCjokKl4v/8DUwHhetIuRi0NI4Amj
  xM7ZU5i7GDmBnOtMEk2bEiESexglTlw/xgKSYBOQkrhx/z8biC0ioC+xdPYesAZmARWJF7972
  EFsYQE3id29J8BqWARUJW6t2wZm8wo4Srw6soIRxJYQUJCY8vA9WC+ngJNEz8RTrBCLHSWunv
  zOBFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpBonH6ICcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNfQUi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHhTilmP72Cc1fdX7xCjJAeTkiivcipXihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  r0ngHKCRanpqRVpmTnASIJJS3DwKInwsu4ASvMWFyTmFmemQ6ROMSpKifOyHgdKCIAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvBMh2nsy8Erjpr4AWMwEt3rWFA2RxSSJ
  CSqqBaV5NfELo291fe9r2vN45hdtl8sKtMuqvO5fPPf/w4burt5Z/mrJw6Yw9fGmVnUbdJovm
  +U4od14/V03kUP0mrpJ2XXvJgsZN6x4K1t7bH9CWa3xDe4OB2CYdy/L2+PMHljB+MDrUNOe1/
  51FKRvTIv9Gxko6+233eRi8SGZSYfZpYW+hrY9U/zDulGp79szdc20A4/vXn4SX2Ndd5vpRsF
  sh5iyn/luZW757pVVCTbddq1il9ik6z/hTXj+ryvfcExEC3L7qt/if8fxdXvvNyOy5mOA5zSU
  1gk1KWXyGG74rSnysOGB6ZKdzpPmfPLvNEw4uizY5qKh5W1z9r4LoDbMfLeeWaTZ11ErKnjqn
  osRSnJFoqMVcVJwIABK0mt5ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1678428836!606309!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15458 invoked from network); 10 Mar 2023 06:13:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:13:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 616FF100194
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:56 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 541DA100043
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:13:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/11] tcsh: upgrade 6.22.04 -> 6.24.07
Date: Fri, 10 Mar 2023 14:13:32 +0800
Message-ID: <1678428812-7622-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
References: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101477

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Enable-system-malloc-on-all-linux.patch
refreshed for 6.24.07

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcsh/0001-Enable-system-malloc-on-all-linux.patch  | 10 +++++-----
 .../tcsh/{tcsh_6.22.04.bb => tcsh_6.24.07.bb}          |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.22.04.bb => tcsh_6.24.07.bb} (91%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch b/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
index ff2f6a3b6..f32d6e150 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
+++ b/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
@@ -13,18 +13,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config_f.h b/config_f.h
-index 6a632a5..0a66960 100644
+index fb9e69b..c207c25 100644
 --- a/config_f.h
 +++ b/config_f.h
-@@ -139,7 +139,7 @@
+@@ -147,7 +147,7 @@
   *		This can be much slower and no memory statistics will be
   *		provided.
   */
--#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__GLIBC__) || defined(__OpenBSD__) || defined(__APPLE__) || defined (__ANDROID__)
-+#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__linux__) || defined(__OpenBSD__) || defined(__APPLE__)
+-#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__GLIBC__) || defined(__OpenBSD__) || defined(__APPLE__) || defined (__ANDROID__) || defined(__NetBSD__) || !defined(HAVE_WORKING_SBRK)
++#if defined(__MACHTEN__) || defined(PURIFY) || defined(MALLOC_TRACE) || defined(_OSD_POSIX) || defined(__MVS__) || defined (__CYGWIN__) || defined(__linux__) || defined(__OpenBSD__) || defined(__APPLE__) || defined (__ANDROID__) || defined(__NetBSD__) || !defined(HAVE_WORKING_SBRK)
  # define SYSMALLOC
  #else
  # undef SYSMALLOC
 -- 
-2.12.1
+2.34.1
 
diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
similarity index 91%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
index 49d7c3f75..f136c06b7 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
@@ -13,8 +13,7 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[md5sum] = "fa2b347fa9ae866eb036e6e4bb85fe1a"
-SRC_URI[sha256sum] = "eb16356243218c32f39e07258d72bf8b21e62ce94bb0e8a95e318b151397e231"
+SRC_URI[sha256sum] = "74e4e9805cbd9413ed34b4ffa1d72fc8d0ef81a5b79476854091416ce9336995"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.34.1


