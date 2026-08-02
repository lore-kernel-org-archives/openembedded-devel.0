Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57E4C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22332.1785672305424239567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SxMOZtCy;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so2919399b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672305; x=1786277105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmmbB5GW0eyY3+RGkhSk6UzADHAFBpM6N4q7LFimtpc=;
        b=SxMOZtCycwdjXoEjrWN2b0x0M7j5tI+f4sBNBE/J0BzODwqcNWxQZpJlIN/ivJy4iI
         aTAP0AcaQWaE+2FEH/q8LotqueE5K9sKj6XkX5mfTUU8oB4oJrNkuYdohxZ2XATQanfF
         n6EWISCc+5oSB7JaeWatu02nhKc3ttEPX4AHovBr6A+gb7UJ/aqnT3uFyveFV8jY9hbJ
         uzNsqwaOv7Ovc9jEXh7NB4xEdyQdzbpvLmtqljzY6gscIMg0pCTR13qZvhkIlO+ca9sF
         2CNKiyApJgf4O+mi4spMnqP0qdIZkkCu0NF8Wz9Y2ANKYkm639MF26BQlG0H4lJc+nY4
         9tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672305; x=1786277105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bmmbB5GW0eyY3+RGkhSk6UzADHAFBpM6N4q7LFimtpc=;
        b=WkyMrv+eLca4zTVi9m5GP6JIaF63KCeww40Ih4qz2lndcIcM+YRfFsVxFLXATAjm3q
         Wj/EG94iUb4DOJpvQ6CsRfxtH949lqXVZMA6c7FHZ0ihdDnIUqZSlSVod6tqZAmzzwWM
         mutyGhLxJ1GLppjGMQ9BGnDfNo8/4rX1/8IC4hE9c4jYJhkbjRlplkQJZAsisullsLKJ
         F48IpSnQQMIXPc3sWWd3rDf0tJWQlHEi3wOU/vkI7UjjZ/6K4dsC+0emnFtPj/5aYPRw
         CF4H4XfeRckgVcL6bkoMDJjp0aogUCWHA9gQ/mDC0bljWpgIKhMR2RHRlXwZPMzjd79S
         5FMQ==
X-Gm-Message-State: AOJu0Yx5+BRAXiDBGo9sdehF5JQSYfukEFdNSjchozhC4+V2s8JxCJ7+
	ZdJ8JTvdZncMZn/mYbnWf8BvsRtikutOhqayayX/wjZK6Sg9xpzGt3cmuH2elA==
X-Gm-Gg: AR+sD10sgti4Wh8sVkpYY3FBcr4ET1a6p8o7gyWVc5PuCKga3orcYgeMQTQavaRjqq+
	UKnJwjiXhMxRDfn+i4t1g0331O8BAhm/3ISimaeR7vKQzZbGuF7r7NHYHZv7FB7JsXFnaDO/YBB
	Cnu4pkOW8y6ozClW2imnYVwh8YKOzRD8okCPxEJ0xCfWinh6YA5KWtK9B6ena5kJYoBTIljLpPX
	ZcXdbGf5nIjvTIHcc8FVrBq6GTXS+R7eKcz9bzZGoV1CN2tjFvL4fVh/vY0Di9/XaB/EQHMYw9p
	iJmP0LrS25LGemjJOQmCxDsaK8mLaa+3qjAMDPakqBy9zA9uz09iuU7VEAT0aso2s2oafykSNnR
	nq1G1Mjkbcerz0G/9i0uU40aumeIbN5soaP8pvtPHQXNFsksu1DU8acs81JtZdqj/hYStKVA30W
	nfu1mh9kf2+EQXbJSi+6k/9C18Af9FEtH4p0k05bj8CnnSb5uptx9s+2Ko8XmfdvgE80yvUC2Y0
	qH/rMp+q8Ob
X-Received: by 2002:a05:6a21:501:b0:3c3:a969:2cf with SMTP id adf61e73a8af0-3c92a8f5e8cmr7004616637.53.1785672304803;
        Sun, 02 Aug 2026 05:05:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 4/11] sngrep: upgrade 1.8.3 -> 1.8.4
Date: Mon,  3 Aug 2026 00:04:35 +1200
Message-ID: <20260802120444.2973561-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128659

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Included tag in the SRC_URI and dropped explicitly setting PV in the recipe

Changelog:
https://github.com/irontec/sngrep/blob/v1.8.4/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sngrep/{sngrep_1.8.3.bb => sngrep_1.8.4.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.3.bb => sngrep_1.8.4.bb} (93%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
similarity index 93%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
index 2ad532de9f..5bb30da6db 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
@@ -15,10 +15,8 @@ DEPENDS = "\
     ncurses \
 "
 
-SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
-SRCREV = "c77bd75a52d1aac96ae9d1603f2b7dfbe7e90ffd"
-PV .= "+git"
-
+SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "9c370866afaf5ccb258bf03848b2d22f30cf61bd"
 
 inherit cmake pkgconfig
 

