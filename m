Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78864C4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 20:13:37 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.17256.1699128810949470738
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 13:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mftluuda;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso1969616fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 13:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699128810; x=1699733610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwDhSpE4MKm5ndU8B0MUWc9VIJCoRzarZXSe5Q3iLLg=;
        b=MftluudaDhaRvAtBBzyOyRUsoLIeIKdukDja8eKh7nkcne8Q7SDZBtc2yMj9XMO4M+
         uDj9TlOrkV4HYoyXRgwaEyw1oe8nbRgIt6WZDjNjOS24FTIUonakL1aEoQ6FTHELLJF6
         VBOExgWoGhCPJdVZ7QG3V5qOtZ4bWbGm/5/XMzTrAKzo64MnFlljlWjN6MYrWqxnD1wy
         KLe8VglUOhZomMPrzKm5YG55eHvrkG07YGGKYw0gqkkbCTPxneMkGTtv//mImN9O1Cgi
         Qx5N8p6N6xCrVWQ8kyWa4cQ+1sJmFUrq4USFGEcTFYYfydumzdj/y+93FbCJ+juAYzqF
         hp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699128810; x=1699733610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwDhSpE4MKm5ndU8B0MUWc9VIJCoRzarZXSe5Q3iLLg=;
        b=FthvCRoE95zKYsSwBQ+fuOXdva0oH8wmeh4YDw0CjhY0BrJIgLUzygiAi0+6ETpAEW
         LAxPc8xHEGYamAH6oK80JG4BJLAOpXb0oML2ZqVtvxkfG2X2PcUqa8ZXye20fn+2wrq4
         AKUL+ZmlGAleNyxFXemvOwmTsYHs4u0L+Q5d7KrXRBdqA2/9xBxM08arQ/9dM0TnuOCI
         X/AN/x1gmq+mA8wFSoMoyzHfDdWxcSEvb1mda2lU1QFBvIHmObNY2HOsP3b4rdSm81R+
         HWXxN56YFpuFnnROcwR6gzda8pK+TjsSZ8zIEz++HasZOMcz0MahJoKLVGwkwTex4X6M
         bXlg==
X-Gm-Message-State: AOJu0YxcEbWJYNP+TgBr7R94leO35uWELkAACsHtRWh0eR7FbJQDnpkI
	+O4zTVMYlrBwW62/EURHyPO39NrvRUDkHg==
X-Google-Smtp-Source: AGHT+IFHyF5JISD8w/oMzjv4paJWxnNiaRsKaq88oru6MWPorx4mC/LzXxifmfwhoVM1uHg31guoGQ==
X-Received: by 2002:a05:6871:2b04:b0:1e9:beae:947d with SMTP id dr4-20020a0568712b0400b001e9beae947dmr30676741oac.19.1699128809842;
        Sat, 04 Nov 2023 13:13:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id l4-20020a63ba44000000b0059b782e8541sm2782446pgu.28.2023.11.04.13.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 13:13:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xmlsec1: Fix the key name in verify2 test
Date: Sat,  4 Nov 2023 13:13:27 -0700
Message-ID: <20231104201327.3539044-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 20:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106377

This is a typo when compared to examples/Makefile check target
Fixes
Failed ptests:
{'xmlsec1': ['verify-keys-manager']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest b/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
index a203c38f27..afd8c69853 100755
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
@@ -34,8 +34,8 @@ check_return verify-single-key
 
 echo "---------------------------------------------------"
 echo "Verifying a signature with keys manager..."
-./verify2 sign1-res.xml rsapub.pem
-./verify2 sign2-res.xml rsapub.pem
+./verify2 sign1-res.xml rsakey.pem
+./verify2 sign2-res.xml rsakey.pem
 check_return verify-keys-manager
 
 echo "---------------------------------------------------"
-- 
2.42.1


