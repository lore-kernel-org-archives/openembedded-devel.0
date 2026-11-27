Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11787.1795762943849801060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iF3PFeoI;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so12064927c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762943; x=1796367743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xo+S93qkjW62KdUO8Y7H/Xn4gPfyrvC2lTVmUBL4pE=;
        b=iF3PFeoIufVjAWJOyuixPh+MWHC/h3sODiezugK33/4XVd7Kq6em3dBonTF5neP9QZ
         qH7NdMWJEVy9kiYTL0Oa2GYvflz0Ugiv1WwvAZS4cvkHEnCr9bWTVNHB3OO1G9Hb/Qa6
         hjXCvxXD4DW4d5zLxPU1i3x5m1LoCUI9fSZcCBK4Oik4YwjL24/bFZtW+5eg/7QSU8cA
         /qY+sTD4TTjdL1HZXT9wvQn0q3leetO3dSQUzrtIGuEffTUD9voDdco4MQ464mC8z4to
         FmqMxFu74DKYKdfoPw6abDOziNsycndcTQxXi+J9BxZDlgGEzelBvGTVZYdwxjIdFXdF
         uFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762943; x=1796367743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xo+S93qkjW62KdUO8Y7H/Xn4gPfyrvC2lTVmUBL4pE=;
        b=Gt9utgOFjYR+uUg+yLEEhMgECNQSX5UN8ycVhNDPn6MHE0QsN/muHCDZmo2AR1yALM
         tr7m9COEIcDjp5iicq4IEi+8LHD+2WfjeG9MpyDHthZdpkTb7kq/J1A6Vyb/hB6yuo4h
         USZfr7dDHI4GwWoa8eVsYtglvfDtpQEtIxxKTvOaPB9cbbnyt22oeWluoaOofGJuqAcj
         YDVKPY+GIRIm64nFpZT+BkzykLgNhXIliL9x3SkmKTF0+uqYXjFYg5foZIm9gaa1bXzr
         3M/M5hYMC+2IiTe/4fo8syeWD63RZmBhLPV3MCnSjiABpVqYWOBEN7ceGCpQbBTd9DJO
         4P/w==
X-Gm-Message-State: APuU4Z8gy5/sSayIWV9oaTHgV5xDsul9jnj05WruYlcA+B8xxx9gRa+D
	/5kz9v0yEXsYYLmw80H43CFOb14Zfi0mrAP91twCafnZeViyEv8DUOtrTdOGcFvD
X-Gm-Gg: AZFdTZfgyInE8/EHEsUvert+qqGUkZgC/tS1wo/MNpHGBVOkbtQiyPmLB1cfzxL4E7Y
	d7BEoG01m2T4WMbxOvh0W0LjxbhxHfyUYML9dMF3VzmXpq4vRmJIMqTdNWyMoSLOdrzccbr3juS
	gpjfn+Sun14nLVWu9o8Iu7fGG8tQdpV+iHMDK0KOUXITjijeaTFD8MHpyu+shu5oscXDluZfSA/
	9upFMk4f6SS376zOsL1fDfTRip6iJmP56yKsrc4CIiZicPfB3Lojx5AMRecAhVvy0/cZKNTngZT
	9QMkyRRgMVoO2EhegSJl+8yltVYMi2ls/NB4NKNFY53xWo4QUFmfn3Hv4aLEUrdvXl5f+p4H/5v
	OfpBbKwV302ZVrgMtwd8m8S0/7pJFAl5wcCDsUZx7RSefdDO7U/AGT9Z9m/eT2sWSabkRZS2VeH
	C1GQWzKEOpHhElffhfe2ptNZwRrJo8onxD/jaNB6rPO/VGBi6EUpXtM8zELmazQYWYWNyp6e/hu
	x70uYtDXN2jzLHUP5hlveldEmhztmNo9sK/gEqYO3z0wYfiihJf13K42/tJBd5H2V2CZh5XQeKm
	0VgosRkVPjfoTNGmrjXiTgV7sCrwye2CETb55bY2dRlh/qXZanSuHvV6FZDMihNWCrgsgYaPo0I
	dAJfseHSn6CNO3B1J5FSx88D5EO8nE5gRZ/1VnrcVZy2WOn9xh3kPuHEqCC8ahaNIvI5niRC4cI
	CgbWjXenpVJLPAgxHlC+u99Bv9frIYjYzA+VPVtVz/I1wrUKmqC03o2ZIhXIjp0YNSTKOryGIe0
	GCh2xecAf4ErGQPZKtS0oeEqpI724OqJNv/24nxU61pm4eFJJiD6Wib2NRRRvSrdJ9S9HiMLgQh
	ixvGihLMDy8yArecSxVIS/d2vA==
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr36222056c88.17.1795762942950;
        Thu, 26 Nov 2026 23:02:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 07/21] ibus: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:55 -0800
Message-ID: <20261127070211.2329979-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133334
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up the 20080901 date tag. Match only
plain X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-support/ibus/ibus_1.5.35.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
index 0e2584fa90..df8f1dd423 100644
--- a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
@@ -12,6 +12,8 @@ SRC_URI = " \
 "
 SRCREV = "d464316d9b9613005c5573a010fec7f9b40b93b6"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 inherit meson gettext features_check pkgconfig python3native
 inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache vala
 
