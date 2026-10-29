Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11247.1793278603948350673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SgflCT3A;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18052935e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278602; x=1793883402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8t8ZFUx3B4JEmTVb3Nx2fnnMgrHag+VxKJmw+uUzaE=;
        b=SgflCT3Ag206xj05dT7mx3PQUWHoH/U/nc10qXwhz/9zxhKoahOVN+VVwE9IqJj9xw
         QkuIGgqU59bZI+5fMImUlL2BMI179THXQBAKCJdynzvVWHmc1WEZfEzToIu/BriqzFUx
         yhc8ttFYiU5eWOtOZNPkuCqgEWSONy4B7tYAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278602; x=1793883402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8t8ZFUx3B4JEmTVb3Nx2fnnMgrHag+VxKJmw+uUzaE=;
        b=v8IpHSBXFbY9m0Rw1j9qEKf66k35hnKqmh2YudWLxOfqeVwDP8/O2NV6QdAwnYMzHw
         bhoftzQtuAvdS5GJdZ6GQ+h2k2+DWoAHrQqUnl/qDPoZ3+03RnCqjrkwc4lRVjZCDmOT
         S9vHh2OaQ0Z9OrMzO2y7Kbe7aR9nek061dJeu8/A6RsYgjv0R3AL0X/Dc/fykcbHeVja
         bh9gLqDoZDdLMP2Nds9rGsyZS8TRvA8RZYJb4uiJa8qk8Nu+WoCncsFr49dqvHvXXuOI
         1bTUxL+6/oqpMdmLJ9Esstafkzc8v8rHY93Z/sUhha18QO1vcIACFnlwKvsdlMFxFLVq
         7BSw==
X-Gm-Message-State: AFq9FYL18vgYjNv6sx4Ct3yrDdkPA6i+n2Y1XmjGWY+ttTdv6P/IHQrc
	vBrDJ3PjybwOC3KUIrUyLAwWmRzZmKMHuI2xFW480YkxZVPkL9fnhENugHnrxd989SaJ9IzY4Dj
	OWId7
X-Gm-Gg: AYBFou1C0bIGqpxZc9PsLMnQVuTV5fCaPHDTF4Yd6WnYFgWi5VEqB6yUUstl8jBkxcE
	MS6s4wLU5IRrB1+08YgJcnby+hs1snVRs04Y1QV8Wu8vLt0bZwkXETFVSCKtjGnSbK/UT4Yx4oi
	Gic/WfK7GgIW3JbItYQjbO9z39YPKqpNoVYc0xqDwkiaNHTGD7F/p12YmOj1RJcbnrSxTTVkPZT
	pnakQcJruI2HcUF5/i1rxuAFyjyoQgSnNoqK8GAi3+ewk67zZoQ41080Mwf2KThgR7Txpy/L2cK
	BgT4kqbRJ1rMXgES08lYCbTvER21ZSPq1qukleevS3KnY2u3xxU7T7kdliaiaP5+VZqTMof5mL2
	Ni2vTK5KZzwHPrr6uY980CxP0aCOmqFbXulIRX+BzzHEGDfZGXlnOyax43f6xzs9Q0XrJfMm1Qo
	Q9uK8/fyFd7L6yT7SkPaHNHnAI31bZtOW8ahBHF3s8Y86OxqhQDZJNjP8pjKJ8tkDawadgC7Fuw
	ONhXoTSOh6AO2tXZZf0oZdQfwaStUHJiefH1Ba7rjwIVaLqGzp8m/Kal4rTi8acpXFqc91Unzr8
	0QY5BuKaaqA9YD5J9G4lHUGBQTepwUq19oFxSbUuD1yJVC5ixc++0JzfDnDWUoiZWfvc0sPJzX2
	pnTf87kEDxIPrNK+dcRzdn2YREDtiPQrEFiQBF/MPkK7NkN/JXJABOs2KOK3uu8njwGfn+fHizj
	Y=
X-Received: by 2002:a05:600c:848c:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a966b4afc5mr134885575e9.20.1793278602151;
        Thu, 29 Oct 2026 05:56:42 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm36160335f8f.28.2026.10.29.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 3/4]  python3-opentelemetry-semantic-conventions: Add
Date: Thu, 29 Oct 2026 14:56:36 +0200
Message-ID: <20261029125637.811856-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029125637.811856-1-leon.anavi@konsulko.com>
References: <20261029125637.811856-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131662
Content-Type: text/plain; charset="utf-8"

Add recipe for python3-opentelemetry-semantic-conventions, release
1.45.1/0.66b1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-opentelemetry-semantic-conventions_0.66b1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
new file mode 100644
index 0000000000..8684b0e35d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "OpenTelemetry Semantic Conventions"
+DESCRIPTION = "Semantic conventions for OpenTelemetry, an open source \
+observability framework for cloud native software."
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "497ca63bf383723411e8eaf60c8779e9877633c936bb641080adab59d0eb6ec8"
+
+inherit pypi python_hatchling
-- 
2.47.3

