Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C175C54F98
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3034.1785293072517738288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NPlZFoO4;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1094051a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293072; x=1785897872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+u1QDAXf4kXqh3nRxe2f0KnNB73ZC9b44l11y6tzfh0=;
        b=NPlZFoO4xIqNujlq4drF3Kh6M+VKs2pW6HWDdGHrRTA92T+7Vw44gFDar1fz+S+bNa
         uoczzINdwRc78x5faBIHiOGV8fLtINxjviSYb/vwlefcAw2ZhtfWTX00VE7bqNjKzAyy
         EzbdCRy96UEtOk06RrtAlHlFomt9XylZTM3s5VWM+yhZJGBoXufAW1Uc/5LgBoiH7/K6
         tBgJLf33ohZSspu/u4niBLIeocImNF0rTH2TW8lfRI0O6TrfsQFKYuABhVfBkl31Ic4r
         Y2aJn3TkW6KawwXjHGdJ4mJIQpjvpzwIWQgnfXN+nX0r3mnSsqeP5CCr3Z/T4a1zEzDV
         IUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293072; x=1785897872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+u1QDAXf4kXqh3nRxe2f0KnNB73ZC9b44l11y6tzfh0=;
        b=Oa/pgnBnuLTsinAsQOAQT8ryTM4EO5fltKpOFDlgxd+Yx+Vr4RLpK4ihSEvXj7gF1N
         Oc1Z9TXBzwdUSRSdgVrlSwdlYSy9CjHQt60qcEelbdESqDPoZA8IRo33DQTYucRGfdFR
         vJDxMBBEv3nkhXddLhfBMmdBqmXikvq8SamT6j8SwJxrJ/fI0iAVE0awtNcoLmxl5eL+
         ZnDuir3AhNIRSc9DKMpKeLrKT0aPo1rT7M+JnHyOR/PfndfJefNbCReiqIoQwPdH2Ptf
         FYus5FkjRvwU+Ua3/J3RDdSOVga+GxXPEzTm/tEARFDDWEbEcJMnO6CHysIGlBMj3wFC
         UJlw==
X-Gm-Message-State: AOJu0YxkrqDyHXw9x8jHZ8EE2j/Q9MD/c/fTzO7VyfCR6Q7FP3hD1h34
	yP35QSyrdWv9Q80UzWv/NjEEMEy+AsdzUHReTFyqF3uUGWjGM8Zs5iMsXUZ6/Vji
X-Gm-Gg: AR+sD12LNaKSxsAL65aR2zf1EaEhgHi4vJhu6IGJbB99qwZHPZvBhiFZbYdkPglo54v
	hq43r/tPb7qO92KpSXJSe1xjnX0sS4uDGj6AzY6ZJnbbyJwoKne7g5meV0PZsPtyg2OIe5C1s8x
	d5TcbkBrLeYY27Z5spKKWzsz559KkIbKO+61f5QMV/m151KRY0eSel0eGDxge7UJk14flYTG2Ft
	8d/TkninM7Fy9Gscn5rLOpEfzXGWDLrWD/uz5GX4aVd1LXuK3sZzx7YfC2ic4DG2pYs2ri4uORz
	u3yhkXo7vhRKtsXm20t9URW5vjULrmkRL0y73NnnzX+9s5F7v/5kUP2v1Zkjr1gUVoGx3CL6BWc
	9kh39LW1dvhlPi1HzHyEbXp56nHKKfSDDwC8ngHUCWjTYVGQsddaKI00MKOgP2Dy0wFqpw1L+sL
	uVoKs78M+bBNy93K7iF0ENcpN7ffgn2PK1QH7OoME9NZFgo9pFPx6IaX/BzWr0yVx4CNUcBs/di
	+MBSbQSbblys8mvgdvnWfxcjfUmbSiZzgWavb4nOExlPcodkBREE4kZMs9VOsk8b1rwu8nvAXY1
	s7VqW4vNzt48W4zN6ljmCH0FErFC/FqoTA6XtiJoTFph3BviDzs9ZX4IPQUAAxOgAUT1RekWubW
	0/g==
X-Received: by 2002:a05:6a21:4cc6:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c8e47b5c37mr582881637.23.1785293071866;
        Tue, 28 Jul 2026 19:44:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/18] cairomm-1.16: upgrade 1.18.1 -> 1.19.1
Date: Tue, 28 Jul 2026 19:44:10 -0700
Message-ID: <20260729024420.2328180-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128524

Changes (spanning the 1.19.0 and 1.19.1 releases):
- Add a Path iterator (Cairo::Path::Element / const_iterator) and matching
  path-iter example.
- Add XCB device and XCB surface APIs, and an Xlib device API.
- Surface gains create_similar_image(), supports_mime_type(), map_to_image()
  and the MappedImageSurface class.
- Add the mesh pattern API.
- 1.19.1: mark Cairo::Path::Element/const_iterator for export in the Windows
  build, fix a memory leak in Context::pop_group(), plus build/doc fixes.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cairo/{cairomm-1.16_1.18.1.bb => cairomm-1.16_1.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm-1.16_1.18.1.bb => cairomm-1.16_1.19.1.bb} (81%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.19.1.bb
similarity index 81%
rename from meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
rename to meta-oe/recipes-graphics/cairo/cairomm-1.16_1.19.1.bb
index 371e085b0c..15a2d0fc40 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.19.1.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-3"
 
 SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e0e996a979ee52c840dca3ee74f5d005e3259b94ddce58f255d3b6f47c8cb41d"
+SRC_URI[sha256sum] = "06881a0167d84962c74db318427c5be663d30b8ea5c60740a9dc36a9c1961b54"
 
 S = "${UNPACKDIR}/cairomm-${PV}"
 

