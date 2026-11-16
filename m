Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34313.1794851691612943745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uWTABymT;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40312e2so1300372eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851691; x=1795456491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXYrcwf3/y+Wwbk1kKreB5xicWBxMgCCgNKyRXJBYak=;
        b=uWTABymTU0BDsh1cR2i+oT8JVJFmnjheRJzjYrH65O2xPj50XqT7fa10axznuyU0Ci
         dUdII2Vs4fNdTJXQPmi3RqrV68bax+zb4NP4XeZCQxdx5hEvBYWXgSL8nuT3oP3SE/g7
         0X01v82D3wWvqATWfyvXb+gu0JkpwiMVdYjx5HEwoUZF+TphhLI1FOpQ2uzmOLjZc+y+
         nqRElW+9sDJ4Nl84dqRCjw50GXUnbsgKsN7Sr2agFGHWaNIktcxLxjL3AssLwIXS9oDk
         OSIugEATEiXGYm7BP99UkP+bs8IltVaGeuAnlK4XeRMgchpq3emzDc7eMqfq3lcylb+t
         ruPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851691; x=1795456491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXYrcwf3/y+Wwbk1kKreB5xicWBxMgCCgNKyRXJBYak=;
        b=lUTdggmoRq0pOIeAhCgbWSezynY89yPCwoPogCUrFmHvi7+kAAPp4JttdvxLd0PMTZ
         9Jy/nMYcin8PESmfiV0Ts52GK53b422RUDNyr6tsQiu63Ro/KuJNBtgn7n9W4hrG+kcM
         5qE/H3cLsOB/s/42gvkIAUu1DxQTIrNrrKEwAXuY49ZvZS3A9PXQwsRwMI1zKQonF54b
         DSTR98qFvo77MQ0Zxx0Fgh68u1UeQ/LK+WaiqrAViUWraFVE/hvI2AIIAbvtcCrjJ03u
         m1/rCyxeyVYCfdWeZ3OFVLU4VPaS2NcymzPE4a+Xzs1L9TTtzSfQ0pQR1d5QNLCI+cM9
         aaQg==
X-Gm-Message-State: APuU4Z+4eooewczK/Rl+f0ROjUNRWQyqfJPJrrHnYfRl+BeNbG+8v3Pz
	BMSRC0qI8MJCKXbl5/pV2CJr/UNetX3fQs7/h+DyM9aV5NWS6ZPasaLS+l7VHDsZ
X-Gm-Gg: AZFdTZdTiq7/LSdxBiLsxsGKVeFjSH1WZF1b3Vz1vCFn158uXTI9Yebh/z4oW8K3DFf
	D7nDwbG9BTkNgQjolJdKZkVUPdC/JdBLTQarZhBIRpNKKH1lupLW6+pKXGJy+UU14CICWxnoD3o
	U/3YjgF5si6+EBgJ8Ph4FrpkNoi+Rp6KM6/hpr/I7fNGxP8/HA4TFGW5nuRS9YEbVrk0Zda+Xq5
	51CJM4ag1ytyNpkZnNh1G4zLOm1AVnQ5yFMNvZUZurlMUE8TK1uMIxICnDU+LKkVfxhAjvyx6yT
	+/BCce9Doo5SrDd9gFi0ifnExGaAbzteTk6mgLjAY8H2cO95Q1pVPI5VeqDFxG0b+YVAQY7nw2+
	Zgljc0IXI0WrA76i0BVHJDlEa/rktnDQqzBk8fyfnKXEzyMo/FxgXne6Z5JHEcfrCqLQs8+NN+z
	Nn01mH3UafyCN5FS+vJg9dhZ+2YLjAV6dNzCB9/PmZVD2OLgh4DIezKawAOXgTradBfc1v6pQlj
	nP5Fle88m6tXUHJd1sOyEqFHHtjdXFAOGGnIaVFi2mhpL0ndlBLrdm5EBiXg7C5jKFdTVq75Ce/
	3OaiFX7J3OiaQNHqq229c/nkc6IVVYNokwdcGCZ+1/pIu+5BdokRFPntZBq4kJEKTZmzVUGsj4x
	S9EhKt82RWCodRfHvirWluVpXnVSns5vOYgaOXsl4BgvZZhouaDGbFocKtmZJrEkUhOmOVvHKFy
	tKRhNjvwcVTG53HwP+VjwXCgpvTIgKJMD3v08Do9aDYIflefx8Xu3ZRufIOQKIOnfn0r83DVmcT
	U7my7CDJxLLVQmZ6qXQBnbfyUDAWHvxxlp7Z9zqus3sgVaOFXWhcz9ygRFfzU/Y4++lKGL6b28Y
	9SbU39nL/967Nb/pevsOy8P83g==
X-Received: by 2002:a05:7301:4614:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-379655d45c1mr11356161eec.13.1794851690982;
        Mon, 16 Nov 2026 09:54:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 034/105] python3-gcovr: upgrade 8.7 -> 8.8
Date: Mon, 16 Nov 2026 09:52:46 -0800
Message-ID: <20261116175359.342679-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132490
Content-Type: text/plain; charset="utf-8"

Changes:
- Fixed removal of coverage data for internal C functions (known
  bug in 8.7).
- GitHub-theme HTML source view: breadcrumbs changed.
- Release pipeline fix for macOS standalone applications; CI
  hardening only otherwise (zizmor, dependabot).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-gcovr_8.7.bb => python3-gcovr_8.8.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_8.7.bb => python3-gcovr_8.8.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.7.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.8.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gcovr_8.7.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.8.bb
index 5bd4e031aa..cdfc007986 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.8.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     git://github.com/gcovr/gcovr.git;branch=main;protocol=https \
     file://0001-pyproject.toml-Support-newer-versions.patch \
 "
-SRCREV = "7fc1fc829b77a3fd7828abcd976b2e56ff1f28c2"
+SRCREV = "6e49f2f4d05f0bde932dc40f95d6e501c0e42651"
 
 
 inherit python_hatchling
