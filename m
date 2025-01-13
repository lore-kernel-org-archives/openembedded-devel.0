Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5272C02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.17195.1736776182599244037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bOrfKqxu;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso780111666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776181; x=1737380981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI/BL7Q9zy6hDFoEDexDXi1w65TFnIYE720pwn1s854=;
        b=bOrfKqxufW9M9dmYqUfhD52UqWsOsBR4P62DwOT17sLJuJY1GcFFwCpS0Q5G5ii8up
         Ud0qTvwDexPItgr6a5tXwk2hO0j21/R4OVj+wJLkuDNwhYeEXFeZJe137RdTjD4LXaIN
         4RkZNSk1QGacL3Di/tV6PoAYgE90f6a7ieopo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776181; x=1737380981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI/BL7Q9zy6hDFoEDexDXi1w65TFnIYE720pwn1s854=;
        b=w4JD9ikI6cKj6q5pPrUPRQmykckncyTblNHKIymH8HcCxeoYO/Las3ho83xWoTD8/T
         B9bgGRXpmwDRsChjPIcGqd0AMMSZ03iyK0Ffl+gRMHGsAnfZDP9K359DpYnqEuguQESE
         eZI2lePIhwG7dh7P+bxTzEsWt1yXpmrr0YRvgrVgV9liLJ73nNm+F+5kXax3byBF+vQv
         yYjwJWYKxUXpU5pLdI5Er+vm2Bt2dwR0in2eByPOhCZhC6/JufWrC1SnjVg3UIqlSERe
         9R/LzGWHpaVPYKyoBWa399v2O6nSorIdE3DqUSvxhetM5VjMPbYXhEIOKPeuMr26a1R9
         oYQQ==
X-Gm-Message-State: AOJu0Yxg/3EileX/6AIT6zGanEuXYmgBnhqHVWuw+2pzFUw2VcDaVLDe
	0hZTp7N4+osMS2qGcqV9sP5fbx8XnL5hueLh6U5Z5WJ+l8OyB0L8yJlszab6typGAejnU29W6qX
	4
X-Gm-Gg: ASbGnctLALCUmT0Ofu1rK/mwwpHUdpEHWRLNE4lUpCzp7kkLdpcG72Nf+93ct6LN6CE
	hb8fTdJRtDHr0osXclH/+rfft55QgQC45a3cKPn+VubJ1pPE5GOLqOLL8+QzNKaEWHK99dYUGm+
	K4bngyztTSqEIP4fxjKhhziij/a5BANJQCJofiKbMLsf7StXfgzfQWjHbew7jivNa32NA7dFlMh
	ApEfT0t4os0SD5IBgokBlG39FiTX7cTOK//xlwDAORjr9jBESDNVcEITCAcQowMnFi8Fpk=
X-Google-Smtp-Source: AGHT+IHScpT9YAT44K46QRlHFlZZVnhHAxAzOgEuOYxnObWrsHw6su5Z0BCXYSh15CgJxkiySd1o9Q==
X-Received: by 2002:a17:907:989:b0:aab:dee6:a3a2 with SMTP id a640c23a62f3a-ab2abc78f4dmr1688965866b.47.1736776180769;
        Mon, 13 Jan 2025 05:49:40 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-responses: Upgrade 0.25.3 -> 0.25.5
Date: Mon, 13 Jan 2025 15:49:34 +0200
Message-Id: <20250113134936.3594358-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113134936.3594358-1-leon.anavi@konsulko.com>
References: <20250113134936.3594358-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114834

Upgrade to release 0.25.5:

- Fix readme issue that prevented 0.25.4 from being published to
  pypi.
- Responses can now match requests that use `data` with file-like
  objects.
- RequestsMock.matchers was added. This property is an alias to
  responses.matchers.
- Removed tests from packaged wheels
- Improved recorder API to ease use in REPL environments.

Fixes:
WARNING: python3-responses-0.25.5-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-responses_0.25.3.bb => python3-responses_0.25.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.3.bb => python3-responses_0.25.5.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.3.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.5.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.3.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.25.5.bb
index 50835883d8..ac5ec6eb84 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.5.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/getsentry/responses"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "617b9247abd9ae28313d57a75880422d55ec63c29d33d629697590a034358dba"
+SRC_URI[sha256sum] = "e53991613f76d17ba293c1e3cce8af107c5c7a6a513edf25195aafd89a870dd3"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.39.5


