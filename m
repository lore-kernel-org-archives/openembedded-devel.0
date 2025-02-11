Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49619C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 16:34:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3793.1739291683802717815
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 08:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X92+bgox;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f0444b478so82524055ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291683; x=1739896483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4j2T7b7moB754SJ9eOTulgG/SbGXmPfNyF2frgmJ/Y=;
        b=X92+bgoxptY/NoPrrA0uOKvtPPlJlNpb76Izn9pROP729GC2Sy3f25VFrCVNYPMyYQ
         vv52hLwREfeOY5qSKwWrkz5qXbAArg+PiQqT+ckCE3Uz4OHbiqbJ2NTJaDHuHF/pML9o
         YAZnNnJfbGtQjXEGUuAym58eUIWAX4mNt1Tos9ze0Nf/ZuqPn4k22Q2DOQQ+EYtcQUkx
         h/XxboYRu46xWHg3+5Ay/fEDY/8onpHcTrQ5u8CC1nm3ZnNG2YyjrBqyJczf33pMjP6M
         CWMEXp+8GmId5AYolyorsri+qYqQ8hUnUkxy14dIVuuXqZm6VQwfRadoT7HOWc6tX6Gp
         R+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291683; x=1739896483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4j2T7b7moB754SJ9eOTulgG/SbGXmPfNyF2frgmJ/Y=;
        b=fAYHioCOKvxMI9IEOVrtQExe1IcaRzAIkZmcHP8+yclYtVUmtZbwq5+ewBMGXz/0ll
         vXA1SuHYkqTRHuztHVpkTTzrYxWYKrZWC7K+i42aMBZc5yTwj+dZHr0plB/WM+6r5ARJ
         CJRyN5R64SKDiEMl8/wfgJyafUvYPlw7Kvgbl9BLcAlmbOMOzQFful1faa+q+0VY38u5
         a9scKEuBmHzcbm4UFtP6954DqOgbZ2/ADhr1S8UCmq1Pddil2f3CEURBhyuS4auv4PHx
         UwsTOsyrt92owL2By/x7bDlhcnpMvE/NeJcVhs8tFBCk2adbY0qkEPlTDHAUdbNeGyoQ
         8GXw==
X-Gm-Message-State: AOJu0YyX7G+9vNkMGulfGbLcdZRh+cZlz7WM+SF1VtpHO78v+9hDL0Rr
	mQNJ8gxfpyzxLjbJIS9PpzJaVQfi9PVYaLf4IapBPW5pqaNSEr25JNJgziQt
X-Gm-Gg: ASbGncv8Hs3iTw8LwGd5YSFy6uUeJZVGgw/+xSUXSDRi7ko2D5crah93/KZC0O2IFrL
	CGh881Vsgv4SipR85oM9CNwIz61ig7bdM2l0DqpZg9d7CuHP5axP1Uha93t/RHqEBEooesBl8nJ
	GOHqVUMkojLWeSxdJre48OLaM/GiYk6EefDJG8+uTx1K5EJWkWfEkgtKk7TSl3sV870MJhirurD
	1KtemsKG76p/ptqXkoiRSesGD5ZZOvL8c8tuIxHA0LckETujvgYjCaHW8lULMR0mNAVb3wf0wFu
	pvPtyQ==
X-Google-Smtp-Source: AGHT+IGZ4yHCen3leAgurKfstq3UVEo/Gw0Q93p/lsYyW9G8w9muFgGXrjqEBII8/piNgiDE7713OQ==
X-Received: by 2002:a05:6a20:6f8b:b0:1ed:707e:7c4 with SMTP id adf61e73a8af0-1ee03b6fe02mr29484075637.38.1739291682871;
        Tue, 11 Feb 2025 08:34:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::8da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad53aa4678bsm5331437a12.28.2025.02.11.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:34:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-typer: Ignore failing ptests
Date: Tue, 11 Feb 2025 08:34:40 -0800
Message-ID: <20250211163440.831559-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 16:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115431

They call terminalreporter API from pytest which are
not working since they are not external APIs, pytest
is not at fault here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-typer/run-ptest      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-typer/run-ptest b/meta-python/recipes-devtools/python/python3-typer/run-ptest
index 94b6c0fc22..526825aadf 100644
--- a/meta-python/recipes-devtools/python/python3-typer/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-typer/run-ptest
@@ -4,4 +4,11 @@
 # Because it needs the docs_src package what is not in Yocto.
 # And the tests are not that useful for Yocto.
 # for test_rich_markup_mode.py see https://github.com/fastapi/typer/pull/859/files/2cfd641d86a591a0d8582dec9292c03e6322a21a
-pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion --deselect tests/test_rich_markup_mode.py::test_rich_markup_mode_rich
+pytest --automake --ignore tests/test_tutorial --ignore tests/test_completion \
+       --deselect tests/test_cli/test_completion_run.py::test_script_completion_run \
+       --deselect tests/test_cli/test_doc.py::test_doc_html_output \
+       --deselect tests/test_cli/test_sub_completion.py::test_script_completion_run \
+       --deselect tests/test_others.py::test_completion_argument \
+       --deselect tests/test_others.py::test_completion_untyped_parameters \
+       --deselect tests/test_others.py::test_completion_untyped_parameters_different_order_correct_names \
+       --deselect tests/test_rich_markup_mode.py::test_rich_markup_mode_rich

