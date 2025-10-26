Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558D5CCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 20:51:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.18230.1761511881878454992
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 13:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FRXWzviJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3191121f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761511880; x=1762116680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yGmMK5RMKTWD5GgCCsQcwAnF+qX1St2qF6YfQ7EhIE=;
        b=FRXWzviJQLR7hLT12SH0jJpmDyjEkHoblvUXeyQJ40fy+KO6XYx74VJ+xStRsxp6NL
         ub63Ocb9TqIl55x9I5lFeyUiu9RhbaYHRcazwa+inmkxT6oYWzLSVmeJFBrwjq+1yYQn
         PJVs4+EWi4/r+LR7lLzuNvNzGk+Kf69D6UJ8w0OMDU/WdeTBNiIbrHd4x+daJ/O/2qbD
         uoTE290/MNhtugoliWxb7sFrYJSiVdUEUYgNHcylJ2aMmfQ7CBqGgRChmzJaVczjOXsL
         f58NDJqULFeY7d3ifhYh29E7Ma+SSAFiTDlfAWBYjmWylN9S85yoc0OvGkksY+ZCA3e8
         J8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761511880; x=1762116680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yGmMK5RMKTWD5GgCCsQcwAnF+qX1St2qF6YfQ7EhIE=;
        b=oESjaLZMBSoE5IduIT5t9J7C4MNW2MY7ZWbIScuQPshohxKgb6yVw/i6Kn5qCuidzv
         mkCQ1uL27V+5WW19ZFMZjAN+GJlV3xIlsMgtS6jsZi4VWpJd/I/nVeVRAg1jfMNmY3Ng
         ZWT3/+r5YQGDhqkL9RscjugTgRFJ81PtUxtSxz5O4xM4UKZgAUQfmSV8KwIXu/gfN2jg
         wgNApU1fHrB2v1ZZjjnbXJQLVJYaJhKHJqwT15BLNvHU//vJT15KU1DVB3RftgFCH36r
         /reaa/gMXbaamUdzpZfbw9SRkI4zrQ4fGgxgFEBq3hXbgcHooKvf9EY0PVPrpXBSC6+s
         qnZQ==
X-Gm-Message-State: AOJu0Yxj5pWR3LCWkpm9Ymsr/7VjZZM1d+YZxV/LA2VnB/B+kqW+DIig
	UBMVYW4dcertprRiswHQa1KvLCVGmXjFEzjLGMQz+GmI2SQg2gALHmNXE8L3+g==
X-Gm-Gg: ASbGncsyqH6vg3m55hX+JLUugCBqAY8vQMz+59sjTN4qvajyNeMuFUMYqKt5j4MAx+b
	ZjKszLeKb81/NRMa//TwczIFF4qFYfuyvKlUaH12+hriAMhf1fn0koDfTUpoaRXpeI9rnRMGjVB
	V32y+L1bOcCQV9LeDCny4rBoCJeKaiXUy66l0wgx482ngEXe9L3+wqbO4uVCdCDL+N15Itk0Nrl
	KYmZrUwylA6fjx7A+wQf0OokLZ7yDyxQTnz9i8vudJXTtPdCOEm8N98nR/Pedcu7NqG6zJf599h
	2PeFG6uwsatEizsrEQHSew9yutdhYpekX8LPtieZYan7O37zhCKHlRFAFzWFyVKnkrcHF0Kz+BR
	IQfuhC4HdWsxjqWiYiWDTpW4IPMlFjZ1cf1LyJElevDe08J4mcv3VOxHqgpbyJX5E9dqrr1upZr
	bsV5rcNcfP
X-Google-Smtp-Source: AGHT+IEYmLAs6ki5tTWcijRCCn549CKNxSM1wdnn6XVEzzf/vlS6/s/pMOEnHj4ACd01xdBSbV0njQ==
X-Received: by 2002:a5d:5f88:0:b0:427:537:39e0 with SMTP id ffacd0b85a97d-4298f5825cfmr7863098f8f.14.1761511879891;
        Sun, 26 Oct 2025 13:51:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm10484113f8f.29.2025.10.26.13.51.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:51:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] lksctp-tools: move ptest from problem-list to slow-list
Date: Sun, 26 Oct 2025 21:51:16 +0100
Message-ID: <20251026205118.2439308-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121015

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

