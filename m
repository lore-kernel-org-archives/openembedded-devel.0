Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3834.1794729060756084645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GZlLe6Rj;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1430656eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729060; x=1795333860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/X/vmGdHQUgVcJK0O0DUicZ41wHz6Fwt8GXm419wKU=;
        b=GZlLe6RjPhEf489HU2eV2vnb/dqJ9dImMb2EqyPQwbVyEOoCJaWVxtQSglBVPGNPCp
         epbQMyMxvofRHgu3lzTJvtp+H/IXJGsxHjqUSEYuWPp/m6HJRqlHrEWUP6HPrCtBYRaz
         L7Uj5ITZjbKv4jAamPBxBnolAdvxs1d9c+wYIDmxQx0PaExkmj9RuHttsbmbANNXcwxF
         YQQszbeLHQh67YbHMKvrT6qj/8qSgthg8ZCOhTsyhG6TanvFPjllXxIiQqtdJA9qp2fG
         MS9VV90Jyb3mp/EVu43UYzRjE2jpmEXO7nXRf4IlfVy7rVglgcV3VppcXeWsed90ASUE
         cs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729060; x=1795333860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/X/vmGdHQUgVcJK0O0DUicZ41wHz6Fwt8GXm419wKU=;
        b=Q/yY+ugP+1hFfnwIGop8VjwNNY9VAmme7bltIpIMA/o/jhQRxYBtNvqjXsSHc7WdmH
         a95XjVYuFlX1nC1x8bICrrTGlX73mtl20mRmFeWLqO9EmZrLKB1AslMWg1ELENM14STj
         aYDIOoamSAkWaZQrWbHmwBTx+Ta4gwXBHg9KZG3okgDp8TYIzc6MeU75sheiwPpOzlgL
         L762Ytk9rB1LKV0QwDnnlJwOh8y/KTZ9jNE33LgI8jOm6de1U2XcgDFwj9MLahfmcqwe
         46U/TH6EInfDUiS1K/zJmZEv+RpdOODCbJ5wAi8IoggzBnfbeAl4m/lat5MWxdQnqRCk
         ji6g==
X-Gm-Message-State: APuU4Z9A7tp4aiElMdADd12ahjwXkZcxsgEUPo0dhxZdQWWAbpO559Dj
	2G0CMGQRRUX7Xh/jklH62Mq/GCiZubZEKgADvA/v6/XJThhwNi6euefGvbUeOtYV
X-Gm-Gg: AYBFou3z6AiZbUk0pTr55BFjPyc4qO43SqUburGDw02SySgbntYIztVtHK4TQjJZb9S
	aN+FkCxYsKMg9CzhGy6KCeUHFBSB5IsSVCU/y8gXZeNr97BeCqzSgkRhDs21RsVv4i3zr9VzlVQ
	ZYWxyguLbG/GvD9wZh+G/V0lWOS1vU4SLhrosC/+ThVfRI7VyHdvC6qUKImFHlBHn8MQ46/Arbk
	NxJX8rA0TYZlUY32rlLldVGUaqOguJGnFcIcpeoZghTBDcw54nVuMdXJIwKTMbHe1TLCnC+PfCh
	PO/tZVzwWxA1h7ME/CR9vvLw7pZOAphERuaprMKHkgRu0Fh9jLvH8wpBXUJlOudM0nvfqXX8WQJ
	Aid6gAwaeAxdmmA6RcEUT5mszwJZmyO/qUG1CsPIeDvTNTnX4ikkHSuOEH8aSIOQf3qXruRTlF5
	wpeCxsHnJI5zlIKC+NUqaIIovyxsN4cN9Yl1376r0AF2mpSK8KB19wMSOSp7ZcEoYUUEJAfJMYf
	hLQPwxdCdc4kN8wGSKskXsI07EZxj28aJcEZUPFzMep3nnY1ZJf0RY/XN91SGLaxs+pqy0N2s7S
	Ss9FgoLKxEFnZSj6OTLfYOZWnr0z/BbwS3K9IUrlUw7qqgGolmqF9KVhhaT7Jb2Y1cER/bkSmUk
	1t9r51YeKUDRoFFA/iEQlT3FajdYqc6P0nam7cInnvbft9yVT5F1Pyxs1myKQ4ImLlCG4RA1Q1n
	pYwkZ9uf2FC7i98vodHqNdw2B5pD7cOMr1a6d5rz8+g7r3VTNCIsWG8MmPx/EUDN+Pckj0gM0N6
	gQTQAuSZ6EIATBfqHD0otAPlgG4MCRddO6CjlNV384XSVYrBaiT55qAF2pnjs05PRv5XTfXWLoc
	gdKd
X-Received: by 2002:a05:7301:1625:b0:36c:9f1a:30b8 with SMTP id 5a478bee46e88-37966c4a5fbmr7763612eec.31.1794729060037;
        Sat, 14 Nov 2026 23:51:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 62/96] deqp-runner: upgrade 0.20.3 -> 0.24.0
Date: Sat, 14 Nov 2026 23:48:40 -0800
Message-ID: <20261115074918.2932593-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132332
Content-Type: text/plain; charset="utf-8"

Regenerate the crates list with bitbake -c update_crates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{deqp-runner_0.20.3.bb => deqp-runner_0.24.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/deqp-runner/{deqp-runner_0.20.3.bb => deqp-runner_0.24.0.bb} (87%)

diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.24.0.bb
similarity index 87%
rename from meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
rename to meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.24.0.bb
index 57f1635426..7dcf358ac6 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.3.bb
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.24.0.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://0001-cargo-Update-tempfile-to-latest-3.x.patch \
     file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.171 \
 "
-SRC_URI[deqp-runner-0.20.3.sha256sum] = "2de4b135ed68a7f821deeedebb4084d33058b0307f1f9935e2c960430f7532e8"
+SRC_URI[deqp-runner-0.24.0.sha256sum] = "06bc5432359b2150cde819f2e324995c1ce3b29ce060af9d5cb9526d1481f5e2"
 
 require deqp-runner-crates.inc
 
