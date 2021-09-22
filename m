Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.962.1632338565115926776
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oHe0sk6A;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id m26so3592289pff.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+gxMDfgwKEqD8hjvmTUXR1RvNgtdz63Xqxwg/y5k5As=;
        b=oHe0sk6AqiuVtRAYyADHyrvvRPs0FXELBfEbaj1vWrsFvvWjMg9rQVwjhpvvn067Ss
         6v+HtN+pVIzrql8YFZZ5/hLN5DZb8fG1bbvtAS7LPWYU3a7FOujnbnrpXT3Vz/abs3Mw
         wXBMXE0yI4pz7C5NGCisuH89Yaj7DwDI9kg05olhfODu2odPR8TU3oR/HejS7eCrBD5s
         bjKpiKnSBDxxsrNXvb69L4I5jR0uAKqumIlbp6GYGW3n71B6QAhy2B18HEZAAtg+FnWC
         ctwXq38bjyEEuCc3b9rhICT85i6nBWmYffS9jA3bnX/t5Ed6EVsdTVt7DZjZ7HGUZ1x1
         t9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gxMDfgwKEqD8hjvmTUXR1RvNgtdz63Xqxwg/y5k5As=;
        b=JBwFBiWD+YZqT92bqiWrTAjVFaF345pb1tI0Ih5rqUl55FxthFcIStrv/bMRSkb5fC
         bL6ZSPftRJBRdUfhOtmUXJlq4AlfnnRLwojdTyd5BVjSiqjh6L/9ZXY9BtCIAnUzft1X
         AN0LCN8LuVyCI84E//MyLFIFBxJUxLLExerS0UeiT9E/wLL4xlsMFfRqxq1/dnpZIMGO
         DrJReYwpd8zYsBoHtSgG+KNnMgW13eqFUiuvwUk2/S7uU2r0I/6PkCgBgwV2F7QB3ugG
         MWUfqgNqtspCUyE1TS7hWfFKllI+pbGA1QWz6jHbwX+8uY4bmzQHhO+a0Ud7E7O7tqjm
         FnGQ==
X-Gm-Message-State: AOAM532WSCycbvn+WBBSVHMYS8rf8ObMG9+cwEMfkfQfbljrnjJxUtCU
	fPtYAgla5/yCCuMz39pEQsfNa1rJN8b9Ow==
X-Google-Smtp-Source: ABdhPJwbnqRWRAoAiKUOfv4DEqYvGcca4Hr2zSfLWskl4OQ5S/sntICp+cc/SDoMj26VbU8hUf4qLw==
X-Received: by 2002:a63:7543:: with SMTP id f3mr454941pgn.449.1632338564538;
        Wed, 22 Sep 2021 12:22:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 33/39] mdbus2: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:07 -0700
Message-Id: <20210922192213.3062719-33-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../git/configure: line 12721: syntax error near unexpected token `0.21'
../git/configure: line 12721: `PKG_PROG_PKG_CONFIG(0.21)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index 71ab4d45a7..7d01829789 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -13,6 +13,6 @@ SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
 
 S = "${WORKDIR}/git"
 
-inherit autotools vala
+inherit autotools pkgconfig vala
 
 EXTRA_OECONF += "--enable-vala"
-- 
2.33.0

