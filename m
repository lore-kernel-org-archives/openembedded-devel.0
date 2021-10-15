Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56474C433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:07:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.1620.1634324825926344411
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=DfL4S0Xr;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id z11so44352361lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lh3pUhXO8m0PtcBcXJ8ORy4M7iphPkfE7ixMlNhshjc=;
        b=DfL4S0Xrz+40Ry/gWEJtBUZg2Bj6+CgevVDkvoAChqSI+kFGRe62O3BO1SmcWBAb+7
         vfTRUl4/klvCEYp9xCm+nIxPOYwHOlCSbYMDutjQqT2bE0lXNCJHomy1AHb3NOrYwmpv
         yvPNWT7Dd23AGFdAabUmrST3P4bNinS1yzXLRYVUgkz6n9U3HN3E0SiI5rkyqpapRPQg
         T2DWfTjJ5HiU648RPdVCLYpG11+1K2H2PiSk/G2ghqpAGKj8FLe7qwr8U+9U3Uju6HwB
         VzjSwv5LUAU/FhBk1yCqDmtQ36sv4sn/9WHFIQNheAJebQmwzqcaZE9FowSE0vOyTudb
         yEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lh3pUhXO8m0PtcBcXJ8ORy4M7iphPkfE7ixMlNhshjc=;
        b=GqiBfXacVxdaRAAfkvw6g9gDsOLzkJIfVgN4P9Qjc86GxX30gkLXBWz05bBVT6nYot
         xzz0pi1y+7UhY8nYe+SPQTcX7TE4STweO0+r5/Sz569wceEU26jrzC9RzVdRd1SFEcfo
         /alQ/9SabUsLBuIXDJj4o+xOgiJ+oN+tU85HCygw6dQZtNMVDCT54kxO42qBOACEXrwT
         fdq4wSLbvFAslTpA+CxRNddSgdXIbxQvmIkXvxAfYZelBu/r9oWnyzz4yV7VCTCfLjRO
         EwUpWj1z3piwhh1IoLUJ61w4Aha8B/bUbLixRPGVER+mh5h7u3w/OltC4bEDMsyd9fob
         jc+g==
X-Gm-Message-State: AOAM530J/WtuAyEKbrEB4r860dEoSVC+LcJQ99BQtCn4/QDh1Sksapze
	BNFO6dzRr46VJ3LR2ih/SL4l4kTtWhz7LwZi
X-Google-Smtp-Source: 
 ABdhPJy+lxa9sUd38h7GixUyFMqKuLDbuOxaJLWCXSIpVY+dAlf5tXBC36+t4AepN8oMSxXQXZ+OFQ==
X-Received: by 2002:a05:651c:b28:: with SMTP id
 b40mr15005900ljr.334.1634324823422;
        Fri, 15 Oct 2021 12:07:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p23sm597235lfd.127.2021.10.15.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:07:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libbpf: fix PV
Date: Fri, 15 Oct 2021 21:07:00 +0200
Message-Id: <20211015190700.879453-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93328

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-kernel/libbpf/{libbpf_0.5.bb => libbpf_0.5.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.5.bb => libbpf_0.5.0.bb} (100%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
similarity index 100%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.5.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
-- 
2.25.1


