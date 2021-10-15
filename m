Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE0BC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:24 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.4194.1634338583135620440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=kAdWL8/B;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id j21so48217155lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfU3ho7pRKHNggBlbyAUZ+x9udGgrP5QZK0D2UKusKk=;
        b=kAdWL8/BLFwpj4VxZjeeOvI6f5BZzs2oF+/4P+l7fN6DvH4PpXWWEtnu3CEz+bxKHJ
         ERoObSCB+giFa+QMXkLZEyH9MBbblXeo4663qRnC+rqnksy7L1VtIFtDFYiUzXDeqVz0
         gkHc/YxIjygI6r2I7LTsFzWvcE9BB7dPnr+z4cWD9YPCgTgw6QpuTNgFdDKPAtUaueX6
         dqpYbl1woZHBk5pBTbQ0iMndBYMMNNWw61z4PSzcLg6FqHwxgxpdEomXlUQaXckZUwuE
         PUEXIOcE7qN9vWj4v2uOZF68t9tMPSPbUs59UmeGczkp8nAy5KVzYjoAIUZ0/qWVd5xv
         V7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfU3ho7pRKHNggBlbyAUZ+x9udGgrP5QZK0D2UKusKk=;
        b=o6A12NOL0ZlopV+dQbshthNimXIHPVb2mF6n9o8rt3yUc2iv7cHzYgFi1CG6U4ofH7
         Uf60HpOcr2JNkOxfJzJXZmdmQ58T1NwkAXlFrBikibedtMQMgSq5sKS2m1fzky6WEOrt
         0uGExQW+3p7BB8s+W0NMGo/tgrTSf0EzD1FmQhHIpUdcE8WJ+UWWlpSx5TlwoMyJ+keS
         VEj513ZUDuTiSzQMoC51oO7MDrcjQvuopyaAju0lvUGJo40ST1mwVSIt25/Wkrs08eAE
         ce/mrt0KI+tpGyqwFpLAOCh4Oy7HL56NlQcv9NXFnYHMCyAnMu68gEdVVw2AAcUQpbrf
         iyPg==
X-Gm-Message-State: AOAM533/aQUXLzyLf/dHZaQLXPadVJMyJLulM6WAYCGzBWeIz7w+cuHx
	8dNuuzG55MHlm3lALwWyI7QROc1oi+vmkucv
X-Google-Smtp-Source: 
 ABdhPJzcGJm6fzeviEX6N6/uSYLXcWVeftXx/nWG/hTijDNr0KefATkm7y1kOe8EBXGCwgr2Kd9JnA==
X-Received: by 2002:a2e:868e:: with SMTP id l14mr14768692lji.26.1634338581226;
        Fri, 15 Oct 2021 15:56:21 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id 15sm656564lfy.86.2021.10.15.15.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pycodestyle: update to 2.8.0
Date: Sat, 16 Oct 2021 00:56:19 +0200
Message-Id: <20211015225619.4162699-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93355

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-pycodestyle_2.7.0.bb => python3-pycodestyle_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.7.0.bb => python3-pycodestyle_2.8.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb
index 611abca6b..31720e2aa 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
+SRC_URI[sha256sum] = "eddd5847ef438ea1c7870ca7eb78a9d47ce0cdb4851a5523949f2601d0cbbe7f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


