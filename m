Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9061ACAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:58:40 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11018.1759672717551691881
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kh2Rm2I5;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3da3b34950so417074766b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759672716; x=1760277516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyitT6psPA30khZ/5NKp5iq8ceiojO5PGBAfDTK+arw=;
        b=Kh2Rm2I5APw/1numxQWkQQrBdFVNffcafr+IRT0gkcuh0CUvztsGI6XiiPDeA/Bnok
         wPDcYbmwlewDBKvvDVfRYByvjW+5HYa2msxM2QVAHXQVV6dOishPthpa1aE01YD7LZg/
         Y/ptM8bykDoNbsj4e/f912G84kIlGdZluhmtNNkIC3AUnY8RakylqYjqxuL3lTY/aMjI
         KBIrs19haAiK0mlxlaangjyzT8rtouXjMr/1KNKLB0LZ+TPBErO6SksjZHx9jBGkg1SC
         teoSwlNbnuWG5/5c5j4WkhyW1pRmsoryy8oDsJ8jZVx9d0hVCsF1UdIaiEqIpOAL9h+d
         oyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759672716; x=1760277516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyitT6psPA30khZ/5NKp5iq8ceiojO5PGBAfDTK+arw=;
        b=X0wkQZcZPhZLcPvGmwmQEzhzxoJWlZIHcepjNfWxypW7UCVxXf2UVhlMgGV0nqAZ7k
         0mWFoEId2lXHiFeJcTL027Iq5oR3WqWpQ8//FiePGxAAbyGzmHImfsCU/+ZaD8odBzh3
         QDBjjoFdnsdAfm53KFXl/ccRTJztnQ6Bo2ESJ9GXgllpIVFp9wGrP1b52SuRs4ZxZPsH
         JBejr6FnGAHTmXVb7/DPlbd1NI/5TPkzHUB3UB5fwGc3Oc6+QSQMGxMf1j5hH2EhuR11
         kLGbzXZIOuh4v2HQD7NUK57UaBwd/d9vrUH0aW36oj0fuu7+C2R9sPKbZcoBU0EKY5VJ
         vctw==
X-Gm-Message-State: AOJu0YwyRgeFHS5omQ1LL4/3AfgNQE7hFhZNPhtLQ8SoPn9Exp27/036
	6QMPqU1oe1AsZ5rBaYjKXJ+zY8XJi77/VHik0x4lkeMziESHRBisQJ9cHAiN2g==
X-Gm-Gg: ASbGncvQS+TcEuIbobFomHmqDU68IJIjACSVx2dI+gMs2OITKZBm7Qqj4YG9Nk6RZ/B
	OB/+xX2SPwBTmxtiJdbMpR+ATKJNKN7l1yiYUuAPXUne1s2Bgl48DDuHi7WZBCqorDAYtFLwusE
	Vx4HVqXYl5TMqYVirsCAQDa+YGbyaZUmFMxV3USLOaoEtcZOg0NKll4j0ypiAmSIyWMWrKUi8s8
	MY588IvA+5Cz8N0TRb0qS96fg1p8y9Rf5FS4Ic/ATF+JEtSrbKgSBrTLecFgcdeA5DPmEJQ+n75
	ORcqNdYfLUfmg8iFe+1m5NLWKvPqBaF3oJw/zVH7X5ZjIHcP2w+2Q5W7t/p7q7UU9jmrGyMtdUV
	BjO//4lR/5mp8DNc7E05Wj2OW+NSfGL+Gbp8EoROgR36te+l5KyILRQI=
X-Google-Smtp-Source: AGHT+IH1ywQ1pWEvdzjLqot+Lp2UEsXM2M3dMuQE9+7RelziPZ/RbTMWhbFDA59GCxfy6dsNQP5XMA==
X-Received: by 2002:a17:906:eb0e:b0:b4b:4692:6927 with SMTP id a640c23a62f3a-b4b46926941mr535291666b.23.1759672715794;
        Sun, 05 Oct 2025 06:58:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm909200166b.69.2025.10.05.06.58.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:58:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/5] audiofile: patch CVE-2017-6829
Date: Sun,  5 Oct 2025 15:58:30 +0200
Message-ID: <20251005135833.879336-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005135833.879336-1-skandigraun@gmail.com>
References: <20251005135833.879336-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120252

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/434890df2a7c131b40fec1c49e6239972ab299d2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f29fbaa4650201a059c65572947ed8faa991fcd8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 7654c073f4..a48bed2a3b 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
+    file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch b/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
new file mode 100644
index 0000000000..00bb7e597e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
@@ -0,0 +1,43 @@
+From 25eb00ce913452c2e614548d7df93070bf0d066f Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 18:02:31 +0100
+Subject: [PATCH] clamp index values to fix index overflow in IMA.cpp
+
+This fixes #33
+(also reported at https://bugzilla.opensuse.org/show_bug.cgi?id=1026981
+and https://blogs.gentoo.org/ago/2017/02/20/audiofile-global-buffer-overflow-in-decodesample-ima-cpp/)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6829
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/modules/IMA.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libaudiofile/modules/IMA.cpp b/libaudiofile/modules/IMA.cpp
+index 7476d44..df4aad6 100644
+--- a/libaudiofile/modules/IMA.cpp
++++ b/libaudiofile/modules/IMA.cpp
+@@ -169,7 +169,7 @@ int IMA::decodeBlockWAVE(const uint8_t *encoded, int16_t *decoded)
+ 		if (encoded[1] & 0x80)
+ 			m_adpcmState[c].previousValue -= 0x10000;
+ 
+-		m_adpcmState[c].index = encoded[2];
++		m_adpcmState[c].index = clamp(encoded[2], 0, 88);
+ 
+ 		*decoded++ = m_adpcmState[c].previousValue;
+ 
+@@ -210,7 +210,7 @@ int IMA::decodeBlockQT(const uint8_t *encoded, int16_t *decoded)
+ 			predictor -= 0x10000;
+ 
+ 		state.previousValue = clamp(predictor, MIN_INT16, MAX_INT16);
+-		state.index = encoded[1] & 0x7f;
++		state.index = clamp(encoded[1] & 0x7f, 0, 88);
+ 		encoded += 2;
+ 
+ 		for (int n=0; n<m_framesPerPacket; n+=2)
+-- 
+2.11.0
+

