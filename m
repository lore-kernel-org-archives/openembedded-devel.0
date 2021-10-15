Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C2BC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:02:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.4350.1634338926969853011
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=mvzrSgwN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id t9so46954543lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40yn+UePOMAbd0QByzp3437mN8wKFmwiIMP9tQsF3ms=;
        b=mvzrSgwN1fQ8xy6HCQSZg+Wth7ZdesbLTX5pI/OGVxBVqCZRHuaKyZUyFfFg3UNXV9
         9nWiD2j74heOpf7O7NO3dFy4LoqQTzlMjHLWd8T5SuzxVrpZMGmwWnCUeXF370DHDVik
         rHRAUHc7KWUSLDMxNIuEWpJwAiV614ZrPD9EbImpCotWfyHKs3tFyh0WTMxzZrIVGtVS
         e3qyat9X8kdBc9rlLANE7Le93nM1dS0yUJA9JsgDSZyEYPcU+Wv5pATutEL0m2FNKJoO
         lhqCiABYnMZpitMAoLTNre1/DERQlFqBIEbt6Rf0B9Fv5AkZPvVWTjMnmi3p0UqYLvM0
         fjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40yn+UePOMAbd0QByzp3437mN8wKFmwiIMP9tQsF3ms=;
        b=yoPlEYNuB7iPNT8wcziDMxzMK7s6dtydtm+8yte4PO+5sY0/FX/sGUENnptcEYo3gR
         03yRFwdnYrT0ZS9z6GRKXbaRulRu8N8ZZgmUSAnNPG9KmcER8RWBhEq67Bi3SZCkhyq/
         50n3KLamOx8dfPEBV2HoXTNVSEvoTdGy7PD3dCq/Nso5gZBucZqBpvIVVDBYhnJNYlDU
         JLQMkjit7xAgSLXU+o6SLUKiVnfpPbXFlfZlM/2vt0aIdVCgejw+3e7pQcQUY6DhIbtk
         JRh3K+w4827fEjy3ksVIcISe35sjsXymI/Jk7IAhzMdOdtKTWuJmytOLlEumr5Y3MF13
         njTg==
X-Gm-Message-State: AOAM531AxSTgYuOv4SZcrzbJcCevhhoC9Pu2CwihXfH82nYiEcZivU2K
	uAPwMMax3EX1lrRUCoDuxWcD0+yzaGI+EVwa
X-Google-Smtp-Source: 
 ABdhPJzZJRAlUKF1U9J6skz8bn1oK/iMVXDrtDqpHfYnVuTPfYh3bNBIcMwSalG1cEoiN9xY6LN2kg==
X-Received: by 2002:a2e:8143:: with SMTP id t3mr15185304ljg.461.1634338924973;
        Fri, 15 Oct 2021 16:02:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 s17sm711566lfe.10.2021.10.15.16.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:02:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-coverage: update to 6.0.2
Date: Sat, 16 Oct 2021 01:02:02 +0200
Message-Id: <20211015230202.4165766-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93380

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-coverage_5.5.bb => python3-coverage_6.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.5.bb => python3-coverage_6.0.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.5.bb b/meta-python/recipes-devtools/python/python3-coverage_6.0.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-coverage_5.5.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.0.2.bb
index c780a63ae..67b3a5ef9 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "ebe78fe9a0e874362175b02371bdfbee64d8edc42a044253ddf4ee7d3c15212c"
+SRC_URI[sha256sum] = "6807947a09510dc31fa86f43595bf3a14017cd60bf633cc746d52141bfa6b149"
 
 inherit pypi setuptools3
 
-- 
2.25.1


