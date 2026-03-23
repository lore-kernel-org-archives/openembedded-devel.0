Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BB4F483D3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 16:27:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21771.1774283268931998958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 09:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LDty1RLp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260323162747159e20eab20002073b-js1hcw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260323162747159e20eab20002073b
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 23 Mar 2026 17:27:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IyBgq8EU09lJLpGJVQlB3l8YOQLke/TTIBFKIJRFue4=;
 b=LDty1RLp0mYMdFvsOhne/W0wJL1rhWw9bgNasHkXkexANgBe68McT8LuSefZL2HOfYKAKT
 CGnICQKbhG2Y7rV76sME4+ufSAbPPBGCsFo2uzm9cZ5fgdpQsCCoUKYVdk3GsgXvgtwkE4wX
 5HLxY3XT99bs5jWlLJejtjoPO+DQL+/8rTg2UKLdxlZgcoNYaakaZqaExiAkWobuHVvJz6o/
 QOsqIl/5QodUaTdwL/K86StkJZoBbv1/fYr1drCP4bGMurpW3SIo3W/NoWn+eMdCNfjJMHjQ
 cWZ7jwdZU5WrcIx+3jN8tC1Y0QmK10AzvMidxM/7c1H9j4HyeP9BnVrg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 2/3] python3-protobuf: upgrade 6.33.5 -> 6.33.6
Date: Mon, 23 Mar 2026 17:27:30 +0100
Message-Id: <20260323162731.8483-2-peter.marko@siemens.com>
In-Reply-To: <20260323162731.8483-1-peter.marko@siemens.com>
References: <20260323162731.8483-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 16:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125522

From: Peter Marko <peter.marko@siemens.com>

Release information [1] does not list python changes, but we should
match protobuf (C++) recipe version.

[1] https://github.com/protocolbuffers/protobuf/releases/tag/v33.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-protobuf_6.33.5.bb => python3-protobuf_6.33.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.5.bb => python3-protobuf_6.33.6.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
index af9ff85f20..bbc713442b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
+SRC_URI[sha256sum] = "a6768d25248312c297558af96a9f9c929e8c4cee0659cb07e780731095f38135"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"

