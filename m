Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4D1C6FA86
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:02:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.22580.1662368559834825628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CO07xjE1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368558; i=@fujitsu.com;
	bh=Iy8fgKxw5iQ80UQ8Q/1i15mP1XnMIYp0FwlCW8kR4L4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CO07xjE1NHP3RauXTn9t3yqnRwNrLt6LkW/W/NrCUrZFgcTiCKbakPrtuccjFX3VA
	 ZyqFhkBzTTO/h9n4OCi/0E+PbLsXBdkkhJuo7eGKaouFEUMG4huQOxNtbZGO/w+3WW
	 0RgTvumtOMUabzV3WJadNkdhzRT7HV63eBMpQsLrLKBx24ikZhzLMmXjArjINdW95V
	 6zlodmF5XsSy49WN0pNbrVgCpgI6EBm4xp+uinXXjn11E0LFJ9vWRmmQ5jWm5kYA0K
	 2ER4K8qGX9XZes6TWBXfej9n9n+b/jK+boIamtfAzHEyNP9HwTBQKsoaonEqKKlJ3C
	 i627zl4fRQxNA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSVd3t2i
  ywaZflhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBtVuZCnZLVlw/85u1gXGmWBcjF4eQwBNG
  id7931khnOtMEn+2XoBydjNKfNu2mKWLkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFLidM/H4LFWYDiWx80soHYvAJOEsdfLGMCsSUEFCSmPHwPVMPBwSngLHGlyQ0kLARU8v
  jVC0aIckGJkzOfsECMl5A4+OIFM0SrosTsy80sEHaFROP0Q1Aj1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1NtI1tLDUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOOUYoW9Oxgvr/ypd4hRkoNJSZT3/RzRZCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvCt3AOUEi1LTUyvSMnOAMQWTluDgURLh9V8HlOYtLkjMLc5Mh0idYrTnmDr7335mju
  VgcubXtgPMHJv2dR1gFmLJy89LlRLn3QQyVQCkLaM0D24oLAVcYpSVEuZlZGBgEOIpSC3KzSx
  BlX/FKM7BqCTMywUyhSczrwRu9yugs5iAzrLrEwY5qyQRISXVwBQao5lu8Vb/k9GbzQZSpwyP
  dy8tNn4tx3Ig6231EunF73ccuzzpyVcBOz87jw5Ov2sFWXUTpO9t+lNa9knpgU7V7qu2x3IXf
  /jiddFMcYVG4fKq6zO4S9bUyokf/TG5/ZdwOY9ee2X1lF8vi+Pb988RTYrpflmzsGKxhXuyy8
  Mquzmhk2SfyN5+WrTu95cNjUcVJk859O7Q7V1bLWZdPXCj43PHCXnl7uMu1dcENL96OV9cG6+
  aOYu393dk89PjvQLxZc/Z7jP3bn7uVG+9dUf2i+dNYo0HGzkCy67O4C6NPWg661/6JIttu63e
  eIcsSzvklpY3n/9mlG/2rJVFUwxz+3wV3qTlnC7/3DSvrk+JpTgj0VCLuag4EQBzHlE4fAMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1662368557!898857!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8733 invoked from network); 5 Sep 2022 09:02:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:02:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9E9E8100078
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 920DD1000E7
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:02:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.31 -> 3.32
Date: Mon, 5 Sep 2022 17:02:09 +0800
Message-ID: <1662368529-32226-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
References: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 09:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98663

0001-io_uring-Replace-pthread_self-with-s-tid.patch
removed since it's included in 3.32

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ring-Replace-pthread_self-with-s-tid.patch | 45 -------------------
 .../fio/{fio_3.31.bb => fio_3.32.bb}          |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch
 rename meta-oe/recipes-benchmark/fio/{fio_3.31.bb => fio_3.32.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch b/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch
deleted file mode 100644
index 766b1fe274..0000000000
--- a/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 269164337e0168b93661bb95c6a4e462ae6d8b61 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Aug 2022 18:08:53 -0700
-Subject: [PATCH] io_uring: Replace pthread_self with s->tid
-
-__init_rand64 takes 64bit value and srand48 takes unsigned 32bit value,
-pthread_t is opaque type and some libcs ( e.g. musl ) do not define them
-in plain old data types and ends up with errors
-
-| t/io_uring.c:809:32: error: incompatible pointer to integer conversion passing 'pthread_t' (aka 'struct __pthread *') to parameter of type 'uint64_t' (aka 'unsigned long') [-Wint-conver
-sion]
-|         __init_rand64(&s->rand_state, pthread_self());
-|                                       ^~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/axboe/fio/pull/1455]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- t/io_uring.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/t/io_uring.c b/t/io_uring.c
-index 35bf1956..f34a3554 100644
---- a/t/io_uring.c
-+++ b/t/io_uring.c
-@@ -799,15 +799,14 @@ static int submitter_init(struct submitter *s)
- 	int i, nr_batch, err;
- 	static int init_printed;
- 	char buf[80];
--
- 	s->tid = gettid();
- 	printf("submitter=%d, tid=%d, file=%s, node=%d\n", s->index, s->tid,
- 							s->filename, s->numa_node);
- 
- 	set_affinity(s);
- 
--	__init_rand64(&s->rand_state, pthread_self());
--	srand48(pthread_self());
-+	__init_rand64(&s->rand_state, s->tid);
-+	srand48(s->tid);
- 
- 	for (i = 0; i < MAX_FDS; i++)
- 		s->files[i].fileno = i;
--- 
-2.37.2
-
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.31.bb b/meta-oe/recipes-benchmark/fio/fio_3.32.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/fio/fio_3.31.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.32.bb
index f8d63014ae..90e28340c6 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.31.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.32.bb
@@ -22,10 +22,8 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "6cafe8445fd1e04e5f7d67bbc73029a538d1b253"
-SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
-           file://0001-io_uring-Replace-pthread_self-with-s-tid.patch \
-           "
+SRCREV = "db7fc8d864dc4fb607a0379333a0db60431bd649"
+SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


