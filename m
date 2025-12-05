Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDA0D37493
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2320.1764963973164709544
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 11:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDeIgu44;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a637712so19361615e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764963971; x=1765568771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ3TVmYIKegZDqAZ++okgoDEmDle0Tn8sAcLvI7XZGY=;
        b=VDeIgu44WhQyKOBt7QiZgOESAgeXegwxYkp2F5oR1KA/w32BwscHUPWv6xtGzqcPFB
         eMKtJ7pHUd1vsY0FEk82JLvjMpcdc6ail0DLk8gFYK1dj63LxYUmtCvYSGPPkm/BpnTv
         p95MZ0CJch1wxDcJms1x35LUJa4vadsBbojw6nZB23v365g2q6vDz5W7b2XAjxYAfZOG
         VHWuWbuF+I2cPkVdiU4aHPMdVWSHBoVm8Eo7lNpZ6dU8xXzF3T+TDZtlzhE/aBRrMy+9
         fLlzkvSX7ncEpQ5ZKe+C5kXl0VVLVZJeqt/9IicgL7McNhrXsqXgHyNYSfF2Eky1An31
         oKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764963971; x=1765568771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hQ3TVmYIKegZDqAZ++okgoDEmDle0Tn8sAcLvI7XZGY=;
        b=huMxEyGcjl5T3CGuXsrUjw3AEC46hQrlaJR8BsEX5kzP+qiOb7ZjY+sOcfdZw4F6Op
         XaAU4AeW3M+DN2GLSVncD38g4/WqeJzZ3wHzqTCznHe4krwv40PiRfCHwVBtwhM7gPik
         K68szraNH3/AJ5CjisxKcgBjdSv0WULuOz9bI6v7lyYENEzRv5HVDV8sDG6ZXwXp4QOF
         ihXJICrThwwJQ0dpS6MJYEwT0z4zJpOgQKXxtxxl/7wLbV30OSLvybg8HkNvgLEAuF/b
         wSy7Q0bSEhoNgHjgwj1CZ0V3cIWAFtb2o94n/f9QxF5d/SNnV7yGgGqfD8RlEG8n2xFA
         gWZA==
X-Gm-Message-State: AOJu0YyG00MXz69D0rUAIrWCPQDzWX8L2DDEnp0AxC6RhnKQ8oX2B3kP
	BU//xudmL1KCLexjR/2cKECENUA3P4yoO6+LtdNz/t8tfaQr4W8Cnd6/mswd/g==
X-Gm-Gg: ASbGncujy9tBBqFXz4iqtrXD+YZ3+g1IjOXpUfIWVsVDAvXYep5aFEGacrVcINjWjjf
	TcQRxlWq+Q+MLdROPmCNTrotU3g07u9zeEyEROA2w5A3jLh7qMNCDgDtaeFXT7pUJ/rNFqhL8Qj
	r7ANFEwL3fqIC8GWQFqD8EK/sLQ9Oqd7K5rbI3P69B7Zu9xlyJPeNnAr3zviMJfuqbQK7Hj0eeB
	/fr1rcp1Q779so/lwj3tGMSzPlcaW2lotNvbR7UvQkAXRbvp5JoSfb/DI0Ymvqx8gm/5BqekeIA
	ngePkVKHawV1Qf3mtC9XmyQnlQxL5BXMQmVQdFm3bTjsnd4j2mQA9gGaFMJYVO/4MStGfRyzEfC
	iocRmsMIxvU/oId4b+Hp7U7AXP3G4BsJcm6g+dOi7/789QX0/TvElrBz/yASGRb5RdPrbZZBW1I
	V7KjsZqu+i
X-Google-Smtp-Source: AGHT+IGCRQpfg9gQf/ZzfVFutC8EjmmCdpAZbb8cV5qJDEHjd6ndmEUFHmVsQW2nWIHB3Jx/Gs2GDA==
X-Received: by 2002:a05:6000:2283:b0:429:bce4:20bf with SMTP id ffacd0b85a97d-42f89f634c0mr301183f8f.55.1764963971448;
        Fri, 05 Dec 2025 11:46:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeadesm10435614f8f.10.2025.12.05.11.46.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] libupnp: upgrade 1.14.18 -> 1.14.25
Date: Fri,  5 Dec 2025 20:46:09 +0100
Message-ID: <20251205194609.1546800-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205194609.1546800-1-skandigraun@gmail.com>
References: <20251205194609.1546800-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 19:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122360

Changelogs:
https://github.com/pupnp/pupnp/releases/tag/release-1.14.25
https://github.com/pupnp/pupnp/releases/tag/release-1.14.24
https://github.com/pupnp/pupnp/releases/tag/release-1.14.23
https://github.com/pupnp/pupnp/releases/tag/release-1.14.22
https://github.com/pupnp/pupnp/releases/tag/release-1.14.21
https://github.com/pupnp/pupnp/releases/tag/release-1.14.20
https://github.com/pupnp/pupnp/releases/tag/release-1.14.19

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libupnp/{libupnp_1.14.18.bb => libupnp_1.14.25.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.18.bb => libupnp_1.14.25.bb} (90%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
similarity index 90%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
index 5a42fc760c..bcecfd3b8e 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "c540ce2431bdeac73359029d4592b45790e1d154"
-SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
+SRCREV = "da7cf950f22357545061961b7e5610e08690b0cf"
+SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x;tag=release-${PV} \
           "
 
 

