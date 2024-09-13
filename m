Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6635DEEEC31
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:21:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.67534.1726208459883115728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OtjqbAZP;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-205909af9b5so5253675ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208459; x=1726813259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcGdNSgCqguruTgNebLSZjVDI2BxUZ/3Cs0qnqY/mIc=;
        b=OtjqbAZPJ7brzWV70Z+OwL1amp7604jw5kVYB/w7Cxp1EVhaElPh70U9r59k+l1BiK
         cy7wPyHG5jdo6leMghB3ThopT0AIviqlvMlN9+KB6EqacQ3x/K00+h5LUwj1AE+0Z7dB
         ZDwmaikvXIaTV6ejtbnj7qeKv27LB0ktR+0sc1XlTyOmuEY/HREUQKRpSykdjgO3gsX8
         IpBy29Gk5SAOp3vSwHfQ7FKi+2eCGYuduSfPQJURxkeR1DCjPMhhHCDZDBUkvJA0rfNU
         TQBMemF7KOqaAGx8qtAh8S9PAOgLzDOmP8z1EAwLzPas2yIid2RL+kNtTT2+7aVyfgcs
         Yqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208459; x=1726813259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcGdNSgCqguruTgNebLSZjVDI2BxUZ/3Cs0qnqY/mIc=;
        b=f/KckHNSaW5FxdqcyLzYMVaihh8Sl4CiMX4rTeoUCftAVo1HeYZzXfSlGbtAu6EMrd
         nNDi0gkcRscleckidu1OpgiRDjgvroEh52msC2Iq0irnCjJjKThh4asYbegfngjljVTn
         9JDbAxuU4zmfSJrsSYSSzitHG64b/7Jjz1aAEIxBxW8NunzA2gnoEgoT9NfhQRTLUl6f
         +30nNCkf/EeAkECiONHc1VNU3CD0O2AMt3KSrJrUxsIIiynpudapHFDqwgwcpSL3LmoN
         TZZDQusLQC17DhnsNlaMeFftzx/Ko4qQ9sOMeRJvzkJ3W00zABotxXXdwnlVXSboY0PI
         KIVg==
X-Gm-Message-State: AOJu0YxzO4hKvVyxgftB5LNV5yviRWYGCXPiIGoaKLwPmRFd7+L/nYKS
	/GzcuZCaZeDPBewCcUHOr70LtCFtHqfH7lubt2ReKFJ3ZCcGr9ewPzHEA9kg
X-Google-Smtp-Source: AGHT+IH4l6Ji9WKfs5eoTyYfAfvfWNeXgYgJlh33VA7csfxkNcEAGFHV+GCLiB+yXb40Zru93dr5XQ==
X-Received: by 2002:a17:903:228c:b0:203:a11a:30c8 with SMTP id d9443c01a7336-20782a69ed6mr24346585ad.43.1726208459039;
        Thu, 12 Sep 2024 23:20:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 07/10] ptest-packagelists-meta-python: Add python3-fsspec to fast test list
Date: Thu, 12 Sep 2024 23:20:47 -0700
Message-ID: <20240913062050.2597921-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112266

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index aa918aa89c..92e64908b1 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -24,6 +24,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-flexcache \
     python3-flexparser \
     python3-freezegun \
+    python3-fsspec \
     python3-geojson \
     python3-google-auth-oauthlib \
     python3-gpiod \

