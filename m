Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB33FC02187
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 23:42:51 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.6309.1737243769695642740
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 15:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=THJVpuhJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso6027047276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 15:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737243768; x=1737848568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MakuyXhJXtfnUS/KIviYK2GplFxWN5DoPrBdzOyzpv0=;
        b=THJVpuhJdS8ghtvsIQ45cq4YfNDGZ+GM0lJGPL+Ccn1UHET88tMAL4sSaB3thbCBt7
         UTKzd4ZNtkyD3RnB5PWYawbfJzkPnKh+oibJ0abJ38+0hK4jBiVlbojz3tzpkr5lqSwp
         S7ZJfycQ0ckPF4vXRkCM7CZotFEO33HgHnFCcvEB5hkiUubLPuzrtkdKRkXLwaIiGMRw
         dr8W4AKpvQzwv+p54OWs4RK3fj2qHkwMpO8HJLGVAaG4SRSbb1FBd8sZnUGE0Qje+RQZ
         AF0vEecYnn3kNMD9NMBuno3kOivbbQC581nzr1UPV+peQigafJNemtNsBzTnsMyFsFEO
         xsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737243768; x=1737848568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MakuyXhJXtfnUS/KIviYK2GplFxWN5DoPrBdzOyzpv0=;
        b=roBp3bdargZ1aRtWTYl4KuCgsbbSFsijezzMBoCkwVBY3wD2SIdJG0miCJgaJKTID0
         2Zj1ezimbMPhrD9wW1R5bU1pbEZvLy4e63hiJPNP9Q8pit6gGO/QNjIWgp2lEHBgqebx
         LXiFrc/pwyxZsByw4wlG//wWdDGHLftrgHio3QMEUs5SgB8cIa/2kp3DPpQyhHk/xVWF
         4i2ZLFn1xnlDGD1De5eoy/GX6JMnrstaHGJvCeWi9QmsZckWi1u8RUk2OKvi67J5RPua
         HhOlBd9Lu2oZdx169Mm9Wes5fbXz7/zkXsdyyKgVDKeKiPVdsQy494/cxKuMltry2PMH
         TQNg==
X-Gm-Message-State: AOJu0YylEYjcGwd0lUsn9JmY/3Z/eLvc7wSnUKAZpxjxM90ZnSquGtUN
	5FAGXYw6XEdbU+yXgk/7K+4oscaDcIPtv+udrtXGIZI+qzn9ZFumbkykTPrD
X-Gm-Gg: ASbGncu0Cb/JWC63LqBuh2hI3E436MLYRuzywpsPhG3SmxxzMTI8wr+EVT3utHLzk/E
	Gi02rN6uLZAudHLKLYHuZvF8oVNz4uL+HbXGP3g3fLwZnwdFk89QWO8Wt2vaT+Y/qNG0uRV/Z7U
	CpcC66Va3q0UL5280hN/ewjuBPJyVUV6YQLtNqMyt03fI/NVz5juMv2mHiBcnmyYKBtGIUSmfBa
	Xp7yP4TU8VmbC6xJ4Xw4W45LxIf1z4xBsKtPz0BQ+dloDYEVAEUhnUqkD/9m/acvAXekcAoXq4O
	XFyhG2wGbLPwkg+0I6rfpqluss86
X-Google-Smtp-Source: AGHT+IGXfVcpyAA6kraWXyFVZjvPVXohZyNapozHrIp+noSjy8k82cJRTNQdDsDW+JGi5Azm4+maTg==
X-Received: by 2002:a05:6902:1616:b0:e57:4167:477d with SMTP id 3f1490d57ef6-e57b103b725mr6686253276.2.1737243768329;
        Sat, 18 Jan 2025 15:42:48 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e57ab2e7d24sm974408276.14.2025.01.18.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 15:42:48 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 3/3] c-ares: upgrade 1.32.2 -> 1.32.3
Date: Sat, 18 Jan 2025 18:42:12 -0500
Message-ID: <20250118234212.13357-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118234212.13357-1-schonm@gmail.com>
References: <20250118234212.13357-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 23:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114953

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.32.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.32.2.bb => c-ares_1.32.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.32.2.bb => c-ares_1.32.3.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb
index 438da9aa9..8bc22f997 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.32.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061"
+SRC_URI[sha256sum] = "5f02cc809aac3f6cc5edc1fac6c4423fd5616d7406ce47b904c24adf0ff2cd0f"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


