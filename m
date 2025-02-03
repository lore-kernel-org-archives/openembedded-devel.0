Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F084C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.95237.1738607014227140906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZIY5EuaL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250203182332ae1395532b6a5b4d54-8b5y4g@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250203182332ae1395532b6a5b4d54
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kav2ctPq9+PL3uM+vsD+SpZ4daZv9EbfLUjUev+f624=;
 b=ZIY5EuaLM/P6j2ixigHx4RIyB/lHZ0D01IRcKYcx5OzTSQme2Z4a6gPxox0WbAe21cWb4P
 37tB5gfaQCKNBvi9KLYiYHlENbyTFasgSbMPpnIEWjKOmSdqNBOSpRxPwP6qpzR/hzNeSxNM
 28KkZNyVZg6ui3sjux4dCT6mf8UrErAMEVYIIh7jkQ6e5C8xkOVzyi7AdDMEj9wGbx77WHZk
 CdjstykEfD7DUP3/TGO0tZ9NmAawNq7VySEl8WycStUl6/7e8MBD4+5zQvRhedrskcwP00S7
 ywLD+49qJc2HjjsLeteIH66Ayl9QhR6Hb3+aIu7SuncMTmfFlb+OZZfQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 8/9] protobuf: set CVE_PRODUCT
Date: Mon,  3 Feb 2025 19:22:09 +0100
Message-Id: <20250203182210.574300-8-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115252

From: Peter Marko <peter.marko@siemens.com>

Add all relevant products from following query.
Also remove generic "protobuf" to avoid matching golang:protobuf.

.../downloads/CVE_CHECK2$ sqlite3 nvdcve_2-2.db
sqlite> select vendor, product, count(*) from products where product like '%protobuf%' group by vendor, product;
golang|protobuf|1
google|google-protobuf|5
google|protobuf|2
google|protobuf-cpp|4
google|protobuf-java|15
google|protobuf-javalite|12
google|protobuf-kotlin|6
google|protobuf-kotlin-lite|4
google|protobuf-python|4
protobuf|protobuf|1
protobuf-c_project|protobuf-c|2
protobufjs_project|protobufjs|3
rust-protobuf_project|rust-protobuf|2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: typos in git commit

 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 7a26967dc8..a470a7c643 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -27,6 +27,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""

