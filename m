Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14844.1793092861330890611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hxJwWJVr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44634305e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092859; x=1793697659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEjoV2yGQM30Gk51KO8vFUhESyQJFVxWeVibfUWzjks=;
        b=hxJwWJVrEMa9agU4ruKIYRSxebJGDnGuB4CN9z0iXb2+Qv8jBCMAVT3rYVbmMHDQqc
         ybFJQqGIfmo3axv95P8blm2Ruq3iaHekOiqlITOYQECnm5I9n9lF0ZkrVTRfln8Wd4kJ
         dJocKYsbdezpSukd4ZrhULrY60lRBgUYuAbwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092859; x=1793697659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEjoV2yGQM30Gk51KO8vFUhESyQJFVxWeVibfUWzjks=;
        b=zMX9d/p4krb8F8sNLTaY+y5N5dYzSrT5ftkGNcM7tA72YgdQGPEaq6C2qdym7TcDqF
         gXlF07t7d8ywuwvifaq9JB+gvHDu29o1o3kUo93sJACLHD7biJduXRUXvD8gjmy/S3Sa
         CBfTSxeYwHIFSbOPH6lGsaCDHyjpaRq3PHU+DlTcTdTSSgtlp3wVUdQ/jY/bwox2y6oE
         t4+P/kKMoRO2Tj3peuu8OZZ+rrhGnvwfO8s/I3Do384lx8p43CuKkFqdNSXpHBDrkllh
         FRLvaXFliZgbYqJfAwU5eLOzeGCkPkh+5wzhBAFYskWCiae9GC1hzI4NlP5KKkKE0pqf
         xglg==
X-Gm-Message-State: AFq9FYLAqtnYzkPrugG9FPaeq0FmkZSmyLkg2zyWmCFNSFx5+NxGENwD
	9rJqug21F6jb919LS9TxXYRcLHMVXlBltaXIaNQBUlosQMzuj9hcH/cmdjsHyj+TISy5ZpiieYh
	f8PsG
X-Gm-Gg: AYBFou1fTNxP+xENCjgGfBWIXsdPCBOuT2GvicaLVR7uNiOMWc2MwSo4rBuX/LGCBjp
	gY/4s4ztS8aFGTTU4iGW2bZzaN9e7RdHfUmamf0qXfEIoone3lPUVZHgO4W2X6fSLfFwCCDL75U
	6e8h67APUWe6UpQlE8DnIsG9U8j5huXX2ZDNGze/ZQz1iLb3GrXMQWQmDb0KiadmOauM/k//wXz
	iST0H5oWjmscvlvkEuIOKV56IaSCx+w1azjWRF63/6pZhlSwy5mg4aIUiqE2VgUhRZSsPWoGJoe
	2BB5v8gNrIOhkSjFtU0RcZXufRvE6ldutEP8Xg8rSJohq5SNaf7z2a/LBG/ckcU/XvvLylrUctY
	WMGFVqwRhBl87Z5QR1EUoVBabv6X9h7rTy2TMRdk1TRWBttELFVsbpK/RnfCuWOISusZhM9dlAd
	bk92QIAdOx7+ufZD20Wd8ublIgREYxI6q9lm98VXplhMhbyTRfbgNX5TSt9uZKPNHUKkR+CI1SE
	afDRpz9KCTufej2eViItM38upLsRrycRml4/UA+VeJxdMk8S1eOn/eLLQMOoLue9SaAuyn+tq9X
	zTiktEN/l++O8c01fVq9ncnehsvemO5O1kW9FMIwVPx5PRdWgtupzrcOo7b9vqCDsz1F0Hpe7T+
	ASBCa
X-Received: by 2002:a05:600c:1906:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a35acc3f50mr161210555e9.34.1793092859560;
        Tue, 27 Oct 2026 02:20:59 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 26/61] python3-pyproject-api: Upgrade 1.11.0 -> 1.12.0
Date: Tue, 27 Oct 2026 11:19:53 +0200
Message-ID: <20261027092028.782979-26-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131490
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.12.0:

- Validate in-tree backend paths and reject metadata directories
  that contain the project root.
- Contain response serialization failures.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-pyproject-api_1.11.0.bb => python3-pyproject-api_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.11.0.bb => python3-pyproject-api_1.12.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb
index d174bda08b..299df5f913 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "b8807d85a293e6c9f133e6575946fed45f1d42b22d58c780b33aa2421a799549"
+SRC_URI[sha256sum] = "2e83226079dc446a8e2357def7622c01c733284e39afc8e332d9f722fe0c2beb"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3

