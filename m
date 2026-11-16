Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17654.1794787853800081299
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I/ozTW5T;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso1336142c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787853; x=1795392653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8D/Y65Sas7Vp9asO5kma+razKwYBLfKTGg6pv76qJRU=;
        b=I/ozTW5T8qft8xO9+0FDQBYd2vOpxmCXxDqTNVPMJh2Pi4TrqF12OW7utjyRwrG0X8
         aVAQJFPOhl7fjpYrmtUPwwINY1zNVTqf26M1leZgBBpFE32AesCAtgXBKRxUjpNHAAqI
         qXHjv9kJnF7kqtaoSc2VEKBfmFL2sgiEREIEZpGRJ9y6z+g/xWy2pzdosaHTBQn49cGO
         2sL+TG4njwhe552Mt7AEiDd7Ca2Sz5sAMg/+Z6/h0Vvcxk+OmpKqAwbiKcjDbVxCVDVg
         y5vDBK2qliM7hQqIFMlvQczJcQ1t4IxvwAupops8BQr9Jao1LbpWYcHH6VfAjsGbVfUL
         OGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787853; x=1795392653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8D/Y65Sas7Vp9asO5kma+razKwYBLfKTGg6pv76qJRU=;
        b=HaYYfsZ9mfB1VgEsCS4K9hxP/79UkLoa9JjCLLcmW64keuxPen2zDV04oiV5WfKoOk
         5ku7svqmDdItjwn3IccIzSnAnklu7Gt8WI7TJOWqDsaIbEMkDEfAHqGbC9InUrlyjslg
         URGLG4shFpesNhEP02DWstnx+9GozvBsJVUmIn/c6I3e03Q5xB73GP4QaxlTKaRuQuW5
         ZIi66EC0sM39LrjSEKaD8Yw81+Gi5BU0Y84PQQY9VlCwME9v/+DMTjiJlOYTwcNq8vZx
         oJjI0w2E9gr4nP4GL6pfB+ArTyEO1EfuYURfKqy1EJMsdMt94JYT/nxf3lUaWDNL09p0
         swUA==
X-Gm-Message-State: APuU4Z/XTmBzFa6p9E5VDbilTLIy3S7gt7QXolp1tqAmHkKk+IkpEukq
	4sFJCWN2gpFO4kWaIVlac3vvcfp8qUnkYy7Wy6+0pNdmm+U71d6Mq9Ka4EPq2OIZ
X-Gm-Gg: AYBFou0qje1AjhFEizC6GfYax9550sZj40R+XTb1PFIHctU/A5zIDOM4jWH26Xzb3/R
	4E+TrsD2+ckiyhTVtLItek1iGR1xg0sdi4EF6U/M+Z5RfDHnX8x0E+vEkMA4MvZpHvtLIwR277+
	hiQfyw6ExUch0JaSUz1zG/JddEyVX4ITZH9MLVIWsa+rxHJt/Esilgo0WbjwCQC7fb4+EGXAda0
	L5lfatWRA0tJhunmKMvTf7a6rS0hE48jjJ1w0kbRmimNlJ6racskkW14XrnMtWGKis+RDFKaZ8A
	Y7ow4w5+N50KM8EXzUbUs1qVmXW83rR+P8Ak/SHc25cSXoNwHUbhbb2nwEqUzq8YGb2Sx9nuutk
	flVwLMtASHXOmfqIwW20J4L2uUQHnn/xPYGuJYrnikNoiHro3LsAEDCNNxi8ZGD2GpnOXqv5zEY
	UuhExYlS1B69eF50mXlCQPknYzJL7s2g5Df1MkNlqcdIKeyHnBKIa32hlvrj1ocO78ZGAhzZQ6a
	MGscBAqxfUk4yQjtX1L9YlzqvHzoEC8coVKRcTPsjP8UN7an8lo70MoXG5W92tW45R8i4Y+waI4
	NjTpnZFQ+K7/R+8wDunkRestgKiqR4fOKRp0hlHUV8hBWUNbk8FO8tFJPeRyYuNPF1HiCNvfDGi
	ijxOI02ORNxsHybdl2nT6w9W9mgNA7fuN39zxVAwnghFHTm+aKq5EcdhazyyrHQNVL9bXHqg6QE
	rTVO7fG0E+XP7084rJr8GGTFUdeMZxrbjXR0IeuQ3+zqQHlNey3hKgTNKHs9NXqB/dVr80a1D3A
	vAZotbNPPqU8B6QAdZcM33LFA0W3X/P5oeRDsnhMEgt6xBdsT4vhZ+1kviYOqez0aW9kF7g7sdC
	nc0wcQ==
X-Received: by 2002:a05:701b:2616:b0:159:f192:5290 with SMTP id a92af1059eb24-1b4f5f37854mr9778108c88.13.1794787853076;
        Sun, 15 Nov 2026 16:10:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/16] ttf-sazanami: Set RPROVIDES on the font packages
Date: Sun, 15 Nov 2026 16:10:33 -0800
Message-ID: <20261116001038.440763-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132392
Content-Type: text/plain; charset="utf-8"

${PN} is not in PACKAGES, so RPROVIDES:${PN} had no effect.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index a1ffbea79f..fe0ade3d82 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -7,7 +7,8 @@ HOMEPAGE = "http://sourceforge.jp/projects/efont/"
 LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"

-RPROVIDES:${PN} = "virtual-japanese-font"
+RPROVIDES:ttf-sazanami-gothic = "virtual-japanese-font"
+RPROVIDES:ttf-sazanami-mincho = "virtual-japanese-font"

 SRC_URI = "https://src.fedoraproject.org/repo/pkgs/sazanami-fonts/sazanami-20040629.tar.bz2/ceef10579a75c92483171f3bd7f77df2/sazanami-20040629.tar.bz2"
 S = "${UNPACKDIR}/sazanami-20040629"
