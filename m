Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB275C4708E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.7760.1649747006456908825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ht8POHgK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649747004; i=@fujitsu.com;
	bh=ADoU0CSt3aBbIXZ9l7k62NeJkRGxbwOgG3q5CSonIJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ht8POHgKN0IKmKzDcySJMbE+aQkUB+ZbJYLsieO5cxRTnVp7ZoT4WL4OjzZ/qggx5
	 8fatpljUEtfIhFm1KNSSpOZNuRCWj/XQy2ioNkZfpG2CbOJMebledp4PGLErS46cFB
	 EL4ehDB+6PLRVuLEuKENubh4GsKxfX5OsttYhNh89znR1kDwouGIiUpH0UTuZJ1Bzg
	 yNZjkTxEK5YFe6TlIEZ1JkACAQV6CB+6m95bKX3cYFGIA1PO/SnwQ9okXIeeevmrxl
	 JBfK9qGAS2q72r+nuqBnsk8Ir+U+7SMSlUKR34xA6TMYhSToV8Ll0Zfx9B7HNKw0gt
	 +TC1Cuj3xNGHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSddGJTT
  J4OcBJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP4/k+MBS0cFW/bljM1MC5l72Lk4hASeMIo
  MfNgKwuEc4FJYvGjq4wQzh5Giasd+1i7GDk52ATUJKbfugFmiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCQOLh4EyOIzQIUXzTvEFicV8BRYtLBD2BxCQEFiSkP3wP1cnBwCjhJLJnvCxIWAiqZ8v
  wqE0S5oMTJmU9YIMZLSBx88YIZolVRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU10TIMtQL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4pRiltQdjH19P/UOMUpyMCmJ8hrwhCYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uBVVgbKCRalpqdWpGXmACMKJi3BwaMkwvtdASjNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qV
  LivOEgMwRAijJK8+BGwKL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXjuQKTyZeSVwm14
  BHcEEdETotkCQI0oSEVJSDUzzvvfJMs/J9Kmt7Zn/MbRvq3NabE3tsYdXG22cNm68HbhHOf5j
  3rY1BhM1Fmp0bZ3oLRSlVlj+xXB5+NSPt3j8eF9dKS9l6fvzYHngJH59zbnqFll3ag1yfp3wf
  PLnpPfMoAOW8rbsb/sWdz5ybPryTp5B/0RJYkSFq4fO9UylCGE/rn/c5st+/ufwyZOu+T4pUK
  XlxcdAzwT93pa5n7Km7Pqr+eyX2RPm4t9xy749mMa2pnZnhPqXVb5/irTnXXH9viDmhuCvlY/
  YNe8EJqz9c1TM4f3/4xfDWP+sYObk+NFess5h5fHmA7mZSjmbXs6eqBm+fK7Uheb4L/lL1LRU
  7l9xDrm3ue28k+a3UwFKLMUZiYZazEXFiQCTN024aQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1649747003!40623!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3030 invoked from network); 12 Apr 2022 07:03:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 07:03:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 88BB310045A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:03:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7C06F100047
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:03:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 08:03:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.25.7 -> 1.30.2
Date: Sat, 9 Apr 2022 21:59:34 +0800
Message-ID: <1649512774-4814-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649512774-4814-1-git-send-email-wangmy@fujitsu.com>
References: <1649512774-4814-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96581

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.25.7.bb => nbdkit_1.30.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.7.bb => nbdkit_1.30.2.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
index 7eb99c1335..da24b1efd6 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "babc2e2717c9025392dce613006a6ecae5886a57"
+SRCREV = "b59380e061fdf0f114c13c226ea2a508f2c067d0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


