Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0F4C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.28965.1690312193708048495
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=PF67JaLH;
 spf=pass (domain: baylibre.com, ip: 209.85.160.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1a1fa977667so4468935fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312193; x=1690916993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ID8RFX2xzU8tj/JrxdmxP+o6KUgYRgDErEWtQnXejg=;
        b=PF67JaLHwNZTWjGv0DX/HK2nElrhgqzoPHdLCnYBhEB2f2G3o8/EQX5ws1LOv/UCod
         X1azZnO6aL+Z3mIeciiijZGRgcJAI9MPOaCFMyv1Hwiy7QeT1GQDFhHArOuhS2Q1uf7O
         6Ne4SUyskZrh4gxLcFvOG4zEb0SSa02jYFaznu2O2kwEPQ4jNIiFnR02AAuk6MN6JLqW
         6uki9UNGweKU8OdyO1afVMjrk+4/01dR+Vz7OrE3gAg+kZkIXWS1CdvAfzzvaAIQrxC6
         0XXygev46CUIimM54sdJSNhrNWoDTrZjZxgRB5LP3cLlpjGO5EZ4mqNNEvlA5f6EpMah
         mHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312193; x=1690916993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ID8RFX2xzU8tj/JrxdmxP+o6KUgYRgDErEWtQnXejg=;
        b=a7YjmEhjX1A8dFLz1GAMZ7geXE1WlyFTUbxtlcedrntqlGpOrkA+s33GKy8Pq4iSmK
         MasghgqoOnOUraDVAIX/5X6NMp6TJw1EJxZgDKQAzg9ZLPojsUd6Rxjf3hi89ieLAeIb
         fEc+WLsGZEZjpCpFhEyYrcBLyqM3U/Ot9lzIWe4zJtKvfXneonsehL98htyxYzLyGKAx
         yDx6/tPnjJBeWBGwlDiRi/A+fzxehK/A49LwyNYnNA4ewbuR/mSWZ9YBZGZOAn6vtLS0
         AKBWIW3v7xtVQNuxpUAzYgxatmec0kzkWWlkC5OVnvKKN5Vdof4G4OHCtouwejVLbfQg
         JsEA==
X-Gm-Message-State: ABy/qLZueFdduTur18F2Q455RjXl5ZnuNqmJhaCDofa+eq6P2TONlBj1
	DZJ/PY3fIcqoOw6cR3bCV/JRXWuPErPxQQ3eq8E=
X-Google-Smtp-Source: APBJJlFxx9OOWV2k0MUXne+cKcCcyMmv8WlrVWpl8fprteQqNnu/ew81cfbE/iAO4PC026oysxXi7A==
X-Received: by 2002:a05:6870:b681:b0:1b3:8cfb:78c5 with SMTP id cy1-20020a056870b68100b001b38cfb78c5mr15066992oab.34.1690312192818;
        Tue, 25 Jul 2023 12:09:52 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/7] python3-pybind11: upgrade 2.10.3 -> 2.11.1
Date: Tue, 25 Jul 2023 15:09:42 -0400
Message-ID: <20230725190947.660933-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104023

Changelog: https://github.com/pybind/pybind11/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pybind11_2.10.3.bb => python3-pybind11_2.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.10.3.bb => python3-pybind11_2.11.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index bb604982d0..d51dd905a5 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "boost"
 
 SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https"
 
-SRCREV = "0bd8896a4010f2d91b2340570c24fa08606ec406"
+SRCREV = "8a099e44b3d5f85b20f05828d919d2332a8de841"
 
 S = "${WORKDIR}/git"
 
-- 
2.41.0


