Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F32C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9340.1788343533890909958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jkui5Lpf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2027035a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343533; x=1788948333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGDgyQN9x+2JwhBJleGRBrk6VEpgl1RgfkWUp96un/I=;
        b=Jkui5LpfgZ6ghqG3R1lI8PaeczELVGB8CgZRJYAqBngXQPPXgMxZvpuTzICgasWLKo
         AzsxIQt3f/z7EcmW84Dj4LiOq1xMbhKqhsML8B936Uh64ZVI3HkArxVLQQjFQeQhniBb
         u3b0kBsngp8bDswXkLFuXttOxKnTTPn54ELf+TM+B7/uJiQxgUHpDYTUk1nL+iMwyeV8
         I6nB9ua9bGtkaNU4eOTib3ogctkilvQvXelgw+6fXfICwH2yOwT7hiBci3BhkfpyN48m
         wskz69CGEm37HA15h6nuxZiPATwxOa2r5/9sul4JfdRvwJbHT/3XSrnJsA7uTNzG+Zop
         1MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343533; x=1788948333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGDgyQN9x+2JwhBJleGRBrk6VEpgl1RgfkWUp96un/I=;
        b=ZyUhIWdn0XJWpbTZ5ZFAxa9TvgHZPbSVTuqMJR0ty5U2YfzBrjy0cTNFjpykfV2bQG
         f8I0RvX4Q5NTGLiMXgJyRQ7N/3SAIpjxrArsL4DiDyyp9fWqjRa1owS5/hyvin11+vjI
         qpG0qpK+Tg2+cg8s6TodDI6aGW6ncbxPTORAheQDp/cWoBb9xH6R75C7YGoCxJzN8CKz
         Mzn8JNNaCh+W/5SwzlfQZ9tO3MRi0Ew8do0hXvf/NKCyhyB8l8UHR6Qqpe7bMuUlwppZ
         p6mshUboK1Uc8vr9KLWsINhxRW/JzXVLpH4nT1d11QK/qHw/vF7LwbbNHr8k6YUdoF5D
         jVSg==
X-Gm-Message-State: AFuF++lMSqqf1l95abgOW6XGICpwd1pMe7qwXeY/6zNjQu19VJGax9M+
	gOgorF3E/GuS2+DgZEeVrxaNq/aEkiQNe3RBlYzTXt4562UmiP9fnsk+mdL9K6EV
X-Gm-Gg: AYBFou0rtjxm45bFqC1Gk5bXyjNtYTqHY/YWi2DPzW2BlCGf3F5+GARiTSX+zwhj8GI
	hWIUS3JfQh8OYGAxdS9ImeWIfiLy5yZnWiVB+mFxc3VMF9p7YlKxVy/xhxdpxAKTqJAcj9YWts3
	/M/cDA86/Jkl1Y7RBiGXRYkjNu/JLl+vzlhEZYJR/8nSk4FsOCt22UXNLo1fp9oQ2ByuyQ16dxF
	yd2+iaomuXw267HmLkTlXGCCkt5yQJGveDx7hHx1pJqXNFNJGXv+KMmvdNqzB7Da1eulx2cIdXU
	4QAyVCsJ0i04kBcu732/R/dLSxxmQPr8Lznvwx8pfhfR+IkpTKjroZwH2SkJVVde9+kwEQNq78w
	z/1Rs9udy1i5+jBJDjm3HV5lzapG8fgIzI9pTU2H40AVS1Lhhcv90g10mQa6srMO1C23Zofxxfv
	TCVNrmhCkcxwAEkOyOs7QwZSjwTXvfKAwJGvC+iF7r/5rD5jSQa7CDovviOnlROLQnBCUfN6Uiz
	JOn00/ORls=
X-Received: by 2002:a17:90b:5445:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39af63f7f7amr1488504a91.8.1788343533189;
        Wed, 02 Sep 2026 03:05:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/28] bubblewrap: mark CVE-2026-41163 patched
Date: Wed,  2 Sep 2026 22:04:48 +1200
Message-ID: <20260902100511.2105916-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129637

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41163

Fixes:
WARNING: bubblewrap-0.11.2-r0 do_sbom_cve_check_recipe: bubblewrap-0.11.2: Found unpatched CVEs: CVE-2026-41163

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
index 7e63435e90..c9aa04891b 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
@@ -23,3 +23,5 @@ PACKAGES += "${PN}-zsh-completion"
 FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2026-41163] = "fixed-version: fixed in 0.11.2"

