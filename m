Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EED9D63923
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 10:26:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.10455.1732098404028545557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 02:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=xgnQi+U8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4319399a411so17977595e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 02:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732098402; x=1732703202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBl4Ot+Hq+rjzwQE1/4ASuG3aX0JC2kyhJZ+soxdPwY=;
        b=xgnQi+U8uYvUiHw/97c7AGqhQbFOMb5g3HMXGxQef+8zsXZlb13AbzJMGQva8CmBv1
         VArZXssx41/ZaLASArx7ETYH4bl3viPVzdKrXY1xoMb4it2kZexVEffEp+zFCvM9ybd2
         H0ts1wocZK6N5A2xtTiHseahrYGRnoNAUYHvMuEj/nO8tlGXTt8ECW44Cz9S6XsFUrwl
         DfM0EQ9W42+dXjS3g1vDWQtZF1exqn/U7VsfgG+InfEO9Sz8TvFig81KQsf6PTNcZQZa
         WlEme09/MblNDO9SZwYtOLULEpLhdvMv6V2mo+hs6b5wLr3tccq70jkpDxbR2N2oZt4k
         XzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732098402; x=1732703202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBl4Ot+Hq+rjzwQE1/4ASuG3aX0JC2kyhJZ+soxdPwY=;
        b=RTeT4IEsk2XO6pgtzvuGlBISyd46aq6hXQahbCK9tQw7Dgtz/J+TSk1HZve6p4IdYg
         O0Doqvnzs07gxu8uA9zstqvFxbQRirx3kD6EJ5wsA3O3mKGPflUmK1t5umYW2N3n30iV
         VD3sGrkErS1XKr2ZBD0hTHOOWvpGIq+cr03bBvP8BAu8YndnKEAbl7M+/CmQhpbsqzeT
         oWvMoHhTDD26GcGvjuxfUX8JAoxOhhoIFauUR3DiGBZ3s9G8oYZGhJaYqoX+qNWzfbZx
         7D5N8O0d/zL6ycQER+U1cA/EFkse7uMRfP6XNmPezIXBMpWClBrHffj5nOJwCsXxtzan
         vvYg==
X-Forwarded-Encrypted: i=1; AJvYcCWpKmjGqakg8mKFNufuLE5pJIRlfOA+Pkom3KzrKKfRf8pTEmUJqOowBtfl2w4fj6xDiQKmgq0DB/OVe6u76YXJocc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUJrYN+I0zEQgDLnxdVonIJLgj2zWIMP7+3VEaCZxo3kmmW408
	GgQusLIqZM+GG4p0ZSPZVPuN5FF3f4za6g12k6bTMWwasI7CIHZQp6WCkUsv/z8=
X-Google-Smtp-Source: AGHT+IHyZGQ9UwxTf42XEGTmbQ6HsMzzmqzjMzvgdreLCueu18NX2FLe5IGLGpuHt7MCEtosvMSyIw==
X-Received: by 2002:a05:600c:46c3:b0:432:7c30:abe6 with SMTP id 5b1f17b1804b1-4334f018b93mr16885615e9.21.1732098402354;
        Wed, 20 Nov 2024 02:26:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e93c:902f:82f5:7ce8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e0584sm14137175e9.5.2024.11.20.02.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:26:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-filesystems][PATCH v2] python3-fuse: new recipe
Date: Wed, 20 Nov 2024 11:26:39 +0100
Message-ID: <20241120102639.20539-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 10:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113926

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for fuse-python - the official python3 bindings for
libfuse2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- move the recipe to meta-filesystems
- bump version to 1.0.9 released two days ago

 .../python3-fuse/python3-fuse_1.0.9.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/python3-fuse/python3-fuse_1.0.9.bb

diff --git a/meta-filesystems/recipes-support/python3-fuse/python3-fuse_1.0.9.bb b/meta-filesystems/recipes-support/python3-fuse/python3-fuse_1.0.9.bb
new file mode 100644
index 000000000..95351cc31
--- /dev/null
+++ b/meta-filesystems/recipes-support/python3-fuse/python3-fuse_1.0.9.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python bindings for libfuse2."
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+inherit setuptools3 pypi pkgconfig
+
+SRC_URI[sha256sum] = "9ed59577c36ab218d700aa2839f021f12c252b357186057572b98e19bc2a8589"
+
+DEPENDS = "fuse python3-setuptools-native"
+
+PYPI_PACKAGE = "fuse_python"
-- 
2.45.2


