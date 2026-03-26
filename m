Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E83210A62F1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49226.1774534345232478321
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rcC/1Rq1;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b611274bso535334f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534343; x=1775139143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=rcC/1Rq1aXKcaUi7AyH7hdjJlwAsnE2YISUlEhssrMH9HBK4D+3W3Y63javC+F7efj
         IeNA716KeNdX6ZqfPDpLascr2cyj7ubtXvgxMhsgfjxnYsMGSBYG2+if35dwYiPrBig4
         9X70ogPtBrxFXB9yGV2uCmRITePQIZ4SxUvsWj3mfns5V8ysFTgG3k6hbmzqUrP/zC+Q
         3iVwu0dBldYQtx1H3NgHNAYFtmF4PVqDEcpNKm+ppH1DjQ2kAxb4SeqnzKtKnqNE2Elc
         l+ZTszZdrr5OoREYj4kx3ntwIOzdOV8EKeljy/PT5h3oRNCag7ZNTl0vZ3D8oHSwqFok
         Wngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534343; x=1775139143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=IJ7UTifyP8/C/vTAI2HZL+KJNtMoI27vogfKfmhfylyu3LjFSJ/P5xSo6L9MAuUmv+
         2Tc+LOOt8zWJnIrVlkdMEXWOFkCyVj6NiitffzVHdAveP7pfFA0aQhQkxp36hLQO3gUz
         ks5HZtV7Ox1u/4T1j81OkMDh5ivW65iQLTa6WWTLMWAXd88ec7b6D9S7PBfVYMnweHI6
         lnceIIU0stc88Em+3Fcmx3oXQfz28iHSsgbkSfMg8Yr+S6KQpXFeSNmbWkW40RGe352v
         Br2ARMcTY02lps567eQp+dzK3/geV51g89LMfXP+PoMa5OVobmbH7xzD+cLtyomnv2uk
         KVqw==
X-Gm-Message-State: AOJu0Yzzho0apIwCIT+O0t6wDlkAwUpdY62bvTeXte956zY34ki4H8og
	IwkCmPwU8mo7IRujQqoXSEDB6jwLbyIzGxb3zCKrpHJs/lHsXt87wTqTyyw2ng==
X-Gm-Gg: ATEYQzwGgZUG13drXtsYIsbduBQUpFlLQo5ZhP1qRRVBF+3woCAVf8x2hogULhPfQlr
	mdPY1szuwYZwbGy9zjn8w1LIY3BZogkoBSWzsXEmH/u75tQd3UdTPlSvmQphjmMVBsKVEdkR2p9
	8bJH6GccghSS+rNrt3uZFR8oNDDZ4zqN38E3N+lXMNBJI06KsaKdIe0+xWW0crtIwQ7otTnDmHe
	TqMXo2/o9LBkHdHFKltlsLV+2ZsXWUKWHfXEQAJZaz5Jv51nmZoDvF8pGRHAmG8UoT5rzEVSRGx
	InoONFTLGegOkORUnFPA7IbIHCTdo2nAOcUb2M5zP4GZAE/rBZBDQUWTQcIc0tfCJj03GtbeJY2
	5/98j9Jmv2ArH2k9TR/5zOhXMTvF5Z2t7l+Ej7Bq12ahp3GkQ9ufn6k8xlQ4d69/y1S5efWB/FF
	p59jMu0KZvvbxpuw==
X-Received: by 2002:a05:6000:2c11:b0:439:be04:13c4 with SMTP id ffacd0b85a97d-43b88989da8mr12026384f8f.4.1774534343096;
        Thu, 26 Mar 2026 07:12:23 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 06/12] clang: Use PYTHON_MAINVERSION for python module versioning
Date: Thu, 26 Mar 2026 15:12:06 +0100
Message-ID: <20260326141213.2081121-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125728

Use the new complete main version setting instead of just
PYTHON_BASEVERSION that does not include PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..d5f8aa777f 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
-PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASEVERSION},,"
+PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_MAINVERSION},,"
 
 OECMAKE_SOURCEPATH = "${S}/clang"
 
-- 
2.53.0


