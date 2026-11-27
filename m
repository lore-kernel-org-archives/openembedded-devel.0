Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8085.1795739726465565554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PoGQtEND;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so10997345eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739726; x=1796344526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjyNtU8KLGa4aDBTjDXR1QPSiBC7KG2z7v0TQSBLhcw=;
        b=PoGQtEND6c0+vaCxNnYNX0T9YD1YMubVTNO1kqZvYuayzcnv+NpXNRTTNiUgdUB7m7
         2eU8b/AAxIrYhQeKF/11p1o55Q9+AH7O7eDsnHekU0GaKgTY8wKYRpNxvFoQEkhgk/9H
         42qYpiBGrOHimu9crwtulprSDpuXS/CW5qfOVGDUB+Own4wuoja4k2Sxf1ndIRIAQA3G
         GQT8R9ACv5w6BnXdLM95MflGUNTBH5DzQFa8O2dkVq4YCcp/Q/yjhYi1zPZ4AxZqDuA9
         lnuT1X6ewTwfmUOZC1Sh5FeUlFXpSaYiEacaDs8c92PAjxIT3JcTYiMLKTqwY9sRgs7S
         BJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739726; x=1796344526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjyNtU8KLGa4aDBTjDXR1QPSiBC7KG2z7v0TQSBLhcw=;
        b=KpVc/z+XxV47NjZtBZI80jnysDgeyIcrYiLMehzVwg/Hd7vVPj7HytB82RmyvfsA8K
         wSCU3WqhIAmFpPMYcyvjJfENb6cCTfdAI2onJK4bkLMmkiigOwFRfdN52ZPxyQxXCk+b
         DleHzKYoNGfHJ7HxQxmcsdoSI51dRAq8jvpYCASOFjxh9Qc0IHqK2scriJIzRlS6XTYz
         nkiUXWDAIGQZy34GO6kL7vDbdgJmJRbyF0Ss/nJyu0QbQI8PFH03bjAzNd+Zt3m1pgPa
         RR9ILl23AVboZYv783JgB67WSeU1HolfEZdq333NgE5nDWWU7jhShP8VgRspv6WjKUAg
         +eog==
X-Gm-Message-State: APuU4Z/Pp2crI3Agab6Qr9X74p7VBeUZ69mM/mZ7IrubhBDNWUq7xJ7I
	jKJHy7iTbGgg6LxX6bpRWUfqXTm3X91/VVG8cpmXUoZnMrrlyEt9s4WsbdD+3I9N
X-Gm-Gg: AZFdTZf3pbvPxvHbSDKpGZ/EgkhGqra5hFHdkOS+O9hp//2i/GcotfjM92VaQonQ+JQ
	zbtpFlyeQkjzfaHYxh/Y/4xREjoibiT/Pll/9YBYrn6Exsk1xJIICtcU+gYrCkNd8qAcoqZCVNN
	PAG2AmzzdwRXAX0QNbRJ31baJaNlMhfX0+gASufxQbbUlbXgz1j0rsEm0SfGcdaJvgQGZW+AlG2
	Lnvf+BUiCFJidepx2xdroe15xJHXtpgRtF9JTTJTbUdUjTLDgWfyQrhyDEsy0b+VIQxPg+uGDsL
	MBxVOcvOrgkp4eM2wuMHgQpkUB0cxV/pHpAQdL/P3E/ohwAJt1/zWLomJwoaXrvOLcA2i1QZRgr
	zRuku3TjIDcYEwEjNw/sbzvMXmBv/rTaqm6JVnxlKugT4WPhUsJcfwTktGMRPxP4fGEYR3temKM
	4xQ7y5Kdj0+UEG40Wr0fFkI6/9rwaHOM401q9quwf30mMBjZwhlCUFbTjB8SGH2qB+vkBRnJvFO
	tyZyFjYmynv5Br9V58jZ4bsckihHxgio2iTZfj/AxSMRGfK2e4/Z33rSyxANHgkbRfuHIf4ISJp
	Pc9DAaOJThpc/H1CZliwizSlUIi9n6aVAM56/1al+w1L3nfdA/9lbV3gUlJ0EoLLDDdP560VxUD
	os0/ueLNp/h6IiyguPTCgczzR9poCuc14OATcB0V2OF/FkNHDhq+m/T0eZeDlJxR5n2jsGl2kUp
	JRbbv1I9aHBWwPR+zAJDdY0gO4oufylzW6c5lL+Tb5Imv7SQI9YJN6vV46SmyA/cTbwuQwdkTDb
	TbPjQuBoQrBv+mSd5TnxmL2MH/JC4uQoQRKsmF/0nwLvYg5pyEbmxhaNuvk905f3MXJ6APktOF7
	syDk
X-Received: by 2002:a05:7301:f02:b0:378:7434:a526 with SMTP id 5a478bee46e88-3856f8519d9mr22440459eec.14.1795739725801;
        Thu, 26 Nov 2026 16:35:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 53/69] libutempter: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:09 -0800
Message-ID: <20261127003425.2166632-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133153
Content-Type: text/plain; charset="utf-8"

Upstream tags are <version>-altN like PV, but the default regex dropped
the -altN part, so 1.2.3 compared older than PV 1.2.3-alt1. Capture the
whole tag.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb b/meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb
index 6d9746c9ad..e2569db630 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.altlinux.org/people/ldv/packages/libutempter.git;branch=mas
            file://0001-Fix-macro-error.patch \
            file://0002-Proper-macro-path-generation.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+-alt\d+)$"
 
 S = "${UNPACKDIR}/${BP}/${BPN}"
 
