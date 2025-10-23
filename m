Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37759CCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 21:13:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2185.1761253988717148022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 14:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQsSJ/ah;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-427060bc0f5so762628f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 14:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253987; x=1761858787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1e/8Wkg+9SwE1hEekclB2ZN72twCFWFhopO1lGqNGg=;
        b=RQsSJ/ahKpbZFZYTezL6LuYfrn0jTdarw7zu2X7C4rHdeyut8+peBthdUnJU2p+hKh
         haQJi8O72ftR/COuIZSisZUrCcbccDnDMCCwGA0aXnPVbWPETuVemiHFDKoSctzaQvvo
         K2rf9+b241x4l/9ynXTOws1nkyhS10lzOIZ+Oq2L7pYRm8Ww9FaJB7X7zs04slLWpDZr
         fnrtcPxO1T9EqZLmReH0smMDP18PiDk+65S5OFULH9zzRiH6QHHihXvRsuVJH3w30W/c
         erE29hTNeZfNYE6/tMo8VVzAERT9dgH2B8Aa+XvfHooQNTsiSizZdAW0ipyRK6PrtzoY
         uYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253987; x=1761858787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1e/8Wkg+9SwE1hEekclB2ZN72twCFWFhopO1lGqNGg=;
        b=YwwGZKuqeWKWdF8AKmxUggGO18kRLpgRL0F7AhnzJbi1IQWjoFNHS2O5f8JbxzGgLJ
         8AqTh2jcp/YwkHdli3CAnuo+o3WTd9j0Cw6LMoK8Ur48l1S5P8IpnBNO5uu3C5UdkpJM
         INFHvOFQVMlsIJuXxs5QydS/yHvvqC6JrceA38ZJaxEMXakJLAVRdAW+K1SfL/4Tos/K
         hD9LylXdTfiagMBQK+0Rplmg20+FPLfFm4bACXkSXLxrgolauLmAXmLyehEzST9pw619
         oIGfIgZpnFsMOwvWDDtM2aNfJB0IsS++gQ8OShTJ1Oscolv7eD9LK4qBzyd1MWJyqEu3
         I2Wg==
X-Gm-Message-State: AOJu0YwOvnxi4g9bsSie1qkIQD8EQAjieEj/KglVCicz7Eve6DarSO8b
	OyjXxkP5JRUlDH/z+xkDY4IrRSJuQ2jio/GLeT1IxWanpv9NFkokbVmHDpDcyw==
X-Gm-Gg: ASbGnctpgnRxnYhuwGEr0q4IaJNqgcxHnCU+KaQWwUSvKs1fqejVgA+BiyLWi5UYSdm
	KwVeLXbBOALVTqJQ5SCnff0wDgmx91/XEdw6dqUmfdggKVFug5ENS+hQuaoOOJc3fd/tXMq612w
	RaqY2shRlgEjuI7Cx3VNz7ZGkyS95BIPQ8FOWFiJ7cPM9lWk3GCDwgALYL19zNTvmk+d/dInBJv
	X19wb+padpkEAH1L8bsanAq3ldV7xrWWilIfjrR+hnv/oxEeZXBhuHWI9M5SgM5YWTn2JN50dy5
	2lAtJEo5i1/uTNE6Q7G7+ycHcJyjtFWNtHYKayshp8UAF+4444NPgcXtrUJ3DTpvAnWZqxj+9XP
	Ww0BnkPJMxvPz3kFC/NTHp9F59/XdSVT2PqFyh9+20ZiaSC+vzDWMYSA1RgaiuPPtpeg6i24WmQ
	==
X-Google-Smtp-Source: AGHT+IHk9s5d6ChwcQXAQC+ulzztTBkmvgEqzMEjCPK2h9khxW6SmojPYRIhfTg3ZjIcPMdt09Kf4Q==
X-Received: by 2002:a05:6000:4b0f:b0:427:1ba4:de9f with SMTP id ffacd0b85a97d-4271ba4df55mr18999542f8f.31.1761253986835;
        Thu, 23 Oct 2025 14:13:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm5890915f8f.2.2025.10.23.14.13.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:13:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-requests-toolbelt: disable tests with expired certificate
Date: Thu, 23 Oct 2025 23:13:05 +0200
Message-ID: <20251023211305.806040-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 21:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120939

The application ships with a self signed certificate as part of the test suite.
Unfortunately this certificate has expired in 2021, and since then the tests
refuse to use it, they just fail.

Upstream has fixed this issue by refactoring these tests[1] not to use a vendored
certificate, but rather to use the "python3-trustme" module - however this
is not part of Kirkstone meta-oe, so that patch cannot be used.

Due to this, disable these particular test cases.

[1]: https://github.com/requests/toolbelt/commit/b93b4067ea1ded1e33959920ae5ff4163fdd6939

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-requests-toolbelt/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
index b63c4de0d9..687934edc0 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -k 'not test_x509_der and not test_x509_pem' -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'

