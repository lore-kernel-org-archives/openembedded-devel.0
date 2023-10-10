Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B1CD691F
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.87409.1696930795457917519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=QsndRyCn;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32d3755214dso246939f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930794; x=1697535594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK84Lm8zVLl3OhVFjNamJ1s/A+zuCwzt2EztJMvcIuw=;
        b=QsndRyCnEIAa8xW4OahttgNnIIWx67L5VDZJITUpVCrHfAE79NcjpqP+Ybu9J9B6hE
         luwTAoUsTVB1o1pjTGDAkzc1m/Aq+TUmGZGjGwO2Pl4qY2qJod1LEhuMV7aACK+yUlwz
         VgId4jgr+iOEgBLv+mVVRaZ/ruUqHlVBkXSuagLBjC9UHWZ8Fiyni10GHiIP36TrNNzI
         VCnMYVcZOK8JGPTCOl25VMFFqaLo7L9ZAz2fZbI5AdArhg8mIi61DpI7rWei+xROpNAX
         ByAIgt2Ym9x0ngG7kZTjZLyZ5NJRIZIRNMXv6TNuDHXJbJ5MYCISsYJctLIRxTVTfv/+
         h8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930794; x=1697535594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK84Lm8zVLl3OhVFjNamJ1s/A+zuCwzt2EztJMvcIuw=;
        b=BQHoFKsKViKU7dpf3f89G8XiVBBNQnRKHBrhYEsMW/LMe2ZlqSode7bnUHD6DlPE7M
         pvlJb1YqkeYzs137hqR/cnk5nUCW52BdwQHGj7wLeOseD3pNRwmJMLYv1OYLHLbz4l+3
         1EUQsC8ShbSWGy5Vvqs8x2UZTOeq5sUNystMLyaCysqxHwq+K95LrpTSjG8u2rNQI8PI
         B6DSvkdBMctYDcHxhFUBF+YkFlzd3NLbQyhLmgJIAsoXBwWHOmvNI0pNHSafVkt+APL2
         Fk5+Y66TnQb0JNNETjLJB78tQb8TgU3PoUNurJJyowRzMP4okNMDOFeHIdz4qXl59ndw
         hqqQ==
X-Gm-Message-State: AOJu0YwSiVKdf3SFiTdTydX+V/zDJ5lCzFbjq5DxFkFJsLzhbIeRPM4G
	x8tqYD90tbePDx0PebSe6gsXkh+8Wyo3vQ08ssk=
X-Google-Smtp-Source: AGHT+IGqVw4ukJHuSg4pgR6ii2BKm67bvpwUZOqfvYNGiko/SzXWBP5Gtc2B4Totgbmmf7P/NwSJug==
X-Received: by 2002:a5d:62c6:0:b0:31f:d52a:82b3 with SMTP id o6-20020a5d62c6000000b0031fd52a82b3mr14729201wrv.46.1696930793808;
        Tue, 10 Oct 2023 02:39:53 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:53 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][PATCH 6/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:39 +0200
Message-Id: <20231010093940.75037-6-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105402

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-perl/files/static-group-meta-perl  | 1 +
 meta-perl/files/static-passwd-meta-perl | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta-perl/files/static-group-meta-perl
 create mode 100644 meta-perl/files/static-passwd-meta-perl

diff --git a/meta-perl/files/static-group-meta-perl b/meta-perl/files/static-group-meta-perl
new file mode 100644
index 000000000..7dd58bbbd
--- /dev/null
+++ b/meta-perl/files/static-group-meta-perl
@@ -0,0 +1 @@
+logcheck:x:670:
\ No newline at end of file
diff --git a/meta-perl/files/static-passwd-meta-perl b/meta-perl/files/static-passwd-meta-perl
new file mode 100644
index 000000000..7b3591ac5
--- /dev/null
+++ b/meta-perl/files/static-passwd-meta-perl
@@ -0,0 +1 @@
+logcheck:x:670:670::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


