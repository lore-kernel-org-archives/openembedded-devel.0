Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BBC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:28:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.16758.1673414925128051392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qOonGB7L;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414923; i=@fujitsu.com;
	bh=YNZxeHjZMR2KwYi2ANo3pESZkfUDvUoiwjnW0bd4tPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qOonGB7LibdKKZB9RAYp/pFiBIRlFcntjyKQ/eotPwlnc+nrIbfPKhVqxctVLiGXR
	 n+dPH+i5RQiEAOjrCF5QEVJyjYQva9V2pm+YbqSpTkzS7F4A3zyEHdIj1F3FEBtm7f
	 dOnXrjFb61bVNSPz6bmPSz6GwozfILZU2kwGXfRMu73umrGXo1CYlnAKi/ZhnTHaMP
	 +LeJYqz3W7szCHFsVpxNWUbOOXzLMF+OMu1NxhiVmOMFWgpP5mI/Ys5r/wa1DVje+d
	 JXMbav8o8B4pR20pb8/F7AmgSijpEkw4A/aQsx2kygTTEmgPo4hQdZddCmIrk7n7he
	 pcvZiAmT5O4Gg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSZfLc1+
  ywZx+PYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd7J9sBZ2cFRubD7I3MK7l6GLk4hASeMIo
  8enuViYI5waTxOfGmWwQzl5Gia9P/7B3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICfxKRpJ1hAbBYBVYlTv5eB1fMKOElMur+MEcSWEFCQmPLwPVAvBwengLPE2y0SIGEhoJ
  LG4zvYIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpGhrrJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0qx4owdjP+W/dE7xCjJwaQkypsnsS9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSviitQTrAoNT21Ii0zBxhJMGkJDh4lEd5aR6A0b3FBYm5xZjpE6hSjopQ4r7M7UEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZmdgabwZOaVwE1/BbSYCWjx4a69IIt
  LEhFSUg1MDk09a3tSG++KdsULKcV87T21pGibTJpdVE39nt1L+bd+d7b/yil7OuRPWMaTi5OT
  LkV5m5x0Ob3JZ9I9pq2uFe0C+jvLHzN80P2gcK5mIrunNteSb2GPEqrZ1soWcrtwW0xtzxP0T
  9waERNUtXnep6joYhFLJf8dFx5M46pZPafjl8UTi8PyG5OW9/hzy+5YfC5CIPtfTI2J8L0jEr
  GpO8V2ri0/U1Fopiqdtd+w9vfMr5EpT0u+O7l+emOi2rzae28V12oVob5dt1aYPio5k+Zy6ac
  bSy7HLJXCPhG5S0emPfddFCmgL9cc+Xf35z6e6W2R15/7K557ZNE3/9iFthMJzCY+cQ/t000d
  HimxFGckGmoxFxUnAgA75JUKWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1673414922!40067!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29958 invoked from network); 11 Jan 2023 05:28:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:28:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 779441000DC
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6B5151000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:28:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.5 -> 3.0.6
Date: Wed, 11 Jan 2023 13:28:17 +0800
Message-ID: <1673414898-13896-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414898-13896-1-git-send-email-wangmy@fujitsu.com>
References: <1673414898-13896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100540

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Added simulated worksheet :func:'autofit' method.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.5.bb => python3-xlsxwriter_3.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.5.bb => python3-xlsxwriter_3.0.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb
index e64463edc..2b32c0f59 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.6.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "fe2b1e2dec38ef8952e9a41a0290861a052e6771a9f43f5e3d56dc63b7112348"
+SRC_URI[sha256sum] = "2f9e5ea13343fe85486e349d4e5fdf746bb69dc7bc1dedfa9b5fae2bb48c0795"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


