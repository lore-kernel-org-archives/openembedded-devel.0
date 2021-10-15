Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7068C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:56 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4254.1634338915602146245
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=1SwXOlZu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id y15so47835282lfk.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7+rSrogLqg+dde7P/8ZpNFz7fP4PPVKuchXR0Eb4gE=;
        b=1SwXOlZuLCCPR4uG8xswJoddVNbxmq7Oa9LL/g4f0aDJeJbpmkmUw22mA8YbBKxtQ6
         GBPPQOASVjmD4KnYbFRwFxOfO9mBhcr2rwZ2222OVUXYhYkK1TPnGoSUhKCd9Q9AHwV6
         sVbuhRPtSewEie6rP6he5NM3Mehz6RqX0mhp6PN+sfnnHDJrB8CWMQKRRstY0DSqI6sZ
         x+Cpb4WNedZN/EIFkHpznqdRh6sOIe1RWK3+R3uBi0Ce73U72QDQvQ5gmacWQCHpg/+N
         TRJjrr/raXtTbZjCvMxLDjF/MVmiE62XAEQb9MVyNBwL4wYfG7qmzfySJIC2anm9k+Sc
         DK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G7+rSrogLqg+dde7P/8ZpNFz7fP4PPVKuchXR0Eb4gE=;
        b=64tB0LXEQJ+MkFmsjWCZDcnxRGEHK+yitUa1j369/U6uHbQsYOwNEIBTl3++pACP3e
         Vvbbyu1fKRPhSjvET2bvTb2hf/e+wm4PHlWAJadVbn1BPHCcEuWP5OX95ULfAJNrWg1e
         Cjf7Zyy1/24s3nwQ1SbMBEWEbf+pzW+iHNZOvvyXqdZceJYOXEn1L1GWb7F9oCQgTTBB
         0KLoCpWo7dI4QVCDnZ3KGWJyUyIoKC3W6RbECZzaZ1W+QZSdFFZtf8+n6qTefixRGGBu
         4mTBoSE+HxAMlnjeuZopiOghjoKeFa0p56osV/VGm4tJW9zuSzLcnA9jZKrhUWs0W64S
         3sFQ==
X-Gm-Message-State: AOAM532y8p0qIIbcPTKy98Q1C6xQvvVklaHwjUsDWaf9XCwvfmiBwH7f
	xOeu2OgxfKdVHtt/n2Lq2Zlnx3YEMXfBdzN5
X-Google-Smtp-Source: 
 ABdhPJwTwsSQokxwrWj1B5GxyW4hL+w8X7LOWjvqmw4zWB1OqIarYBHaq4pQ7T9eO1ITJLFHTcrldw==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr13719150lfq.25.1634338913531;
        Fri, 15 Oct 2021 16:01:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 w36sm137901lfu.81.2021.10.15.16.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:01:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-cryptography-vectors: update to 35.0.0
Date: Sat, 16 Oct 2021 01:01:51 +0200
Message-Id: <20211015230151.4165600-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93379

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-vectors_3.4.8.bb => python3-cryptography-vectors_35.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.4.8.bb => python3-cryptography-vectors_35.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb
index 2fb48f3cf..474eb8234 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[sha256sum] = "4c84410257993d3de058b44b777a49e1da2ae35ebea2970a360c7e3aa0f580f2"
+SRC_URI[sha256sum] = "978ad96822c0e007a0a3d8187eb0eafbd9eb1d67b50cfac70277175e74957bfc"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.25.1


