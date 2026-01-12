Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57B8D2502F
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:00 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27577.1768196098829549446
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gt5Bv5C4;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c75a5cb752so4581145a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196098; x=1768800898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ldtVlXpKt6Qa8MLzxJTD4BdbwZYzgP7CPV/sAcLzdQ=;
        b=gt5Bv5C4rF02YmToJADEqoaUvID8Ii6CXS2CV/DvVVYdP65ybKkzl7yDSC61VNsgMn
         UHO/Mii4EuORqzbU0bpl6erh2OHAHgfImT/p4jwEttbEobaEHIFx1duY7D1Sv9f0ybYz
         wtO4ZeMLe8J2B8QMqqB1VhGgvI0WgpeRtjbIUDghMUqj6e/WTW/HHnZGtOj4ifrA9zQ9
         szL4d9/OvwRCIcOpJz+dMCbZGxnjbIUTqEUimlzQZYImLOp79iQUXmvwSdQs77DCUnI7
         kIXp7Evmhs6U/5vuW81eKFzupQAsIRjyOHVoY2oGFCaCeuls3Q2PMBVogAJIXnFmRkXD
         +BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196098; x=1768800898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ldtVlXpKt6Qa8MLzxJTD4BdbwZYzgP7CPV/sAcLzdQ=;
        b=TS1VrZRp7BbsU0W6k2IjlgrrLSUGCeGvoGPrw38lk0swrm8IJl58YtpCRNYAI2DSc+
         GCgVu5aDKhky/t9x4qBKnlUNzAJ/VamqJb//JUXgysAQLuL7Hkvlu0MXfMvNBKT8ofi2
         j7RcniQ8cYimUSg6MSh5PNRflN1VAsSN2+hHN/Ji9PPnWTvTcWzKvYmLzJS0WIpDwPiS
         DNGfooq5zM2UKnR9PUAO5F8theqIEIaTFcdaQkKij1styd9hT7QQqJ5dYy8YFd9zlP6B
         chw/kx6SiNVuLYJBj6g4ueb9VTK/0hBxFv1Y8t4MKMAzhWk0M2wSm7LA6gKR+vRtTgf9
         A04Q==
X-Gm-Message-State: AOJu0Yyjo9VoQleRoIUlNgs0U+dwL/pFbL8U5iA7m2l3rxiY69/dFLI0
	vfCyB8c/VHFW1kk3tHOkQLzycpZtwhyNi+y95oO9QD1/rymVRWGZCN34E337fA==
X-Gm-Gg: AY/fxX5AtjsnzBTHkUeyCxzSNso1MQyxqcQmGI5b3REuOK+l4GASUgKE9z2mnOngWuZ
	06poYZ0RjMI3ePgW+kQlk5XaYKvH2qO+9ZQpieWgobLbwoTA9C/U0tDX1j1rpqp6Bzy0Q8qWp6t
	hZa5Afro+LDYshYm2lg6QKK9gGefN3HFljKoTuAPR5KNoHlnTuadrswKM5ULKKbstWh3U2Qzk8/
	7t35rFg343rBONDsQ/KexJtkROWO2VHpBka26q/3fsq3dV8Ip4YpE415yBXqEn5sAXRPQp8O8tc
	A1mi2zf++0huIGDbfWnCHT0rMsdo/lLqS33VPu0CkJ8azhbk9LuHL1YNkp1lrGuQluFHLdWMddx
	J1MFEwcgm8BV68DFMmngZ4Bwxl5FQ5O0RMJVNty4bq02VZw/9r6SjSVIBJFj648tU21UJkAKbd9
	/EhXSapZOGmfSNJyDQ31NjkXI=
X-Google-Smtp-Source: AGHT+IEnY/zeYlvF+itanP5D0cKn0PEtRvcE5M1EgE56QuZc3MM/p3CFECNL/UtPsV/jMTCEdPlMkQ==
X-Received: by 2002:a05:6830:34a8:b0:7ce:519d:10bd with SMTP id 46e09a7af769-7ce519d1565mr10614389a34.6.1768196097805;
        Sun, 11 Jan 2026 21:34:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 5/6] gimp: ignore CVE-2025-48796
Date: Mon, 12 Jan 2026 18:34:39 +1300
Message-ID: <20260112053440.3694238-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
References: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123354

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-48796

The vulnerable function ani_load_image() was added[1] after the current
version of GIMP[2], we can ignore the CVE.

[1] https://gitlab.gnome.org/GNOME/gimp/-/commit/aa51b9e19ece8a8c54a513fe33b6d65abcb0fbfb
[2] https://gitlab.gnome.org/GNOME/gimp/-/commits/GIMP_2_10_38/plug-ins/file-ico/ico-load.c?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 68daac776d..064a797986 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -75,3 +75,4 @@ FILES:${PN}  += "${datadir}/metainfo"
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
+CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
\ No newline at end of file

