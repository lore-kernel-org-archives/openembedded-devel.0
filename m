Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22049.1794808961135607730
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NLfEkH/0;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so1043838c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808960; x=1795413760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8r6YA8kDqbtpWdu1YfiFD/GEi6d/Z0D7Gd3jMwlbvc=;
        b=NLfEkH/0Gv7UEAdjZB5Rj6ECxevM7ox17c3gCr/Z1YRNT632FYrU7Almk3B3Y92FWs
         9mIVyclMyTN4COIG2SvDL+KzbELaUmwTJ4jpg2KUjfUFLda3e5qfF9ikwQHpApnHzKyg
         vH/LyL3+lK7LOjkBcs3lArXw2KtQauC+EHNS+6f64tPaVCuNiJjwMneMSVoYaIIoxqhF
         PiMohtcs6lKqujiQ/UvGxUq/qlSUqvTPGrUY5JtETNzlMDCcEIqxvFoIUQJC1SZN0ct/
         MBQ+A8px8y9frK+hrj9XrVkErAv1uWIQErr8IO99+hgatXzCXLYHylL18iuOXh7SkoM8
         pTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808960; x=1795413760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8r6YA8kDqbtpWdu1YfiFD/GEi6d/Z0D7Gd3jMwlbvc=;
        b=Z62gFhvlesn061PTy5CGJz3fCuPLNdipJXDTPwak3HI9NVjxchCrRbttxHvCI66hW/
         QtvM47IkEkCZolz0UuEzISJGqSz0qZAo1Sm/1yl7U8dAfwNzPflgKy/UpJ0JRzC+neGU
         MhuGvJlZR8hEv3GvKHNZqJ9ETHNGDxXoH3U/KLvJ+M/ZiB06cDGDpgkF8aDBmRAY3smg
         s65YV6L/fFDhFEonLr0HLvgH3fAMriKEj9aWOONiR9+R/Au6PPNxkJtSZp6+/k2htR3l
         R3W9LN3cIoFRnEKOFaWw5zntVyrzW/KyFwXuf0gLz8Se5A4tgSaj4obaqI2/3KAKD1/5
         JCpA==
X-Gm-Message-State: APuU4Z/wvmLNQlqpQP+7mYHBmrwvEDStCVPYYp6fjhipwcJlbkY91r2f
	jI6DCoOplbhsb8zWH3IcryPNyovf+3etzWhvKFA4CMROpUcaxkvBzFV49PQgovVw
X-Gm-Gg: AYBFou34D5viBLg4Q1bSxrtVz6PDga2Sa9Dru1/yTUN3xWj/KolcVLNS8v1jSHGEX3B
	+EFeIdpgWEMR4GmmL+uGSGzuvYNiz4laoLUVFvwKNKVp6nbqKTpzovfDphg+Lx8SbLRHlQvF9v9
	s/l4FpTCYkLOrcFe1EhSImHhBRbtsqeW76jQ8Ptk/6iOSXoma9msE2DnQcapuDz9pp/vpct7WEm
	O3w5LeUZxFEXzCfBFUTc+qA0SH1ebtQzVDEIOY+YwoBh0Pl69z63ngm+sxE2bPp4f2bt3NjK+bf
	UUpd3MkD9EcNjovuBzU2l/oasU1NCfZkVKtn/t2Aif8wF+Lb4aXlXNmpQ0KFZ+pTEtPXQzY4qAO
	2N7YpwmXJX4+BEiDLFD0Gx4nOwtkg1WzWpHzodyDcmM4pgw5X9ndKPm/vsN6s5QjESQLHQbUALT
	HCM/b7WO1bbSRDwEIOOXZUlItDy2C0NG8+NRVQ5uAu6CBCRdKG2SZtE/TZf8mWpf3YMunxePCIT
	XyZulA7gEb4xhtngdmc2Q3Co4FrjQnPEL1byfXFejNHSwva8r6rkJiJh1xhnklA3EKlOh4DTMbW
	egmZnVKNEUL11gEpLig+iQQ68fO+hGKRhQINWAki8H+Z70PhfKe9c8fVjyffw76Kas0XPaUIlVb
	KdHwnzlaiM/rxxfFnr7sCGO8gQfhOqbtYBDyAFhM3olIglB0omPwvTmaheNRf5FMWXSweANNfwJ
	xPEvjFI6dQ6uQctAtxL74CosDheGmLRn0O3TMxmgpmit0M/pGjSJP6tD69DFfPBEjwFkZyL/sev
	8SyVSbe9ocaCueBYbdcGR27Cc1q+/tkK8fWjfl/5QhTrvsxS2KNFPwKB/7vls4OgdzKflq7wFk+
	g9lG
X-Received: by 2002:a05:693c:8312:b0:374:ea35:9069 with SMTP id 5a478bee46e88-379681cdd7amr8737204eec.39.1794808960435;
        Sun, 15 Nov 2026 22:02:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 25/30] libxfce4windowing: upgrade 4.20.6 -> 4.20.7
Date: Sun, 15 Nov 2026 22:02:03 -0800
Message-ID: <20261116060209.2916444-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132423
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{libxfce4windowing_4.20.6.bb => libxfce4windowing_4.20.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4windowing/{libxfce4windowing_4.20.6.bb => libxfce4windowing_4.20.7.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.7.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb
rename to meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.7.bb
index 615367a684..2eddc57c00 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
 DEPENDS = "xfce4-dev-tools-native glib-2.0 gtk+3"

 XFCEBASEBUILDCLASS = "meson"
-SRC_URI[sha256sum] = "2d06b6a567c965afbca1a51419fc728fd83bd0460e30ab62c34564d5e0aac9e3"
+SRC_URI[sha256sum] = "01320b279648ab5b13263f8d260bc5958be599e1eaac77c4503598dfcf96c8bb"

 inherit features_check gobject-introspection gtk-doc xfce vala gettext

