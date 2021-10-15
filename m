Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99383C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:43 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.4253.1634338542744567254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=dZy5Mqh2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id p16so47909082lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhZ8rtPcSSvBV64cEcVeHcMLRhar2l//LUh4mi0s7wg=;
        b=dZy5Mqh24L2UMIFayp/TrJzNNX6hsZLuN4zJPdLAfETreCheEr3/AL1mOw9TAYdyTc
         Y5Feugoun9Ed7MlwYxQfZyAo4k/K7Bpx5pjLywV6ydIrKIX04JZD0Cc/Ex510PCbO+1t
         Da7jVgygfsIENAoSFi04ZDIF9r8HTJsrViCWeBqF1GFjW2Or5CgOqiABc8dqFq5Wunoy
         VZbCliHcwGZkRWv0/tJWMwSuIfRazGK46IiTXTyhBOFmOMbu0g6x+5CZGf5gCv6hF5Zn
         hDJLzHbIW1EKH0uf3thOLF/ndCtmwLq9huGq/yNzIIRk3r/7NgDZ7I/he5l5A5bPO5Ti
         awFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhZ8rtPcSSvBV64cEcVeHcMLRhar2l//LUh4mi0s7wg=;
        b=5GjetMiZTOVmSPmMLkUYbFmcLauVEburTMsJnXFMqPGM3lfqtEpVL48w2gYHkc2MZ9
         Ena/bwisKqw/Cr3xDbpY2IDWMjtW9mcHSBFO47z/OsxJbv+yFM7zqZjDqawi64crHtbL
         IH9q/JLw6wCvehuKWS6tmOPaZGEBO++YQakUcuW3YtlzSNNoNotu6d8PU1/ZdOmVjooO
         wq2xGTq9uJElRlPYHzd1EvX5St5Hoz4hfNjDZzOcw7EfI46mw5PR2XMmDRPq2VCWCfH0
         hSmBFEG5i+BxsdzrEh6FNT2Z3ZWjzCfQR78O1DFwSMHWt+tfLikCgkte5RS7yerw+ER1
         w/Pw==
X-Gm-Message-State: AOAM532mMhrIZmpLjvefOW/t/9qwQ1uhBfKQBx3kVv/XueiC3vRVvz2P
	YL7YLszQPtsVsxlcCNAjRwzc2LgRDf43AGSv
X-Google-Smtp-Source: 
 ABdhPJzV7huDfsetQW+lRcKm48UGL7M0yAF/kGhlHY/qviNH2iluN1pnZVuQbXgzGecu2zTeGZHrvg==
X-Received: by 2002:a05:6512:6c1:: with SMTP id
 u1mr13913161lff.203.1634338540615;
        Fri, 15 Oct 2021 15:55:40 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id a6sm672382ljd.67.2021.10.15.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-xmlschema: update to 1.8.0
Date: Sat, 16 Oct 2021 00:55:38 +0200
Message-Id: <20211015225538.4161679-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93337

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-xmlschema_1.6.2.bb => python3-xmlschema_1.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.2.bb => python3-xmlschema_1.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb
index 217e77e50..d720dd334 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "31ddf77a44e4b121de212beeb2cc039e2e8b7a7a4f1678c9b29be1f5341aec52"
+SRC_URI[sha256sum] = "fa4e22a708f08d15f605c9191e2500149ba1a848fff7fa4904c2f2c57dc1087f"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


