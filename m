Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B2C87FD5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.4254.1753153986280899099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NM91a/j7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153990; x=1784689990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OQSDHxNX2gWyx2wrpdrhU1o6Fh21S+Jn73f26v/d2Cc=;
  b=NM91a/j7GFpHUOoKV4nlomElUl4YSASUTsBPkaYMQj4QBtbGN0q8BCz2
   KRxBphBLHdIm+cKIC4zE/SmjXtO5MbpQEsCfqu9GjcDCuhrsAuVFnuy/r
   KUcJC0rZF4jul2nHxGVDE3aLJNTXuwuza0Es/cW7fDjbIE93HS6m4MsVl
   pRUp++/VVi1yAZBNggwkG1LKmaml8IzJmkyxvdusustXaFTTcJ/bVWF0u
   WOECPpDDGKQz5I8U9MbLLy2wnEvOfRRuTExcEq1PRCxTLtwX3mx5BVqE+
   VB+mmlUdCMLByGe0+pOqPSwz/NJFxWYInatcjzoZwGgNlW7KnxkzyfbmP
   g==;
X-CSE-ConnectionGUID: qOwvHZHmTVuNsvwIIZZ+2A==
X-CSE-MsgGUID: /U5OoOmuTDqcJMj0OT4ypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="207018618"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="207018618"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0F4381002B82
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7A2FD8D65EA
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:08 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 926AF1A0071;
	Tue, 22 Jul 2025 11:13:05 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-webserver] [PATCH 17/21] swagger-ui: upgrade 5.18.2 -> 5.27.0
Date: Tue, 22 Jul 2025 11:12:25 +0800
Message-ID: <20250722031245.884-17-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118678

Changelog:
=============
- feat: add support for OpenAPI 3.0.4 (#10247)
- feat: apply cumulative update to address various issues (#10324)
- fix(docker): fix security issues CVE-2024-56171, CVE-2025-24928 (#10351)
- fix: fix definition resolving being affected by the order of schemas (#10386)
- fix(json-schema-2020-12): avoid accessing properties of null schemas (#10397)
- fix(json-schema-2020-12-samples): fix examples for nullable primitive types defined as list of types (#10390)
- fix(utils): fix error messages for range validation of number parameters (#10344)
- fix(json-schema-2020-12): use consistent comparison operators for displaying min/max constraints (#10159)
- fix(json-schema-2020-12-samples): use zero as default example value for int32 and int64 (#10230)
- fix(style): prevent operationId from wrapping when space is available (#10259)
- fix(docker): address multiple HIGH security vulnerabilities (#10410)
- fix(json-schema-2020-12): infer type string when contentEncoding or contentMediaType is present (#10411)
- fix: align OpenAPI 3.x.y file uploads with specification (#10409)
- feat(oas31): display file upload input when contentMediaType or contentEncoding is present (#10412)
- fix: avoid accessing properties of empty Example Objects (#10453)
- fix(oauth2): avoid processing authorizationUrl when it is not a string (#10452)
- fix: use spec compliant JSON Pointer implementation (#10455)
- fix(spec): assure operation is an immutable map in operations selectors (#10454)
- fix: assure parameter is an immutable map when grouping parameters (#10457)
- fix(spec): avoid accessing $ref when path item is not an object (#10456)
- fix(json-schema-2020-12-samples): generate proper samples for XML atttributes (#10459)
- fix(security): update Axios to non-vulnerable 1.9.0 version (#10460)
- fix(docker): address CVE-2025-32414/CVE-2025-32415 (#10461)
- feat(observability): allow defining custom uncaught exception handler (#10462)
- feat(json-schema-5-samples): add support for time format example generation (#10420) (#10421)
- refactor: introduce function for getting Schema Object type (#10330)
- fix: mitigate ReDoS when generating examples from pattern (#10477)
- fix(release): fix failed v5.23.0 release
- fix(packagist): exclude large obsolete directories from publishing to Packagist (#10329)
- ft(oas3): show the schema tab in the Try it Out mode (#10488)
- fix: align expanded content inside expand collapse button (#10497)
- feat: release SwaggerUI via GitHub Actions
- fix(CD): provide correct npm token
- fix(dist): provide correct npm token for swagger-ui-dist release
- fix: fix opened model schema resolving issue on spec change (#10509)
- fix(docker): bump nginx image to version 1.29.0-alpine to fix CVE-2025-48174 (#10508)
- feat: release Swagger UI to Packagist (#10513)
- fix(oas3): reset request body values in try it out (#9717)
- fix(style): restore paragraph spacing in parameter and response descriptions (#10514)
- feat(json-schema): support x-additionalPropertiesName (#10006)
- fix: permissions of files to allow running as non-root (#10515)
- fix: sanitization of relative OpenAPI JSON paths (#10528)

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.18.2.bb => swagger-ui_5.27.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.18.2.bb => swagger-ui_5.27.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb
index f0653006a3..4dc1b86125 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.27.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
 
-SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
+SRCREV = "7b86721ad6494216d8bad0540c737efe1885688c"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


