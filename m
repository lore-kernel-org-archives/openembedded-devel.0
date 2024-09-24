Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5F7CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 13:13:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.13646.1727183614903903531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKl/5nY6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4484633b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727183614; x=1727788414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6Io5DJDSLlaMK9kYbu3Ke0IAbybKu2SXTSnzfMfTXI=;
        b=BKl/5nY6vLfST7RN8hyDSTL2A3DrLicJxJz2ARSBJU4G0Ea4UiRRpnouFyeulh/Czu
         EqqrOUeeaOU1NtI78M/ZQB3f2UvK/yZUzos+X4S+W0dpQ5JZYrO+/YtSRB/7icjxRVPr
         G51FDFqj5Mc7pGpy0WbZbK2866twxE7YKQeIk1KQ1WVDR+sX4JjI8ODQvwpbpNoUmgLa
         k7WPDrWMlTwq2eXSbqTn8519x5mkeDIErTOZom2Ao3lmvR3KMVUTCqGzjTI/zNWTAqjU
         LvsjV6w8NInHk9w6Xu+j27FdOEkK4I1JnUmaRjFVqaFCqqXsokGqdcz0ZYxfcmDm26Fd
         MPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727183614; x=1727788414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6Io5DJDSLlaMK9kYbu3Ke0IAbybKu2SXTSnzfMfTXI=;
        b=ZwSh7urBtREgx5BLL8ep5APPxzOg3kwJ0Lah8OYZnt+MqRZ1I3kIv7CAVJntRI8qXq
         A5Ofi+PY9JFiBijV9HmHXZ67MD6ZoaknAd4z64brFOgA1dSdhMyxcqCK7nvtECE/0o1Q
         0DCItU4i7Q7cu+ZapBWvmU2sk5SmaQj4UrmM8QpJHHPwL1ZLQV8kgMsibMqaA4oJfDRJ
         uf2sX8gscm80+z9YNook42F/TRwjvQV/b2RAzezPwAc+j6DNgMa5PTkmhTryk/hdd6hY
         sDn8QAr1K4pt8lQozTPw2OZj8IZ4EfkReG4Sn9K74Ysda7IdWF9oezqL/nyAyr62oKEW
         eG+g==
X-Gm-Message-State: AOJu0YwSpBANWQ9dEy0Iw4jHsS1nDO+yk5HviwPmbivTbdftE/YXpAVL
	QMkjsjgWp6V9fkMwNKJH5/NFPMk5yofKHu6Dg2F9N4HoB+2MtUb/v5dlEDj9
X-Google-Smtp-Source: AGHT+IGm5IHSAe5tcYPDW/9qQiI2LqoUC8rsI+/1ZtF5Mpw7NU0JWZ9q8MRaYZ3SQhPXD9ZpgxKJyQ==
X-Received: by 2002:a05:6a20:8417:b0:1c6:9a3b:ba44 with SMTP id adf61e73a8af0-1d343e3a0f8mr4323980637.25.1727183614035;
        Tue, 24 Sep 2024 06:13:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7020])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc83478asm1165125b3a.4.2024.09.24.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 06:13:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-typer: Disable test_rich_markup_mode tests
Date: Tue, 24 Sep 2024 06:13:31 -0700
Message-ID: <20240924131331.2625342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 13:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112477

They fail for OE, see
https://github.com/fastapi/typer/pull/859/files/2cfd641d86a591a0d8582dec9292c03e6322a21a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typer/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-typer/run-ptest b/meta-python/recipes-devtools/python/python3-typer/run-ptest
index 94b40789b1..ce611cab8a 100644
--- a/meta-python/recipes-devtools/python/python3-typer/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-typer/run-ptest
@@ -3,4 +3,5 @@
 # Ignore the test_tutorial and test_completion.
 # Because it needs the docs_src package what is not in Yocto.
 # And the tests are not that useful for Yocto.
-pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion
+# for test_rich_markup_mode.py see https://github.com/fastapi/typer/pull/859/files/2cfd641d86a591a0d8582dec9292c03e6322a21a
+pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion --ignore tests/test_rich_markup_mode.py

