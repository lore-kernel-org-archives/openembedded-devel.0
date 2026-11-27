Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8061.1795739687887737010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DXcaCoXP;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10174176c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739687; x=1796344487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vYpRtgIFWHTLSZAROm2VuKzGrfkDUocbhDq0xAr5M=;
        b=DXcaCoXPCLy9bvxzpWz2Lz9jgTdd+6LFzqUuMiIMTFP8sSr/AhoF32mjpIj2PnDf/E
         OSFlOU5cdXxLsDY0S6aKL7U1jJpp80LDETcLYS/kCiV6n4qoXjU4KB9jZvVMZMTpCTke
         6enYuX7P7srcphxOp1MXHTQpAYF0Vos9zfnc/rkklosn2txw2xI1+8ydgK+/MJ0JDGBf
         7vRmeuByM+tMmrl5S3apOuFJXU7szxSlRqEPoodGrEDN3shLUBAmtaKYIRTHpgrucPqZ
         dGTzsmkaLQdTr9sF7qE5ydCp5MRLX483ydvapnUsGsFFW0ZzjCfRAOGhcHRTDoJ831Vb
         xQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739687; x=1796344487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vYpRtgIFWHTLSZAROm2VuKzGrfkDUocbhDq0xAr5M=;
        b=XZhl3N4Ig+Z8HeLPwQfXLhQQJAQjMi6Q75ebbsHg9JQkAVdMld9eIqchvI7Ps4TFe7
         iXbQK3S4Cp0shsTm7LKOgh2xsAisj9iex+qQKnNXiAJu1dkvyI4Iufp30QuRd6Z/YYmK
         2Y+QzHCjAPhtVqtdkCSFDZPobwWd9Ta+BC0q2SY0yWX7DxD5HzkH39U91NsarNhpeNUi
         twwQvhRqFdM7Nz5BhHCY5PMtB1RTBKc8ZR76T4Pkmh+T0Z/WKQZJccL2OQ5GSNqBo0m3
         BCgzy+bR3Y9yKDpYP1RhSutZFj/8/SSOelbhQMVMuQBPjfUDX8L10cF0o/LdBjh7nFpA
         zcOQ==
X-Gm-Message-State: APuU4Z82hoostJSApZLfN5ctlXpH5cPiw7aYef9ARC3B/Raip2LEgmMs
	7NgKafypZ7GLVFcyehxZ1mR8tThipRuC1irRGN47K2A/+gzf/VPC/ftbhj0KvI52
X-Gm-Gg: AZFdTZdnN6ZHxo7IcQFrNikuebYwsnWq447ZnajDB3mXoVoNrFP31nY3DdDkzzDFr5K
	KiHpF4EoECm/3SM24gliG8r0FXDHxx6L6AVmdmwiTl9j0FTVdfpohodvFFj6ApgNkqE5wlY9yFs
	Rc51VxeDnuJT3YVKpISYFfitze/Vf/0FdOuCwhK4Ggaf1tfA/gLsfp1DREIQ8ld8WCH3A3kKNMA
	8aKqQzf8M3oOwruH9a3Fv//UQ8l8H0yAdrVuSEDanZjmtnWbuujONm44EM29cbIgqhMYvac+n2a
	4WYd9vIvOqtaPNZkVjijSpNZcu8HoTeVedCxLC+uL9AsWFLtg5u7LBeH2kRK0s03gSim938JmTB
	Wl0YfAARs6UqdZVQMwNrU0MBmGYQLyEQ5/uMRgfvTZjenMLQi2c/iwIvAJgxDTx6i+vdkNt33v9
	k1Yc1sxYWH8y1hyO9F1A3704YjUymOijOhx6CKZ2MBlamccoze9G+v8RnTyY7zpIDcdHWGOJD3E
	UhLc0nL4kdjn3mCwUOV7fl0rGq11VatmmcIwFRCT7AlgmyI1y9vBEiFE6uIZx1TzS9frYZcoAVZ
	Lwcor+XmVRwSFcjFZvdIFlB9yFeI0rYzCSiO02GPWzJIJyCD2s8/81G/uYQixfJOExxRngfXdaH
	Eb3eNAKnMg0M603FIIuEdTf9nBK57W6bUlg2BfEMS/0i6c07fKfVAUPLw6cOwkAXlcPkutsK3kA
	XYwiSODghFL2H5wBUa//1pFbAc5NKE25zAcUh8g+9B9ZIhUVTL12Z2G97r/64PLf6nRlFRf4iry
	6YvUxAeWdMgR51whLpUT/jrGUh8JjbhWAV/dlYXOaai56Vy1aL1eLrxlGMQmz+vfBU1KP50nU90
	5fG9
X-Received: by 2002:a05:693c:60d7:b0:386:a01f:a31e with SMTP id 5a478bee46e88-386a01fa8a5mr19715229eec.29.1795739687171;
        Thu, 26 Nov 2026 16:34:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/69] include-what-you-use: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:32 -0800
Message-ID: <20261127003425.2166632-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133116
Content-Type: text/plain; charset="utf-8"

The default tag regex matched the clang_X.Y tags and reported 8.0. Only
match the plain X.Y IWYU release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../include-what-you-use/include-what-you-use_0.26.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.26.bb b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.26.bb
index 57ade99a1d..dbcebabfeb 100644
--- a/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.26.bb
+++ b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.26.bb
@@ -12,6 +12,7 @@ DEPENDS = "clang"
 
 SRCREV = "01a091d16b3dedb808db21f32ed3e761737a3691"
 SRC_URI = "git://github.com/include-what-you-use/include-what-you-use.git;protocol=https;branch=clang_22;tag=${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d+)$"
 
 inherit cmake python3native
 
