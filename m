Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA45EE57E2
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81819.1767167705957985515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOS/5sW9;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so69212545e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167704; x=1767772504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVeOkXKhl5afL/H9Uq2yulWuZzjJjIEPXOeFi3BA42A=;
        b=KOS/5sW9ZBp8+UQIlRP4xmLpTJ2r2fg21KC5MuII9RgzyM3H2ayE2YFluk5Qwht12h
         2H89XuSuf7gxvYynxRDdiZSceMm1+gTMwEe9OsHb6UPILIQ2W5UMcJOC6FIrUzvocY5G
         6vBc4hYlD2i9eLvcEeAcmccn03vpd+U76w7pQf5/CTMYkAOsDtHZ0qUhjNXPbdWRimWf
         pxQBgXfTdrUlF7RA7V3KqBBR6kKuGjaaND4BAzuPj7PUKEtMayE+4vL3Hf7to7C7awy3
         WntQsBPd/FH0H94dAft5qs1HnuAqXYZ5lugRiBem6pUmuvyPHKwkQzRNWINK7IxYF4MR
         Ofyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167704; x=1767772504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RVeOkXKhl5afL/H9Uq2yulWuZzjJjIEPXOeFi3BA42A=;
        b=hE+kNQWSj4n4b8l3F+9ci7KpJUpivcn43BcopBUOhtKD0kSMFdgCNRql9jSf6Kfw0u
         cNeKo6m2b16B6udndL+srr+B5vh5V/rzMI3KQvLqedyrMR+PNPCAy2m+ExKBHSrmkEbt
         pLqOkG3dUJXxLKWr4DFk5eYGL673AXw0Vl27nstZjdsYVjTzUZisk4w0jzQdir3ctoL/
         Yda0+i0rnF6RzCP4YppSMnRqT5/XuugcPaDxI4wgnlfIquZ/uaSeWljNnq0hqQZVy+dm
         Bx6ZjtMd1WZ4HHZDTCNk2NB3P+7UZF8b6k/kFbLwQ3lIT0m9lpT6v1A2e8sa1O/Z6o+y
         Fkmw==
X-Gm-Message-State: AOJu0YxR1W/C7dBhBN+8K6tJLKTTggNybyyclflH7Z5FLQrltmNoTL17
	BNVjmZrvFBZuXEmrQDkW39ag1GKSqVweSQu9THE9C0vUJBcloDPMi2xMxm5gMQ==
X-Gm-Gg: AY/fxX4/ekHuv7XjlZYXgsNjFonwuyxnTsWjPdItsn9zfK9SagWoe9VLPCjph5FcqE7
	L5asZMcZg4vclBORGjJGgDxYDLfCe6tg5BahAKkcQ6EeKUUizqzcz983GbCd5vBfRLTYFiuRh6Z
	43EGInWycb9Rx404xgqfJL7g/zFfGDWNU/H7aBMhWQCzwZJ7l1bdZOeaM5EylyyuYHxkmfmviw4
	pKvMvlbAaUGxqJXJBYxtlTk4vC/C5zCyxLjUhgw8relN2cS6byx105t/HGXZeGMmY2dU3N/x6y6
	20KIOa2DXk3vgX2rBDNFKXXPEhEJDhv0h4HYe6s/VNx1oxwRtHpEsHgUfKAtTTbnai+E4qM/xY8
	rxy0iRFPxE8geSH3e937oUOAq0jgBj5Ug8i46H4GdiUxR190wsmhg0aX+K0dmjVFVj0j0a0TwYE
	KT2va9+O3k
X-Google-Smtp-Source: AGHT+IGkcC0jYSgSZxqk5PQVfrIMn/UEZprT/cY901jfEzFgU8cl0oeStexZiPWfr/7iV+hfUkEa3A==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr424488815e9.34.1767167704330;
        Tue, 30 Dec 2025 23:55:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.55.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:55:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 34/34] python3-scapy: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:36 +0100
Message-ID: <20251231075436.771395-34-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123074

The default ${PN} (python3-scapy) CVE fails to match relevant CVEs,
because they are tracked under the scapy:scapy CPE.

Set CVE_PRODUCT to the correct value.

See CVE db query:
sqlite> select * from products where product like '%scapy%';
CVE-2019-1010142|scapy|scapy|2.4.0|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index faafeecfaf..678aec0135 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v$
 
 UPSTREAM_CHECK_COMMITS = "1"
 
+CVE_PRODUCT = "scapy"
+
 inherit python_setuptools_build_meta ptest
 
 do_install:append() {

