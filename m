Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32763.1793879738471232676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uT4/dJZ6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20158585e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879737; x=1794484537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8/5WE1DA0C6xTQs8xC7GXGf7HyeOL2UZp4kd8uy1Ew=;
        b=uT4/dJZ6wsrXxB52q3ENgS4CiW3+44KONVb29HT2z5lQceAfV+hZk26xR5YxOpxzLB
         0AfEsFIO1lN5Ns4G3T45Ec4uhigt+2UYQS/dDYmzDsHNjJuWGFroxWU/HwErhbU1shsi
         pOrIqJloEbWQXLn0SGXX7hAteAbPGCcPdoLNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879737; x=1794484537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8/5WE1DA0C6xTQs8xC7GXGf7HyeOL2UZp4kd8uy1Ew=;
        b=xc9Oz5/4PaC6HKLt8F+V80vRX3Z6L941j1ZJ8uJbB3vnLlU9zy3fzg+NSaxj9loiMf
         qzeWb1C9xX2alVR1WY+545PrrWk4SCpX6INOVWOPQ0eYADu7DEMngfNAQvpjKzi32Mtg
         Aj40bH/DuQmjwSaQw4w3E8iDQih/zWU8q3Qaaj20ber07nmHec0dr/NKcsS2pbcSbmnL
         NB65rxqWBweBxzMmJxX2qKsutAikW/LNeam+QKwgGla6Ks1Kwfdpyra4XuOCXhWUsbMN
         l1Sb6aOOubDxrXnPXT3RI8iDa+VvaPCGzkqeyO9q9qCKHf68S7qjLnbYl09dTWmR5Wiq
         vgZw==
X-Gm-Message-State: APuU4Z9XXXfX14/JqxxDHDpb7kOymldnpa32nIqb1VZ06AbbdpFr9tSr
	ogzeqWtWCAQQqsHMVG4ShVPkvdWtnugjq6CtBvgFe78qaE36ppzUKTkjBSngRlh03NU338OsYFA
	E7H7u
X-Gm-Gg: AYBFou3b8S4EF63Ac4N9/ajbUjZOtwz6xptuypTkFSsaxr2cdqVUEHX0IhbCJL11fYa
	BGs+quz8BnVA/T/7pVoza59qsMp+Fil/r8q0UPiuclgMgBkx02qksPxWC3UTwQYFJKv18KZrO2k
	FMvG+HSrRIpgPcrK4HIEacjz2JfAWBW8Vp/0MUkwNtgszos0M+0vifgmRS5CUaYvoUE29b+Y7sD
	xKX1+Wu3zndhLDMfgYo2OxPQF314D8MLXwgT1wWhjP/wViP/7UTqt/tl3ovlne9gHE3VcK37B0J
	6sGR0HRnhNo9nytPiqzG+ay82YzooILjrLIp+4ZiZDj41E/cuK+c+fqFVbtAzp5PcS3qYUotLGo
	wmRyR5e6a08hcWLk34cXruZ5qWKCcJ2mRivhOCQhWl6eygZhmXLM1S/FvASLGk69qwY0uUXjTG+
	uwpQDe1TABmr6p4cH/W2+5uUCT/f9KhphJwj1NJtGZA9Vx+BZ9FgobHCvJRBjepoj6Skigp2iNv
	X1pSmNj4L0y6vCQPIdgGIw3rOQ1nxmFYTiz9IM54N9V6KHAV6WOkf0rOuaDlkYQ9EsVK7HwBL1i
	7CL7XUOoKb/6juDeFyi/eiTkLZMySrw374gC0HS6Q7hGhgFAZSeBDrKOdqxWgO69YGzm2zjOMIM
	1XYt59g/HEZb+duaCaDSBIjNcna78KGTDlFocIaOoVQdzXaXYu/EonQ==
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr421337875e9.31.1793879736800;
        Thu, 05 Nov 2026 03:55:36 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/19] python3-aiohue: Upgrade 4.9.0 -> 4.9.1
Date: Thu,  5 Nov 2026 13:55:16 +0200
Message-ID: <20261105115526.634289-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131909
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.9.1:

- Add gradient points to LightsController.set_state

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_4.9.0.bb => python3-aiohue_4.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.9.0.bb => python3-aiohue_4.9.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb
index 19612797a5..ac4892e120 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.9.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "c1c5edf114266f6b5878ffccf82db8b326141cc3d8c3697f5fc3aa87a4d3747e"
+SRC_URI[sha256sum] = "c56c22e046e3055e9e71b45db82692c1b8676ab561d4f8f82b8df0771fa744d5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

