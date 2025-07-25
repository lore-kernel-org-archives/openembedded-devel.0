Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9302AC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:38:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.19710.1753450714146597402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 06:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMJtVDbn;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so1845551a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753450713; x=1754055513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1iJ5mUHxjeBzHAL2zb5Zrt7O+C7NSWfuro2Xhkw6PE=;
        b=TMJtVDbnV8+Xmn5vLhgLTh/ExMtdxMQfraHC3h0ZL6H2do9q5gCoyNbTva37gmRHnC
         ftOVBZezTKelqJ/uO8bs8ieoUk4MzPzuglh6/nlqTvJD+OXJzRisomo53EKa44G/uyo2
         mKAmu2Vv99n42x24swhHyWmosF61VwqM1M0JY8riKEAR1my23BMJgJo3cvUXBWx9FtJO
         n2e35xFDR/gYlEe6qgpWIgSq9PoCg1gFK0EwZiYEzxhKAsurTdMcdZEFwXBx6ais9V3Q
         t+1OE2o7WsreDMG7KILd0s7Qntrg/1PISsJYG14f2vknX6m9o01/F1DSZdPEP5mKJBgd
         0+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753450713; x=1754055513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1iJ5mUHxjeBzHAL2zb5Zrt7O+C7NSWfuro2Xhkw6PE=;
        b=hg8qVgZTaYv8uYRkJlhKs/FxaF+friGtADykQ1JBfpcaGG/HCx/p6wWI6V6v2J2Mz7
         Iqr5rrK0e3BtaCBSOE67MFG2Fdko0KoGa1LW4ENDxP/vwQWuCWyAa1XCk73tAldKcMk+
         0WFFiprHvudIcEltPBSxg26TZl760eieB4jn6MBHUAoh1nW6EaPUTSrJsD9iltX98DEK
         02k6M+Fqi5aavuodT8RrycJuC9OoGdwZ1aBrou7sZu+vfd2wyWXI6DfP2XLlIAoQFM83
         eRwQkgMvbvx6V2lrs8WGT/jqqwe67MbqnN6i6L4gHhsdD2lBSXU9d6g7CjEcrTYUMDFg
         7LSg==
X-Gm-Message-State: AOJu0YzGrozLV17Oo9kK71c8Rbk56CmgD92CRmVVUFNvtqpN85UPKvcq
	LUlcZ3l1dB3wWm8idiCLtP1d8Wb6hnGar5rv+Gz2K/SWH8LimOtAyNB0MJPS7GotTcY=
X-Gm-Gg: ASbGncuhOK6VZAxVbEJwzPBlvH4ZANMz2mb7dOqQmvRJbi8jCn8FyN8nci7+WqKfEs4
	R0C0MO+SzBr6HJ3gCCBCpOP+jWrqkL7jgWNwutyl3DpbdDxkmExN0v9OCn2J0h+RjyFMNf5US3h
	br4sJGk+a4nuT42v8P5YXtkS1587/zEAcAUmQJfC3ynVwRMUJcM8gb9oWrItBGr3ddyLdUH3Z/w
	TkYWqs2TkT8ECpJ2fnCNgCtpEGrHN20Pv/bBWM9YQ231rNHc4i5WiM8mjpX+8vbX6PH0nEz1lVJ
	NQlHUa9X9NkxAGgPQDE3JN26FUmzi2YKmetSPobAIMD2R1wazxpg+AoNu+Il1/ia911MyxW++0p
	j3ZmW2l7jvPJ7Mg==
X-Google-Smtp-Source: AGHT+IHHyeICJA4i9sDM/dZ7unuMbTtgM3dDReYEG+bXI/bbyeCeUsZac/Bnfpk27KS4tDmP+biMhw==
X-Received: by 2002:a17:90b:2b4d:b0:311:b5ac:6f5d with SMTP id 98e67ed59e1d1-31e77b22fefmr2882381a91.29.1753450713039;
        Fri, 25 Jul 2025 06:38:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6226adfasm2549284a91.2.2025.07.25.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:38:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-bleak: Add missing asyncio dependencies for ptests
Date: Fri, 25 Jul 2025 06:38:27 -0700
Message-ID: <20250725133827.1533329-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725133827.1533329-1-raj.khem@gmail.com>
References: <20250725133827.1533329-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 13:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118730

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb b/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
index f18502c7c4..7bc69bfeb9 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
@@ -8,9 +8,10 @@ PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;d
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-
 RDEPENDS:${PN}-ptest += " \
+	python3-asyncio \
 	python3-pytest-asyncio \
+	python3-pytest-cov \
 "
 
 RDEPENDS:${PN} += " \

