Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1758710A62EF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48355.1774534343397604928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AcJLdqfe;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439fe4985efso785990f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534341; x=1775139141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=AcJLdqfe7FG9e+nEjxM63HoovJpYkF2QktwrWKIeTtqmMiC9mSSpIYT+iGWF4QZQJB
         doDf4YJEhma3uqfiRVo9eSEB5XUUQjQzCeSYoIciIl+dA+MNLIFSUu7ybzY11cKo+J8P
         kaQuSjld6GrB1mXgSdEMzoVW7xLwI1Cz0rc3lSmauDE+dxVnyvematBAY0mI0E6vEQx3
         1RF7kcO06CT9DvgF8zKLflxNPYdOgNJ7mYZledviU+Zq2DMsO9ajnnRrsaSa3yZgC4uy
         3bGhBroh1WNonuJxQ6pkmD71Dvo3rW6ehe6zTg6+MWJlz1aLf08e25tOmvLTf2+hzxNC
         OtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534341; x=1775139141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=M+fQ3nxjfVTmi1OpQxU2UGIPpdJo3GRnGYg8gvYqVTw1yfEvB42lromOxxPg/YjRzo
         RmQ28Dx88Ne9fKFCZgt4WAchY8LitWr14uwPpoE85qSdgncxd81CNc9CwJ+MwU8DBfq4
         5bCwDPEfKql7CVHxgbCoerz+QnLBMNkekgGsNjlDe7rZEFbeHHKB9RlgLPN2Vh7r7sek
         lcImLOVJ95fdwbRGeh6mDoY1m7cUotW06VFTuXY8n+WWO7SwOizKQdbbwoVK9oVqxVJM
         Me+VfOpqXCMfiEBLuQiLglsAgjrxsg4008Wnc85iQmuJAhWAT40Zlfge7zTp08g2zkSm
         GIsw==
X-Gm-Message-State: AOJu0Yy5K74kmTfQ3svmc86NfXItxQwo8Q0VtWWJbf11jicX7PDXHLSr
	Dcu8psb+UNNxt5hAgvUk85HyiHWpRo0XT64u1SFyC+VQSxZHSrGqddWkOou6xQ==
X-Gm-Gg: ATEYQzyZIwFhySTEupqweFECbPMjAJs3ocrVxp/XeFnu+S1xouT7Abr/uuGvBSIaMCb
	FLJFuHiMEWQ+pFFgF7MCG5FHE+vp0HsdCHeKrOt83PmMXfDhppdADYHBOKJi8seI7reX9KIIMVk
	9smA2r3/5WkpzNFi6UAAHgiewldXcnONcglmjQACE+4+XPkhB3ZxnpRNOIslMXF2372Ekw0L7AM
	vQjtGXPc0xxPx7mDz/Z80PiimDS+7vioBHJjPnBYLZZioijFYER1zG0N1DiQeKkXE+adReHJ7RX
	tML5+BCldPgZpYkF/ud5KEFnC21VSMbvZOAufE0joLpQCTJzKkZKAHHsrREN+f4Aiegv/vfgbh6
	o5F66QF/NNprQISvtd9EjM9PawHZ76yvGOngssTJf6gEG0iLthUgqZrvsm1kKSbs9Et1N6uhYmC
	dJjYbG5eY9Q7wTEQ==
X-Received: by 2002:a5d:64e6:0:b0:43b:4ae5:d7c8 with SMTP id ffacd0b85a97d-43b8899530fmr11277512f8f.2.1774534341406;
        Thu, 26 Mar 2026 07:12:21 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:20 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 04/12] python3native.bbclass: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:12:04 +0100
Message-ID: <20260326141213.2081121-5-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125726

PYTHON_DIR now contains PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index da1283d6b3..755a6c156c 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
-- 
2.53.0


