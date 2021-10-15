Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91866C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.4306.1634338590994538245
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=gcR4BgdZ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id x192so12705512lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oc0O0tuBevqtSg4epC5XoyzziGKLe1tp/XLSVbDtGhI=;
        b=gcR4BgdZIOSnIV80WFfSG0qK6qhd8OfkADAh+gbwObBrwe7hRmoSeF/BH1mInb8n0X
         h1bpsYDCJMP9S8EOYYddGuX45ua64v7n7nUdIsETIyCChVeGGTw0b1Ursngofg+px02L
         xaPYg5O9nTFmJsuPMwwd66D3YzMW3TOXYVDIhZJJ42AvJWohEKURLX3iSUr+JUUGJnpG
         SIOxDf+jNXoSpS2yV+xYpzp/8hPo/btxSgc3pJtxmDfryp6nMZhqUplAsDoY8niV/inX
         FEx/2lx1Iv4jAgxuDtLNhHW27TBKkjAt+n9hcqVMYzcTtBDM/OLE9hqsj98tJwrUIfwD
         tMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oc0O0tuBevqtSg4epC5XoyzziGKLe1tp/XLSVbDtGhI=;
        b=V4GHZ3gLAX+vyTYaKp1JIC/BrHlf8JvapL834ichxe7SMaGOYWPiz0HJLwmnsZIDHT
         mvxvQPo5Y07SHyzo14XadBQVK75AP6szel4cVQvlk2s1r7FvF92d4mhm15/fnoBxFZ5Z
         /iQmA9ecbKRgKu8QDoLOEElZYv5ObvaQkoamodKzhdbHh8AYRxVzWbKRD1zLuelYYQVY
         D0o5QIVc1KS18A7/DM+S/PwgZ/qCJxsPnG/x0lNyloPZQG4v78BWLAMTmkj5BDDMWDZP
         Ddwu/Yi3A2DMleo0Nhp/S73f9C/rL+5Vz4D7YGFr1EQ3l5qZf3L87FAzTwqMroiJLEPg
         xdvw==
X-Gm-Message-State: AOAM531rGfFsH/P1D8BxnLFUxAktWj0O6groTsez6N0hvG+PbyJz4d3F
	HRgU1EsJk1e+mVe3PthSUFk5wgzbEh4g0vMh
X-Google-Smtp-Source: 
 ABdhPJzdswMY1lg/jEWyi1GfPdQ27jvW+MY3s9HfrX7DzqhZ68fzoxguqxkVguSp6cU523buAvoPDg==
X-Received: by 2002:a2e:361a:: with SMTP id
 d26mr15787562lja.104.1634338589078;
        Fri, 15 Oct 2021 15:56:29 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t13sm656338lfc.34.2021.10.15.15.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-portion: update to 2.2.0
Date: Sat, 16 Oct 2021 00:56:27 +0200
Message-Id: <20211015225627.4162926-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93359

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-portion_2.1.6.bb => python3-portion_2.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.1.6.bb => python3-portion_2.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.6.bb b/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-portion_2.1.6.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
index a1076f9f0..e712c8f1e 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "725b65da806fb79df05c0b6383b01631c510f371d9bc0ece93a996b4260ba085"
+SRC_URI[sha256sum] = "b6bfb08a7834787aca076da1200b735d97beef61b60a462b05213e7354a099cf"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


