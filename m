Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5094FD10F46
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 02:38:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.31037.1731894323659957784
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 17:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kMv6u1V6;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: david.sands3@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so2609174a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Nov 2024 17:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731894323; x=1732499123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYi5BYDYRha5AkPXmA5/e8oBmhTkfE/q6YN5MTukMUA=;
        b=kMv6u1V6mjocjuMlanpLb7M4xRz+B15km6r3xC+lKDn9nvIPMCXMHRdDjXwhIE0eUv
         hj0/IFEXh8QpBXT6WATrEy9n4TRl/B5uU/hokic4/rtM6Yjpv3MCet8bF0QZFNNSjxLE
         p3TE9QKA092fJlMp6hRtfABhkjecXDySIkxNsli+nTpFk/eAIniT1ecYjk10+VK0KEte
         B6tVdY58io2PUtPjVAfYvo73XuyWrh0gPAQktaZrbA1VzHKFq694fGfKtFvwZRQsw2ev
         YpZLzoVmPoNTa0pwTUj8DjiXdzMiHzXjqrz23nlLx/tnkfgpJrhD1gdxVAD5Giyh4x2I
         cMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731894323; x=1732499123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYi5BYDYRha5AkPXmA5/e8oBmhTkfE/q6YN5MTukMUA=;
        b=DeEs1ttAn/mGccRqHWxVuo1bYxDUytogyS6agOFLOqtYsqCYTx6iemLlDXQoXngyiN
         zYCix89lsmD6n5geggyFCf1ZAtodrvq42KRLDu0CLEtSQ0PZPvFTbmCDY4sKLxx2Mu6C
         Fced8OK/UVcUcFJvpvMiSt+lM0RAz8jUWhXD8/y3E+OIGqPUNWWo4FFI9WJglp+lxj3A
         7izM3zTn8FXF0OkmOqEu8nhjFbp6rua2CJRUkj7HqaWu5P5Hb7kMhuMjlzdYF4NR3TMw
         eLqT/nB42yD9ihAGxjJWQ0m4X9EREMwuFbklF0Z2MDmCNoCJdxoATZj2oeNVgDgVbNRm
         f/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHAYsmTjY/CVgCbF1a2a+bL4iAKxhUpYRQBMK0CWVeIamnknYjxbOxDHAlxnX5wIpnlJuHpV91WNrZg6/lsMlNrgk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnxFYWidIBrZ4JPzNlrWfX6/IbyR+G0M5/jAgwb0UhGkYD8lP0
	/gnf530ZGwp+yn7QNF//uxHtico/lq3pTGfuOgKyzMe/9Z7E5OPaImXEjQ==
X-Google-Smtp-Source: AGHT+IGQULGCuzM8h6LSHAp0uQwt5XdAONDrm/sSGYR54vvZJXIf4iKgOi3QBGKuDveMagnshlKdog==
X-Received: by 2002:a05:6a21:339f:b0:1db:d869:9204 with SMTP id adf61e73a8af0-1dc90b28fbbmr15920709637.11.1731894322896;
        Sun, 17 Nov 2024 17:45:22 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:70ae:e501:d81b:1d77:65a6:5f13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477135ecbsm4959211b3a.84.2024.11.17.17.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 17:45:22 -0800 (PST)
From: David Sands <david.sands3@gmail.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: david.sands3@gmail.com
Subject: [meta-oe][PATCH 2/2] jack-example-tools: add new recipe
Date: Mon, 18 Nov 2024 11:44:59 +1000
Message-ID: <20241118014459.2029441-2-david.sands3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118014459.2029441-1-david.sands3@gmail.com>
References: <20241118014459.2029441-1-david.sands3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 02:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113856

This commit adds a package that provides jack-utils (along with jack example clients) that are broken out from the main jack repo since jack v1.9.22

Signed-off-by: David Sands <david.sands3@gmail.com>
---
 .../jack/jack-example-tools_4.bb              | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb

diff --git a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
new file mode 100644
index 000000000..a868a2969
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "JACK example tools and clients"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
+
+DEPENDS = "jack"
+
+SRC_URI = "git://github.com/jackaudio/jack-example-tools.git;branch=main;protocol=https"
+SRCREV = "33de8b4285fa5054af1b37fe0496c110604ed564"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ??= "alsa_in_out jack_rec"
+PACKAGECONFIG[alsa_in_out] = ",-Dalsa_in_out=disabled,alsa-lib"
+PACKAGECONFIG[jack_net] = ",-Djack_net=disabled"
+PACKAGECONFIG[jack_netsource] = ",-Djack_netsource=disabled,libopus"
+PACKAGECONFIG[jack_rec] = ",-Djack_rec=disabled"
+PACKAGECONFIG[opus_support] = ",-Dopus_support=disabled,libopus"
+PACKAGECONFIG[readline] = ",-Dreadline_support=disabled,readline"
+
+# ZALSA requires packages that are not available (libzita-alsa-pcmi and libzita-resampler)
+EXTRA_OECONF = "-Dzalsa=disabled"
+
+# jack recipe previously packaged jack-utils when these were part of the jack2 repository
+# keep using jack-utils package name to provide compatibility with old image recipes
+PACKAGES =+ "jack-utils"
+
+FILES:jack-utils = " \
+    ${bindir}/* \
+    ${libdir}/jack/*.so \
+"
-- 
2.43.0


