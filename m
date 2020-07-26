Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
 by mx.groups.io with SMTP id smtpd.web10.24633.1595747632835626596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 00:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=JxgRm+L6;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.74, mailfrom: 3ly0dxwmkapw0eoksskpi.gsq@flex--wak.bounces.google.com)
Received: by mail-qv1-f74.google.com with SMTP id v20so9002208qvt.15
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=68dPgwJIWC3pXCKHoKJIQv77THd0WIInfHe65I4zGOE=;
        b=JxgRm+L6M8piQG9S4seHrgHj1ONxcglABoy07itL4RMA456NImMUQEJW1/b78G6kZ2
         vdc7Eh7xmd/87Ljsp0KN3m/WJwA+q+xQy3bqcrXZygD/UBzj/DA1WEadaIiYye/FHpWe
         yJyov3bZ9gajpm36WbORMcJuLdn4RVGwiH5IJKGpkUQICsfAZUi9JkwKsesANeqlfeOB
         I2BdRkpE71DAE4kyLgljnO2oDL4gYM3wOZFRzA8d1A4ovkTnrNAkPmt8ZxLCPvkTkPu4
         w7k+ydwqHLUfWiNpkHpMmMcIgIyb4ks4w9joEdNurS0SdUZ3gLCMsi2s1yX9+dQID+Vt
         TOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=68dPgwJIWC3pXCKHoKJIQv77THd0WIInfHe65I4zGOE=;
        b=A+rkg+R2sHJtypw7Pfn01iBTTByRUVOIE42CXeThk9Rbpn9+iJZwRWclDNsGGNJ/5X
         iwAD6edzkNtFPBKXuD9nP60R54my8ridATEF7j6Pk+6b6aBEYkK1RnKt711/+Pn4qDsD
         ydSAvi+G3gnAFjHuBTag9OQwNdjIP6eqbvapx4HwXnzXydFaBol7eFYI5DhXKtB5zegn
         rLF83gdQDbTKYppSc1VMzjCj05AOVLl50jm7YcFnOr3zr4ust9T2IGee51AjC1lLvz+n
         Utsji3gr5Fr4j34AbyDjR2ocg+5Z7ftkhH+w/194jYTWJkY0imh7RxhUNut3XDNhs67U
         iGXQ==
X-Gm-Message-State: AOAM5318rJCQpae49OIWBiBncVX4fHH/ZwQEkA5fsEbeiAV0kRygQtYN
	kFJLN1SB4/40Fzx/cUl0a3oKPd7e4HwZnzyj7gxn60xilk3Z7BQVd6gAxkQ2evfOp1qvZR4oxIN
	fUpAXO2VwSHS+VSgoHBUUQEkHNsCB0iQqZTM2TZmKFHZfGU1hZxMijiaPTiuNVpU/HGcggmRUOM
	oJuFI=
X-Google-Smtp-Source: ABdhPJwMqzteljGf1rw7TZ7Fm5YxxdmycJ71qW7I36BNkFnsvcXZLUMxSB5SHlBIZQf/k5eMrN4bPt8=
X-Received: by 2002:a0c:b520:: with SMTP id d32mr17244549qve.6.1595747631737;
 Sun, 26 Jul 2020 00:13:51 -0700 (PDT)
Date: Sun, 26 Jul 2020 00:13:42 -0700
In-Reply-To: <16253B4F2ECB6422.7401@lists.openembedded.org>
Message-Id: <20200726071342.612126-1-wak@google.com>
Mime-Version: 1.0
References: <16253B4F2ECB6422.7401@lists.openembedded.org>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [meta-oe][PATCH v2] cli11: 1.9.0 -> 1.9.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../recipes-support/cli11/{cli11_1.9.0.bb => cli11_1.9.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.9.0.bb => cli11_1.9.1.bb} (81%)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.0.bb b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
similarity index 81%
rename from meta-oe/recipes-support/cli11/cli11_1.9.0.bb
rename to meta-oe/recipes-support/cli11/cli11_1.9.1.bb
index 151653b22..5f022d78a 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich f
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
-SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
+SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

