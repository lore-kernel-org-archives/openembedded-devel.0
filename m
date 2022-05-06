Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6753C4332F
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:09:11 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.30236.1652713749734820343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Wb1sZMqd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713748; i=@fujitsu.com;
	bh=1GVk1zNpUZdIiRtat3OmNzU3V8zRH+q23CywU+WcI1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Wb1sZMqdGx7vb1rKU0+Ygdcl6DDGlo39GICv+eJJL/mxBJaFq8BSasKYI9QrNJfoS
	 /EWMdY+Wa+q0c/VrgWbBqnDqmQYM/IAG0xeHP9+4YtGceF+Lc8JdX4y2ubvRNytLQ9
	 UOBwgwOL7UELgkaWF1/mbBEy+EVcIzLTJSTO6bdDOO8xdM2Loe3FPvX+FMh9W76zxU
	 7iod2pnR3KpZ5HSuSQa9KfAzj38ydBZMqBQTS4WNTiLMWdaUUdg5E7bYexaXfNAjnE
	 9swBo4sysL05CkT8C+hJImrSSTMIegnLOTOrb2iFUGzhJhwwUqGYySQG09N28D2Uo4
	 X49c4QFpPXhpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqCuc2ZR
  k8GSvlsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFv3Q7WglXsFb+Oz2NtYDzL1sXIxSEk8IRR
  onPHNCYI5wKTxM3ru1kgnD2MEtObnjN3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBaYtrJGSwgNgtQvGvye6A4BwevgJNE48MikLCEgILElIfvwVo5BZwlti3cC1YuBFSyfN
  IXsPG8AoISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMdolFWWmZ5TkJmbm6BoaGOgaGprqmpnpGloa6iVW6SbqpZbqJqfmlRQlAqX1EsuL9VKL
  i/WKK3OTc1L08lJLNjECgzml2Gn/DsanfT/1DjFKcjApifKuSW5KEuJLyk+pzEgszogvKs1JL
  T7EKMPBoSTB25AGlBMsSk1PrUjLzAFGFkxagoNHSYT3eDxQmre4IDG3ODMdInWKUZfj7sK9e5
  mFWPLy81KlxHlPJgAVCYAUZZTmwY2ARfklRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8yhl
  AU3gy80rgNr0COoIJ6AgR/UaQI0oSEVJSDUzTtfR3PNI71BZ4SeWO/lkF51nNh3vYPhfuNOJZ
  d3bRimka51ecY/syVaXkaXOWYNmzjwkzW29wX5Cc8YWrwKrpZ/PFML5L+yMmyfk5Xm24MLfz3
  M8NOaEiNe5OtjMmO/vGvT1lau8lr6z3mWnLGz/tz6eU0kIYMiVNTISTZ97Y9kGFcfWWKKGJk4
  0N+m+LrW04FmkwRSU68MZxE737+iJWOxt/SJU9m6y68MD7OZ6Lo3JtSk2Wuy/tYBfgTS+VN2S
  UTumccpfNx+5Gn1fpwYgjUf/5/hl6c70+eTmt5NyCCBu5h1cPsEtwcM6dd5Gj+v+e5c2Skdv9
  Nl1Z/Mbd0LsiZOaF3MhTHv7LD68WjFFiKc5INNRiLipOBAD/LFoZbQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-28.tower-528.messagelabs.com!1652713747!39016!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6248 invoked from network); 16 May 2022 15:09:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-28.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:09:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 31C6C100189
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 24B3D100181
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:08:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.5 -> 8.1.6
Date: Fri, 6 May 2022 22:51:01 +0800
Message-ID: <1651848662-13051-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651848662-13051-1-git-send-email-wangmy@fujitsu.com>
References: <1651848662-13051-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97133

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.5.bb => php_8.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.5.bb => php_8.1.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.5.bb b/meta-oe/recipes-devtools/php/php_8.1.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.5.bb
rename to meta-oe/recipes-devtools/php/php_8.1.6.bb
index e3af9f698..96af595a4 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.6.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "827de56771c3ab8313a069812f15f6ec49989d510aebd0dce180839c6d8d6ff3"
+SRC_URI[sha256sum] = "7b353304b7407554f70d3e101a226a1fc22decae5c4c42ed270c4e389bfa1b66"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


