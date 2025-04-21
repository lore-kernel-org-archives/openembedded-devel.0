Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9486EC369D5
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 23:48:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.28441.1745279316364974819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 16:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nND8ABhP;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2255003f4c6so50117915ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 16:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745279315; x=1745884115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CnIheFSaCAc7plGlWo5v47FETwQwDgdh2j4f65RU7A=;
        b=nND8ABhPMViujKw/0u1NzjAiy6jsOXvw2vNJ3cd91nVLKZ/FHXELQhmutcX+1Um0QO
         /HZn+6b1N44XCuu0ujSEthYiBPXpZN529M9neENK+wKNwv7b9d2k/rX5bcDxrHYpPOJY
         uBirG7rgoFpx9jzShLuLVmAclYwWzLd5A8ZNDCqDAVVP2xomHEJ7UI3jeC/7a86uGDXM
         AuBVw/ttdxwqsMUlnTPy2sMriKCZTZ4rGQjNqWVxXivbVI6i0FICp0/d4H4xa8W7CmbV
         hENU5M+ziLZsnOUDik/VfXPKo/98whG+IEMDoeqyjdhxuFK6Hft7yMAunp8VsWocB9EW
         G2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279315; x=1745884115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CnIheFSaCAc7plGlWo5v47FETwQwDgdh2j4f65RU7A=;
        b=AkEMd9ze25pfib52U9UP4aPzmhsfcGw/JIUceRGmOhLVD7qM0lXsOEODf4JY1DBv5D
         +4jzhGQlTC7MpaEo1Srn/ntrG8gH0IARSndBq0VzC3OFbYNf1oizj2EuB2Vzm+Nkm6+G
         OpYii9PfH4hWZrwYfD71pJOX207Bp8afAULAvt1l/5efSvalmITbIfAF+50QZH6dA8wv
         w7fc0y5rLiD5JrpdreABM0SxmLoEonjRCN734jfb36XH6xVM8onGJxXmsX5ZJZSb6W4P
         rkmm9BXHpIpMWwQibwa4GojpNHAGleKICXEREB6iMR9E/c2DrDnKK6wJoBuJGTAV9byM
         41xw==
X-Gm-Message-State: AOJu0Yw8gR2zQU/wx/fgn+f1JPrgRi3gdyoZGWLf1q9BpMsWyMKHbDf7
	ghfGdEQAAJPuXcPcQN6J3qD3/GnDnmK2q5OZiXLlD9RiVjsYvKWGkkXa8nJ4
X-Gm-Gg: ASbGnctpQbI1EYC/eI+7Ff7umphwtvrPteVJjyQ5sluhaeHz/+9NDBsoKx3kUtj5+1i
	Ib8AXZ30BVDNvFyLjbQdJdADYz70aELnRX58gIUj6kkOjoPiBLqLGcxxzGzmkcDGqHtbFzb8HZb
	JAjh+sFXmFk8dJtZyK86b/Gg0vL4RmAWKdrdNVjfdbvgOK9ew21NYMD79nY0yVNsog4VYzSnS7u
	iKsaC7xX/+8zKi1h3G9Ey6CduAbwQOXeoW5olARR6L8J7pnDuSSEfVKUn/XRdo=
X-Google-Smtp-Source: AGHT+IEb1bQqsSbXR+8z4BIesqMqO7NaGx+QnalMvqM4CGe9Ji0fYquQAKpvED7rU/ZDe2EwGoU2iw==
X-Received: by 2002:a17:902:e88f:b0:225:abd2:5e4b with SMTP id d9443c01a7336-22c53583dd1mr179414755ad.16.1745279315484;
        Mon, 21 Apr 2025 16:48:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde986sm71683175ad.244.2025.04.21.16.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:48:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] bpftool: Use -ffile-prefix-map instead of -fdebug-prefix-map
Date: Mon, 21 Apr 2025 16:48:29 -0700
Message-ID: <20250421234830.1217875-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421234830.1217875-1-raj.khem@gmail.com>
References: <20250421234830.1217875-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 23:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117013

ffile-prefix-map is superset for reproducibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index ec778c6e76..d19746184c 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -14,7 +14,7 @@ EXTRA_OEMAKE = "\
     -C ${S}/tools/bpf/bpftool \
     O=${B} \
     CROSS=${TARGET_PREFIX} \
-    CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} ${CFLAGS}" \
+    CC="${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} ${CFLAGS}" \
     HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}" \
     LD="${LD}" \
     AR=${AR} \

