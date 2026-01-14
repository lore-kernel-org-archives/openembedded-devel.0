Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18944D37E21
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:45 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9366.1768395701584417640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHvrL3wP;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso2585996b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395701; x=1769000501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUGf5eZfaHLL2EhpYWJWQfJ9kTIctPQPDveiSfAiyKA=;
        b=hHvrL3wPwMtiwoM7862GCrgvda4L5/WwF1sN765KPYjMNNMpeJMhgqH1tzof6ZIK/7
         lmkuFQe6j9n6Qdj+hEkRoGrWgxKrdf630yo5cFVnMnlcB6nSjeN+cmCPbF/h4dUo4hMr
         zVxd0vRZ/Iwxh6KMdIy5jZ7flasj2GJR0LDSgQYW8y/zVKXAu35l+gcfIqebl5lu/vNV
         /meXaTjfXKe66vV72IPgpAUVv+hjDEIqvQwifnx7WWKXhGriA10pHkJuDXNLPPByxZuy
         /o1dvsD++qzctRyE1TVa8yA0bddWSv6zF0gZcoEYkW/UbpgY1Su0Fxd3NdGVjbYUO+/Y
         b7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395701; x=1769000501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUGf5eZfaHLL2EhpYWJWQfJ9kTIctPQPDveiSfAiyKA=;
        b=kp5+VmeLUDlqjI6aN/3e+MVHK7ijBVCezh8chZEHqXH5EaMFjhMtV+BvGoap98EaJg
         ecppAQXM9sgXdmzW81UjgbuaZcaARwRtfdYgHfj4C/OHpeO6IeI8MuHuDA4AwmN7Rc6J
         o9F0V135OJE7xc25thmOh48C7xF8xuQ8lukJA2GTCbmLUl6DtSU6Jt/Md+NRWKcHZgsy
         jFOooDE+VxICyKyVUaWU5y1cfdszU5km+YGwJDFnQBwEw92xRsfBmGbRw9COhyczU1Y9
         4/rumoejXydKPrvWPTn0nPIg+idQaYOcmNZjwttrwRws/2VhldaR9IOtmCyjMvYQI7WP
         z4AA==
X-Gm-Message-State: AOJu0YyAlHe7ZHgwv6g595FxobmmG5ANijC2xovTcedzZX6M44WuqphU
	mXdmBC/c7QkZ6841BJ+uAOqeqaBT6NvX1dA8srPD5FGqVVuq2MM92LdGcO2xqA==
X-Gm-Gg: AY/fxX6/vd9Fg8x8f87GRn8ykEF2Vq4Wr7Pkwi8zkG0Zy9gZILaj6QhDaHdy3qgQ7Yr
	Wo22iWueluto69x0s0Rlw6epsx4borHQEc6wFHf3doozPJme6HqrqbkwMbR3Q22puFm0y4XYMM1
	xeSP3bko3dO+le4hsLuMqJbDmk/afTF3KCqI1tH4t2hPJfsPypq/ZltIceE3AWDmws6zeVZgWrf
	SbuP3/pvtzJFjad7BGDVSYl5xpVoUu78LMoBInjNoajnDIDpo+uw87t6uqGOiQLHB0PUvXotOVR
	OLKSJkvTET1xs1NlOKyIK0oGESwDTXH17k1/Sps+HPBHZXBzUlgBXK+IFo+7bYoOjPr6m8/y7ex
	WogGM8X/SGYMzZeTUdlVI2cOKbAwxTK6NPpcjIPBzCps/I6a279orV1SbGY4B/ULaMPhXlx6DJW
	mJo/HwL1+vf5X81160R5FwqYw=
X-Received: by 2002:a05:6a00:339a:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-81f82042d8fmr2377345b3a.61.1768395700274;
        Wed, 14 Jan 2026 05:01:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 15/20] python3-tqdm: upgrade 4.66.2 -> 4.66.3
Date: Thu, 15 Jan 2026 02:00:52 +1300
Message-ID: <20260114130100.1016416-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123468

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
- cli: eval safety (fixes CVE-2024-34062)

https://github.com/tqdm/tqdm/releases/tag/v4.66.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-tqdm_4.66.2.bb => python3-tqdm_4.66.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.2.bb => python3-tqdm_4.66.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.3.bb
index 77d26f54b2..0e1b0b33be 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
+SRC_URI[sha256sum] = "23097a41eba115ba99ecae40d06444c15d1c0c698d527a01c6c8bd1c5d0647e5"
 
 inherit pypi python_setuptools_build_meta
 

