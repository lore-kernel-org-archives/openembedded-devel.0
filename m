Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8902.1792580527776021363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gvi5FPEp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d885929so448543f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580526; x=1793185326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9VynzDbSH6DMDRHkvQ377J6eO0PATdb2hDdMmdVaSI=;
        b=gvi5FPEpKGEu8Tj6P6UId4sPrx+lS8d3j7I1s4Qr4sdhy8x7OZ73lY5VT6EAzYxTPt
         G/7q9A3FjlYZsYx4SNL2Razs9mOSGMwiIMFDXHIUAAIdwYGid4zH4CYy+EoP65v1e1Jn
         0GrUblOrKtdw4B0XOYkM0ICVZ/f8WWBVfvYbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580526; x=1793185326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9VynzDbSH6DMDRHkvQ377J6eO0PATdb2hDdMmdVaSI=;
        b=KkWe3H5Cirv1ngrsqc9thnUaF3C6bik5NsEKYOR7E2M5k5MS2d4A60bMU8QrmXLJXo
         kaXKkuvmG67qBKK9mq3BpPokoDCe/82Vk0kP4d/liyfB/mdo61TSN3ufRDwBkNpkYj57
         qnTElKgA7NWltd0o4S9xLxBlSrNRMQmBDR8v2sEKA+XmcJekae4THUgXXKK0+qog6wJP
         yjGTNFfesZ1kQcQmkNMdbBmp2O+LzO28vx6nP8u35Xy7ygIqEo50G3GWVJbhsho5bHHq
         KYNE9gj/SocwJBYb9/gG4yJnZloxmwenXuYW830z1IyQezy+lcg/OGy0l9ym2quOcUnB
         tz3Q==
X-Gm-Message-State: AFq9FYIx3CPomRA0dZYoH2Swv8yefnPxEMQ+6/iUHTReWYZ/tP4wTlb3
	yTn58wfZoZBq+GqE4GFkoVdocMuRNHaICHoZPtgPrK49+vD2IBS1EGJeU6y7aB4KwFSzHuJ3JyL
	EW0cU
X-Gm-Gg: AYBFou0RKC0B21ld3+SNoETlvzEuSHkaBpApVsc+/VotbShMHSFllkrOCE95qo60QS6
	J/Fra64q/+6ctUgSyhgzJjQRgtfxuHk2PHne9457vbvoB1mvFzWTTQL+ofX2RmX1kYtujHLjWam
	LhcTfp1ERLO3nZU3a5Zrn1arscwEsNufdA1iaQFYAB4C5stEzwIqtSBe3Yps7Ymlha6KhzYQg1p
	4ojraD9wdUb4P9OQh8DYNES8VIcIy92eA89Ub7GscRSITuw0cdXtPjHzxCoJppYGO/8qrGoSAU/
	P6A1IOBZ23sGrqXk7NOjKQoISyu1BgsIxhadlynYrW+YxZWB9BpytNriR+FnU7PSoN2lRZKLTVB
	LCBn7MUWEb7wKb/n03vBngiTGlTdTSzYGjk/0F0F0Eb4QOj8/Uj4vc2ngCdTctATfEFJ0DFluvm
	6hDSP/o3+IGWZrgOnNLNF4LPV8OwV6WzXEpAaxwgUhQFS2K9xt+RsiBXeYaWZTgQFlDPRSc32m7
	Fav2SvGj1z1jVrNfyTcQrHVugBJuxoPhvMQ5FRhJ67OfP8QiA43yhTGWlmd/IVoytf7HBs+5jZE
	CEAjSGExijkcrNBYlN/sExLixn40yiXUsPEFcFNkX0Qs7YZCsQc/VUB6Res7SKi8rKGxpT2oNE+
	MIQTZN4Pknu6raVd5cpatFEeOaQ==
X-Received: by 2002:a05:6000:2c0d:b0:48e:f47:273c with SMTP id ffacd0b85a97d-48e2644efd2mr3218777f8f.8.1792580524498;
        Wed, 21 Oct 2026 04:02:04 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:02:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 36/36] python3-pre-commit: Upgrade 4.6.2 -> 4.7.0
Date: Wed, 21 Oct 2026 14:01:00 +0300
Message-ID: <20261021110103.1943456-36-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131295
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.7.0:

- Fix language: node hooks during commit with -a or inside a
  submodule.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pre-commit_4.6.2.bb => python3-pre-commit_4.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pre-commit_4.6.2.bb => python3-pre-commit_4.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb b/meta-python/recipes-devtools/python/python3-pre-commit_4.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-pre-commit_4.7.0.bb
index 285266c775..5b4d2b7feb 100644
--- a/meta-python/recipes-devtools/python/python3-pre-commit_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pre-commit_4.7.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b53a93744e3ff841e5fc9a934da8e1c8"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "8f5d7bfb021ecdbcd9d49d89847082dd24172ccde534390081a679ad046e2441"
+SRC_URI[sha256sum] = "1f3deee12b914c8fa184bd2b5953391c2e4f36763e403d4a23dc9983fa7c6e86"
 
 RDEPENDS:${PN} = " \
 	python3-cfgv \
-- 
2.47.3

