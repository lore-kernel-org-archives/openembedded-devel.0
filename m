Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5AACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:31:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6545.1762612305354642938
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hEFH7JQV;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso619826f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762612304; x=1763217104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpoWX+OTuyH+A77E37E/dKBUz2v9eHr/N3t55gumJlU=;
        b=hEFH7JQVor9tuqAbrSg001z+FGSUzKWCRHMuKE1Zqdjq6CWVt4LTxiQFdsNQGxnAgI
         +2KmhtXiGSEpbxy7Fvpqu7bI/8f37yjoGthhTk3I7wvfc+OK+VqDd7U3nttWn70L48LP
         f7JBogO0QI89cH3IaSIqAyl05lntETmZTKbOeF80gw68C/kHLciIxLFlnE7x8BA4YVrJ
         NpLGJs6PNIvVjHt7qbuMYYEo/3Xbt1WygXXjFbc2KYrHzTeS28Ua+2K6rtBvL4CPT9n1
         KHh9/2+v+OY7nyaahVvh2HuDXKMQTx1GubQmLY7hdhdzFwEk3YhC9jyZLobpEFWPi3Cb
         UEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612304; x=1763217104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpoWX+OTuyH+A77E37E/dKBUz2v9eHr/N3t55gumJlU=;
        b=Ej7NvO8vCTtluhW2vmsZBpwQh2C1WiRZKerI2gBAO6UfEm2ZOk/g/3kHGZeMgf7Rf9
         GUKEZAuHACqC0aFy1blO9Gtj5qIf+MFuGlQed2Dup1HC83NXPl760cNjuZdhSRzUV8w+
         8rYcFNXAIpHNpQN7OGnW+2aJu+AUhW6lb6uZYUpgmlKfJ5bc1vmAC8wiEZEy8fAlbIn/
         wWZuA16jb2aX6f19mSKug46cQX5W0UdPzvpWUzog2KjdR34bv984SI49ZGS/Gguo8qU0
         FFCMWy96eugduYhj3C8MFvHrBhTOHky2eQMtw/bbIMKhMTNHIK4vrIMS1WYR8Xs+gxOM
         6pkA==
X-Gm-Message-State: AOJu0YyLk1AQgJFMTxp5f3Prs+ARitjsKYySJ9KR7h3gLp/mrSU21oTi
	yHmJPu+pTp9q5uZqecZKvL81NHUXmqz9eHk2HQesFKMadHMOU5d62/GPPEznxmAV
X-Gm-Gg: ASbGncvKQqvIZP8+g8SFyO8ROPDPyEUykcJTsZI2pqIUd1OWrywSTwaPpSyb/TiTcfX
	U6qBP96/piEdVUbKRaOU7OY79lpgQh/m/3D/eKRBKaQgpk/WJ9lhXPNrb3W5c6tcVHBQ6mGKlql
	lqUFdQwpgAbl0myIfEBb7bSYf/013ZJbrhaaWJQIvHn54ohdJkz2KAMtSzCipJg01eYPqblHcSQ
	eyZ745zb7hmGmlPuyFdg8vGC/vQHzpgXxog0nn44Q6TL3S490nd3clEbz+6wG3jTqedlE5gbBD1
	6Y/ga60Inb8iiEL8TuatLgVGQKoXhrQt9rSkTn0YwuPBH+2QuSUFR0nwxBciSjAi6fukgWx8KVq
	fKetoe1DDVwDYO02W/kgJhZzWc2Uv1e8Jx5qM9oXZr0CeydrGDmiw8OwPxjFV2hHKI88NSO6G8q
	H05D+yi1pR
X-Google-Smtp-Source: AGHT+IEC/vHzejgCJqPMJaYhUTc/X6LUzuqZfi37K9NVtpYr5b1wacyitx3DW/r6p5qd/qH9sSqPQw==
X-Received: by 2002:a05:6000:144e:b0:429:d6fa:da19 with SMTP id ffacd0b85a97d-42b2dbe40admr1721444f8f.4.1762612303657;
        Sat, 08 Nov 2025 06:31:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm1012211f8f.0.2025.11.08.06.31.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:31:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/5] http-parser: fix SRC_URI branch
Date: Sat,  8 Nov 2025 15:31:39 +0100
Message-ID: <20251108143141.3117797-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108143141.3117797-1-skandigraun@gmail.com>
References: <20251108143141.3117797-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121391

master was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index 7def915db5..82a6e5bad8 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
 
-SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nodejs/http-parser.git;branch=main;protocol=https"
 SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
 

