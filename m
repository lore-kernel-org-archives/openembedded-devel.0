Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D35C00528
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.15582.1689967537237933024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Jf5Ts56O;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-635dbfa710dso16078276d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967536; x=1690572336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgVcYr7ddXgqfrWdOOwcsOArjH80QFzSRoxYLGu5qSc=;
        b=Jf5Ts56OIjnyNs1rzqUz2L+nP0hbkGnSq7j1cmlyXDv+KAKEiT/jDsXDYJqZR7jb6l
         eObShdy3JbsU0U07tPNTmLWpoy+b2mVMAgUsMdi8q4reJVkbZjyEsWbOu+Rz3R5/536N
         vKaA/pEGSgji+17VMfVFSkzdtwIMbPDtp7Cj6uum37BbiLxCReKozoNxKr+tWY2baXlo
         OuR+xPLc7Dym/mCqKAVzs0u9MoQaI9/sLfYVAQRSIjFVmjt91i4c9Gk8y54sglsOMQ37
         GDlyZ7F11tckHBGEMIEz9idFndJxtfHaEDQybI6N7y2nKtwRdkVt2E19UymMjahk/RPz
         zlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967536; x=1690572336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgVcYr7ddXgqfrWdOOwcsOArjH80QFzSRoxYLGu5qSc=;
        b=TuqpvgPVk8+uMj3RdD01H584E9XR8dPbZCxUH7VAI2fa3xgIOKTtEoylcMZk8LeN+S
         nzI/kTWkrVOf4SXqtHAqL2Ow6r9R6Tw8IHPQE+g674DQeBh2nkVJH3Iy/wtWTXZKm1NZ
         ZYJzflpmaS2jWKXJadmRle82tJoGeBq1hCeHtHiPPn+Xzf1pNw0feCjHLRux8r38QeLr
         QakQqfJW51Jh80ArwsAz5RATzfMxNbyPLjfvvHuTAQK4rdJhhfPXOIQwcJov3cpR/HTC
         +FLEadH1Lyz+HYmhvY5V2jz9IGwuBPCjL5Lk2RoJqXGVVaR49akis/l0vvoy9mJfv4tu
         W8XA==
X-Gm-Message-State: ABy/qLapj2KJmNyInZ+fHBiXPYPDkpO6SPObQfvxveh8Bl3WlsLAauyi
	YlyqCZM65NtbQoIy+e/z5Va60uDekQ6RQxhCteo=
X-Google-Smtp-Source: APBJJlFGL/Evbhyovz6cCvYGtoaXNdmrhmkan5RMA3ZTgbjHSHULGJBWwJsltdJQ+Nkf286xCkkRyg==
X-Received: by 2002:ad4:5006:0:b0:635:ce65:38b2 with SMTP id s6-20020ad45006000000b00635ce6538b2mr1039019qvo.62.1689967536156;
        Fri, 21 Jul 2023 12:25:36 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 8/9] python3-flask: upgrade 2.2.3 -> 2.3.2
Date: Fri, 21 Jul 2023 15:25:29 -0400
Message-ID: <20230721192530.2515633-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103981

flask has migrated to using pyproject.toml, so we need
python_setuptools_build_meta instead of setuptools3.

Changelog: https://flask.palletsprojects.com/en/2.3.x/changes/#version-2-3-0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.2.3.bb => python3-flask_2.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
index 90c56c75a4..ec9c62a170 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "7eb373984bf1c770023fce9db164ed0c3353cd0b53f130f4693da0ca756a2e6d"
+SRC_URI[sha256sum] = "8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef"
 
 PYPI_PACKAGE = "Flask"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.41.0


