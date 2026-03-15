Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8C2D58B37
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:02 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28885.1773581757740886233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e2B3mvOn;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1080; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GfEfELE5rYAquJ/Bq3G6qNuvzmoPOq3knOvRomp+ALo=;
  b=e2B3mvOnBJuCx5AR5WEamfDLvQVGsi58ukfrXbevH68viFGJ1Q2/Kqjs
   ZQ7IoQ1aDDIf5UYtZtPzATwG9Ws9ZR002plYm5waadaih2trLXQqT2yNV
   rb7y2FwuKVgF5Phl4nHwB5l33o1BrKbUZwU4pD2vLtasgshubK1g5JoRg
   8AZY8zOuZ8rMv/1aY9Eif6eWOqHcC2KdY0Ul2lDarwECH64lbSaKIppXN
   joSSby8PY1gFTzVhMKAGdE7AhBxYI3fIo81egrj5t2LvT+ulObHXgri+B
   ZysSEAGhDUJXEqCO+YHgidfUAP0ySQ04TfTrZixRsJn+GdnnQOj5jc5Hc
   g==;
X-CSE-ConnectionGUID: e1D49VwaTIO7KQGZWtdnWw==
X-CSE-MsgGUID: xCEMNtJRQwK9NIxZmYwQgQ==
X-IPAS-Result: =?us-ascii?q?A0CkBwAatbZp/4r/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAVYgMSsrGYMCAYJzAgGxfYIsgQGEfNsmAQsUA?=
 =?us-ascii?q?YE4hTyIGXSEeicbG4FyhAd2hAqBBoV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBbwIzgVlwFYMiC?=
 =?us-ascii?q?UkZD45fzH0jNT0BAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:VZK4Ua5kugDufRsNE14CagxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mEaXGrUM/qJN2fxL4p0bN+29kgH68DUxtVkQQY6qyFgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMNQ0prdJHmhy1
 NtHCwkiXC+fi+SJ3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGISFKobVFZkLwC50o
 ErW1EncJA04DuWA6muj02Keg97QpCzCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:bwk03KjAowySJzJNoHRpqtb9DHBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AlxKlDWquZpBwmgv4JXqTqPjmUc18XiGM8mjZH26?=
 =?us-ascii?q?fVkVQZ4+qVVOWx7wxxg=3D=3D?=
X-Talos-MUID: 9a23:NV/4rgoWUruzuqvnMKAezyFJGeJO/4aUMV8uwLMnq/uBBDNJNA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="688278466"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 370AB180001E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 58478CC8D6A; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 17/24] python3-ipy: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:34 -0700
Message-Id: <20260315133441.3034831-18-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125234

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-ipy to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 6a35e12ffe..e71320db91 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -18,4 +18,4 @@ PTEST_PYTEST_DIR = "test"
 PYPI_PACKAGE = "IPy"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


