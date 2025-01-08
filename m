Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A832E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:39:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.15221.1736329141894565210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 01:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=av2/MgMh;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2848029566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736329140; x=1736933940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfn5UFdLpKiIIp66Cz4Wz1+VTOQJnTw6KIh656MiDVk=;
        b=av2/MgMh1iw91KouyW3PNohML6sQoCfSbzc4LsgJoWVfjBRD7QEH20ok5q/4oxIL8V
         h/QZBY6f9kn24Gj6Q9PppPAGmmS2WV5zNOY1RgWU03B9dGJy3y+ah6fNOlgyeIRPouGR
         Fsj2G8iqgV1mpsBQqk/1bZDlZL+vS9e4dAhPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329140; x=1736933940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfn5UFdLpKiIIp66Cz4Wz1+VTOQJnTw6KIh656MiDVk=;
        b=Vtn6bh4i/CVUrpBVFswkmGRUAreS45yw9MrD2r8DKYJTvqjRxFNkjeSQkG+vqrE+zb
         0qRUz+QaJK2B6Z8tZdcKfhNJOl8bHhMZxS8h18AXP3xZZZRz3WwkKiLp1AP2vc+9QoLg
         A9RxKUUHB8oSjOiPZtdc47GiMDeVL6HAUjE+Gx23BPq5RYtWFgo62mOTb/cU0D+i8JS9
         UesngDFPtU8xAKCxCq6zjG1rm6PV3Heu4mdgenHMXOYA91ReGDHd7MXiPGVIEhHFeFw4
         11z00lJDcJdp8XHP29930q6bDgftV3vzOPV9Ed+jPC3enOC6GLy+gyFr0DTn4giwPU+w
         dtbQ==
X-Gm-Message-State: AOJu0Yw9sZ9YPV7GHSg19JIwySk5iTYmn8dgt4nN11uQLu2NWOhVJ2av
	U+6SvFaUDr+6d0OUGvcBFXyHo57Q+VpRIjy3I96tgNKgLfciE1e9Q3m31Zc/+IJ8Cer2m8NxCb4
	L
X-Gm-Gg: ASbGncsWpPyC29Tn9IXmfFkc/fPTTsAH9UMLzqxyoFWP4SBkFBaHf+MnhR67CVByG+Y
	/xfqJNuUVmNDXRSoN1OlTAY37pK7EZ1Vo8ueu5AgwXAoNn95miK0VbnG/cAb3RrhSgiI1ttfJio
	nVDyuLlMt5YL4ZS/yOBOi7aThHeGLYBFo8Uh/eVoP9fW4nHZtleDy9zeQwRbPGPDt8T7GAz0nHb
	YIavX7rOYBshLcHY/TICnxgNNh9X/ygtGM3ypFV7AVVnUKbwQBCObRZY+4ACAMr3pkMNwc=
X-Google-Smtp-Source: AGHT+IFJD2vbBu/qK2dx/2XamyKqxaaRt0St8MKAqQhb6LCAktQ9He4dqWYKXi8yBoUD2jl+OAEL0g==
X-Received: by 2002:a17:907:36ce:b0:aa6:ab70:4a78 with SMTP id a640c23a62f3a-ab2abcab441mr150859266b.37.1736329139928;
        Wed, 08 Jan 2025 01:38:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f496sm25179772a12.34.2025.01.08.01.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:38:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-yamlloader: Upgrade 1.4.1 -> 1.5.1
Date: Wed,  8 Jan 2025 11:38:51 +0200
Message-Id: <20250108093851.1560110-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108093851.1560110-1-leon.anavi@konsulko.com>
References: <20250108093851.1560110-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114741

Upgrade to release 1.5.1:

- fix: remove uv for Python 3.7 compatibility
- Update pyproject.toml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-yamlloader_1.4.1.bb => python3-yamlloader_1.5.1.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.4.1.bb => python3-yamlloader_1.5.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb
index 55c48f889c..11d7cf96fb 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb
@@ -3,9 +3,13 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "b6fe40ecf5af596d840e920670ed3475f9813492bf6e55b24f2ad450c212bab5"
+SRC_URI[sha256sum] = "8dece19b050acb1c6a8ca14aa30793388f9be154f734b826541f9a1828d41cec"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
+
+DEPENDS += "\
+    python3-hatch-vcs-native \
+"
 
 RDEPENDS:${PN}:class-target += "\
     python3-pyyaml \
-- 
2.39.5


