Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0586BC433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:31:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.29556.1652085101184164977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wp2w7XGT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085099; i=@fujitsu.com;
	bh=SPxKlNK9t/J85AghRoMfUu1MY/1MNrVwtVuA6xP3x3w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wp2w7XGT4r4nnz5SfvDyWwD06KChs4lSJ78uy8VBGaPMwd718Ze3xgnXIa0vy9/Wu
	 bU/tBQ5OdQzmJbeHkuGPArEnkJ18NVokLCP1kYwT8acKdkot2jX1kEZcrGDdFp2ypK
	 qzRi1tc7u2FQM713TAbBXiXx7SUJKAY1zIERnJgWnMoH4kNqXrYDg1jw7zlIF9gwFD
	 dPU+FYZvS+TYFuVpXQusuq3pmCeKgaukASP1SUu3xvS7ohnvX8o+TX+4Qc851FMImu
	 aso/eIQxOAxFrkaT3M2krXw7kmjnoEkUuNEClbCiLvXXW/JsMC/9GOEJXrgClO1Y6Y
	 2W6mfl7MH00AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSTfrYkW
  SwZylphYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bWtnlsBYu5Kj72fGdqYPzB0cXIySEk8IRR
  Yuv8jC5GLiD7ApPEgs1fmCGc3YwSb/fvZAOpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAVWLJme2MIDaLgKrEt31rweK8Ak4SrQc+gM2REFCQmPLwPVgvp4CzxOLmXnaIK5wk+l
  uamCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6Boamuqa6RoZGuglVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcUox26UdjHP7fuodYpTkYFIS5a1sqkgS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMEbcg4oJ1iUmp5akZaZA4womLQEB4+SCO/dE0Bp3uKCxNzizHSI1ClGXY67C/fuZRZiyc
  vPS5US5711HqhIAKQoozQPbgQsui8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub1vQA0hSc
  zrwRu0yugI5iAjvgYUApyREkiQkqqgclr07Z44RquTmmlkjUJIXNmecVKbgsumH7qVzpXRuY+
  q13fXl7+u6Hc/dyHe6eLDl96VchzXJRLpORCaaepQ+mE7QF75229X9z7Xrv6n/HMIFWO10KhX
  +5uY119T4+PsVB+8sXC0nkvvuZYGvw2nX372Qru9yv/H32Y9bvkXLrh7fI5Gv/D3ii+OnKlRc
  Z+9ZXH17xkFzZkJUdo7p3+olWv9a0m96zr3ku0Oy8ZmEr3ei4QWj/TdVOf3mLD7KD5ixLyDvM
  an/G0vD91v1zN9daczAVK/w+v4L/77/ycO4q8TW1V3u8LDxhI97vM1Q1wvusrJ/wl8MQyx9q5
  ktd2vCsMNOItmhU6JWNBhIbQi49KLMUZiYZazEXFiQBiQEtKaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1652085098!318040!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11270 invoked from network); 9 May 2022 08:31:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:31:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 639FC10044F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5704010033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:31:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] stunnel: upgrade 5.63 -> 5.64
Date: Fri, 29 Apr 2022 16:13:13 +0800
Message-ID: <1651219993-27514-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
References: <1651219993-27514-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:31:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97006

Changelog:
==========

    Security bugfixes
        OpenSSL DLLs updated to version 3.0.3.
    New features
        Updated the pkcs11 engine for Windows.
    Bugfixes
        Removed the SERVICE_INTERACTIVE_PROCESS flag in "stunnel -install".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.63.bb => stunnel_5.64.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.63.bb => stunnel_5.64.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.63.bb b/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.63.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.64.bb
index 325737e8c..13ecd5c5b 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.63.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "c74c4e15144a3ae34b8b890bb31c909207301490bd1e51bfaaa5ffeb0a994617"
+SRC_URI[sha256sum] = "eebe53ed116ba43b2e786762b0c2b91511e7b74857ad4765824e7199e6faf883"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


