Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17651.1794787849587950171
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aJPhJo2w;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso3190623c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787849; x=1795392649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xdd0OMTm3LY7975E21VO3L0emuIhoT+0czABBV1E4Hs=;
        b=aJPhJo2w2uilEoJofH88+6eHsZnyj4iG8rwViEkT5p6ncUSa+GOylb1BglU3kRqjM5
         LkKdphArsEmWF3UBiDjZ+WxlozpNrifMXoZ67hRqxFQpwurYqNyDJdxLLNR+8eodEjbA
         AmFuW33peHIbaLArvr9v9jHHi6kkY0qo6FewFZrXF4wFOzvgof8kXfChZlP7az7ZEZki
         B8TESU26rgY3aKifr+q6wvLcIHUw/myMt4HiGopzr5N5KcfJW149di2qxffZZazgW7QF
         WgIq9SFwubxXQg2/FK3OydUVaqfmU2PhwriMjcXkCZqNiowNMRNeA3Al/WUL/ewA894X
         OD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787849; x=1795392649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xdd0OMTm3LY7975E21VO3L0emuIhoT+0czABBV1E4Hs=;
        b=2aB6tZTXaP238IPJAYtpajPOqZ6hTwrStN66Qj42vHFyfgtcgpHOGNZ1l2XiqXomxN
         A+Gj+JqVdSNouP/Oxppi2BB3nSJqMVLLhK2IKHNiXMpEvB++u9pb259zDrNFU4PWJTil
         HBcSdnIJKnuNh1nSjpNf4D5BI0/QOYDEsC6Q/bMaezvNz3fLDWNUs0UFXfOGrluJewbl
         KeloJYuZDgoaXupz/DPnn4SBZUuDaXYA+ILQGtarP2gVLiCgQbn8dFLXgE/RZXrKcYtj
         58LmN3QvLxTvhmblh2sZow5wR6bZA/mgYF1VMizqf+VlKKbA1akp1CbK/4degkHz8Nk3
         FPpw==
X-Gm-Message-State: APuU4Z8nC7U8J6Pq7hA6S/Dqa0S4A6IOn+6x2McpvfiwKG/ZREgSdaDd
	HNOjtJkwQUIFGYcbY3UTg+CtdreKrE/0pxd+NWkjgoOCkVJfpweB/NTkjoSzSxlF
X-Gm-Gg: AYBFou3mTOJ7vlXr/fh85AKa3vvuXxMP/eqAr0uQbkg2aPcg+N0ieTu3OOWVfhUgczz
	HfeydNliE/e0PdnRiTyh0W9/sxqBc+a/NwVHDLuGn7P/26EYmTVzy73dQbFi9Za0HAhVn6s8hpV
	WgLOgrPrZg0ZtNnn6YGk9KaqhyIy08tfMIVjIQlCTRFgNbuOf98IL1E29oAHujk+DfP0D4pv4ZR
	J+cNUbQJzY+AqGPHwewPgmvl7iaXGPNGhTHuTSAOpNqIkoOtUucjLHVTj/c6M9G/XzOLopMT0J+
	fXcOQDTagXGONhNEaZdSU36hX++6tlccw8uFPdwyVxVEr4HikGG7hmga4PujxjP90wl2mUJfQ9K
	aY3Kf/PQ/utd/QTdqn9VHdIFoHG2O/sHKvzTV/LNpAX+hK/tCOcbGhg6m7TWNrS9losSQSqmv79
	LV3+bjnwTxu+w+QCk6AZxcvrL8AzbuN9MxlLwtsR852VS7C8yzz6HljrZaCoWlEiiVEQyG2KD+R
	LV1Bc6gLAyD9GElGrNlGcPdqyqNx2woZd6Ta4WUkuDDN2hoZvA/+fSNZSQmpoaIsYjNXlRStaOu
	nBJoAIG7F3wWesJlHXg+7aHVJw8hfLIpzxG3TQy3RIzwSTKUDRi9whlUhp/jp9w2WlkyLaQRvsA
	VfO8yJfQ0qBan8CUf3cGyk8shSLTMlpHYZ8g8xvqA65U5gjQiU2U2Yd0OKnTT1uoDhLDnsHGbJO
	Rmmt3e2gkrV/DO/BS1Da3cSIdJwVDvVTznOx6cxW5LLEEv8/CLME5F/y1JC5DKyf4bfTzkP4Wuc
	yPST0ZWrvV78JlvCdZ2XE9kYvN1TWHcLt0yWX4j6G4iZmDKNNLcS2e2y1wybsd92F7w/HVvX4Rw
	EDXM
X-Received: by 2002:a05:7022:7e86:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b5030e73e8mr8876846c88.15.1794787848834;
        Sun, 15 Nov 2026 16:10:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/16] libchamplain: Drop ineffective armv7 override
Date: Sun, 15 Nov 2026 16:10:29 -0800
Message-ID: <20261116001038.440763-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132388
Content-Type: text/plain; charset="utf-8"

There is no armv7 override, armv7a and armv7ve are already listed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index af2e31a04d..bc1d0c0351 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https;
 # https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61
 COMPATIBLE_HOST:armv4 = "null"
 COMPATIBLE_HOST:armv5 = "null"
-COMPATIBLE_HOST:armv7 = "null"
 COMPATIBLE_HOST:armv7a = "null"
 COMPATIBLE_HOST:armv7ve = "null"
 COMPATIBLE_HOST:riscv32 = "null"
