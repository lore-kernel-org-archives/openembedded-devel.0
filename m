Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48032.1795411851468057824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SRv3KJoZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-382f4710a17so4982110eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411851; x=1796016651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwzrnLUL1K9IXXT0p8pvVmRttHgJpuByTbW/lztnGA0=;
        b=SRv3KJoZ6fHc3bXxM1B5J7da+PHv3GbIgTI2qjS/ZF3N774juQTwwuqPjSqXpScuDq
         UZs3PtmhRPVEaWDSmzezJbS857VgN1Xdsf2o83YjmZ59w1ORbHhL4j16rc3iwu4xps4R
         pgX8xW7iUWINEXBlAsn0LaO3bi5A0u83t4fqIKSaSGbJ1LQij4SsWqL2r5/SngA9vpij
         fYxj7utIv4pr2L+5+/t67wmyrtyswR86JDdWBX3q7e/dbDQM46ZAuW+kGjWQS6K3pIhI
         Wo8jYs4C97KSiFAdIV7FoRI7G2FTZP/RaVsUOm9l+DTev+FCwT1kvKDkKwMZj5rvFzFT
         EVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411851; x=1796016651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwzrnLUL1K9IXXT0p8pvVmRttHgJpuByTbW/lztnGA0=;
        b=ZKiVfqQGKw3p8iBiY0oZA/AItNvIaSWyNKlEsta3UTZhrVJ8qPL1mLydTOmeVr/LDo
         m0Q2aY8Edpqcrsk1p9HhgdwND/GGKcG5O+FlN0BJetKOTIMDmIaktWx9gMoVC8Lzok0v
         wGTzQFDZWg5jDNmnfCbEYUgBSJd4jeS2EI4O5pwHfKcQPmqbUlh414k0pSfiiJrE4Xis
         6A7VPznkceHJnLptzxa5NibQAmPSm6YzO705oPs6o/x0eHbe9LYzrSlPTEuYwJ2GWnva
         N2ufj9ZjYt5BwWWQNKt2dEC4hOsiwEbja5MSUziRvxnwnIwQbMzmb1ht6YxZumbFkgW5
         wweQ==
X-Gm-Message-State: APuU4Z9Syui7WZzyrELUUTuHF1UEDQuH7m09hnx/HeYLTh2bdFB60EEV
	eeid5z2x22OXIL9AIv0j7tOD5ijmb7MvYq3JsM6VzB5xRGN1LlwDVI3iDErDqV55kY4=
X-Gm-Gg: AZFdTZen+C42UVrTTwBzW6vrEoeTWPVrmleRAowvd+eSGLxDwm7AiEoJsEqBTXw+ty/
	pusqTodHq5KfTdfX6OwbyaQGfG8gUUQmhNNVzXfRm0TQ/QQwsohPkXaLv+FCcrkLWjnyBmglFvG
	ibEpv66zP9EB70BXWTTqD7WDmR9aPTRub8m/q+aC3odirxrmZpVWIoQJtX201JLDpURdRK4FfsC
	o1EYGcQniQNtD3E5D2RvF0Jk3o5Rn7hrJUDUG0+YEe/iET8tJ6XFWBwnhbi7ATKpW0ZzjJh/fz5
	GLdlbjLhkww7h4vjrcOLT3fA+onb+9HsAARLnJOF006xecIBGfNL54JG2ehPlmWxFrvqAXEwcRw
	4r/FvXf8PcngEdabebcTEP0/PQU2RKNMMYRmeuj0hhax+fLvjCN++TTdIrkgPzkYPTCvmW2VyC1
	+DYhtolNDp8cL2IG886q/CGWsgKC/zlLBx0W+VlJ2sjifyddk2M+MJfLrdyiPRyghn5WmC/iuAJ
	DNjq27EYGYR6yiofwZgZya8ip6MxDf1V5B5wd5AzqdJ3f6N5G12hryqygqEHiNGZTaNaOuflqxI
	CkRl2hl0V2xc4iDOQpMu07SvhXGhatle/8JpJ8xMOLFzKYGLytN1m/YdQSSrWDp6mKo2kGcJhr7
	wHzOBIH0t8jWE7MjbGBzNaSSBjG6FZAvGFePtlboGOENqAnVqN9T4D8XBMVGkPrU2NyR0vX7ky5
	DzrET3dNh1VX7pgnVuPHP90sSACYC9sfcWIm/FsT8Z9pTUmMcJQlq1g6+h1IebcOOCz5Iik/+x0
	oWZPreNa9N2tx0FDC2FdFhPvLAphVeO6G6xC7Azhj7aR+Nmn/x8Y0m7esgHWkuaX7jnWGY+iX0T
	qVUx
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr10888019eec.28.1795411850703;
        Sun, 22 Nov 2026 21:30:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/42] imlib2: upgrade 1.12.7 -> 1.13.0
Date: Sun, 22 Nov 2026 21:29:01 -0800
Message-ID: <20261123052953.3658549-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132832
Content-Type: text/plain; charset="utf-8"

- Add imlib_have_loader_for()/imlib_have_saver_for() to query
  loader/saver support
- HEIF loader now requires libheif >= 1.17
- Fix WebP loading/saving on big-endian and saving of opaque images
- Color modifier functions no longer change alpha
- Fix ICO byteswap on 16-bit fields and a JPEG loader build error on
  32-bit ARM

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../imlib2/{imlib2_1.12.7.bb => imlib2_1.13.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/imlib2/{imlib2_1.12.7.bb => imlib2_1.13.0.bb} (96%)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb b/meta-oe/recipes-graphics/imlib2/imlib2_1.13.0.bb
similarity index 96%
rename from meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb
rename to meta-oe/recipes-graphics/imlib2/imlib2_1.13.0.bb
index 00ee200d7a..7f1287dccf 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_1.13.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-SRCREV = "6eacff4a366fda6ba02d6d27dead1cda0f600e07"
+SRCREV = "155b36abc10361ab7a70e6f4983c7648a8c9c551"
 
 inherit autotools pkgconfig lib_package
 
