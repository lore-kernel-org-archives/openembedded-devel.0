Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7343BC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:19:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.26633.1640614778565697793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a/egtGx/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640614776; i=@fujitsu.com;
	bh=Qh//pvxWiyeysK9Nbb4+vA4MstxUY1onc+gqTXFMpjg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a/egtGx/CdAx0nyA9RGxlqhBeVFZuOz+GgwfyWFQWIByAhIj0eHZ0CechiqvL/fQz
	 jwrdDAxs4u5H0uRVFJkywA6F9FsTELN5UJ1nHNllDSaMAJx1kNzamu8pPfVdcLsptu
	 hNmbHy67aZqqwLXv+QF3OmrxzrEx4ULHSvd9A8DgqyYHoAMsX9Rpe3q52l/c/q7TiG
	 0V+FFIbQg1V/kv/X50TJCvTmD/nWDgyDnW7kfLVmCvgxIULQXyDpFVwQTTZYB2nDVK
	 BDvs+ZDfWyiIQ4WdXvVikjWUISMnqbeQDu0/17cqvowgGO4FuTqp4VG6QOAjt86lV9
	 QVqxJg+ku0Q4w==
Received: from [100.115.4.164] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 59/FC-30341-87BC9C16;
 Mon, 27 Dec 2021 14:19:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqFtx+mS
  iwf9TPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZDz022guc8FZOn9TA2MB7h7mLk4hASeMIo
  8efpNHYI5wKTxIIl95ghnD2MEqv7lrJ1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAs0TP7P
  JjNIqAq8fTVOkYQm1fAXaJ9/3qwuISAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBFOcAqlGUmD
  1dHqK8QuL14UtQrWoSV89tYp7AyDcLSfcsJN0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGprqGuq
  aWuolVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGXkoxo/UOxo6+n3qHGCU5
  mJREeb9POJkoxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3+BRQTrAoNT21Ii0zBxgHMGkJDh4lE
  V4ZkDRvcUFibnFmOkTqFKMux5dVSxYxC7Hk5eelSonz/joJVCQAUpRRmgc3AhaTlxhlpYR5GR
  kYGIR4ClKLcjNLUOVfMYpzMCoJ8/4BmcKTmVcCt+kV0BFMQEfMdDgOckRJIkJKqoGp5d9rJdO
  r3jKC+eEH12Ub3W4tvTPjQI/yr8SPMdEXF3AJnvvWzRG3Y1WlZ3Oax45pc4Manrx9lF7iEcM6
  SzFod9iXkHrzhF7lRv5Ig+VXPzHwlF+1VT7l+E85fNe++e11an0dlk1vlK//crbStTDVm6l09
  0PbzcNPp6w3v9iS+rdk0V+3/v3y7tt/Wayd8clqW8kqx6PMJa8iNAQZ8+JWfzl72X+2U0Gp0s
  5QxozrM54/5ZQ+7tI4VYmz54jY/AsFKXV2exM/9MR8mJDY0/xDVkiyXz5kV36YEOPxyccXN2W
  d+br3Wue1jN99z2ecLijvUeP8dodjktYxkbTTnSs+y9Uxd7cFcDObV37fW63EUpyRaKjFXFSc
  CAANwP/zRAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1640614775!308634!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13391 invoked from network); 27 Dec 2021 14:19:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:19:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A954E1001A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:19:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 96875100190
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:19:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:19:30 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20210808 -> 20211224
Date: Tue, 28 Dec 2021 07:19:23 +0800
Message-ID: <1640647163-3637-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:19:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94507

License-Update: directory of file changed from "debian" to "package/debian"

Changelog:
==========
 * package/debian/rules: fixes from Debian package for lintian warnings
 * package/debian/control: updates for Debian standard
 * VERSION, package/byacc.spec, package/debian/changelog,
   package/mingw-byacc.spec, package/pkgsrc/Makefile: bump
 * package/debian/docs, package/debian/copyright, package/debian/control:
   errata from Debian package
 * config.sub: alias aarch64le to aarch64

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../byacc/{byacc_20210808.bb => byacc_20211224.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20210808.bb => byacc_20211224.bb} (65%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20210808.bb b/meta-oe/recipes-extended/byacc/byacc_20211224.bb
similarity index 65%
rename from meta-oe/recipes-extended/byacc/byacc_20210808.bb
rename to meta-oe/recipes-extended/byacc/byacc_20211224.bb
index eeed39f63..85e507271 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20210808.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20211224.bb
@@ -4,7 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=80ce98c6ab91cc4a93a9d2cfb7c14463"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=e13dd32663e3159031608d536530a080"
 require byacc.inc
 
-SRC_URI[sha256sum] = "f158529be9d0594263c7f11a87616a49ea23e55ac63691252a2304fbbc7d3a83"
+SRC_URI[sha256sum] = "7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8"
-- 
2.25.1


