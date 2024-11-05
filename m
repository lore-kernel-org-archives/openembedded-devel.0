Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95321D33A3E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27859.1730831921119738769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RAMQlq5K;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea7c9227bfso12405997b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831920; x=1731436720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v0D+j/f1+3Go89WKjzXui5LW8LEHwUaseBhdeOrGKc=;
        b=RAMQlq5KNPEUI7kD0VSnRDLyAZYXDYR4I2DUxSJvOmDMcJFyxh4i0TB0W8Vccx2aBO
         ZovCvSxEvsqJ70J4s/d/cMq3VCpfol5T3hlY8dH5XRJ7a0XX/lOQ4nlglfSempbqdqFZ
         wL4SRSDKHjtP39kHOrdS9E1VKBRuGBagVTi9OnZg7sLAs11JQr/ftuCu14GdylhF9xI+
         t1KKRNsevU8EgtW0zhRZyiGLqdDxcV8E6Ijcka8Km9KQNDsOyVwH/LtTRvFkQnTKT+YQ
         DLcxrQAlqDTZvvMeFbM/vsRu49DDp/h2Xuepzi+WBsR1VD2l/jWAo5pD9bFDTOyfaYHu
         GL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831920; x=1731436720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8v0D+j/f1+3Go89WKjzXui5LW8LEHwUaseBhdeOrGKc=;
        b=xUZcGMk/Dpz+5+MtcX4DCc1oBrO2EoHCBaN+PAK7k+dJchbnV7EY8mTWI36UnPg2l3
         eElSgBbMIWXLlxJ63QSXo0tx/15jDV+111QSpZxFZRp+HOmGAi94SaeUnVEw2LvSweM9
         lO9S15ZCJa+xk783jS1FF7zbjKRUiodgPnxjnkUz59hA8/eNdsLqpYuY/vzNnMWsc/76
         kcXutrQFzUULEyvuOalDuL2sgFcTBv9mhfCS2Uto6Dv0L6e5RAq9KS9dphhqF27oGis/
         VBd8MhLRxCcfySNTdGxI+Pw+rg15M8kbc1bm04kSofeQmqZpPT3JhVNChf1MZbi/P0Ao
         bACw==
X-Gm-Message-State: AOJu0Yz8e9+ySfHgNezffEdD09YFyUDNZkaz0YDYafa3p3FfZQsO+vyX
	aOVez9K5oyfJ1OJcC8Q0SPbMbCVD85syCpRdz6mvw5+pI7QA1sKl/jsT+Qeg
X-Google-Smtp-Source: AGHT+IGEKxULqUGmy0edrBaINUTNxFQ4NFUQOIkI92TX5vAqZtsGCk3+al/YtH5W45kOQjqsmnrwwQ==
X-Received: by 2002:a05:690c:680b:b0:6ea:8a5e:7fbd with SMTP id 00721157ae682-6ea8a5e8732mr86955997b3.2.1730831919810;
        Tue, 05 Nov 2024 10:38:39 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:39 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 050/161] p7zip: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:26 -0500
Message-ID: <20241105183658.34982-52-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113565

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 498623cc8..789819a5e 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://CVE-2016-9296.patch \
            "
 
-SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
 SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
 
 UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/p7zip"
-- 
2.43.0


