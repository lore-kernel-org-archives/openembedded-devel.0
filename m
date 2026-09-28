Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C014AC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:24 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47663.1790553800995334211
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dL9xN1El;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9726675ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553800; x=1791158600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hyo7L8rSwn/aqy+fltAn5u4DlfgJSoxkFAkK77q8E+4=;
        b=dL9xN1ElPS8uDLDThSxM9tMtY9yEU0hYV9P7u0rxPx1EqQSVv+hyK/qSFuY9WDeqlQ
         uifCqbRG12M8FRWFRAdtQVYRapetwt2Fw8oLcx2OTJFbSMszdEKpn7d9fMc1pX9jZEpS
         pGhAejUHdtzpbUvrf2LsyXweSMIpfCSs+8gfZw4arlR8UcITCrle8JzlPB26/47i6jV+
         +/QyCc5QTRRA6ssP19QaRiEGrjueF+WljWCTv3M1LfYcaCvTKf/sL8v/ZVF/EDwjvOii
         SwGOwfN5R+skEvIjbqUMj3A/3eJJP5J8828kD+u8xRNhL2tezQS84U4MVkGAbNus9PJE
         Mf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553800; x=1791158600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hyo7L8rSwn/aqy+fltAn5u4DlfgJSoxkFAkK77q8E+4=;
        b=eIvPieOzsx8CMqhPeBH7/Wf0mQgrP5mtVc5l+BNokY/kqQXS/hU4RAyqLNrIjLeh1I
         Qfch1eHe8Q1BrLfElAQob8OCs69vn+AzUnyA7cVeylnrMovANes60wjSL95ncKO82Km7
         HTlmxd32VJDzHxPrYbD5smz5yJWAyPzqfOceh0cFCdojBmcvsKVZiMtLyXcUyavRwg9h
         5z6nTHfngnE6fY5nCzp5kL5kQOLp5mFYgrA60vYFJ3nku0SXwgeGsKW+p52xGTInbDgU
         VeP84tnMCE4gZSHwj6hW8Pj/vsM14gKnWgeoRmLhRhYwVwvmZiV85EexUGgRd9TELKkf
         ZBvg==
X-Gm-Message-State: AFq9FYLQCBTySUwbGi1PBwwiac91qOD/Fh+EE0Ale8jPWdgBmzBR8XrU
	7/EirpquzER+U4MRbEbPmXdR4nRCuXHEc8qDFtEdsDSPdN5zpFT3mzDHLj6xiA==
X-Gm-Gg: AYBFou3aRXoH1byEPWokHl8FCjLpmLnthCawcRp2MfiXX1qkGJxQ9IH/6dEvRkfljgU
	p9kx/DxwFtbAXOropCjh8F8hRBqWMts8dy7uAfVrU8Ks00BP+fxPtc5rcVkJjqqH8ej7xHA0TrX
	Kxybl0dqM91PNX2iWZ5wWMTztxH8+DTeuyErK+Ot881y9fpT2yRK1eS8b3p6+X1ypzSyfKP9tz7
	jTvUf+ZN98Mv2NALNS+8SLTaoDDyKc9hPnRM2ICVF4VVCGlLhND3D6SiYwlXbXOLus3FEF+ovth
	bHng3iVKQ01K/khzuzjLyuhS0PR0Vda6zV5ABKx1tSrOEcyUDi1k6lfOXx+XdChRji83HEUYyFL
	TBPNVevNGODezymDmJ7eeS/iSVu/LxKmxq7Nw2Xwx867y5kPkD7k6lyI4v4uvNdKAjEXv2sltzr
	ageaqPUyMKypmQWNjIRtRlI0pX/zmaCXVUZoPZwEoySdo/41e3RGq2+vrW1SHHcAKx7Etj+9pcL
	stI6t3ye/kFCc+un8DG94cGbMtc/4mecg==
X-Received: by 2002:a17:903:2acc:b0:2df:ab73:7e7b with SMTP id d9443c01a7336-2dfab738416mr37377895ad.31.1790553800141;
        Sun, 27 Sep 2026 17:03:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 6/30] python3-astroid: upgrade 4.3.1-> 4.3.2
Date: Mon, 28 Sep 2026 13:02:38 +1300
Message-ID: <20260928000302.2528437-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130393

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pylint-dev/astroid/releases/tag/v4.3.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.3.1.bb => python3-astroid_4.3.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.1.bb => python3-astroid_4.3.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
index 2e1932e88f..55f4d01194 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "bb359253d8ced6635a3881c17ebcbbc0e0b65ca23b555a9bd03c92a3cbf4caa7"
+SRC_URI[sha256sum] = "8cdaf5b7f3f4f39557ae05ed8b0852136b43a04ab686db7d39255b206233677a"
 
 inherit pypi python_setuptools_build_meta
 

