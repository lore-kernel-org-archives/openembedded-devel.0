Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8FCC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:28:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.90474.1679617699952932779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kVCf4P4C;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617698; i=@fujitsu.com;
	bh=GUDK3XNiWnT6erqFwAMh8jQcQn/cSGgNrzKA+xby/PU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kVCf4P4CJnGFLEU9fNun80X4+aL+/pExkqBNXwM9uJIDORYyDoi+inZV3OCHk32QX
	 45FTHEWkwZulECjuSrS67EV9QxDJ9g4iQRp09+S+/D7cNgYV8O8VrdjNp1BpOEQVBm
	 UVM/cgwFezjYFP9Bj9xZaPUqPm2xFpqXqsfGgXkWSlo3htxmALXHul8so7Mj6GFcOB
	 1ymFZ+MXXKI2zQlm4bv+qQlQK1UzFA7Km6eabjyaXH98tNFsLMMT+gp17M93gSZ3BL
	 tptPJgOwR2il3rMJyhMUqkNtpiyBAgqk04q00/H0HLIfwQnFNyVaoAFdCVKYZZpWkW
	 6KOnhjfDzBF3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWXfhO5k
  Ug01TVS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyXvyayFLzhq2h/vIS1gfElTxcjF4eQwENG
  iY4PR9m6GDmBnMtMEu+OBkMk9jBK/Ju/kh0kwSYgJXHj/n+wIhEBfYmls/cwg9jMAioSL373g
  NUIC1hLbDh0hbWLkYODRUBV4t5mPZAwr4CTxO5N/WDlEgIKElMevgezOQWcJaZ8fs8EsddJ4u
  m6pcwQ9YISJ2c+YYEYLyFx8MULqF5FidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3Qt9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L0
  8lJLNjECAzelWE1+B+Phvr96hxglOZiURHklQqVThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwf
  n4jkyIkWJSanlqRlpkDjCKYtAQHj5II76GzQGne4oLE3OLMdIjUKUZFKXHexLdACQGQREZpHl
  wbLHIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmFQamASGezLwSuOmvgBYzAS12rgFbXJK
  IkJJqYKoxffc9IZBrr83ynY7nzx2fpe8zJYjDYIf7j6VdMw2fGQq9fO6+6c+bNvYnK48xPJxq
  U1DH3TSpynTnlbdvt2ZOV9F5qC8vF1HRkvXnz4On/U/X8LMn3lrRfUXmstV3p5DuFNHekMdWx
  3gOmglVHpbtazP9dC3s1bOFwcabWFbzChsIHzx15FzIgg3vlsqlFkzerv3OLlucp6x7x/WoiT
  3/Hv9XOM9dkK38zX/ej3VhMvoiE5Z1SLxI+30rpNr19pvrXi0xjG+eh56yizu4pysoXjotSlg
  38492f2tBmnold+kE7aKC3MDqtcsSi9RPpX59Yzv55heuPrNXFqKelomLVZMztE7vnXOZN7Zo
  rxJLcUaioRZzUXEiAEXSfI5XAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1679617697!256467!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31326 invoked from network); 24 Mar 2023 00:28:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:28:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 51009150
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:17 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 43E667C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:28:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.3 -> 8.2.4
Date: Fri, 24 Mar 2023 08:27:48 +0800
Message-ID: <1679617669-27228-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
References: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101681

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Core:
  . Fixed incorrect check condition in type inference.
  . Fix incorrect check in zend_internal_call_should_throw().
  . Fixed overflow check in OnUpdateMemoryConsumption.
  . Fixed bug GH-9916 (Entering shutdown sequence with a fiber suspended in a
    Generator emits an unavoidable fatal error or crashes).
  . Fixed bug GH-10437 (Segfault/assertion when using fibers in shutdown
    function after bailout).
  . Fixed SSA object type update for compound assignment opcodes.
  . Fixed language scanner generation build.
  . Fixed zend_update_static_property() calling zend_update_static_property_ex()
    misleadingly with the wrong return type.
  . Fix bug GH-10570 (Fixed unknown string hash on property fetch with integer
    constant name).
  . Fixed php_fopen_primary_script() call resulted on zend_destroy_file_handle()
    freeing dangling pointers on the handle as it was uninitialized.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.3.bb => php_8.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.3.bb => php_8.2.4.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.3.bb b/meta-oe/recipes-devtools/php/php_8.2.4.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.3.bb
rename to meta-oe/recipes-devtools/php/php_8.2.4.bb
index f7639cd5f..aec222b58 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.3.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.4.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "87bb58865f38f5e2941813029152cea2102fe2961bb4d68b88f831ddd0548d0f"
+SRC_URI[sha256sum] = "79186f94bd510db86e31e535dd448277a1eb92a87878303a1ead44602d8b1197"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


