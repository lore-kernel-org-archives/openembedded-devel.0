Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD23C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:03:26 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web12.7702.1637593405107621067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T3wUdeDP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593403; i=@fujitsu.com;
	bh=M9lfC7Rf1xlTqaCPLuMtn/7nF6GKguAfsI3tg5f2hsw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T3wUdeDPM+sAqcqxDDyQrASzRtb/ESfCZnlV5ZI1DqOhHLNB+F3ByJY8sSM6bO3Xe
	 uX1z1Qd2TrF2qXVUkxVC7eXvyEB+/XP2NtexspV0UaAb/aXkaYNZ7L8xr0SX0ZKHXh
	 C3NfF0Q9yvaIJEZOpTYFGYzHrzqGG8k3ZME8ZzT3bVeyn5wX3+WdnsugZD3oqeSv6s
	 SUNpLiTC0CmBA33UTx7NIS759/ddE55eBJ2qp0oSKyV8Uc51I+XolwJpKa8H+odDmM
	 Z/VL9qSsbk3LZHk+s6eIvfUwhjvbGAmXS+9IHKjbnfkUesfLSG+agxWYAXDpJ8RcnG
	 0cL/PCNb+nKXA==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 42/3B-08711-B31BB916;
 Mon, 22 Nov 2021 15:03:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxVdd64+x
  Eg8vnOS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyvO06wFVzmqDh4oryBsY2ji5GLQ0hgJpPE
  hkOHGSGcE4wSD86vYOpi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8edhBbWCBW4tm5Z
  jYQm0VAVeJO43qgOAcHr4CTxK99qSBhCQEFiSkP34O1cgo4S9zasZgNpEQIqORJVxVImFdAUO
  LkzCcsENMlJA6+eMEM0aooMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0SKpKDM9oyQ3MTN
  H19DAQNfQ0EjX0NJc19DYXC+xSjdJL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBRTCo52
  7mD89eqD3iFGSQ4mJVFeo9mzE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8D5eB5QTLEpNT61Iy
  8wBxgVMWoKDR0mE1wEkzVtckJhbnJkOkTrFqMvxZdWSRcxCLHn5ealS4rysG4CKBECKMkrz4E
  bAYvQSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeDJApPJl5JXCbXgEdwQR0xOnj00GOKEl
  ESEk1MHGmXl0QOFPwVM8OYa72wzZJ7yPmzzxRVVrSeEBn+7MIDZXvVj/CiyTu1XGUZa1UMKpf
  r1WjX9qxuJ5/dXqOYEGc6tL7gr+3ZWUYLTd2YPq1dN+DuzyGPJl3uvyXGAvtUdrw9lxm2tT5i
  85dXyKQFr1MvqCr+WI8b8yrqiBRhpfybfp3pVfPeFXczlCX+GDy5/P7zUo3Rlw3qmwsf2fwJm
  2FEcM2ncpJZissAm9N+mb4stkt6vpTi+SbTPuSg88nrpVjvH6b87vKu2V7w/1q9Pdf/uyRebB
  mStvf3HCuXGOm7+13Jp9SEwwNjTuo+7ejJ1LC2pv5d2OLx41JcVstHHZ+0S9e1b6Dp+lQ75/Z
  SizFGYmGWsxFxYkAY/Y8fkwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-285.messagelabs.com!1637593402!1091050!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17883 invoked from network); 22 Nov 2021 15:03:23 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:03:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMF3Mxg031167
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:03:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:03:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireguard-tools: upgrade 1.0.20210315
 -> 1.0.20210914
Date: Mon, 22 Nov 2021 23:03:06 +0800
Message-ID: <1637593387-99348-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
References: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94095

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rd-tools_1.0.20210315.bb => wireguard-tools_1.0.20210914.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20210315.bb => wireguard-tools_1.0.20210914.bb} (92%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
similarity index 92%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index f7064d543b..0c686aae2a 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "622408872fd6f3a58e98e88d39d30e98968314fa"
+SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
 
 inherit bash-completion systemd pkgconfig
-- 
2.25.1


