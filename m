Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10172E82CAD
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 04:23:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.101860.1696306998357821439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 21:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3Wgg8jp;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c60cec8041so3311415ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 21:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696306997; x=1696911797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=661vZ0mWxG+d2utGHlJZBsC+5qBd+wXOM8WfsDYvQGM=;
        b=f3Wgg8jpElGz3f41DCjPN1dtsrCMh2j2wzacXK5L8ohqPijJdE5IxHy+CFTkmFGuPS
         ZvfgdnVcQffl+BbqZ1e78nFfFsiKdDE63thq2OhBtEyyDyKKvong9NLBVo16DxzJnvsJ
         UxpRcfsUmKZO18tG/I6ySSMKTenTYoLNvdP9P+RmmK4xd37fXFDsJ8sfyqYzJynCjXJj
         CuaXPxDZ5QbkFkPldtZWmXAte5xq0IWNOaXKNNxcsi7jZFsdIOdUkjfDN0fwvna6qlBZ
         SfeRQPBqhIXtdBq8pHSiCdKTSaFWP5P3C2j6KLV34xBbh5LRbIYCTAZXtp4YJ33boh7B
         OOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696306997; x=1696911797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=661vZ0mWxG+d2utGHlJZBsC+5qBd+wXOM8WfsDYvQGM=;
        b=u+sRTixyH1lHXQflZPEB2C+HKeMIMSJ8cliC/H72Dq658oMUrsFXYSAHuNdb4NnIHu
         u1r2tTXI2hHMuwnqe82m3iFdnKZWZKVSiDHfSgK4r3RPb2dPva4t15TUE+f2fHh0VTkp
         h4lkNB0owYe1NwBwRLwiXzFs6ej1tMG0neqxsJr2/MJPjkbmHLqFwvK+pt1rpi1hL3F+
         4jPIdD/RiiC44vkkPjJbUKOYkJxRWSwB/ohhw8lfQFyoJHlasxQ+W4ZScD9pp9WZ0Tq8
         d39+21ESRgCIhcuGaSl7LmDibz9JlLJM88FgPm8KXmXo5TJhWKn6S2L4DqYmnVFhw3JC
         XYrw==
X-Gm-Message-State: AOJu0YyRPuBnY8OaV0Ap4mQC31Hc7SBcQtdF7Ujkil++oIrc2GlC+jwO
	ITeqFLKHEFgW+CamNsSvyqW4Z9NWjgSgpg==
X-Google-Smtp-Source: AGHT+IEbW14juEmNdymqiOEJ+zMXMCBO36oCFQFRiwBSeH+SPfyIXHEv/kKyhdT123f/JngIakz7KQ==
X-Received: by 2002:a17:902:f541:b0:1c0:c174:3695 with SMTP id h1-20020a170902f54100b001c0c1743695mr14082598plf.13.1696306997363;
        Mon, 02 Oct 2023 21:23:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8a00d4f7asm320041plh.9.2023.10.02.21.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:23:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-lz4: Fix ptest result format
Date: Mon,  2 Oct 2023 21:23:12 -0700
Message-ID: <20231003042313.1153843-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003042313.1153843-1-raj.khem@gmail.com>
References: <20231003042313.1153843-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105315

This is to support ptest format
https://wiki.yoctoproject.org/wiki/Ptest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lz4/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lz4/run-ptest b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
index 1b245bcd8f..3004024619 100644
--- a/meta-python/recipes-devtools/python/python3-lz4/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -v
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s : %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.42.0


