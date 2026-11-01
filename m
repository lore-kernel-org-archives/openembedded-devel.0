Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16913.1793547259964181927
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 07:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=arAp1DIF;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so3018104eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 07:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547259; x=1794152059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzW7FzaxAJioDPE4TwwacPnJg2/zBhZWimTQBZPADNQ=;
        b=arAp1DIF0cVbtftXoq80DG1UAvUoBWkLsCrMRH8vPws2fBfWuz1gnNPzaTTd/XnATu
         WMh8pJWqOEX1E3OR3mJUZN1iXJK6XqqcptyNnD2iLYW+MuDPgVIzM25uFihvYr4les4z
         lmFDAkc9GvP83JGzwtGq5uE9B3w/QO7QaoBAFwAvdjvzLxePaEwU3EZZhkiCYFgQy0sK
         i4hxIETtMxUAyrcctd2Ks4doAJIgLSLjCGtNm8f/Y8mE1PXOQVX9ERCAy22QYMRJrCnz
         gNgQOYtkGSFfct4YG9eFyEXXGfU3nj0vSHArQQLRKKD7BCmLeFu3yHRoJ10tXohW7NcM
         sd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547259; x=1794152059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzW7FzaxAJioDPE4TwwacPnJg2/zBhZWimTQBZPADNQ=;
        b=0TnuyP0ImaI85c/6YMR3jNjriPcSCg1SsChIZ5gR7aGpyU7xfEXc02aNeSq4ghUC6o
         rgL65GiMWdcY6ZolO/beByPe1limPFXEFaA1F+dIueuHeX+Df0Bg4YWzTZn06rlfC+9/
         oqwJ2g7DBBKLWecOsKs+JBA2kWJIbcqJMgUWyAgMFpdpbH1igpoFr3IkhYeuP0l5jCEy
         hhxScEfdEQbA51sUjGnzPM20/oH7CL/+CfPd8LS9YV5HioEgk15R6L0Cimx1mHTUQ6i8
         87IaArkZkA4TL0d/vBx2BmI0+EdBxK6KkY39ScbBMmyG1y7Z1yioyEDMDtDoH/NkBXEj
         AbBA==
X-Gm-Message-State: APuU4Z84xf4DGei1Oq0PBoWmxP2rXF6lFT04j+xPObWqn+tJ2zFEXW83
	o+OmJ8/hy4PABKm0CAwyVTDnR6q3we52Eu9OuMiAtKhELwppFxxVRt40ISMtutjBW80=
X-Gm-Gg: AYBFou03lUNwt3lDulCkhfOnWdEn5zAZv6V22t9Bg18rP/HrC+5uqjYC0eAost2UtoR
	6dOoA9JIiv330v9oo1ntnYK37UewjY5mPE4MiXbiQlLsFqprB10xSCnyhMmx0UjN9J/SEs5n9NU
	pmvaHM8ZPdtf+9CGaEIbWTFi2PP5qj38pH7aPd031D6QV9orX5ocxDrc9du1sUb3wf5+rX71XYU
	RAq7g0VwIxcImtZ2F3UXRFdUpvCWJlY77YLRRkbE4tVBx3fuMOsImntOwfFXNZVZIF8i5InaRXs
	Kd0bSFXnlBUDlljSeuHV6vbF3kjKidHXR55tLgi5pua88uMwckja63Hz076+Pofkvxuf6jSgR5K
	897tmaezZlydanfKMCBeqZVc3/mIx9q/OUfAObPzbbrJc0H9Mbv23FQFoEa4khqRDI5ZTLoI+ka
	PY6BddKn4squ3QBG1FJjaQs+b3nHEXprb+q16aXslfZ59Bopz5/jSUivKXhvAeDgORIs648nEvz
	DB1A3htD3/fcm72qpw4mmc/A0KiBH5mLlbVKlAkz4tKlSAOWNEMoowQZV6+j6f+v0EjRuyBbI5j
	BW1rwmcB3iND509RzG60bGPuwKbncaboA1h5HweZ+n6FI7WjjQejem6ys6zXRPZ9hCdTEF5fdfJ
	vBNh3J73V/4qdK5jSokRnEO8+8E3mYSH/bL1MGsFKEJk7KCYwgun6EozNGagfykO9A31Fr1gLGj
	76TmlMTvQ4VHIMjFBSMP8O49kI0iZCci53xGQ6f9IIrFcT6UUAAeR+U7u+AVezGVGMaJiFkrMwm
	fLBiRaU+5vpg3lvbBJUTc5btbeCjZiPxFMrj8HAAPc3Ho+yluttVKqFkwrEynk5TrKrkFq8zbBE
	gY21
X-Received: by 2002:a05:7300:c8c3:b0:36a:1b62:da with SMTP id 5a478bee46e88-36a42340be0mr12321281eec.12.1793547258992;
        Sun, 01 Nov 2026 07:34:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm31448224eec.29.2026.11.01.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:34:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] smolkit: Only provide polkit when selected
Date: Sun,  1 Nov 2026 07:34:13 -0800
Message-ID: <20261101153414.1370959-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101153414.1370959-1-khem.raj@oss.qualcomm.com>
References: <20261101153414.1370959-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 15:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131728
Content-Type: text/plain; charset="utf-8"

Universe builds every recipe, so the unconditional PROVIDES puts this
recipe and polkit in the same build, and bitbake -c fetch universe
reports that multiple .bb files provide polkit.

Claim the name only when PREFERRED_PROVIDER_polkit selects smolkit. With
the overlap gone, smolkit is no longer dropped from the world targets.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/smolkit/smolkit.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipes-extended/smolkit/smolkit.bb
index 6ba338ef05..e3f6c7dba0 100644
--- a/meta-oe/recipes-extended/smolkit/smolkit.bb
+++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
@@ -14,7 +14,9 @@ DEPENDS = "\
   sdbus-c++ \
 "
 
-PROVIDES += "polkit"
+# Only claim polkit when selected, universe builds both recipes otherwise and
+# bitbake reports that multiple .bb files provide polkit.
+PROVIDES += "${@'polkit' if d.getVar('PREFERRED_PROVIDER_polkit') == 'smolkit' else ''}"
 RPROVIDES:${PN} = "polkit"
 
 VERSION = "0.3.0"
