Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CB5D185D5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4018.1767869674810666563
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVqkM9bb;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775ae77516so33624265e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869673; x=1768474473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaM4fDrFrC4SFavISQPQWmlXqNfYpgfze8J9mBVERJM=;
        b=PVqkM9bbvk2hzZUfJGC/+mamFVzRT+TXbbeLlog2e8Mu3awMPcc7B3rFCHu3gTNlDH
         sUNEKCtjsSyjiMItIalutmvy651ryh4USGMPKDwtteF8eM96AxYJNrv3hkDhYozUnIKj
         V0aP6k2I+IjMFG0wmn0gy6tO/AN8niPb4hqd788KjQe1zzG5PJh3QJ7frpv/FQS0dRW8
         JJAj0MIyqp7SHVJuoIHb4vCMfSW7HIfq4gRGBgRG7RR9MC0IjNGiWb8Xkpv3qaa6bXIv
         FMxK64ZMWjJeR34+EcLmodW4npPo850PpjB2lc+z6l2T4paKtfmS+4tFqCTlaxQshoOF
         tTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869673; x=1768474473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NaM4fDrFrC4SFavISQPQWmlXqNfYpgfze8J9mBVERJM=;
        b=bzuPj7Q6j5PHZtywguSb/5Q9+kiBBFG096FcMhbuAmTqu63PEGG+oslxJw8Y3CfVWn
         6fbtLBJJKz+vWArbmuVMbAd/fGw7Q+i2KwMROtNAD0xk6cDY4bmH7IsJWr5ef633CS/M
         SCuDZGLxMpaP7g029z3+jMOFxPObq8eEdimIWxqPnwzgdgFIrZrWXZkxD9/UfXsIGjVE
         QKrsU8nRs02n7kIosgBWofVjVLCYX8FAyzWxpDWI0wPWUgGQMLnGsUJa1B8UeD8kFalo
         W9PSMgoZsubn+jYvZCOeKB6natzGra3TMpSwpn2ncdRfHfMcQu+kQ2LRsaJB5BvBZ5sf
         LLsg==
X-Gm-Message-State: AOJu0YxubN0QCl5WzAGOK3MV6kFu9d+0CLzb0+LJjg3AhbeO3yIvLdG1
	n4vBCUifbBP3zR2+vfjg7boi0caDwSp1VB0PT5uSfksnM3HBwtmkh9qjrdTVwA==
X-Gm-Gg: AY/fxX6/WxcSisiZ2XQEDdXE+AazFkjPveaQ+v3/mC7IJT80PB/2YZDYwzu9+kagz74
	zdL8rpwIaxzd+G/p3J40Pi4GWPWnE5TyJHzS6OCn8qreTmc3ZymeB2tTPs/XfntvvHjyhy70Ri+
	Ug3zg5aqrjQvQgAHtjpEAPAslWXp+/l7XyG5ie12xqxO24qnRJ5n8k4IK4p80sYqP2ROggOz005
	AHJs5eqlwePRGKQb7LrXnplsMDPJVGIwgy0g0xQnFTXRBo9GhX5+qlvzhBoYlDRqk1uQN4X+387
	jgC6Pejlfri9oZpSkB2ueOVHqyCLoZzuZ1brbEpH2PsbkOSlKKZROuS5UzYIC1RtyP+A6nheUMh
	8NRxJaCzxdoPB6R0HzpYh3RrGOWiXhO7ZmU+v6zFEuQHSExead2SWIAia7XtWRF1d7DZ9Rey2OQ
	LMInlLtAlK
X-Google-Smtp-Source: AGHT+IGRhMvxI1SSN5AKTUQyAUvjTNpCqR0O6jUO8lSZ6WNtCIxPyfKpSHOdGVS6ELaB1m53XtMdzw==
X-Received: by 2002:a05:600c:630f:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d84b3b75amr60824865e9.27.1767869673152;
        Thu, 08 Jan 2026 02:54:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 15/15] imagemagick: patch CVE-2025-65955
Date: Thu,  8 Jan 2026 11:53:17 +0100
Message-ID: <20260108105317.460246-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123269

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-65955

Pick the patch that is mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-65955.patch          | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
new file mode 100644
index 0000000000..cc88b8ae3b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
@@ -0,0 +1,25 @@
+From c798be8690cd314c115c568ee90136e65c53b90b Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 23 Nov 2025 09:17:29 +0100
+Subject: [PATCH] Correct incorrect free (GHSA-q3hc-j9x5-mp9m)
+
+CVE: CVE-2025-65955
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6f81eb15f822ad86e8255be75efad6f9762c32f8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Magick++/lib/Options.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Magick++/lib/Options.cpp b/Magick++/lib/Options.cpp
+index 5d5724c96..eba417cca 100644
+--- a/Magick++/lib/Options.cpp
++++ b/Magick++/lib/Options.cpp
+@@ -310,7 +310,7 @@ void Magick::Options::fontFamily(const std::string &family_)
+ {
+   if (family_.length() == 0)
+     {
+-      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->font);
++      _drawInfo->family=(char *) RelinquishMagickMemory(_drawInfo->family);
+       DestroyString(RemoveImageOption(imageInfo(),"family"));
+     }
+   else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index ed20b67d69..99632967c2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-57803.patch \
            file://CVE-2025-57807.patch \
            file://CVE-2025-62171.patch \
+           file://CVE-2025-65955.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

