Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1365CF3195
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:55 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3958.1763549628315377260
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eN+kIdDm;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5698007b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549626; x=1764154426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnjZFrHg3im77EhyCO47hmoYzZjGBZ5H03MxjcWeOBk=;
        b=eN+kIdDm2ZE0UmKOE6Et/OP7Ec7a8yR8Opmr0xAhfHRqfjdgLc2uiAkbEefyToY3DU
         xFvSOqNT4sBwvh1uE9WQ2dlKpQILpDHu9rJavonKQvaKuows+6Z+PzhLaPQXDvRg8daH
         tV4EZeC5KmrrjUaxtWauzRvdUK/G9lmpOUn7KQuFdrKvRIxbGfJNII61Ej3MNoUsGsBY
         NvQfJLeUkPOXy5tibSmTxQVbLU7pexgSRxyl5WgUDy5W9l5gxtrkUUVCMHS/H8DkMhhV
         7rDeyB5eIX43aBWByWGFusiQ0pytVvurKPdlU4/e5AHij8aTJLlDjKlY93tc/SKtFAdF
         yx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549626; x=1764154426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnjZFrHg3im77EhyCO47hmoYzZjGBZ5H03MxjcWeOBk=;
        b=KRSNPutCDXgmKrEUmpqV8ubLxn0iLCqSkp+vcvpYuCFg4O9kwv2iAjQxR83FBeAyiI
         04W7UvJySLtjDzYjLu9qF9em3zzCxTIKvtOEoFyGWwKq7WujTJx681T7Qh9GEdTGimbf
         rAtR2MZf9s/zvJsM3X+9sEbmWbEHwi8XuoEYHxNywc3FB0Qgb5jFuIdBl3Q24DZIcsKm
         PcrZWPF2JuTkg8iPEsneevZow6Sqb+Py6W+fK5985vvch4YDmhR33IOGN31/Li5vG3tY
         elMESRQJxSswiZEk/YUQJWY0u9/+u3c3A7ahsENrxMRAWlNS1LUdsumXyUQet0Q5K6ad
         iWsQ==
X-Gm-Message-State: AOJu0Yx3SqHiUSMiPNJFReyU5J1ScF+aFX0j8KNaXyCcpg1DB4eeSMKu
	qglyGwEu8xQFokvoGnueD0dpdMRWiRVSoJT7TfPeD12ElgYGwEWvZV0pWJwQ1A==
X-Gm-Gg: ASbGnctfSwCrcPGBPpPr8EFpqFTsD95KzLylhLmWOH0ptS6bQ5WFzEUy4TMcVaoN1fh
	uxzB/fIyh9u1XCzGw0WpR4q2CZPSQd3NxNF7GHR18fkWcMOMnyDMKPKLZ+N6hVCpySSRGH8msbS
	fFMbMteuyvn6OJjFAGvEuVImpjOT7/+3jXZtslwtwI3YbJm+6bT55+kY+BP+Nkbb3+1yFhkNpbA
	/TEOVcxDuEKevsBDpt+21Cpxd177Ulz79YbSfQVUs+AjOq9ykI0QNvwpzBR5cvnz0hb5xE1tCSP
	cGiokNuBmF7lFusMwVj2X6b2PDRhb6u7M4NM61D53c3YtcVbh0s3u6FoV0lnOY5cJ4ltNlsbkON
	2EFT9ZC+LSOcJqM1MR/+tWgpVR0/4XcDd8IhRIG+2j1xeC0LfeCktkysqpyKHolHgSAcPGQn+JN
	OZxw+Q+1LUDgaXmJ0PCKFVbzC/qni5S4bGMhQ=
X-Google-Smtp-Source: AGHT+IGtXQ2pHg5cnswG9m/KIYki7/1zr2HXziCB1EMgbb9IBx/ISHuRXyoD7E15DT6/6oerNZzNhg==
X-Received: by 2002:a05:6a00:2d8d:b0:777:797b:7318 with SMTP id d2e1a72fcca58-7ba39b62f32mr22023192b3a.7.1763549626308;
        Wed, 19 Nov 2025 02:53:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/6] tmux: update UPSTREAM_CHECK_REGEX
Date: Wed, 19 Nov 2025 23:53:27 +1300
Message-ID: <20251119105328.2849176-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121895

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Update UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version tmux
INFO: Current version: 3.5
INFO: Latest version: 3.5

After the patch:
INFO: Current version: 3.5
INFO: Latest version: 3.5a

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/tmux/tmux_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.5.bb b/meta-oe/recipes-extended/tmux/tmux_3.5.bb
index 33f709681d..c7c87eb4a1 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.5.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.g
 SRC_URI[sha256sum] = "2fe01942e7e7d93f524a22f2c883822c06bc258a4d61dba4b407353d7081950f"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"
 
 inherit autotools pkgconfig
 

