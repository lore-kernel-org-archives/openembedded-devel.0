Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758F7C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24524.1786747617601398290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a7i77fLf;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc73e322dbso23236205ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747617; x=1787352417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDn5jFy7NPHtv3yhDdKTRxnf4FrD662JQRQN6AWHCsI=;
        b=a7i77fLf3bPnYCWFvqNoBp4MVkYpD2UsyY8LatV2RWfLLdnhWujDg/q24kXbtWIkxY
         lZeK7r6B0MPT+WRnY+7BO4PKgePsRNcb6k4fgiKi8zjgAiG9WD9zTCqEaGMZTJXjZ2CF
         zo2jhSrhZeVZb8rz81uQzb2P5RXt9Ddey6V3/h9+UUV31WiWvtdWCQqMMdA3VzEk/NbU
         SEJJeWr9ikSDJWpWxtF7CTFwIYUVSc6Fd0OH/UB6E2JqZvOZ4b66+N+TOeRZOh6Tu3Qm
         W6+p8vqczyqv4JByEFpQ77mvVVqjeiVeS7D9CIy5Ej186rEGk5KYcSeUZcF0JXBmdc48
         Mf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747617; x=1787352417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDn5jFy7NPHtv3yhDdKTRxnf4FrD662JQRQN6AWHCsI=;
        b=Gimn/gj17GUa6jhen/9t5AezFXPKewEzeiERWIpVZnMFSTxTGNbHVYHMAjTQexw+5W
         dCxb5cnEsXXWtMRQRk+CvylMelh92Z95B/JfCSTdXoFguq+pilgzSxTuESsSjgOjDRBv
         Qmif7ysp+jYFOW13QG4b+52PMLjKAO5U2EjjEWIS3yWAr5CEiqIT1m79qkuY+5NgC7rU
         uwfhPi5GoKAOJWahKUyXGsQrik/TIGwPdA6+wpOL5BhRWImOig3g1vSiF3HRJIwszPKb
         blCEEMdXyErsg68QgwBJDKm6G3GOc7BZ9XHf3DlB1XxH+VkLa6S26EZXMvj61TbWYrvy
         0ozQ==
X-Gm-Message-State: AOJu0YyX81lkFWWEO2/jB9ZPirFA0a7sS6ARHEejstHJYeKZFU9rA2m3
	wshmu05ggfezq/WRxfaFzqifN7EPqVTce9q1gD8TAxy3IksVATnrRKng74nNqQ==
X-Gm-Gg: AR+sD11pfJYdSFzWUiWSz74O3W5PoMazEVsmTz3UT+PCNebayeLrlWExseNCq8o1nNO
	P4CBL51PQj9sTKKOTRZ21JxdSRser9bSppFfupevHjAq6gT2FpJ9A4Td/SgZumlRWoNU40fjObt
	i0sFZqZyjjo53BsyO4srsL1H/DwMTayImazMaqCD+Ju8zZRxNQe6ptJCyLdi2q2DiOjiSfhJU3q
	dqtWucRJhB7ZVJL5Z7bjj5HGFaO2d2embjbvXzuy1OYaML5GOl6MZKHe69JCi2Na8HRfjBQeirz
	8Mm/rie2EDkuVnp1CUQF0O06u91e6hvuqCV6yq6rG5uSkxPBvqMbi4y348tO3lqQS0YdcRYPmPl
	COtPUdyCBd1iXhT8FIa1bsRAPIpMpIPn/jBFCrN/bo3XA/pVKoa7SjpTCHb/gOwrDb421IArzrT
	uJltuzXQ/9Fgagfia5FT93NBsZxpSgcMTLuCOdcqm53Ck6VYRU49v8a6vl9qWyr6GF4KUKpkByw
	h32Gcf8pXmJS9GM915vsDx7A1e1ogwRl+HKhAIXDcvgiIXvI4zZIFgp80N9twNQx7BGh8OUtWtk
	3mSX68RKNA1DaL5Y0HMeTmyRaZ0clpE56PKP637G87cmx0V4pfY7c1CYADBVTu37H8UDyhblx3J
	+UgSFmGIbDrK5iBXz8FPEtlSVyF0muDfRIZOybbuWjj1ezw==
X-Received: by 2002:a05:6a20:2443:b0:3c4:2cf9:28b7 with SMTP id adf61e73a8af0-3cc7206ffb2mr9251901637.31.1786747616914;
        Fri, 14 Aug 2026 15:46:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 067/109] gnuplot: upgrade 6.0.4 -> 6.0.5
Date: Fri, 14 Aug 2026 15:44:53 -0700
Message-ID: <20260814224539.1523174-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129131

Point release. SRC_URI[archive.sha256sum] filled in for the new tarball.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gnuplot/{gnuplot_6.0.4.bb => gnuplot_6.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_6.0.4.bb => gnuplot_6.0.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb
index cf2e56f86e..d3ae44e04c 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.5.bb
@@ -21,7 +21,7 @@ SRC_URI:append:class-target = " \
     file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch \
 "
 
-SRC_URI[archive.sha256sum] = "458d94769625e73d5f6232500f49cbadcb2b183380d43d2266a0f9701aeb9c5b"
+SRC_URI[archive.sha256sum] = "73237f37f03306d68bfae133a9a50d5e9341384e198d5ab37eeca9ab534deed8"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # Tarballs live in per-version subdirectories, the listing above them has no filenames

