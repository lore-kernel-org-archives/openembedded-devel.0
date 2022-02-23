Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D361C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 23:45:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.3601.1645659947503013435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 15:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=vKTtmP/G;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jsSSL/64AwydZSHBdSX+uvelmiRv1vDu1NgKxSsjuUw=; b=vKTtmP/GT/xgre2PwShQWZA9AC
	1SXAYKZzKMpoJn1mB9p/9Oo3imSXZzIfvcY2GtToNN5cp+/4tLWyjG0zFOMNakXIKljxiSBKcVbmG
	1Y5st7xck+FV7LZV2u1ZGsuo0VV/HBuF6/uXZgG5mwmMK/ShxNBA9PSlSxquc2ARBFJZXy/LyLZhK
	1ilXdTIMHH15VQbN7nnyJAZbC1jAh9Pi7XrJtoB+CrEszQGgcWIBPZExKXeWKx9j/qNd7Yo0eSYp1
	G6m9LK0GRhBxuMEbI9YsvkznSgVTjjxsroHhpDgHBjG8cOBte8iSQc1D/QlxlLOlGgDo+ZqE+9q1j
	OLKn3G9g==;
Received: from lan.nucleusys.com ([92.247.61.126]:54742 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nN1Mq-0009hw-6d; Thu, 24 Feb 2022 01:45:48 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-coverage: Upgrade 6.3 -> 6.3.2
Date: Thu, 24 Feb 2022 01:45:33 +0200
Message-Id: <20220223234533.1829801-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223234533.1829801-1-leon.anavi@konsulko.com>
References: <20220223234533.1829801-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 23:45:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95491

Upgrade to release 6.3.2:

- Fix: adapt to pypy3.9's decorator tracing behavior. It now
  traces function decorators like CPython 3.8: both the @-line
  and the def-line are traced.
- Debug: added pybehave to the list of Diagnostics: coverage debug
  and --debug options
- Fix: show an intelligible error message if
  --concurrency=multiprocessing is used without a configuration file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.3.bb => python3-coverage_6.3.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.3.bb => python3-coverage_6.3.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.3.bb b/meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-coverage_6.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb
index 0ed90281f..3c6b45705 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "987a84ff98a309994ca77ed3cc4b92424f824278e48e4bf7d1bb79a63cfe2099"
+SRC_URI[sha256sum] = "03e2a7826086b91ef345ff18742ee9fc47a6839ccd517061ef8fa1976e652ce9"
 
 inherit pypi setuptools3
 
-- 
2.30.2


