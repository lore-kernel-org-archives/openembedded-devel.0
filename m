Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E109C54E49
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:26:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.80335.1709494001324567017
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpCvj/J+;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dcc7f4717fso38116945ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 11:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494000; x=1710098800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82Aj0azUsfvVPjZWTjRxVKbW9XWH0XFxv20GelP7+dE=;
        b=MpCvj/J++EdQiyjvspn8uO45ULjqBDIsn3uC89d+tjYpFjnxtqhyzZRnFhyAPZnYzF
         2fjAbNKrca5o9JURHD5/OnWPpkFy8TBb1KApKJ2llCdah1UAlywEIh9ZpTeQseoUMVz4
         Cjzg+DFn7+zElCsOsWNA4CY0eUt3RLzImo6i8o/jsuokC7qieGKh4t5u0wz8d2E1J8uO
         KxUC9ITtB0NBnVLSq+hLPf1EytOh0vyYeeDL/uLQ9MkWQyLo0g96ASp9uwwuUrlnblk4
         9efTeA2u/6Pn3ZsqlLR/rviViRD0iXlRNwYLbvjm2IT6xhKQjfB0MpmB8wfnQNw85dlU
         nnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494000; x=1710098800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82Aj0azUsfvVPjZWTjRxVKbW9XWH0XFxv20GelP7+dE=;
        b=Z2BMP5lzHiNU/7wyLV2QiE5srDcNh/Z18C5X0Z5v56rNl8wLEaqqpYmHldtc2Ni7gr
         TvtPT6obp+OUE5f6DMdgLPHZr+4jptWE2M02pbp1yzGX7auYd7orUjks2AhuraFufKvq
         T01ksmoWsu+Q/AfX9c+5nVYZ2wfNOhzSbmtN7c7Z67dD2hoikYIIiq7gE808qYrv4jgp
         nABuy4y8EHk5LJ4NF21IM0pqG7ToL9R1PR7cFAJy4mhfkF80TcSoVtE++J6w+yM66ulS
         NcOCSbyuUZSc8wAH2ePBOj1NSv2WP1IlRrAUrnCo3thseEx4y8xE2D+jrPmNgBQGCKx9
         eBng==
X-Gm-Message-State: AOJu0Yw78iKngWLOecshdtX8inb4VqFk45B5yJ6DKGnX+Q9vn2tTEwfY
	MNipvbBC+NmvalYyxXsOeUxLo3hTv3hYbgm5fxfNaChu1EwMjqDJngCljm44
X-Google-Smtp-Source: AGHT+IGCCD4TyENLbprBJb7Px/mtOdh5u8FScS916Ss7cUnWc+3yPkHP8mRVH+5PiKaQJR8qRO4Ivw==
X-Received: by 2002:a17:902:dac4:b0:1dc:ca43:307 with SMTP id q4-20020a170902dac400b001dcca430307mr10553898plx.60.1709494000402;
        Sun, 03 Mar 2024 11:26:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090ad48c00b0029aac9c523fsm6360955pju.47.2024.03.03.11.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 11:26:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] influxdb: Define GOPROXY
Date: Sun,  3 Mar 2024 11:26:36 -0800
Message-ID: <20240303192638.4154965-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 19:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109088

Its needed with go 1.21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 0770e4bebb..5301071516 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -27,6 +27,8 @@ SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
 
 inherit go-mod pkgconfig systemd update-rc.d useradd
 
+export GOPROXY = "https://proxy.golang.org,direct"
+
 # Workaround for network access issue during compile step
 # this needs to be fixed in the recipes buildsystem to move
 # this such that it can be accomplished during do_fetch task
-- 
2.44.0


