Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D552C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:46 +0000 (UTC)
Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47669.1790553819039345693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=naRWK+fW;
 spf=pass (domain: gmail.com, ip: 74.125.227.163, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so13680235ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553818; x=1791158618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0WKUkVjtg6NxiEYF6nWKaIt+Se4iMYhcoOq9m+Z6FI=;
        b=naRWK+fWEALmRY7o4t2eC+2q3OtZtZs0UiuZ6EFacjhiQ8MqqoaRjCuTJdwUGfIc04
         rS0N4tav7+AOcxlxo5Wux5veuJzY4VYAr8VDsQspRWK9sMpKthuqX0UaNVhzatI9GzUG
         CrFRArUK4y1N5Tk5JT45xGX1HcAzCMXib4cIXacNwHupRO2NhuIUOWfvlzMYRbaEr/Gs
         vaWnqKk1SC1+WkgKsIgMN7h3sFu5pLw5b+e+8sgdgTf1Y9O+RIZRCWBo7CAgxCg23lHj
         KTWNDdSz3XhLdXfD/EtL6kg6nLbxliwwaYmYpeecyWUBPRZNq3L12FAcTLdiI6kZwkIB
         Tdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553818; x=1791158618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0WKUkVjtg6NxiEYF6nWKaIt+Se4iMYhcoOq9m+Z6FI=;
        b=OZsXsv7+8nE3Fjlx3GjDYnJKI+BEZLPbcV5gl2k5j1HKMeNRGvtU8faLpaTiX9KPrQ
         1tYfT0TAYsIY7Luw3nCze+KgDjr7UWesiBWdcUFpByHQaA+XjMc1C5+5kU3dsNxutvw5
         wbuDKEgReqFmFZZ3pdx4EPbnNbe0/MNdJT5b/FnOsPA64pT9pSeBuy3JjGq9+VdNjr/A
         AoVEwBKNeFjL1XveA+6UcDJCdfET+TotUGbL1uSGiy7L0uF48Ctm6FDLFMTehLPXmh13
         3opLa0ZRU7l+9zjvwAW3eTGTKMYU4bmHouO0lNL3+dbTVOZl29zeA/cTmGh3ZrBQ8ouI
         1Rew==
X-Gm-Message-State: AFq9FYLNAQeam9prNd9+ZstbHyVTkoTHzrXKrYCvnAdDpkks9CQzFo08
	AsgggGrL/5vF6tAgG3OCMUOLIENe99SYDuHS2XvrcOEj9Zchny2szH0VRMAEzQ==
X-Gm-Gg: AYBFou3uk3Kd3CHZVozfQeuvlFvkzvMn2V5Muo54NZcnHl3u2DAxCmMBEfOGn+jBVuX
	/Lf/M118Gp7tSS4jWinG6K7o7TC66vWD0EgIr30KgkIoQ6yN72HQtjbLQMwnT1y9fSBKdms2ca8
	3x4yg//J6BSNuRvx/oRFd2VFsX++s+c1DIABK3j+Hikkx3oFtL9bZ0h2B4Hs6/AKh910QF4D5kl
	nT0oZ0qzLo+oXBnBSDx3gzBA23yS/gjIzm+KVLeMnrYyJFild32RI36nqiNo/eYHUdLqjzRpOSg
	7IRkF9xIsVJAd4pjrIrYx1Zz8QkJ4aXdM+RE6Hih11p9JLT328vPtbAR01AJeUV0OKlUJ8obwHN
	j3Rb2pVT4zZYZYxC/HP6hzUoG57n/lKJfM+vQbQOo6/tloGn6lp1DEWIRCBvzRL0yPMHakrJX6Y
	idgSO8IlN8YjLLGuH6jsNzRQeXAnflneH3P+2/yY3/b8cHrmQU/jdNMMO+wpKnj/9NMXntibaci
	AUB/HaciT5THQlt1CWq6GQ=
X-Received: by 2002:a17:903:228b:b0:2df:90d4:1193 with SMTP id d9443c01a7336-2df90d41a8cmr67068255ad.45.1790553818234;
        Sun, 27 Sep 2026 17:03:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 14/30] python3-dateparser: upgrade 1.4.2 -> 1.4.3
Date: Mon, 28 Sep 2026 13:02:46 +1300
Message-ID: <20260928000302.2528437-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130401

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/scrapinghub/dateparser/releases/tag/v1.4.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-dateparser_1.4.2.bb => python3-dateparser_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.4.2.bb => python3-dateparser_1.4.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb
index 6b52cec67c..ad8b590c25 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "bed2a3fd9bad8f2fb2d72b57748bada260b3a9349a264c22ffc23c3249d7049a"
+SRC_URI[sha256sum] = "bab8c43a746266e68142f4926e69438ce551441aa88e54e78bb6410bf3ee7000"
 
 inherit pypi python_setuptools_build_meta
 

