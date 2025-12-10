Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B984D3C907
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:28:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15681.1765373291142347330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8PxNJLU;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so7685273b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373290; x=1765978090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLh5IO58EcxYaoDjEkbcGFVT4TdPaoavSUSgEo5VXro=;
        b=N8PxNJLUsZ+LZJxiEAurrcqMxN8qGNPySq1f9YR17p+8Pzj/oKmjiHmtu0oObKUNCM
         zZUe0+hQXjYddYcvaDjnYUNKH8mZYji2yyyM/LtaZcaxWTwfL0iQedRwfpVcFYxG5s3n
         eNq7rbMh0EQfSX82YwDImjyPKhDpxKXIaC56of2KktzRGhS2XITN4VlHGTavSDT9h2Tw
         6EAdt7NEOLcKIgxr8Nn2ZdeF7PbLKLSP7gMQQ/taTsFae3TKTuj9zeg3GHaRpMfllCrZ
         8oBk8K5mTouErP4NcN0Mrl2ec+lJz1tY8E0FFzhrBbDpavnO1aHzCFWyVuBNyJi2IALR
         /l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373290; x=1765978090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLh5IO58EcxYaoDjEkbcGFVT4TdPaoavSUSgEo5VXro=;
        b=ZKKQACS2zDGPYrvgIYaS4tsmjQ990KK2UFiirV2nifpQRU+OoyEaFKe5FrTwzdpo7q
         fMEUMvazoM0lRlTfiPCMO9rNAqUabE4aSYg9KqXh8jMG8VtFMWoTonkRwTglKcOWWshN
         EoH/ELShEsGQ7w1rTSKiFEGhzXppLe8n1SU2U6ZS4XgJ7WkPOx2YCQ1HXhP4tHL5CEkb
         q71NxMX8UHXH0WcHZxvAxd2ywjNFP8bKETulveN+MdOACxI1kAYvJDoGf7c/cWT7Ysnc
         7b2rDMOo1UuY8Wn8zbeZ7UPJIR31BWWlZbx+aTBOwIj1bpzgHLqnEsgbtXkzgRnbKhMq
         xq5g==
X-Gm-Message-State: AOJu0YzN0yVKYNMAIQ+n3bPrEPwthkQ0FU7J2d6xBH2qYvHejVq0Bi9o
	iSqSR4mfoWbouY/eQJYssdH3H9cJ49PsAfQ3TPSxZH/6smwbjemJGU4QB8INIA==
X-Gm-Gg: AY/fxX7jyh1S55tfK0vc/yVFDSR7bacvnxGr2Pkds8yeNOcbN8iMI0OVtx1BntZUxn/
	p99PifVn0mTa1RQjh1p7StKlfEWFhNXMZbltdiXTozAwDJEARAlCVAtKUSBzgwl93E1owtFZipq
	NkUxJAL0gvrgzJqElRW1lHjwDBuAFV88pAOnEi/a7Ro0s6OSUqoYZl3piQuJo4UDg5rs9Op8ANW
	DDjuCqYvvZxFrAUWM9eQ+k/EIDUWTXBfKYucMrcykvFQ4JTF44Zg6X+ZIN36H07PD7NRLWlelHa
	f4XOO7GotseOD7j35BjuEvWcKjwhzW7akUIS0ikEFmwnJgsrDMIYnC1n+p0T7Xz5D1qHMqbsEhG
	AljvXDyp833FCGiXPb4g1+PCYZStgsAm3+BxiyZCY8CX3gEJrwQ3bRb46yU32GgDhmff864C2H2
	rIRM9oddMSObzcMFJV9yREMhQ=
X-Google-Smtp-Source: AGHT+IGa6BO5lD8i2Mk9Y9h4eyffTDJZ4r1NBX/HF6xgiz4tgQib//+D5pE8cYlU7HWKNf7PnY8C/Q==
X-Received: by 2002:a05:6a00:983:b0:7e8:450c:61c0 with SMTP id d2e1a72fcca58-7f22ffcc0e4mr1935762b3a.48.1765373290350;
        Wed, 10 Dec 2025 05:28:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:28:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 43/43] bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA
Date: Wed, 10 Dec 2025 18:57:44 +0530
Message-ID: <20251210132744.336180-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
References: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122547

From: Mingli Yu <mingli.yu@windriver.com>

Most host gcc doesn't support -fcanon-prefix-map right now, so
empty DEBUG_PREFIX_MAP_EXTRA to fix the below build error.
 | gcc: error: unrecognized command-line option ‘-fcanon-prefix-map’; did you mean ‘-fmacro-prefix-map=’?

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 31a08525bedd960c21214f84c256f67c6090bb5a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index bc7712ce4d..fe3ad6138e 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1be
 
 S = "${UNPACKDIR}/linux-${PV}"
 
+DEBUG_PREFIX_MAP_EXTRA:toolchain-gcc = ""
+
 EXTRA_OEMAKE = "\
     V=1 \
     -C ${S}/tools/bpf/bpftool \

