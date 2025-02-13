Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213FAC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:04:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6963.1739437480182144487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JcvNnoc/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439585a067eso6296825e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739437478; x=1740042278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvdzVV+GG/tE8fyDCuZlBkWPWlBga1jmtKNo4kfqzg0=;
        b=JcvNnoc//0Qg3RRW3uz82l3U+hM4lKUnNtFxRVpI/8qwoPDKo79VpWlF1gUgU0GwVW
         YjkO3M1Khk92BWKlAOI7oCdqMSa+bvOqIfoVOpefj4HpB480vANxVffZ0lj0eGJpMSJ3
         ygjigt7JTpWduBlh0YM91VMv7H2dD3zDbS8Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437478; x=1740042278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvdzVV+GG/tE8fyDCuZlBkWPWlBga1jmtKNo4kfqzg0=;
        b=fxP3bcHWOKoXI5hrx9oj/qxDp5BRCYR6Jx0Aqu7K7ZGYTc4RxZfQilYqadBUOlJRi1
         jpHvrI5IfhjnqJtXawLU9Kt0+7GxH6VZzQVxIAm6y1Bf5KokBnijMtuYgevfULPwIfiZ
         OTW5HgjmmzPehKd/QEHxLJ6xJDiv4p8Wa8FFWl6VMKxlX10NeiReO7WfdgPPdp+Mja9Z
         5J7BE6AiNgzEasH/+16aoT1ILCu1Q7wM34TJtSVWwSzFwFF1RgihveWHYRHiLSjP0GW/
         b9mLfYEfkkflRcaY7EVSxKHuvgeJkB14Tc0XfCtHFDrU1EvNS2SCffzD+L6yY3YjUTNL
         23bA==
X-Gm-Message-State: AOJu0YzVak6G6eaCky+N1vlFybeXyx2oLiuy9tUvnd1ZU6Cv3FwGZeQp
	YHnCGsVs1sL4uiUBiA6BbTdu70h3zbzR2X3dhXTI+lQmsxyG6chJeW89oJ+LAedtPZ+UgKb+hV+
	k
X-Gm-Gg: ASbGnctNGLf7HqtHTuzIED/T0DAxB+9MwT3x3e8NXt4MXd6raH4pABYQzeBpRsRXMKC
	dUQb6DY2oCTBLcXsdG90UORnKGXVHQgIpVzw58UabUsToHYWNJGaLhkZbkXZrd4L1+mqVJ2OxOM
	1pqzZ5Bd1ad0g/px0beZhgc816xJM/RBkgNm1C5XSmoby86fBfRScRRXJOOToG6kAzGY7hgWzco
	n4yT8RE4cBSwwzBAse4pMsxFEurXrzN7dK1cOsGpvfgYxDDIP1+l1cRrMIC/w09bXLQM8EuuPIo
	xT8U2NXsFI1BjSsBrv0tKm1VwbI8DQ==
X-Google-Smtp-Source: AGHT+IFT9+BZzxTRgIYDM7o9Lyz6zka20vU0PtMcPXyH3gK8gj38tvKW0z/w0wmnIH/emo8vDvSpPg==
X-Received: by 2002:a05:600c:3109:b0:439:4a9d:aeaf with SMTP id 5b1f17b1804b1-439581b9541mr51956835e9.25.1739437477971;
        Thu, 13 Feb 2025 01:04:37 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06e309sm42507005e9.24.2025.02.13.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:04:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-changelog-chug: Add recipe
Date: Thu, 13 Feb 2025 11:04:28 +0200
Message-Id: <20250213090430.3750793-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213090430.3750793-1-leon.anavi@konsulko.com>
References: <20250213090430.3750793-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115457

Add recipe for release 0.0.3:

- Correct the programmer representation of a `ChangeLogEntry`
  object.
- Refine specification of valid `ChangeLogEntry` fields.
- Use explicit default values for entry fields.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-changelog-chug_0.0.3.bb    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb b/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb
new file mode 100644
index 0000000000..a34cbebe91
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-changelog-chug_0.0.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Parser library for project Change Log documents."
+HOMEPAGE = "https://git.sr.ht/~bignose/changelog-chug"
+LICENSE = "AGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a9d97a1655c1051f8a9351e15ea3122"
+
+SRC_URI[sha256sum] = "98ee1e8be75b6e9d512c35292c3c293a124541a4ec2014a6ec3cf33a3d265d2d"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "changelog_chug"
+
+DEPENDS += " \
+    python3-semver-native \
+    python3-docutils-native \
+"
+
+RDEPENDS:${PN} += "\
+    python3-core \
+    python3-semver \
+    python3-docutils \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


