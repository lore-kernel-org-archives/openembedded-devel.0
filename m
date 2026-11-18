Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5762.1794975210281056672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rjFLqpSY;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1562163eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975210; x=1795580010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2RRfh4r5hl9Jq/q3g5vl4b7/N25RLNW/qT/PZ/raeA=;
        b=rjFLqpSYMjWDnlv7oE4oZxZS5TjiblXz/RbHY4hEiryyBzfdrC8T0cvIuPYf7YzTru
         bdQkJhsg8vNg+WK77QFEzX9u+x7MHISb+wyoQo/mhDnd77lMgamMeWEkJNxFOXL+nFiI
         2fuaxRabmlPRIDV7s3fWKQVmdMEg1tPlCNNA12g7jom5ef7TLGJ85taG1+noS6WWqW9M
         FUrhWAvD7LnCYE3PYJbMmz5ZOGY77bEVgPX7IJtuH1VKfs8UffpTEE7dmZq8ZnD5gPdr
         5oebOokZVqyiJtEqKXbumfioIlYVSbzcE7IIQ+8je36MD6oxplmA2WYIMmzvpTJBLEWF
         8bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975210; x=1795580010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2RRfh4r5hl9Jq/q3g5vl4b7/N25RLNW/qT/PZ/raeA=;
        b=ZWE4rUdKRSRNFEfb0h5TfvH6M8A7vHlZ/tMBhkC60ArugYT0Eb5RrffNt/vhwdTOyf
         Yae0QQzPlNKY+A0nFVcJKRyYK2XG8t5gwaAjJYI0qUWr6OgNy4b3q6SPCgOxXRrAz7tW
         MES8zafISFk4VIYGrsdWu17O9PHH8EehkbMZ891RJrU4hVXsifXbkyVJ2h+PP3UeR0rw
         gZCOiZqwv2uNQr28XfifhLvQBr10wdNsQJCJpH2bdcqvBrRpqvsQ4XqO0nvTONeLX1UU
         Eq9zOgb4z2BvJCoch032XNIrJ6K8UjmSmAWDPSzL2ZMp7KaRX/JXmtHqD5BtoIeVM046
         FoMA==
X-Gm-Message-State: APuU4Z8C46F5wY/Fo8Dh3xS1v2kXWWk4QU+H0OpwTkP6julKzAIZYq71
	mbJVe6+XjRjP/cr6c59mOeVtRRAOK0BGo4dgeCHgsnsR2CLVX36xOYtxJAyAZk6t
X-Gm-Gg: AYBFou0jdibwSD5EPyNGk16sbKpUnpCe2HIECy+NFSJ6eNaNj7Mksc4q7eUtg2+RkAq
	oNQdtg4GMkQYOIt9DYK03jdt9+z3Xhrr3ewAqUCb9hyWjBizRtykUB0v2RqMdRb5Krua5Q6m1M2
	syRAoBdtHYlYKN9/dvS3jDoMKKxN63cc3VC4UpP9iuc5w17gwskB9a4oOCWuHSvCAWD3K2W5NE3
	3DQEVIyHE7DDA/qESg6vmMkRCleifY/ePBPwYJD12ZRLfjOYRhU8x0RrF8XSllI+16FTWVIOsIw
	8xsFGS1IBxtkdXAByw261tz182UZtaDp0c4aqNS9LDGKx9ZAL/M/OApJEZNQXZcfXWx2QQ9lkTv
	a5FoDZMTBMgddW9iVI4FcS4w74RkAaH1cqpLLdqn4sF/0NbacpZKrGQBfDVvITS3ao5LWdmJsLY
	N14wiU9rYUStqmtT25VNgEGW0JweTHfI6L1jsc71sjPMbtuLgtrL3AXaMCufNIV3WjN53FU86Uh
	bxcmcwvNZAtFxDQM6RMcdDKMUheczPpWvD5gKbj6fHlsKSdH/uusM7W9EhoD3I3M23Al9quRln9
	38kdzmfthUCRRhmP/LPU8Cq+3EQ001NcmxbBMZZXQ6isW8jwYVUfGu04T40V8FV2tGPNN+PWoBZ
	CSV+5SsszSlMFAVGu+574+xWc28Af2yKdfFB7B91PdwkbCJDitRw2QxfAB+ftGwNiSQiu6fX2ff
	6hMCvYJNV1QJo8Zn3zWRP1svxABgjxKCKAQLeRIgbMny+ragfSPmzOcxRm3ro7gA6rHg3k13L2B
	QplOJZg0t3S8AHtUTSLSQ+0e6fVgRAokWSQ/wIo99BioRLxhS83SCPah9xpHWhtZk4xWvV0HJ1e
	ICvn
X-Received: by 2002:a05:701a:c961:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b543c447e7mr1491915c88.42.1794975209618;
        Tue, 17 Nov 2026 20:13:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 09/12] python3-pylint: Fix LICENSE to GPL-2.0-or-later
Date: Tue, 17 Nov 2026 20:13:14 -0800
Message-ID: <20261118041317.2287415-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132632
Content-Type: text/plain; charset="utf-8"

pyproject.toml declares GPL-2.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb b/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
index 3836d82951..b5e2ff6109 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pylint is a Python source code analyzer"
 HOMEPAGE = "https://www.pylint.org/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"

 SRCREV = "edc8e376ba4affd43bc07571bdf3a90efc281ba7"
