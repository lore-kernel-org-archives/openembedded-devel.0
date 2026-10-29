Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7735.1793266020493104697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wnGQ3YK5;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1363912a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266020; x=1793870820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAajpKqcsgKEag3j+zb4DOQZwrqpf86ouxKdRTmCb4U=;
        b=wnGQ3YK5lx8Kq2UgLsKeHN5L7LR9/mKs4gfY8I20l74kIBJpJG2d7EsF/mdJVobElQ
         OAZIS/Li6wzJOCwAT163VQymctGVgTPx+EJUCzjPwaU0Zzk8MXqPOYAoRQU6pMVQ4D4j
         IT30zwftjUdIM/gqHf0h4PZi8gHAU1foN2ceb8Gj6r/yfoAyOveL3BnLUnCpF3tCoRoZ
         uBEp9XfFvM+6BX9giDjwyeibRAKvDWUNbdxDDIpwLDB8zuPZecy4H//Z4wk9ZEUJpYDa
         Kc9noU1/1XUDjBAkQLJpB1erEovxfGz0jXQp8CUKlOTITAl+hPDtmhTAIeg0IrcvrKXL
         DITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266020; x=1793870820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAajpKqcsgKEag3j+zb4DOQZwrqpf86ouxKdRTmCb4U=;
        b=EQnte+buM3fBzwyV5r52ZwWU49RcdHWIRBxAje2OeRfziivRi6qynCOvGrdYL+h8/f
         rfokrd/0d7YQGtkzN5/VVatfcSPjwK6Rt0zTQyNOo+5XU+AY+3JDO6mKYoC2JDhkfzxt
         wiKlqYUSOb1cUnAZy8x0q5ggHFR7wc1JIE03iyorZ/1sRoQv7+A1jLeKL7cPqozWrC6N
         qcH/M38E4KpCBobyUxOqcRcBYYnMv0MzBHcBNMYIrShTivKk/u0U+lj5x7ivj62c15Wa
         8PAs1pkIeE/TLb1dPYHRyEN0I4yCtRViXxkditkUzvFHj3/aHADKdVsOdPQXG69LBrjB
         Dmrw==
X-Gm-Message-State: AFq9FYLR2MWgfsZ0+reLvwPo2GdSJXz4tTlV7w5h7qUXkMggQ1bNEC/7
	Mh7WMvhpc5r5pNul2n2li3xzpiYZGgdDR2OiXOEHqmX5wn+4L8SYa9iDYfvQNA==
X-Gm-Gg: AYBFou18BQkO/lEOJmWKr2Z1dXP8XiXTTTxpv3jRyrE56OkZ314roc+Jl/P6qW6vhZx
	6qWE17TlOh/HuYkxr1YQHkCi8RRJMHyjCAQOXvVLN4z7LKmcw3kyyP5woITOw5nST0dfnrJHaRl
	gQflrABaLxu3kACNZLDyk8aF3vOHvBsvAmQ4B8HZT6sSbIIKv12EBmMg8BYL34P7Vmg9FoB5r+k
	GrmJUugr2EyxnhMCH0+bqizpwVyjpaG65vwzBWrnqxvMs/uGoKc7w1bh01YMk16B3oZcWw0hObJ
	3OolLnj03/ksjWYLmle4bse0AaF4XlYUgB7gPQx3UQ/F+xn53fQazsroKnh7CJIeBdv2y3sf6q2
	6W2hpgzoGN2u0CvAKN617ecjq83c+bKQgjw58SK9tUicoZzTrV+FB4OhRE23v43tFS0O8tG6aZF
	Sq6iHT5bLvbkQ76WmalpBQuzxolORgFKbIe33J5VxkCZ/6uJdc2AvS5VrZrCbV2uPskEsc2w4Lp
	wEAe0Y8e7YnR5oehWoVYu03daul6QXS/g2doeie6tIqf4grnwxONYg8HSUCF02Zu2N6+5xcDH7N
	2GUTt5lJI3oK+gCqt263jIJqSsVsSU+LC7CBl2Ux5niXOblOSK11AvAeAlphrk+TJbOFATnf58G
	zpsGItAs=
X-Received: by 2002:a17:90b:3b8c:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3ae58268806mr3515842a91.61.1793266019824;
        Thu, 29 Oct 2026 02:26:59 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:26:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/7] utf8proc: upgrade 2.11.3 -> 2.12.0
Date: Thu, 29 Oct 2026 22:26:42 +1300
Message-ID: <20261029092646.3634215-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
References: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131651
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/JuliaStrings/utf8proc/releases/tag/v2.12.0

PTEST pass:
root@qemux86-64:~# ptest-runner ut8proc
ut8proc ptest isn't available.
root@qemux86-64:~# ptest-runner utf8proc
START: ptest-runner
2026-10-29T09:15
BEGIN: /usr/lib/utf8proc/ptest
...
END: /usr/lib/utf8proc/ptest
2026-10-29T09:15
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../utf8proc/{utf8proc_2.11.3.bb => utf8proc_2.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/utf8proc/{utf8proc_2.11.3.bb => utf8proc_2.12.0.bb} (95%)

diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb b/meta-oe/recipes-support/utf8proc/utf8proc_2.12.0.bb
similarity index 95%
rename from meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
rename to meta-oe/recipes-support/utf8proc/utf8proc_2.12.0.bb
index 12649d984b..b151550c34 100644
--- a/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
+++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.12.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     git://github.com/JuliaStrings/utf8proc;protocol=https;branch=master;tag=v${PV} \
     file://run-ptest \
 "
-SRCREV = "e5e799221b45bbb90f5fdc5c69b6b8dfbf017e78"
+SRCREV = "79cdd5ab40c79afa559f689ffc13b76812dee1ac"
 
 inherit cmake ptest
 
