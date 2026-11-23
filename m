Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48070.1795411910546930964
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T4K//Ly6;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so8135009eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411910; x=1796016710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAx7xgKpLL72Mvp3s6oClsabXi3IGozXEJOEcXVokxM=;
        b=T4K//Ly6UY/dj+TtwjRnDZzvGnlSHKhaRacYS57713qyic/8ytxF3A8dV43ZD6P4Ex
         +jpGd71F/15xSrIl+p6K2IfvUyOavlQcqJlXH0dCLfdeiQ/jG3f/39Vgi1vXHGxWICCq
         MZdjv7YcIOTm9KqK/R3W0/PV0ZA70WXYmUx+TfyIF9I+zVaK2r8VeLhsMp8YpCPmAjbb
         LTsvaVb/uR389hUmWxxN+KOWl+nv3mVl3pPn5iKDW6Xg5qm7Fyiz3AUINnZy2KkJQLFb
         CsaUpW9bvgkOXoNLGMpdPnCKgmUc6s0OjiJoA9QgR3vEcuoTn1nFv6REjv9cjyldmoD0
         3D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411910; x=1796016710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAx7xgKpLL72Mvp3s6oClsabXi3IGozXEJOEcXVokxM=;
        b=H3FNKaKpyCUbcGDjI112u86WFCzADzzhGh8TyexCOeJgEiHwy2c0I3bCJVP64kHZeD
         +rUJYIDQhqTKTN4eJOBoN4bTqjL2ZS0PRvOyDZERghvh0ba4uZ8S9IpggCw32p/6Ay+v
         85UP3yyT+GknQkOrH02NwAp4xBS07scDHw2ISczjWLUZIZtbNO85M+dShqhFfN5zX4iM
         whRs4AoC6iJbpc2cZMu5YPs6lfSVwEx2anSXzWW/gEO9I8v+KFpZzp0zCanLZYBjtNpf
         nWP1yPhlmKXU0iIhXRbkEOyRZJl+sXtpt/qM9bAGbKavA5EDR8ig6R3pP7gA9/D/Nvdp
         2flA==
X-Gm-Message-State: APuU4Z+Z1xrbKUhxvFEiUU+EkREd3ABWvDI/Z4PLhneASsI2TurIx7fS
	EEk9rsdSZtxTIdXZ3ggcR4rCcXO4t9gapcO4kSccj7Z1Y77Sb5B4wuESusFBpSO8Pcs=
X-Gm-Gg: AZFdTZd53AzKoaDuODG/uqzD5vnGPXrB14Z7FqVw3y5WVtATZB7hcx8WhrAViOKxNsK
	MSwk3c/wPru6xeG0lkVA4LYelOHMJToheTbUDC6aaLybEMCg/syDVIS0CLI9GgDNJX80bdt/hRL
	Nyj1q8vWT1x5Fz9tfHABhyHbjB+6L+DzDmG97yoQrl3yvMHGuSb7pYw8K/pNiX0jGwg7tj+Dn0X
	20+G1CX9hw43R2rPMDC7wEJaXtJQsQdvOmZQ6gbubL+8bnAHoYzKsIU1K6IF8roeiinYv3MsR5F
	J/KweUvUme0Jbc3ch+NSyIXFmGO/J97iLiPX2tj12q4sBC2SiQouKpK/05iuqqZnmgZcS2/B4MB
	a7mEb8vQoYj7EZmFj1UamjrtlrMuQGRLXJs4Pz09zXKRD4+SCuMBmkJo+Dsc50AIXGGefC4n5Y7
	twA+Nx8XVFFtsIQo6TDByh+DnoQj8Wi6iDzutlLiEj+P7xNTIOOtkRKyFJ4kpHVvvhorlhkQzaY
	aSZks0I8WMNhNF/7Z+DoM4kY97zjoGw25SLJ12KIKkxhvLwcZsM4vyqOpS2aVZkhNCnEGvKFSzn
	FsQKfxTbDjXE9G4bIAMMc/X+XLLL1oGNKwcnShuadcFJW5b+LdQ+v6O45As0TJVVuXGykAKTvAP
	Eu4SEmiwkw4s5mjYPvFJuNOgl+Nhp+JMbLttFx56TCRD+7coUQdYJy3ODUYH46XKo0lzKbqoWhE
	0rxKbt+zjFk3gzZUiAKYCb0sWk0dMcFp+UbpgH8w1uSxlmKLESWqjlTTqJx5Y6lFSOfkKglAu3I
	GTsUNt8xyWrtd22Qp1q8JYKbx33NrgcfJC3Pe6jOuuXS28Wvfh90vBUhB+kvSi1fq7vQWrUf9zz
	J+Pf
X-Received: by 2002:a05:7300:2290:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3856925c033mr12077868eec.0.1795411909799;
        Sun, 22 Nov 2026 21:31:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 2/3] swagger-ui: upgrade 5.35.0 -> 5.35.1
Date: Sun, 22 Nov 2026 21:29:49 -0800
Message-ID: <20261123052953.3658549-93-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132880
Content-Type: text/plain; charset="utf-8"

Bug fix release: bumps the Docker nginx base image to 1.31.9-alpine.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../swagger-ui/{swagger-ui_5.35.0.bb => swagger-ui_5.35.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.35.0.bb => swagger-ui_5.35.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb
index df5c8a602c..08158e0b20 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.35.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "bc207af2a9c79d33f8af1899555f3e4ec67fbf89"
+SRCREV = "8fd7a7d57514e63e3601b4c61f3cdbafe605af02"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
