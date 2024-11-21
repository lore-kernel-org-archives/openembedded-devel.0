Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09027D75BC2
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:25:31 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.5050.1732170323395619249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMrE+LSq;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ea2dd09971so506512a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 22:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732170322; x=1732775122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7j5+PFno287sULn9O+vLv68mqWU8oDUAxnwddh64v0=;
        b=MMrE+LSq3AYZTFEHmAeYddArrZioc2HBoYqXcrUsLZF8NYSH5XPKHtyraglO109M7B
         x1d+v/3bzgFYJ5rSUN7Dy1rYcglatBaIZjY170AgULi1jW/RNTgs2Mdl8jRsVBZBegEE
         wjs2jAZgc8CxCQda0cufoQ7c4L/5YwW4r99akFVIIis+DBXd21+9d3hvW3xOFUEwH8hM
         t67RNeGwovMv//LC7fTrSU3HSor5jMvxRBVKux2XRSVkxjYQqTDA+29J33D8Hcvoday1
         DhHQ9LuVyEh4TivZo/1xfgnnqLAI/Wk/kQRrHq3HY663SGNPQC+lcvBEWQa+gYqGhLkW
         kIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732170322; x=1732775122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7j5+PFno287sULn9O+vLv68mqWU8oDUAxnwddh64v0=;
        b=JC8SFygVX+oYpJjiHPH/Xa6vuKAje2UtTNWulLRwf/N2AyBdpfSMYldH19CdGDYVIp
         x8qjAfQCiE/tL0IeLPrbt5SzlRLQaVKiw6beFzpNt7HK9hSBuzgDVB3E+Q4epZMQoqpU
         0sxwJ9/PFDB9P39KvKO783/exJpz2Hx12M0PR/cWjGbJAZQAY+KJIJTD0gGtseb+Tufq
         JjJjs0h7mG8B02w7ksScWS4gVmpFsn/CUyJgBnPyG3XwIYpOA0ZXn5Isc1GLMQRHTJIu
         qjcMFjQt0rHWdvTl4x+NasYFzqi2y2Iu93t9cHMgLU0mWDkYh5fOkReMRdFKeUDy/ynH
         RgIQ==
X-Gm-Message-State: AOJu0Yz4VMsdxM8v12D5nubjzEdYccDfVewG4cLgALz2bs3t5T8YJevP
	AepieJVkJ/KCOQ2xSkHbJpzO5SteZ4CQuMogAzdumf/bYb+kKtUhu9qotw==
X-Gm-Gg: ASbGnctFNzg1ewxeGHT1KWfO9hcRXHLuVObOMxoq2L2kZFF+bV3DBWGR7DbLrtTrDVM
	ApkNn8j0qftA6qbiUWG+bxpF6cwgjXku+XesZaGb6pXNPQfG2cvT6hPb6ggU6lexDir2eNpbHG3
	tGGgwuWkJzIcX18E6sBx31rCwQbrFz+aafB5GLoJTohRhacMq1E4DkGSm+Czr+Ex3YTUEIaUziW
	dC3vCd5o7IQ82z4Oje3ai/pBqnNsIROiRPpCjYmXL4TK4O8u9DS
X-Google-Smtp-Source: AGHT+IGgYg86wFbpSazU/m4SMmqnNYf3vr3MxaZoZ3fdIyPg9mCPMR+bjUAE1Io3V+MO0Y+shoRcEw==
X-Received: by 2002:a17:90a:e7c7:b0:2ea:8d1e:a878 with SMTP id 98e67ed59e1d1-2eaca7e2ef1mr6146173a91.34.1732170322567;
        Wed, 20 Nov 2024 22:25:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883fd550sm5814705ad.254.2024.11.20.22.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:25:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-inline-snapshot: Add recipe
Date: Wed, 20 Nov 2024 22:25:17 -0800
Message-ID: <20241121062518.3074722-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121062518.3074722-1-raj.khem@gmail.com>
References: <20241121062518.3074722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 06:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113954

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-inline-snapshot_0.14.0.bb  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
new file mode 100644
index 0000000000..8ccd4ba8d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.14.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "golden master/snapshot/approval testing library which puts the values right into your source code"
+HOMEPAGE = "https://15r10nk.github.io/inline-snapshot"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
+
+DEPENDS = "python3-hatchling-native"
+SRC_URI[sha256sum] = "54fdf7831055d06a2423054875d640102865a164cc8291a8086e44dd9b4fd316"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "inline_snapshot"
+
+RDEPENDS:${PN} = "python3-asttokens \
+                  python3-black \
+                  python3-click \
+                  python3-executing \
+                  python3-rich \
+                  python3-tomli \
+                  python3-typing-extensions \
+                  "

