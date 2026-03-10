Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10FCFD2D66
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:17:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38526.1773145050313085458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRZH51JW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c4a93841so4927989f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145049; x=1773749849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqT47es8/eB2cbdyCHZ7GbPpNfy7qg2RXtvyMRFlKAM=;
        b=QRZH51JWQKSKmnXBMywt1LqlldqApfDo7cmatSmIicpsyAHxbckicEQkXuAX82H12/
         wnSXQQHdSyWaqIKogHsqWZMWS6j3Pj+GEPSBjcNhixvB+zQeqpLoHZS5/Jzxtg1PIId6
         B+sM6sLy/4uuxhRC2Baz3MuTLfRU1kTtoN9diTQ7OiYnjz5eGe+C/me2QlBFPo7RrJhM
         7pSg91zcdZGVzI7TYFF5sI8IvzAwxVctQ4Syh3tp8/Lu2W50XNDgFC1hUO4Moom3UU/G
         oM0TtD5FO5qINHaG1ANsfTAnZNKFNZJzQM5EcOsd8vuxz4nvvWGxY/3tADzB5ddP8ctg
         y7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145049; x=1773749849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqT47es8/eB2cbdyCHZ7GbPpNfy7qg2RXtvyMRFlKAM=;
        b=lds1WUrunsd75uV+CuklFFHEzDcSdM4DM84trddAjnsL5qrKvjozjfMUF7i3nxLOs5
         YbJUheCNaQl3W9x+nVWSbBCr7XbCpK+zIzGN5vhaKMHBxjfT548pd4JyzK/ZeDKC4Hjc
         4mPc8KDO6g/pmjYurYd9Topa4AT3vLA+irOZtYuNTgzM1wbJFD0RS+pv1l9A8qgqBRf9
         NSwNmw8ll7DMwX/euBCRbLv2k36HOlr+zf2e6FdTbIT37zHDgrE9vHCQes2eAAU99Jyn
         5ifcekkT891uOMEzIEeqbYdx1y9MwfDcOxR4KJSGvcGESBABSGEuNPb1Tr1Nt0UXaVpR
         8hsw==
X-Gm-Message-State: AOJu0YzSWZxvt5ihD/H4T7sw/s7nDjGC7sZw6KJLvJD5GDmZxANahgfu
	V9xxRSUtxAhL2bwQHfsVDtyy7dY2iWBNd6ZvRi9BntEs/L7NvRNsiQ9r9MLnyw==
X-Gm-Gg: ATEYQzwlwZhaqnkDHDUfKCFyvpVBQjGetIhbRMWmx89iLB/YpFoWffFM37q7VfzY7m7
	8eC/ByH39YdXqjxq2zkvjDER5sugWMDFIeEari4Gep7bXIP0tLb/OPajRhniSOJUqAyI11QLoN2
	LbTOBWshwlmvv54yvISdH5q13QseLrHZ7yqBaH4pY/9x1Sn4ovegH9XqyICtPRt1xQ0Nb2pTTDW
	mrIqdpGjCZ7It3yRcwipSK/iLNLxtVmvdPgBJLgwE7SMgdTL5WqByDbVGjPPrOqDat1lvPo95KS
	trsHGlrM5vFMdtUfK1oh7lkb3iNBWxDkS6Jgb9d7JJ7JD5T7gikqHCvB768+5hKndgPuOwTiTJi
	42qFMdo+0VpRKyzX8Y9SjBSlJ/TfSnLJbUyeDcIx/3HhSZ7DZo7CLe7aXrAHpNXGzBDJ1NxYBgZ
	d+iSH1q8bFO7I9ldscR8u3
X-Received: by 2002:a05:6000:1ac9:b0:439:c2ce:1230 with SMTP id ffacd0b85a97d-439da86fbf2mr26789289f8f.57.1773145048529;
        Tue, 10 Mar 2026 05:17:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm31822538f8f.29.2026.03.10.05.17.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:17:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 2/2] python3-django: upgrade 4.2.28 -> 4.2.29
Date: Tue, 10 Mar 2026 13:17:26 +0100
Message-ID: <20260310121726.1115244-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310121726.1115244-1-skandigraun@gmail.com>
References: <20260310121726.1115244-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125027

Contains fiuxes for CVE-2026-25673 and CVE-2026-25674.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_4.2.28.bb => python3-django_4.2.29.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb => python3-django_4.2.29.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.28.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.29.bb
index 2c6d33991c..ded9e6fc1f 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
+SRC_URI[sha256sum] = "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7d5659d4709542014"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

