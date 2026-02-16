Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60259E7BDB1
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:30:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18399.1771245001613351166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t4vXpe44;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48379a42f76so17135155e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771245000; x=1771849800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifWAWEAM5bEEGGdNBnhoyjzFGWUSjGSr7We/9+p56ZE=;
        b=t4vXpe44LIFMvZKCCxgaTgYlKOnq1ARbelSr7eEazcNuB+PbtMLnVQbmSeXeE7SBbk
         IrMJCpP/gnN9raK0BxuBr2or95HfdJclk11N7qoK0V4VHpKlSPW1haN+1b6gqM534fUN
         JdFWB7gBuwLMn0QhtaQJsUnVu73LoufQw+F7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245000; x=1771849800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ifWAWEAM5bEEGGdNBnhoyjzFGWUSjGSr7We/9+p56ZE=;
        b=iGI3zteHkJpq7WDiwx0oFczLUSJoUBAMfQrkWfetIbmmT63Es20BiYm7JTNFKDULYG
         zz4CqnEjQOCAHt5RoK//w+6MxSrlK9VMefpbx8maydih87OsNaWDUXi1vFSBJHX8o6lF
         IrbrFhKzB6B9qgb8Y8jIp36AlIr7+z6CD5Szs+LtP2V2FvZxD4xfXTvcSNUXhwTqZFlY
         reUdq0V13ORZK9OsjhPSq4pBiNyg0L+o46bGOlqI9bbEjXKpo+ITiXE0CXrJppJdTpNc
         YImai7qxonZBKuRpHKAZ6mLSCikV+LIP73VoMoTtxkJwbmpSukeS/2E5KCo2ExB/4eoz
         4ylA==
X-Gm-Message-State: AOJu0YzqecduUr+8SKixq64YJxuczwS03BOYo0OAbeyD5Exz7Fbzu/XT
	BN0Xfxh5T9mwlJ3Rxq/JNRdBOk5+LvvfrM9dJsoBRsaDwjeH1979QKEEzpmbaAg765LiabOScuJ
	Qu88W
X-Gm-Gg: AZuq6aInFMLktF7sQJNUD3S3Cu6h27+5sFMvZBsscf8LYG5Xy3TxlvbOGMt7tYJ9tIR
	EoXVne7B7FlGrOuHIae3BBMIQN6NzBZwC6JYyOB/bbO4jFiXk2SgNi6HIkO6zy70RSaN2rX2xKl
	spEk4wIk+csORF8MaIjfTEHSzdhX2igH5I6i2p1ZG0RAI8i4rkk8CMHzWSHBRVddo6hDNTzL+gb
	Ci7G7k4WyRXpddC2BG+8skqGATIelV+hAU655pqunlSbkdRjb3+jzeS+jnNvi47U3exBV5jxA52
	gnwUAhphXYibRN6b+SqnfjrfYsiZp6SWI27tcjhO1D7ddutuHA4L3C7+/f3T8wXZadHN8yq+l3y
	jb2n4X6/ptqDwTt6t0Qfkan6373SUAHvnJw7AANK13eIBxpCq6zfkZsERJWMcFLbxgO3ZbuuSJ1
	QHyXJACmxhXa60rSkojuMHxuKrXE84lGksJFmO
X-Received: by 2002:a05:600c:3488:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-48379bbcb51mr132373005e9.13.1771244999590;
        Mon, 16 Feb 2026 04:29:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm664423415e9.9.2026.02.16.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:29:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyee: Upgrade 13.0.0 -> 13.0.1
Date: Mon, 16 Feb 2026 14:29:53 +0200
Message-ID: <20260216122955.2642743-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216122955.2642743-1-leon.anavi@konsulko.com>
References: <20260216122955.2642743-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124420

Upgrade to release 13.0.1:

- Check for listener's existence before attempting to remove it
- Update pytest configuration to support pytest 9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyee_13.0.0.bb => python3-pyee_13.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyee_13.0.0.bb => python3-pyee_13.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb b/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
index fba54324da..a5a9822cd3 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2b1cc8797dff32cec5d783148fceab5"
 
 DEPENDS = "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "b391e3c5a434d1f5118a25615001dbc8f669cf410ab67d04c4d4e07c55481c37"
+SRC_URI[sha256sum] = "0b931f7c14535667ed4c7e0d531716368715e860b988770fc7eb8578d1f67fc8"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


