Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22046.1794808953560869733
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xoc8bDG8;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37198ed3727so4627829eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808953; x=1795413753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RT+Fure+oxUZFONb8DAraWHZqhe2SgLtjXG6JZu8Wco=;
        b=xoc8bDG8DsO2bwThDtzT9JrlwnP1gS3cDwwyR0l6M4QZi0UZMjmurT9JtPCQFaNqOv
         jZHO8wfvGlliQ43N4LdQg+hWZV5Goe+gET1tdFpgT707TNN187xOX9g5Mx5s40RpGU8f
         AFFDrbZ3NBlnF4imxFICb9HVoBJxtroJGbCucd7a+DorOmab4OBiYEz8r1k4bVBPsvao
         RhBu1HhrFwsyLAQQovOFKVXoe5GWAoM4mhq+iDn00nMXuTcvKLBvcEO8yY3vusuMfGsD
         zoI5GjCLSsF93erIEK7KFxLL4n8hV0b28ri3jkzTttBsKEJyxIIRHgrAsN874pmkkO79
         Aj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808953; x=1795413753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RT+Fure+oxUZFONb8DAraWHZqhe2SgLtjXG6JZu8Wco=;
        b=MeFaAraAaLRFpwY2e3BAlogD/yFjjLuYtGwDWAA6AslIFw3KHDwAuf1fxb0jOXO0Oj
         45+M0XxTe4FzfiQFTV4LMB8q/v/4GhX9tLUmX2Y700H+HPmbD/DAl9iI9Bey/R581UlA
         czDRQiRovVwbgUky+UZs9YwMU4vYSew8d3W11MxI+9rswNQzlryc/WZsrOvTU/aPR4Ct
         fPKSCwdq/OtV5UXqZSUNHKK0EYtJmvhr5hZIPIMXW0902O6TCmP0W0RwoSmRUYmjIVLL
         SBgzR1NT3LptfNKqRTu+BNVMG71CrjQcGfiClljHbBRdOer60E6gx+kDxRlZHtzE3BVi
         DPwA==
X-Gm-Message-State: APuU4Z/qbzFT2CuT0AmSmyXQFGAOwNfQ6SLwRo9cnn0Oj/gBEVwOGrxE
	HOr+BdNBR7RoEUFMXnDS+V+p80lALAvIlhi+D2QqfblgrVEA3zHzad0QfcevKaxv
X-Gm-Gg: AYBFou26MtpWB8YY+XeyU45KNbHpxYkEZ8UQzg3egsn/7WSDWH2//jJw/7pQsR/2Z0x
	CFjqlWvcg0kTCErpISPEEuit5lDogcbnOvPIdEU5iqLDS++PowwHOqVB0A3TRB02QV0MxZWL9XA
	MDxT4iQ5eNvzKjk3f5Vziv7TZXhwak0BOOaZFWtrblmbGhHu+rC/jXanXEncNpkFQzLc2p6cAEf
	A/wgmbWde+aDvVaJE0jEO7nHNwy8sPmHUTb7OhE6z+dxRWYmw7XakY0lWpMvRIzuRy0pRmv7ztr
	xqKWPlSaNwTZrujn+S3sQw+kWcZ4pnTLHlw4S2l7Z2f4EI2ZNvoMImkgVbRlrqFBF8U7N15ZPwz
	dntu4vCCcRV3KkOd6LFNFEXgbp6QM+PscI3Dc/bTK9PZcwWs1JqePfbyDkBP5iSSKV3IitGbQCD
	Mt6tUBzEx0PNkbeo7OWsm1H+QqX82pKg0+Q0Q7XfQi8exI9aPZax4o+Qkcs9UYnhePZcxXWvuXd
	L+qyAOMmMSg6MzAI6UL6RL1HDQAkM14DdIzpd6IlTzq25I2ijHSBfJoWrwsSY/6r6EuUqa3KHXe
	uRlOupRabxZbX/fyeQqdunzDlZZlcO+/jqsrUM8GhrHN9rS1d3zDQEklM3g+TJrFlK59SIpZKdp
	LizdbH870z5MhY9xeyjSOPtRJ29UIduWz1B1UOblFLdqmT86qzJUzlvCxMTOx81uasrod8tPK7x
	9Qc7fxIAYmYY0TtazJB4hqKh5oH3dH7SM0sRP6yvFLU/ahAZSpKh524lX2u8G2UW87qgrgOYZ/P
	LhoFodG4/wdfLBYws6HmKNLr7/s4uWjZcJLFhWIbGnwi0HQKCgV5bHOGxUY7iJfh8Y5rRVBIqlP
	dM2R
X-Received: by 2002:a05:7300:aca4:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3796676acd5mr11723298eec.10.1794808952750;
        Sun, 15 Nov 2026 22:02:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 19/30] libtext-diff-perl: upgrade 1.45 -> 1.46
Date: Sun, 15 Nov 2026 22:01:57 -0800
Message-ID: <20261116060209.2916444-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132417
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libtext-diff-perl_1.45.bb => libtext-diff-perl_1.46.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtext/{libtext-diff-perl_1.45.bb => libtext-diff-perl_1.46.bb} (92%)

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.46.bb
similarity index 92%
rename from meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
rename to meta-perl/recipes-perl/libtext/libtext-diff-perl_1.46.bb
index c54c1b6a70..84bc7511ef 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.46.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9e795454c53c99fe48b8180eb5917b10"
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEILB/Text-Diff-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "e8baa07b1b3f53e00af3636898bbf73aec9a0ff38f94536ede1dbe96ef086f04"
+SRC_URI[sha256sum] = "3fc983e3140fa2580250bbcf2b52e2acbdbc5abda4374c3be78235905d8ca8eb"
 
 S = "${UNPACKDIR}/Text-Diff-${PV}"
 
