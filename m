Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9889CF54AD9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 16:26:52 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1584.1774369607926807487
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 09:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T9Z+aYlm;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12776bebe9fso922629c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369607; x=1774974407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5oMR87G4yQzBaYntGuWJFxy2YzGzA7HblLPS0cNxyY=;
        b=T9Z+aYlm39FglqnfYouKvZBgyxFUuBtDKrAWfbz9Clu23CwBrCRzXzRV7pV0p41YNz
         YuxIb4oeEfqAmhwDrRvbNpWxUCiV+kBw5+a6wvRtyuO0UYjwhIePviJ9KgXdlG355TKi
         sPInISIxiaN/W/3X56gUmoiqWRe4dg5msUq+ew+E2Pv8KifLHWgKwec3fzmHD9zI68Dx
         luk/wF5wthNEbUkiBp4fCcHbiRHaeknl98yMZ1R2ZlYhdROcrmqJoj9s+On2ySgWNXm/
         BUnpRLsNaVizB5wgdm0BrWhBjlQp4PoCajdT12zMWmpu0v/26o5uKyLxMkROf9qrbreB
         80rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369607; x=1774974407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5oMR87G4yQzBaYntGuWJFxy2YzGzA7HblLPS0cNxyY=;
        b=NDt5RHjj6fJlfFpAtpS2R7sz5hhX8rqvVVy+phkgdKQ0tTC6XQn/fJdafivJSbVm/z
         7jxoBUrkPzSH2GYyb4SH3d3eVFDnsdeoE3T28uiUeG6fX4jb0NvGapEhDRVFlgXIDgfx
         reZtDVewCZVUiXqMEln+1xPcv8eyKSc2TuJpg8iLw78DU84nckp0oXuxTAfhWPM+So2L
         T9mU3Cy1en7gy2HkMMfIwngmchvYs4iAlIGEksBDxg+mKlD+3RzxUDUyIkGjpfzwAXRO
         ia5XHeMi3IH0didPdXCnu9xExLG/Ugq1NeFCU1zUw0HOaTAUQwEW/Ex7IpamHFtr9RU2
         0Dzg==
X-Gm-Message-State: AOJu0Yzui6IJPQVGEu/a9FE21J1HYCzgK2NS/AFs+cfYMevqZ1FoM3IA
	dNPripSFGXyblWRcbmeV/RH4YAWw0p1B6tKHIOm21dieRbo7tY0H4dClHmJpL86D
X-Gm-Gg: ATEYQzxIsDzO/ghsX/sxlKzKezwOmojp0QSt94WtPQgJJiAWY5NHInL42UC1LBlTq+W
	dIQ9NBvQow24tM81iGx00Zf380jTEk4eXUrrR5WDn/JEj30rsUUn06w6+JSEs9WOnxBQhCKBkdi
	AbqndlN57e2HYbtsOv9cv5faIY4/DjMcmzRYoloQKFbAqLU0rfo0axSN9/AMIbhPjjo8lw/Utoj
	k0lsjQ+JhQbK3W1dANZ+QnnuPBOG77a3GNfRK5zavFjTJwLjYDG1aJ5JwzIlZ53Vrqc1ztJMOzO
	8wkLSS+aXB9eXfQEX1kfHsWi0pFHOQ3EPulhg721LK8pVa3Jnx1Zxcokli0cEUm/2DZgS9DBTVW
	gbvttziJDhYltOrnwStjTOmNeAhNdXl4Hv+Wyr0RVyYHieXAk5nM13adQH/uliFd+b6yg6j5lUa
	2m3Spv2ZbFFwEQSPNnI/5vAfJJyHUjFsrTXxQXET1E7nmDieKmnYKHT8HPX6d9HmBrTtsj5fjay
	VpPlQ/FKkF1/WYxLMSP9WWJIIc7UiJFdfviLAi3ZyptQunCyCQRdUHp+n3LLf/5NGA5T30=
X-Received: by 2002:a05:7022:4387:b0:128:d107:da0f with SMTP id a92af1059eb24-12a96e5405cmr113857c88.10.1774369606797;
        Tue, 24 Mar 2026 09:26:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b49afsm12215032c88.2.2026.03.24.09.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:26:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] canopenterm: Upgrade to 1.0.14
Date: Tue, 24 Mar 2026 09:26:43 -0700
Message-ID: <20260324162643.1960073-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 16:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125579

From: Khem Raj <raj.khem@gmail.com>

License-Update: Changed Copyright years [1]
Changes [2]

[1] https://github.com/CANopenTerm/CANopenTerm/commit/e4062f675908c4d238817364c492ac4f0b52af30
[2] https://github.com/CANopenTerm/CANopenTerm/releases/tag/v1.0.14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{canopenterm_1.0.13.bb => canopenterm_1.0.14.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.13.bb => canopenterm_1.0.14.bb} (84%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
similarity index 84%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
index a81ed30f72..ed59c7d8cd 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
@@ -11,14 +11,13 @@ HOMEPAGE = "https://canopenterm.de"
 BUGTRACKER = "https://github.com/CANopenTerm/CANopenTerm/issues"

 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5f8a62fabd50ce3f1d7794bc849ae7a5"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bd2edc721b4a0289efe949bdbe7dda79"

 DEPENDS = "cjson libinih libsdl3 lua libsocketcan pocketpy"

-SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main"
-
-SRCREV  = "b0555360e5e8b444a2a9e14088fd253412184eb8"
+SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main;tag=v${PV}"

+SRCREV  = "012e48af26b483ead9df1004cfc92e6908b66b24"

 inherit cmake ptest


