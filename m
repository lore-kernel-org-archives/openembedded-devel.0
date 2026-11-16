Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22788.1794814540468219372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EOgZxRBR;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2188796f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814538; x=1795419338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/f7UJchEQESEH3VIFhNqo4/ZRSPHI67jEt/Qy2bkeiA=;
        b=EOgZxRBR0UvothdtPCh/aFt8BD2MNZdPfW17GHvxTHFOhZ0cWu7JpXlFHeae61Qxue
         qJ4TZAeZykNTZLH0Vl3Yg67XVI9NbUNgBsPGAThvmC6UIRbm6VH4aZ1YR/cxHx1MELNN
         TeCCU0/dmfTb7SkjKoM+17IKpFYAr71x3zzCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814538; x=1795419338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/f7UJchEQESEH3VIFhNqo4/ZRSPHI67jEt/Qy2bkeiA=;
        b=fIddaoYlvykA1TjTAZ3JnO4OxV35JDcFzM8RuhXsDZilN8sb/SFVPIrrk7uUDmXvao
         kSc/uzLKuKCz+MVxBnoOeI2Mcc2z3n0cJbYp8B4+RbE+6EKhXZribcfGUanOA2AF/KUG
         6eGz9fwvztotg0ln1FPxWBoIwjKo+LcDUSBjg8TnoAJCUymrfWM8Tsn2VsfQIh2a0dOp
         8sBZnMCBPl6BRGGIJ9tO+Bk1dblARz0L5ws+PxiOOB2Un6XWKVuyEaLqlRIp12PeXV5K
         kTe4AYIfImPozpdMG5xUvkatZ0/3OvDoWod0G6BfYOaB7d4J4PFm6GxRvoR2rx8jOXfn
         ZhwQ==
X-Gm-Message-State: APuU4Z9ioLGGq8RnF2u12QIn/HKVCoVEV0CFrNdz6+VY4+nl9TTh8FnL
	BSZWzTAJjQWrfuqkFVVmTixvFLJ6CuRqMf1Q2rHMVEcwpE5kJ21RwE2IJQFx+wp4lWyY2rMJaRJ
	4qiR9
X-Gm-Gg: AYBFou1oBnAOaUSrhU+1EGK9hSnu+FgkdjqqPvVjBi/BQYoJrg7Kp1R2kxRysL+Y8WQ
	7bmSbjPkjQf8bZvEsQFQO6T1BH3bMfBY/O7KWg7QP6kgt+UPKcR8H6fV84qhetkxTgvpE8f8ol5
	H1pj1j/IeJ1MX50gY7V8Wj0Qb9q9zPOJ3YvI0p3hmF+R3vqx1s66UbW/fYh05a9ruwceX15lH0M
	ZiJjnIm4hrfhdK500BytojTqCGLsDTyRaMinLRI4U9m+E1poK/jYGLsK2GbhUuQt+q+/+K5QaRd
	spb7/+DinV5028hi6a+xj5nujThR9pY5HCxhIlg52pQ/CD/hMK3umdRG3p/soDA9G6Ig3gu9Nx1
	Ycx+iH4AvO8cvLJsrXmrRXnZIVhW5evO5uAgdCexYFKSumHKyuXTgF0zQMN2c3PhumWMcLonyGv
	AmNC0RljCzWc1vcXSiCjKi7J+HlHUmZlMsAtcatVFW+WiOMkRWRlGFlstdVmVIaQPEsqgzKW4Vq
	4TsWT/21soXVTmxtFIGVYfewiD8hempin/Tw5ucpw9F3t640C2cjfM/Chf7lKN5VzylMHOVxSJv
	n2o8j4UUi60vF/I3Kl0SLgDPEL+12rNy7DLNAVikL5oCab7p6XfQhsjoO5sh8976aXzMAFRUUaj
	2z/Im4TQRL1wHvCcVw1d1P6RiGQaXFg04UgYG2dS6A231r0mcMIsxxQ==
X-Received: by 2002:a05:600c:6090:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb67528699mr109312925e9.8.1794814538034;
        Sun, 15 Nov 2026 23:35:38 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/24] python3-humanize: Upgrade 4.16.0 -> 4.17.0
Date: Mon, 16 Nov 2026 09:35:12 +0200
Message-ID: <20261116073532.880420-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132433
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.17.0:

Added:

- Add Sinhala (si_LK) locale
- Add support for Python 3.16

Changed:

- Drop support for EOL Python 3.10
- Omit .po line numbers to prevent churn when code shifts
- Defer importing math in filesize.py

Fixed:

- Correct clamp annotations for callable formatters and None
- Complete missing Simplified Chinese translations
- Correct Chinese quadrillion translations
- Fix untranslated filesize units and compile catalogs in tox
- Fix OverflowError in naturaltime/precisedelta for far-future
  dates
- Use "sonra" for future times in Turkish
- Use Turkish numeric separators
- Fix Persian future-time wording and locale metadata
- Translate byte-size labels into Persian
- Complete and fix the Bengali (bn_BD) translation
- Fix naturaldelta truncating years instead of rounding
- Fix intword() rounding carry for very large numbers
- Fix naturaldelta doctest
- Support general iterables in natural_list
- Fix translation loss during catalog updates
- Fix metric() showing an extra significant digit on rounding carry
- Fix intcomma overflow for large Python integers
- Remove the leftover format placeholder from intword units
- Use a comma as the fr_FR decimal separator
- Return non-finite floats unchanged from naturaldelta
- Fix fractional() emitting degenerate output when the fraction
  rounds to a whole

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_4.16.0.bb => python3-humanize_4.17.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.16.0.bb => python3-humanize_4.17.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.17.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.17.0.bb
index faed62db8d..9d3d51ce8c 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.17.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "7dc2244a2f84a4bfb1d36c37bac80cd78e35cdc5c119206d87b018e1445f3a3f"
+SRC_URI[sha256sum] = "1d6a36c453dbfbb3f0b34601d2e0b4ce5d48d780305cd45714843f0068fde6ac"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

