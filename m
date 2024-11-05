Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B126AD2B93A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.19503.1730817404651607389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TA+JmPts;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e34339d41bso47427107b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817404; x=1731422204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of8UzuOhBgqBN38oO2BLOKsspqiU9fxnuP8ok10CnRc=;
        b=TA+JmPts4rnlU0w27j/QJgNT+WnA589MVqIraV9OAFLssSJajZ/SlsSlhzinpMuj+n
         XKk2oyTur54gbjFWC8nUeZEsyphqmSaOwsqZMezS9jrq/sLOWeBIzxdtDm/8bzPW0/Kk
         LJrb+AWVqeIGDeBxbr535GcLkxEcNch9W5NnjTVDeVby1DSSrF932/iIu3YV7ndb5h3K
         yZpOsdaJSWgvjnlF5kZ5CknelT3pGpZ8wbgA24KKIchStxwFVn9dhKY1PuMInEBWHonj
         SS9aV8Um7e9a1C0VqNmMwj5+P+K3OmQ4nr1meSxh2YYMt/9Jdc6gipBlAV3wBGR7YveA
         HhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817404; x=1731422204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=of8UzuOhBgqBN38oO2BLOKsspqiU9fxnuP8ok10CnRc=;
        b=Bz0uajoSJ2J6qL2aUjt9MvJNxC7mX2u4NwImLmHoHL9pLkPjkOSdZQ0kK37kCQ9DgB
         F5aaS4XR3t/59G6tFmxPseMcrK9Nl8IQJmrHPO/CrctkslqMoL+AGYqJTR2KInaLLF+f
         krzZZCohjfj30xGYjaN9N7JQOiKl3QXR52rG1w6N7Sx1nRoogeX+QhUO6VJEbHg5B8j2
         sMPQl8wX4nMqxkIDh3Pg/sb0QkiEfFTEkPKy8/RVs812CUa3gmVNRs7fziHti3Fe7sei
         Y+zQuFOGUYIs+zoC1lsxz2cXoYzKBaTVc7LLOjmOqpDo0BCyjdnhZb1BAflOTOcHc2NR
         thqA==
X-Gm-Message-State: AOJu0YwSVrSaO/UELDh8Vwc98AMMCPeBM+xJF322IDVKzLqCMaONhnR0
	krN+aErRwyPyGHZ60R+dQxCd5K9XLWuODpbzrb5S8Xs3GeixOyDE7Gu6vA==
X-Google-Smtp-Source: AGHT+IHFJ+maq1rNkW0s4FN0Y3F81f8viRTKzvS5+Hga/mW6VdTX7nHvTOCvRFCEG/KTAcfx5gVTNg==
X-Received: by 2002:a05:690c:94:b0:6e3:1e5d:fe2 with SMTP id 00721157ae682-6e9d8acb426mr335652837b3.31.1730817403682;
        Tue, 05 Nov 2024 06:36:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 10/90] python3-filelock: upgrade 3.16.0 -> 3.16.1
Date: Tue,  5 Nov 2024 09:34:35 -0500
Message-ID: <20241105143638.2301245-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113428

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 CI improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-filelock_3.16.0.bb => python3-filelock_3.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.16.0.bb => python3-filelock_3.16.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
index 0aac54a158..abafa1245b 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec"
+SRC_URI[sha256sum] = "c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


