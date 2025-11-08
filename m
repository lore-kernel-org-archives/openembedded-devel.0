Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782AFCCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 15:08:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7315.1762614517717345502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUlKxYiR;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1261050f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762614516; x=1763219316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47D29eIpHWbQF8aNCr5rckEINfihJa3ynLGeChp+k68=;
        b=NUlKxYiRG/bjefWtZrAWBuig+vMXghkQBSTjlcsPAqFzYs/tgynNwmVLOtOCcilMQ/
         iEwr9IgycMdQRt4+Cg8wehTGjW7elkv4Wu0thvZwmRXLwC1NeAEXgpc5RWt909+D9hXE
         uug4SvOJFQsSSw23/1jz07L6JT8bwoeVS+HB7mFVTuhe0Tr4M80GtZdL9e87l9oRgEaa
         /9qaqNdT3DvXvhubWM3VJjXVAElOC+/F7HrPONtun8sz4FnVu7bPMdT4noysxwcCoT/V
         7hPoVbiv3oFAX6UQ5AGi2LmM/uTPZEAWw///8eBuNDhoAm9i23nA0heur/esIzP1A4H2
         a1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762614516; x=1763219316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47D29eIpHWbQF8aNCr5rckEINfihJa3ynLGeChp+k68=;
        b=EbnwESLa4RfE/8coh5Ekn3FUTlRm2UWTFRd1ayBP069cZrRN1AnnbMXqdldf3aeWVI
         zfixaObZPt+HiFkQId6RclwZ6qi95TJ84MslGr/F4mho3yHT1i14MdLM3lEMy+926V1d
         e25gxAL4hQXEjE0+BbMEjw9SFWDmSsxnELNtKy4oysufVpvmVm4EGewhG+HnV6SK5aFt
         iurGE3Bw2Fbgwf4A/ozfT5e0cDZo2k1Mx3gv5p/r7GnPYQSx8frdVQm6zs1395ZIza1q
         x3mliCD1R7QCQPTZZATo1JzPxKXQW9QI1FDpN3F0n2NnKDQ1nE3XBgMogj617Pe4wQSl
         XYgg==
X-Gm-Message-State: AOJu0Yw+Sp9MrTFzxl9sIbbkIIlgU2aGm4xi2JbIERK9E3drc7GiO9C6
	Tg7Ca6CHqeqIftyqWw0LTXFyIcAJVFzQVoR+3occ7aYP1nRchHHfkzO0BoMrXh18
X-Gm-Gg: ASbGncvg/NQiKSI6gqBRNUwMM6vL8wlFEbrss/KkcI7Icigz83GutD7Edo3NZVAl/4s
	0HmG5r5X5OOgL+xpZxs/LLARCo/mubiGr09GRp6jm4vbIpHeXgHL8YuI8/fdULrSFOuugj74WHh
	V200nPAtdb6mzWuiTdKbgenChixkUF5ti89OEJW64qcARHOFzraF15hEqkqqaW4JQiYju/ILgki
	N6K+M6dKosJCaAfLlhW3DF0I4sKrS2wATN0GNgire/bxpAmW8PoShdHhOXVO1A/KsUjNgcbJ1AZ
	0w5gbQ67eKc7R6SBUqkHsHFKGRs1g8YGeLvH7raZTDSZ2mfeloBWypV0LTLyrMrLSrIsh88OXAB
	E12nyT1HasZPKioEellmSNpjOrIH441EjojoZGqWfrMEGLqKuQjoe/GT/6xhMrDzrBI8cFWGU7+
	kSmVGgv4/w
X-Google-Smtp-Source: AGHT+IHfd6ZPbp/NmcWN4SHqJFWzGOzuybB+r75F02/hWKMku4WUMSFnC2xMDf/qjcH5AgNdSAjcpg==
X-Received: by 2002:a05:6000:4028:b0:42b:3272:c4d6 with SMTP id ffacd0b85a97d-42b3272cb6fmr314697f8f.34.1762614515999;
        Sat, 08 Nov 2025 07:08:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm11869284f8f.19.2025.11.08.07.08.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 07:08:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] pyxdg: update to latest revision
Date: Sat,  8 Nov 2025 16:08:31 +0100
Message-ID: <20251108150833.3299165-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108150833.3299165-1-skandigraun@gmail.com>
References: <20251108150833.3299165-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121396

It is only 3 extra commits over the previous recipe, but it
fixes 3 Python deprecations.

While here, also fix the SRC_URI - the original repository is not available
anymore, as it was moved to a freedesktop gitlab instance.

Shortlog:
Replace imp with importlib to support Python 3.12
Menu: handle Python 3.14 ast.Str changes
Menu: handle Python 3.15 deprecations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
index b4dc739ec3..4e2af67e98 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
@@ -4,8 +4,10 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-SRCREV = "1d23e483ae869ee9532aca43b133cc43f63626a3"
-SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg;branch=master"
+PV .= "+git"
+
+SRCREV = "63033ac306aa26d32e1439417e59ae8f8a4c9820"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/pyxdg.git;branch=master;protocol=https"
 
 inherit setuptools3
 

