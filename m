Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBD7C0502C
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.8673.1661843657362085351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oAwwGroV;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t5so10310677pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SBaq2juDa+tPQE8yaG5JiXG+glI+mgIfeWZOgpLAeUA=;
        b=oAwwGroV4xAWkZjsFnXK3NBMTVLaBJUGHqw52zF+zoiDfExKqx0jRGK1C/oRnJFb6Q
         xpsN9z13A1AbLWAT4R1zypT6Tw5cOdr5VQjaqZzFwYT2vzEC5yejNQnVJA2t1UGkH8ZJ
         ZCgR59ZyO8mI8ZhzHqaWPnG9fd++8fTmseOPhd+tLw/tzC1ZQbjSBaC+r8iu931WLQs/
         xlX9qE5HnvjDm+rYIryYGRDEnfFvWeVl1xQW8IqQhx6kYgKhlNVpdzqOWDRRmWDVXuPz
         PhlDR/BtxNbrxx2OcxjfBA6N9rAnyTNMSjVdepQaKWvyLCBbXVf6O3g5u/qvjyIIaAY3
         ga4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SBaq2juDa+tPQE8yaG5JiXG+glI+mgIfeWZOgpLAeUA=;
        b=oYZd2GjhozoxEZxbkfb35LC/XfdJj+O4r2/8ZfDdQZ+7QwJh38kOxQCck7hcj4HsCn
         MNHEBSQu7x+9cFIdivXYBK0mopeymgr1/sU7bv0tO+6Cl36qH2Fvt/h8cTeph9b/0Tgn
         asE1K6QtzYVUljww060DInhY592DM9kuandgVNZQ2tEQ1K/hDjJyMyTQrV9kI1Mo8Utw
         K2oFeh+sQOYjiROOp0YLIRFKJGsKHydtxzZYqJ9L3SBQKEDGY7mHwofVg674kAoW/ufb
         wgvRW77xj4BpX7Mm8EtkqNvl5OFPMrqFCxM5EUnv30Fitu1C8T/dBrV8ih6Z2ejgUQq4
         lp1Q==
X-Gm-Message-State: ACgBeo34qWHmKaz5oCnd8ldQXgU3HL5X86EBTWUTdfthYDTeXaVmLw/s
	Y1g/75ejIs5B8o2ZMP7RsyufaAn+aJQcTg==
X-Google-Smtp-Source: 
 AA6agR5ftQrlzTwdO1Gm9pH1vi5HKXahSSGogt7Kp4GB4vdRTq+2QZSrEnoDQI6L8sAykLSJmmJ59g==
X-Received: by 2002:a17:903:32cc:b0:174:e627:4909 with SMTP id
 i12-20020a17090332cc00b00174e6274909mr6294308plr.67.1661843657467;
        Tue, 30 Aug 2022 00:14:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/21] corosync: Upgrade to 3.1.6
Date: Tue, 30 Aug 2022 00:13:55 -0700
Message-Id: <20220830071413.3887189-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98540

Changes - https://github.com/corosync/corosync/releases/tag/v3.1.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../corosync/{corosync_3.0.3.bb => corosync_3.1.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-extended/corosync/{corosync_3.0.3.bb => corosync_3.1.6.bb} (96%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
similarity index 96%
rename from meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
index ec2a785277..8fca576614 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
@@ -10,7 +10,7 @@ inherit autotools pkgconfig systemd
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
           "
-SRC_URI[sha256sum] = "20eb903eb984f6a728282c199825e442e8bba869acefd22390076ef3a33a4ded"
+SRC_URI[sha256sum] = "ca6ed32b4d7f33ed614afce8760fe58d0de92c68b575d4969ebacd892f3d1e27"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
-- 
2.37.2


