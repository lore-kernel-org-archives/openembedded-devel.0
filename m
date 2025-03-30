Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3559C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 19:43:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.36781.1743363819108054878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 12:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tk9niGcO;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3282048f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743363817; x=1743968617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFGj9zjWOrtbky3MM7Autuj28qWsZwEuRk56WFGy4cs=;
        b=Tk9niGcOpz601IXuqYjQ/gH5kWzEsqlJHV16D18tplxH1PxGFX9E0u2sEqf0Q9eccV
         q6uNc6VR+VuvM7V7t0ej1/seCG8lHhHaECEXObQy8bDaz+4Rl40E82bGmoIKGpmUVsh6
         UsXjKBYfKijwEORqhgIkOt5UoFfvGQbXXiak/BPMKL9u1VZwr2t8XkMKLZ6sxVIcV3fz
         y6iSc/CMypWohBzrhD6uAWXHbD2a78ZuEUw9vPwwkfLspHvc4kaew7SiTIEmOsM0sFND
         4f8Jb8FOzsJsbCUv1Mg/me2R9UK/rKLFbiQKrvXi9gvb9Vc083asvbR8celTNTZmokuY
         noOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363817; x=1743968617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFGj9zjWOrtbky3MM7Autuj28qWsZwEuRk56WFGy4cs=;
        b=j85nZPD0ezi3Wn8Trilyt6joV3PbDOfBiEliKapD/PgSdOmlEkKMknL9BL7S1NyUHi
         s/Pt/wQNyQnys1fqyeVPlMMjcTcFfI+0m0co2Rn1rUhi01OE7hqx1bpp89AQPJJnhceB
         IZZE8YNUwDVDx3QWYfvbjS05Kwe8iHjDdkE4C0fNeYZBHhoAc2ZMcfsHQWPwxFH4VAzs
         Adq5S0s96BUgDB1CRbQtvLUj8GIaH8KxBVmOKtzb27/EP7F1H6JP352x8fYcZSpM4v/I
         Pa+LaCm8LCDy3U8Kx/nLf6wurppz2HtgEPuW5vnyaOcaJiqHuI0nZtIl8SctE8qarE7v
         ehvg==
X-Gm-Message-State: AOJu0Yzm9h1DKAMHf7Vu9plqQJAWzD621/VtgUkN2jreoTTFKYP/ZgRO
	oYqFnU+o5ZZ8jTNxnhmraqtCIVf+RUEQHx5GvE7RK7tVR7SGA9s/SyOqLA==
X-Gm-Gg: ASbGncvdvHF0ketWfSDwZ+8jI8ZUX4YAyAzud88Xq8QqEH0o/xCN39nuroU4dz/hKmq
	fk2gPpaIdTFyMw9ySq6efn+jqMS7i0UV30EvRlmEx2Y0oP42aIxxJu6SNaLU09/VwfV2pwrmlW0
	0BSnnHZjB3HofF8LZgiHa4Qj9O88EIsfVnaWhvfghsm3UydRUmWHMqRrXgMdF6hivyKvAfR8eu8
	0ZnJkzivXDsF+2s8fzWmZPsjW9DkF6svcUtHEir4uFzviDJm/tXVwfrNTUW892Ck74oJmOfrKMU
	+2fRvohTcOT2w3e1fz7PP6DOqPNRdxHyNjD2VZQiP9ovxGVj4P+eujLpDrzmFiqHlV9K4g+u676
	i1m7RxITRz/2jFAzgAu9Vs85xnBsX7ys1iiNrWJ1tpoaxLO0Cqis=
X-Google-Smtp-Source: AGHT+IGW9KYNAFZE21MFhkTIOLw/4HvHD/f5lb8tY5VaFqN+hZNz01nLZZ4ZPyrwT/Pb2wt+EQl9/w==
X-Received: by 2002:a05:6000:1acf:b0:390:f358:85db with SMTP id ffacd0b85a97d-39c120e0bafmr4958796f8f.30.1743363817043;
        Sun, 30 Mar 2025 12:43:37 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm9488934f8f.16.2025.03.30.12.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:43:36 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-exhale: new recipe (0.3.7)
Date: Sun, 30 Mar 2025 21:43:12 +0200
Message-Id: <20250330194312.372039-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 19:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116392

Automatic C++ library API documentation generator using Doxygen, Sphinx, and Breathe.
Exhale revives Doxygen's class, file, and page hierarchies in reStructuredText documents
to make these hierarchies available in Sphinx documented projects.

No pytests are distributed in the pypi package.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes/devtool/python3-exhale_0.3.7.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes/devtool/python3-exhale_0.3.7.bb

diff --git a/meta-python/recipes/devtool/python3-exhale_0.3.7.bb b/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
new file mode 100644
index 0000000000..6168c3d2b3
--- /dev/null
+++ b/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Automatic C++ library api documentation generation: breathe doxygen in and exhale it out. "
+DESCRIPTION = "\
+    Automatic C++ library API documentation generator using Doxygen, Sphinx, and Breathe. \
+    Exhale revives Doxygen's class, file, and page hierarchies in reStructuredText documents \
+    to make these hierarchies available in Sphinx documented projects."
+HOMEPAGE = "https://github.com/svenevs/exhale"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7943919a123ae99ee86a0daf9e1871"
+
+SRC_URI[sha256sum] = "752a96d0a59456511d933311d4a81f642cd668296eacd2561905727d5ed6b0d8"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "exhale"
+
+BBCLASSEXTEND =+ "native"
-- 
2.39.5


