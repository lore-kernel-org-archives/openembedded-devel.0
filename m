Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF59C47BD5
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:43:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86607.1767692585078335727
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tzffj4u0;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so1205206a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767692583; x=1768297383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w6VJwqrBXOgd/RROQRaiIJbd1BnY4D548kqx78SoqE=;
        b=tzffj4u07KNHsCgag5ipojDmHskoUbVyRwtA801VI4maiBH+xeMUmotX9ZaiQzjoXG
         QSfwnuhyiOkpE8AnvxJhcP9RcmnvqiamY5mKRDFyrYxrz5uyK43ZqL21896/notv02rG
         85uqjy5bdakfvgmjhcw9/NTRYoztAl1bzVmRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692583; x=1768297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2w6VJwqrBXOgd/RROQRaiIJbd1BnY4D548kqx78SoqE=;
        b=Z4xZapYQ5r23lHHy6gX9paFJPqruRvQtu820cSTfXO0dGt7B99GKx6X6eKPMudKu5C
         isqEqkKEIIjLJsYw86/b4/eT+4qa8pcm2nleQBcK5bRj8CM+x/tHIqGJ2iDGm8v6rItD
         AkzqBnRY+UzuWqRPIfMpAzn36klFR7o3akeE1YmBQc1u5A/S1rZ+Cq6s5c5groWHJZ9z
         GP2oiMRbKXr914djrbn5kI1D2cKuGiQwST4+2DljH2Svm3WnM5Wttya9V4l0nzKUeT8A
         KCgBd4TCTke2QaNuDIOFTPdtfykfacH8xW9IGSvpK1X0X1FEMX/+tivXRwQa7+CLACT8
         m2zQ==
X-Gm-Message-State: AOJu0Yw8qYORQ09GO9F4n4V+f/TygaIDK7cQiJQW+5T4UUhl3JkWwSAT
	DGWj/oN/1g1fs7xhCwNYxIo4ZKqJFM6IdXXGgIDi1El/ajCHLkYEpYM2kIXLqhRruINjgYWu+kh
	TQsbO
X-Gm-Gg: AY/fxX7Zuek6wUyOjOcNUkh5PiqM/Vdl0LFXAaXCbPWDcKhToCh7kNK0Y/DYgPjSTjg
	V62WAwAsr8tiibHpcYaLWrSfufPpkfZFVhdMRlogIStTnwfdyLO8GhnvMU4K2Ev0Q8+ILV2ZV3A
	h2iPKx3tn4/IbcnjXh2DK9+G88SkBbFWzoiUkajvHaWOqEPcpcANkKlp/ES3vwCAUZ9zITxUZ2j
	FVipAHOsA3uea0IYYl0cJCfGz/SADM3evBHcf5RWRTzPb+hWpTFMOfFwr/iGATYfxrEJqriUTKX
	7jvNbevWj9W0mjFpIQsexEcpDZ6ogLcHP4j7txsxycCauF6JI9VxI0r3LCxQqZGjE5StolDS4UP
	sDOuLMwRWHQ3z51L7HYBw14GAYyEz2/kLsabamvH7WKYitvvxLU37cY5dT3ql5imAK+WCRk/EnA
	LFDSkB0CHl9wzqIVvpekxYiRpU
X-Google-Smtp-Source: AGHT+IHbQ2K2YFCFUAfkw/mZtb0OMoesO2SUzQG8SGAyO+sfJEzbP3APF6McVLR0Dsi5W3YCaYrTwg==
X-Received: by 2002:a17:907:72d1:b0:b73:6d78:9b79 with SMTP id a640c23a62f3a-b8426a68584mr264230666b.20.1767692583126;
        Tue, 06 Jan 2026 01:43:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm176006966b.54.2026.01.06.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:43:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-parse-type: Upgrade 0.6.3 -> 0.6.6
Date: Tue,  6 Jan 2026 11:42:56 +0200
Message-ID: <20260106094259.36870-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106094259.36870-1-leon.anavi@konsulko.com>
References: <20260106094259.36870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123172

Upgrade to release 0.6.6:

- Disable setuptools-scm: Too many side-effects

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-parse-type_0.6.3.bb => python3-parse-type_0.6.6.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse-type_0.6.3.bb => python3-parse-type_0.6.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
rename to meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 8932d95609..6d740cb130 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jenisys/parse_type"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 
-SRC_URI[sha256sum] = "8e99d2f52fab2f0f1f3d68ba9d026060140bf0e53680aada0111fb27b2f0e93a"
+SRC_URI[sha256sum] = "513a3784104839770d690e04339a8b4d33439fcd5dd99f2e4580f9fc1097bfb2"
 SRC_URI += " \
     file://run-ptest \
 "
@@ -13,6 +13,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi ptest python_setuptools_build_meta
 
+DEPENDS += "python3-setuptools-scm-native"
+
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.47.3


