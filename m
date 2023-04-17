Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CDCC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:39:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.48367.1681717135720807010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g8BWXD7d;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717134; i=@fujitsu.com;
	bh=NtSWrEgPw7nCVFoFg5QZNuhFCYD4lbejDhPDmvRm7pM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=g8BWXD7dFvSO9544ly7DQq/i4pDeh5Gia/nM+/sKiPrEtc1WSZ1uvpfMNxzh8V20D
	 0WX9KqDccVK/R2gBktuNCWJIjxhg5Czt0gaC87YgRkh9y9NA9eZ9TFzAYXnXMqUf0b
	 Vllk/nnCHMTJUeDcsHP1HwUsywwoecueco842FycEu5K92+m237u/o7qklqz9sWT/n
	 ZmaPGB0T9Sk4bSdbUTE8jsEBCsPqDTeWDByamtq5RTIHjg0y/7AuKr74EGF1DTSbKB
	 mfsG2izU5/ku2MXUrFsyU9W2g/VrDirt3e02def8PLYbu0HrWNq5bG+wf/3Rcy2giw
	 gpASfls4PAudg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpNv73Sb
  FoGW/rsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHxWhdTwXLeivdbXRoY93B3MXJxCAk8ZJTo
  f/iWFcK5yiRxatllZghnL6PEhcbrTF2MnBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC1hLzN/6ihXEZhFQlbjV/B4szivgJNH1tQtsjoSAgsSUh+/BejkFnCUO9x4Es4WAahoar7
  NC1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNCtOLSpLLdI1NNZLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctL
  LdnECAzelGL11h2MP/v+6h1ilORgUhLlfZFqnSLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfVZ
  5sUIcGi1PTUirTMHGAkwaQlOHiURHiNnwGleYsLEnOLM9MhUqcYFaXEea2/ASUEQBIZpXlwbb
  DovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDf8C9AUnsy8Erjpr4AWMwEtllMCW1ySiJC
  SamAK5lL5IXGqruUgs2ZC1abYNaGuZiLNp69v8NoyY0nfX2Hv11v/MJwsWVWx+PrL+SYKv2Za
  NLQ51C7/erha23fJ3rPH9m9/9WnmXsU/zflBqwMUot72ni42ez7jllzdm6zanv2p1Z6MCpvd/
  x4SEnWX0JWodZt9/EDCcmsLZ/1PvuX/lJbaivzKOrQlfduNuOsXi3mW2zRWVmut4orhEFHfva
  iX7fGmdOWFUjtlzjFKeBopztg5K1vSek2pgO4BByGH/cp9Nhckipd2T+TuPqvnIil95Mzu2qC
  rd4/1GpYx1wSUb1lwck118ezDUQ5/rswvKlifFKq45S6L56EfsRxR23bHz/CO299hpe0W7qHE
  UpyRaKjFXFScCAB2Qe7NWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1681717133!283062!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14434 invoked from network); 17 Apr 2023 07:38:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:38:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 737341B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:53 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 678761AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:38:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.4 -> 8.2.5
Date: Mon, 17 Apr 2023 15:38:06 +0800
Message-ID: <1681717086-19067-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
References: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102106

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Added optional support for max_execution_time in ZTS/Linux builds
    Fixed use-after-free in recursive AST evaluation.
    Fixed bug GH-8646 (Memory leak PHP FPM 8.1).
    Re-add some CTE functions that were removed from being CTE by a mistake.
    Remove CTE flag from array_diff_ukey(), which was added by mistake.
    Fixed bug GH-10801 (Named arguments in CTE functions cause a segfault).
    Fixed bug GH-8789 (PHP 8.0.20 (ZTS) zend_signal_handler_defer crashes on apache).
    Fixed bug GH-10015 (zend_signal_handler_defer crashes on apache shutdown).
    Fixed bug GH-10810 (Fix NUL byte terminating Exception::__toString()).
    Fix potential memory corruption when mixing __callStatic() and FFI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.4.bb b/meta-oe/recipes-devtools/php/php_8.2.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.4.bb
rename to meta-oe/recipes-devtools/php/php_8.2.5.bb
index d5954d976..ff432f3ad 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.5.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "79186f94bd510db86e31e535dd448277a1eb92a87878303a1ead44602d8b1197"
+SRC_URI[sha256sum] = "e5a80663cca4f6044ad86a489798147c7af037eca96f6cd357ab36d28cb63757"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


