Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32E1C98310
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5740.1768643174763626787
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NKd1cEUc;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0bb2f093aso17528915ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643174; x=1769247974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU27x2o+Itl+R3q+t07Teswhia59sLByIdvOP0L8Hp0=;
        b=NKd1cEUc/qeW1IZeXIXVyqYIboRYYI29cqaH3m8fHUa5COJ0A91DzbsiZVplAcgG2e
         Wvlp7k5KMhRC7BR0bbjvzww2MDaem992D0qxs/Ba0lBJ9TVQZ0gCQ2vF2gvZilT7GMGx
         SzOKa0qLIas2BPoUIS0s/WpBife7qXW/RCSitODiyYeEex7ZuqjrZVPKTSMXRobFhOuo
         SzavXDgSXTFF3e0IjCaYHN86ww0QaHVBbYpjOdHQAxxKF1zPGDwX2S6IOYEQxQosJlip
         rdGzFYB0UxvJN0fI8qvCTPoxo6D+MqaL9qS6SjynMW8TDrUKegDLiNkvSusYEzeN4Qjf
         0P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643174; x=1769247974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gU27x2o+Itl+R3q+t07Teswhia59sLByIdvOP0L8Hp0=;
        b=rYEgDpSnRcUefgiadeMOUIF/HFDou8jsRk/ul6XN3YAo6oKcVleQNg3HDXz3721qNw
         OAB4yAoJ+GW5Y6y0Qd6XmARct4998PDKfuCK6OddjL9w6CpD+bb6pC+ITfRpKO/19zRU
         IG4Xe402ZOAM84/1WCziKXPnzy+UxLfIe6aC6TJcswCe25NDkaBmwKAWZkSzkst08je2
         /q2AiWCkcAzHdsZw3YrvJ58IPQebrnGPoPvp4WDKfsaLYtMJqmgyOxXERkOU3+3o9phY
         Uqpr7yZQhVyIF9NLhJhJPpzfGeAwAYiqbJcAH+RpTYpXtipk5X2Ry90nOBGhp1Ftnln2
         nKPA==
X-Gm-Message-State: AOJu0YxXCqDA/79cjlzCKH6Y7d4lV2ec2KvqW4YPjegFhENMoeVTPXdv
	W0ot5U3O17CDoO4SYMCNCa2Jxzhz4Sk5ljrIrvaWfpfUpbsLsqJjgws8cn4g5Zhe
X-Gm-Gg: AY/fxX5Knj4o6v7isQM4punTu+cNpA7734QSaWN7e+gJoR3jNj/hY0JFqaoFYicudln
	/gryCI0aQfnSafHn04EK1bFH+ByjRYib/dg9tHDBAep9UHblHDidyXPu2mN40LfWA2ZaOEoFIBS
	7IrtXzvZ21ZeIetyUyWMurvKKG/EUyjEWrnR/QF+rw/mXFVaxXukenXZ84etv0zkS+7m9scGc0A
	Nl9GAYjdWPTst4FL8Y4N8iqwCLGXAZlKu2URy4LEPgQ1cGequo9zS6sw5KBCIalilKWD7R2ayCj
	q5jzR7Ug81ga4Z7LtuT3pDQhozMq/DOrQ2klDg12sml0S5BzlwR1K5XFlwCYfe2dYEwVupgbK7k
	gyeT806KzjaosNwhwnWt1OvbQeNIMHUGY1ErtTxzb3HaeUiJxzsg9o5r0N4x0XYx9gFj1SylhKU
	xNQ1o8kstKwfFTj6Rq6ASAJqs=
X-Received: by 2002:a17:903:2ed0:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2a7174f8e23mr51810835ad.12.1768643173965;
        Sat, 17 Jan 2026 01:46:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/6] boinc-client: set CVE_PRODUCT
Date: Sat, 17 Jan 2026 22:45:33 +1300
Message-ID: <20260117094535.4191231-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
References: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123550

From: Gyorgy Sarvari <skandigraun@gmail.com>

The relevant CVEs are tracked with underscore in their name.

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%boinc%' group by 1, 2;
berkeley|boinc_client|2
berkeley|boinc_forum|1
universityofcalifornia|boinc_client|165
universityofcalifornia|boinc_server|5

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 31de060b48c57194ea2e6c6844d746eb59a0d056)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 624be655a5..f995fa443f 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -29,6 +29,9 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+3 wxwidgets libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
+
+CVE_PRODUCT = "boinc_client"
+
 SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \

