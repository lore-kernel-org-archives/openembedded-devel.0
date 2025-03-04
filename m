Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6617BC282C6
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.22072.1741096461220009678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VUs8fSao;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-390f69f8083so2954486f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 05:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741096459; x=1741701259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyiDMmLLud2SUbJfauAjmVbvL3JbjN0CctA2vGVw5eE=;
        b=VUs8fSaoDd+Qy0+30mMgAyDhmSMzY5F0+cRHJGvxt6NdIFa+Xr9KFGesKtTxXCdLUw
         6F+U/sJsJdoFaptyp7J6KVprRpw1UqLTi1o9HgvRCR6Hxb81WNiOC2Mg/EyKormxM37g
         zl5mGk9U5xIku8QwwdArvoJcj8zRKSoI9IyjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096459; x=1741701259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyiDMmLLud2SUbJfauAjmVbvL3JbjN0CctA2vGVw5eE=;
        b=wA0qz3II+yEr012mXV1FtckAK4mdFjHnbmzaFs55/WJ1gzkoEsBiJjlc+oLZeXF0Li
         xbKoetUQcip7JEDdVs83wvskGkz4ddUNzk7HeQmZEGnNhQ6z7MGvkVoyuo1oX+Y5CW/M
         t6b7CjkcmDgW3HkUByd1k4zcMe/SSqeMrHBjLWdnCukORteBVKmd1npbppmE3o2b3Lqv
         bMfvMe7Fwgi9bVMMkhcfW+A/pMjm4GvYIuZkD1g2lqewIIfvUDEr8pT5wF5eSTyklvZq
         u1LV2es+PFkV8Zpk4oTJbth/8/RcCS7PsEHtBNOuDbAyRNXKrEJaCFQNYIpywolv/7y3
         MsFg==
X-Gm-Message-State: AOJu0YxBvuxCll0n+14aslpcALlr9MfA8AEkYkshidD59xn62ReOkuTv
	Fzi1ybMDd2fV4HnjZ5FL5yy6ZtjGOVJHAbmdPwuRAKD/MTAJokHgU45V8Z0wbikpGh7YPVgq1JV
	k
X-Gm-Gg: ASbGnct/Ddy2insWlT2MpUg6EKNKOJi5oic63IXDhZQslc9GGlEZ/0OgKcp8cZTDvqJ
	qx2yvK/rzhWe/Wp1rA0cxzxH7ZRp3Ojn5wamFQupFsXLQZI5MJoJrbx8E/EEmg6YsbpGcGoyY8V
	9O0uaEVfAR1zsuua1xXWxHYR4zQ579VS1Km60cgO8lMWIRx9ed08a4pQcl4YDKuo9UkI3i8gFEq
	OxSfn6YGHf0xLgicZ0JmynJ/JYGxsjWQNKoLPilb6Cf7wmaFrsV6u/F11aSDC11oniphAwk2h5c
	/Fb/NX1ggb/Z03At+8ZYUqNYybZohtMUC7pT6MomNjYG5l+AHTDtUdopD1g=
X-Google-Smtp-Source: AGHT+IE7aSJxe7x3io9rW2oihmgBoqTCHgwqHQL3/8CYbDmuHcsmTyQ5/t9TdgaRgumqFKYYR+ElxQ==
X-Received: by 2002:a5d:59ae:0:b0:391:1652:f0bd with SMTP id ffacd0b85a97d-3911652f228mr2279354f8f.36.1741096459311;
        Tue, 04 Mar 2025 05:54:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d30sm17979983f8f.10.2025.03.04.05.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:54:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-typer: Upgrade 0.15.1 -> 0.15.2
Date: Tue,  4 Mar 2025 15:54:14 +0200
Message-Id: <20250304135416.2142742-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 13:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115739

Upgrade to release 0.15.2:

- Allow custom styles for commands in help output.
- Avoid the unnecessary import of typing_extensions in newer Python
  versions.
- Fix shell completions for the fish shell.
- Rename test to corner-cases to make it more explicit.
- Fix small typos in the tutorial documentation.
- Update optional CLI argument section in tutorial with Annotated.
- Clarify the need for mix_stderr when accessing the output of
  stderr in tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.15.1.bb => python3-typer_0.15.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.15.1.bb => python3-typer_0.15.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.15.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.15.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.15.2.bb
index 6206427a70..48d88502ff 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.15.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "a0588c0a7fa68a1978a069818657778f86abe6ff5ea6abf472f940a08bfe4f0a"
+SRC_URI[sha256sum] = "ab2fab47533a813c49fe1f16b1a370fd5819099c00b119e0633df65f22144ba5"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.5


