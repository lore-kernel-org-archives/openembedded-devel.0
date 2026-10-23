Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8407.1792765984712164092
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PrSCTpP7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261023143302ffe00beeb200020761-f9mdbi@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261023143302ffe00beeb200020761
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 16:33:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=fREqOayy3NnKF0bjobmU4yF+Dz6FOUsEiiY4P1opgfk=;
 b=PrSCTpP7mlQNZ/F7PONcYcQaYGe5qo08Y7Oyyy/Ytnnn6Z78G2W30Wv7UtYnPnN7Y3O894
 dMgtkKlAbi39A31/LAMd50OaU3jrq3j7lQc5gqF+g/upGhJTQZbT1aauP+UEBV0xIMbkWoko
 VJYaDFPuTKxfTY0sZfV2kXYVDu95WRjGXgy74nRKNQF81TV6TqeNuZkAzRMxH5kPfjSfuAVs
 rePFhhOsJbFsOs+RJLRGsqPDyIgQ0S94xux91/yxcFwbkoOR/EbpJNNndMU++lbXnB3O9Wbc
 OZZwUi4CTjoou9XS7WxiLIOts/KtIjmZr/IJu1oxi748pc9KPxykXzPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 3/5] python3-grpcio-channelz: upgrade 1.84.0 -> 1.84.1
Date: Fri, 23 Oct 2026 16:32:27 +0200
Message-ID: <20261023143229.184415-3-peter.marko@siemens.com>
In-Reply-To: <20261023143229.184415-1-peter.marko@siemens.com>
References: <20261023143229.184415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 14:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131368
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

Sync all grpc recipes to the same version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...cio-channelz_1.84.0.bb => python3-grpcio-channelz_1.84.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.84.0.bb => python3-grpcio-channelz_1.84.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb
index 18e94b0475..22b86b3597 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.84.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "84220ef2e7ec0a3792a151b6ffbc70691bf0f09cd009fe734f2946b917565694"
+SRC_URI[sha256sum] = "03d2085415bde0e30515e4e429d0d68d25471aa0624628ce335d92f40f8445f9"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
