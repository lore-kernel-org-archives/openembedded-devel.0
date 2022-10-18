Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EA6C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:07:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.1698.1666055218171852323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RDUXZgwD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055216; i=@fujitsu.com;
	bh=87nFM01dNvIHwHjhPPP6dXRZffesV8Yg5bQCxN6qQOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RDUXZgwDb3IxZ78pZLFHSV0U6bJ6zClNN17CpIU7Om/V76bJ089ehYS80IEw1fJkh
	 Cgbjze6OvXwkawO1Y0E7TbuQ9okvG4LqMn/VRfr0GVSPtvqC19wG0siZqX+WLCJUgi
	 yuPURBql1zZ/lzBQ+EJzoVQ4cni/iuKWT3gayRJz4zvt9U0e+1fUv4ZPsQnSRRnApm
	 jMJ/9scfkBDk7awtaAIIBeX/SaSOurpEvn4cFfVuOyaCn+tmbQ0KglzgES29xvbLyn
	 aycpKTMaoY1wB69YgDbvj1HDkwErJdhnF1NV3Rd6r2nUPdtXKoAFujn/3vR8azOJ0M
	 gVciDKMqFE5pA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpKv7xzf
  Z4NBaXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP9zV/WgoW8FY9u/mNrYLzF3cXIxSEk8JBR
  YkfLZHYI5wqTxMKd+1khnD2MEn8v3GTpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qBuDg5hAXuJjpYCkDCLgKpE76EpjCA2r4CjxIEnP9hAbAkBBYkpD9+DtXIKOEn8a3oIZgsB1U
  y8tIAFol5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNZcWpRWWqRrqGZXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZg8KYUMz3fwXh22R+9Q4ySHExKorwdM3yThfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwdvwAygkWpaanVqRl5gAjCSYtwcGjJMIbdQYozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  QpcV7D30BFAiBFGaV5cCNgUX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvm59AU3gy80r
  gNr0COoIJ6IiM/V4gR5QkIqSkGphalKs+vy4s0lNiUTWVNl32XL7Ge0lBqLDqonTGvt0e0r9P
  7/Ev3pL/+8IMfwW3V4t7NR5t0bOY07zy2BeOxc7RX9bfnnR6/YVPRjIzJgYUF0YZqB6si39uN
  fUv546cre9/8cf/Wnw5Pniy0pLqY1VzRDxKXaOjrrxem1Ij4tAmnPfII7Fj1d7bf8UexehpfP
  uiyff3ikb77vJLW3pPPXp6KyhTqcHhX8qRuOfW/hrqE4/EHHn4wJPnebfmd05lOZ2/z1o2XJh
  qskhwx12TWZJH1p0NZr9Um1p0M7dLgyvyJefDprNbr0Tlh67ILj4ySeJgRMAb4wNxYnFJ75lq
  Vnrv3ybvtPz4/T8bGN6HWSQrsRRnJBpqMRcVJwIAHYpIXGUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1666055213!282664!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27567 invoked from network); 18 Oct 2022 01:06:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:06:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 57EE31AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4D1D81AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:06:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.8.0 -> 2.8.1
Date: Tue, 18 Oct 2022 09:06:16 +0800
Message-ID: <1666055176-8001-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
References: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99211

Changelog:
============
Notewhorth changes:

Fixed CVE-2022-39282
Fixed CVE-2022-39283
Added missing commit for backported #8041: Remove ALAW/ULAW codecs from linux backends (unreliable)
Added hash checks for android build script dependencies
Fixed issues:

#8190: Fix build break with newer FFMPEG versions
#8234: Updated flatpak with build script
#8210: Better execinfo support check for android
#7708: Header now defines DumpThreadHandles
#8176: Check fullscreen state and not setting
#8236: Send resize on window state change
#7611: Audin macOS monterey fix
#8291: Android build script update
Fix length checks and initialization in the deprecated (disabled per default) tsmf channel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.8.0.bb => freerdp_2.8.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.8.0.bb => freerdp_2.8.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb
index 33782e56b7..5f539671bc 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "e3fc97feb512053189e276b2ca79762990bb8c4c"
+SRCREV = "0ad3f49f0e7eb78586acc6bf6e4605f96f88954e"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


