Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955AFC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 23:48:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.28509.1745279317484533309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 16:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYmQu43A;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2241053582dso63117525ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745279317; x=1745884117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw9zj7Aa6Mn1Cs/uzNK7vNkrUXAKnBNi9MORtA1o8Y8=;
        b=jYmQu43Afo2tUxc6Uxr8B0j6EyU8ekCOzw4zysm/ZUdii5T1QPvzGFYJspyh6U/Kyz
         BHVuqmiXk9U+rXzyvKIO9jeBQzMsJcd0ytnvyWBzEtciZNyX7QJOtMUphFL43TToJICT
         bWBBAhSOIkzQEnWkmNgduZcJehPdfW7DQDjsMt4GlNVKz5x12jN2lhB1TYYRy4qGWtjB
         8gwo12OWLgicLW1OxMEVLbG6IFz3nh0Lni9Na3iCug8W/fy7IPSjCDan6RLb/vJcLme3
         2BSfGdfzM+fxJ9vwtH/zgxCLYaLHm9ZlRKOBLNhvGxUnTtAOq9EfdM4xuPCqOJ6Xx0r3
         tgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279317; x=1745884117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw9zj7Aa6Mn1Cs/uzNK7vNkrUXAKnBNi9MORtA1o8Y8=;
        b=wz7zITi0v3iAkPw/p0QH6ETQPb5i14F1JPLFqL4Lr5GZLwdHN3SZwpAFGZx5EzfSWS
         m9eiIfmBGovKckbIeY/Ku1CguO4ZZo7B6GcbopSGO/UQDTEqueFABmZLaQC5j0DF3QSo
         ML5UYj0+NoBBiTpYCoxHiux828KW1wEjPzgobPFADjwiJQheAiuKIX0D8ROzmrqd9e51
         EJYEf8Np0X4cuuFp4jXliZYyMkkngXf1HJUOumQn+QVTIIBDisnqYgW7IEpZIK+n081L
         45l3GK5l2WV8kxBTTRnosnqjdhAhVMYggRK76VP2qKqtv8148gWHJqQGmAP3ZMG/4uwl
         zHCw==
X-Gm-Message-State: AOJu0Yy5aJBPLHiddAvz/4VoeYoOo40WsiSN8USULALiufiSY/rGN98h
	VeRqg6eqVD0ujtuJX6r8j6qEKT3nPmSeMcyVjILJgTRBoGq+tJsdtxymJtCT
X-Gm-Gg: ASbGncunINP0n/Hj6tC4fVWX/LDWd6jtTl7sTgKmA3AOQQcVEY1nixM2HpiYTWNJyVl
	vGgqpp4aywfKvcedlNb/t2O8zs3vrJ5DfHMsIUW7VNhF64gnkh31G1C/knCeu8ZQoOQFMg794N3
	UaGaB+XIapofUv9Um5puMestiPdgPANwt+J0+lWR8qu90K1DA8QYXw2f3UYdAvzgDCLSMwgSXLr
	nqTTT4G7bbEtbjY4h5i/OQkl6QpQqqTErANvOydyasKYhWL89hQ5CJy7G26tQw=
X-Google-Smtp-Source: AGHT+IEg7gitdnJvylozz9aV5jvCZQR0P0+XV0vFljqYO6GIKx51w0wNVhwIME/FUUY0n+2gNPayGg==
X-Received: by 2002:a17:902:ce01:b0:21f:7082:1137 with SMTP id d9443c01a7336-22c5357d158mr236465295ad.22.1745279316600;
        Mon, 21 Apr 2025 16:48:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde986sm71683175ad.244.2025.04.21.16.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:48:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] vboxguestdrivers: Use -ffile-prefix-map in place of -fdebug-prefix-map
Date: Mon, 21 Apr 2025 16:48:30 -0700
Message-ID: <20250421234830.1217875-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421234830.1217875-1-raj.khem@gmail.com>
References: <20250421234830.1217875-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 23:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117014

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
index f4f3abd81b..e8e6c3998b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
@@ -24,7 +24,7 @@ S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"

