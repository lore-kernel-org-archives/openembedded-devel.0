Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BFCCCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 12:16:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9201.1761480966331548605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 05:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ga5V+LiZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-427060bc0f5so1974572f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761480965; x=1762085765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yGmMK5RMKTWD5GgCCsQcwAnF+qX1St2qF6YfQ7EhIE=;
        b=ga5V+LiZKxe7ODfZwTSq0XD2x7VgYR+pZpoDusD1BjUy6/sWP2mZEtxAykE8nGc/Ha
         5ZmsHOUmQ1JHsIzBpQkCGTLaGEDLzsS8uTuTwtbeshv2jNGN7OJhDmLkIJap5+1jmKjS
         m7LlSGk0PPhofcZiQ9LjjZYe0ox5vGafo1yMMVkbqu5WgL5I0FgdsB6S5tjvKE63iatg
         VbI1H+IQKGjoaT+drmeik3Hmr9cbUGkciyYn7DJOwn3E2vEqjmiwrP+A4SfPsE7y+1av
         zRkDx07ZrTeyknRnPsSE55qwup++fM3DB+YbueR6Q7RmRa0HIloUmLSVWruJmbuS/1Ac
         vU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761480965; x=1762085765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yGmMK5RMKTWD5GgCCsQcwAnF+qX1St2qF6YfQ7EhIE=;
        b=iaFSZApBkXxGvN5cqLOWQIpI8/eHB4qUHKcdeE/2ccYSjCxZ35ADzODQKChzr5tGeY
         oUVxRGgyM5nt/IalVf1cUbY3k2Xj87RXYXijBM76S/vx6+vH3tRk1dGVhyQHPDTfxU1T
         dAP3h8VzdcUHOz2UUOhNDq0CeAerQrxuR98FkICXoNfEGnuL/RphnYudkElH7sS7rV5b
         E3ILGFA0mmSwYDVtGTaRylPoK4ahADQ8WklIpgquwsJZ6L5eAsVhDlYzEFJ+wfmf5wgd
         LwcSpf4E8Hk3q+mLTmdSpZ1e2C9duVgfLqTSMsKlIqLuKCextcZPfTbxTYcVvbcKBRpE
         YB6w==
X-Gm-Message-State: AOJu0YyqVU0C9w8udwKk0ZHi3Rw+ujwC/BQpStSEy60IvZTQNzajU3nG
	3jTBsLWkAdVzpflHbVr2JOW/StsAB9OGpj1d7jkQoDxK+BPfbVT74zos+4WTWw==
X-Gm-Gg: ASbGncskTGWEs0az+oCK28DJOWh3mrj/j/+9z+jUy0k7colKfj0olnu10K9jOl4Zyv9
	c7WdS37D/yCIc8I53xQF+HF4z18G5gBvNNk3861xpVCK2uLeVzecySzqoF1tCPq6ujICTQBE8VI
	IszRuQAwCPpL3Gk7rWzKqng5MXTGsjzxzOoFltM7y8Q6Q/kaB7tz+XoDkEzSJhrudH4K6xol3T7
	in2efb7QR8zC7sSqavooAWfVmqY21qPdJx803GbRJ1kSfT7Lq3c1oPkEI9KvYtvq7xDuu8JSwxY
	sihmo6fQAIV29q3M0AgmgtAXxmAtbhAVCMBiY9LOg8aB/Ryxidx6tntULuYLXoRdOx5ex7uIdda
	dmrFdFCoZhHjJZK1/5v0udo1TjEAljOkGBwIjcUW0fhEKAskr9zJ6bX3++NLOr3eW50SFXADWvu
	ltd0/e5z0+
X-Google-Smtp-Source: AGHT+IGok8umZqPlLjCuqvJ8IXj9OumXJcVyJ2mvpDhzxvHM+y0m70268baMOOIUmreU7XYUap7/QA==
X-Received: by 2002:a05:6000:2c05:b0:3ea:80ec:8552 with SMTP id ffacd0b85a97d-42990752477mr5700443f8f.57.1761480964647;
        Sun, 26 Oct 2025 05:16:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm8422801f8f.35.2025.10.26.05.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:16:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] lksctp-tools: move ptest from problem-list to slow-list
Date: Sun, 26 Oct 2025 13:16:02 +0100
Message-ID: <20251026121602.2772473-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026121602.2772473-1-skandigraun@gmail.com>
References: <20251026121602.2772473-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 12:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121012

The tests execute and pass successfully - I managed to run them
successfully, without a change on x86-64 and aarch64.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-networking.inc         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 1cdb6d1811..408b559da2 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -34,12 +34,12 @@ PTESTS_FAST_META_NETWORKING:remove:libc-musl = "\
 # firewalld currently hangs forever so disable it for now
 #    firewalld
 PTESTS_SLOW_META_NETWORKING = "\
+    lksctp-tools \
     net-snmp \
     openvpn \
 "
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
-    lksctp-tools \
     nftables \
     python3-scapy \
 "

