Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17898.1795793634216071671
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xl98NouP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so64676925e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793632; x=1796398432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2iVxNSqFn5Nw2q3hk3ImxjxevN+L0DTu+VRgc0HF/4=;
        b=Xl98NouPdTf9db2gXhnF2oojCGh1jbiBR7q+6nx9T8WbPqboJbEG2N68Np2QKWu5L4
         3u+tXaepvU1RYlmoKWsR9j6sJ+rQiOOI6p3GRx/K/gf2OcgFNw/5c1tlqLshyR/cDVK9
         zbuRw+xkBQSp732rNwe/4KoTeXiqCP0nJNDPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793632; x=1796398432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2iVxNSqFn5Nw2q3hk3ImxjxevN+L0DTu+VRgc0HF/4=;
        b=wt7kEdRcLSMOJd6IrLkWyYnW4PgALhY1c12Ft2csIGG6dtYh7aU3nIxKoM4X2Wevxp
         qS8FiaRG713NQ3HhKAgEWYCHypJ8f1F6oznCzJVXXYGcr7gSNfvKP7AhSxZ218pwmrND
         5u1prEzcxYuJ0jMJuRHFiHSkQdTrGbYv0o9soVj6mj5BR5GAHtNx+hmUvM2rTAa0e0iy
         9a2gmXpSJZg5qY/K4+Q1/Pi/0JzUNcwmsvBWkGLhabW9evFspehBayYvhYyYruD8RsIS
         ppg2kOziGOc+w1IZOiNT/cOeEXOerLaWPwu+9EgRToClY9MrovAh0MVhNui45K9+pGv4
         xb5w==
X-Gm-Message-State: APuU4Z9BDWT606P02zJ7Q7JSjbOe0ohemFTBpd+17Gqnkmlur4x1Bp81
	wYSh+xwi/iFSdX5ELFCOgtopXjxw+Y3BhWuy4Z1120VWolxyqKgNs8dKaeWNT/q9LY+DjSWmBOH
	nWbCV
X-Gm-Gg: AZFdTZdRF1WCHE8Ulhig2sUGKuj4UoHLTaXzGGxM86NJ7G+7wSieHbU6wCChGl++XGW
	PZnz7kAV0AOeTlfygj/S/wsqlKXUeX3HTEuizAIttwmpeZuvHriqeORJU2rgMpnA2WNhpMhIC7q
	qMbocnNcd5u9/zc5xa9fs2ISBT4hsb1os1s4/yef1k7PfUKv/Ps/O2mm65t53f9OIBye/8pCr00
	19WM2Zn456IQZrm2kIWIxB2F/31pj0lSTtxx8qvwljAPdFLEIRiOzdHtbJc3151dn0BtedrHqUx
	507COF0eXhS3JFRD+q73ZQSxqP2bjSCOjSqOAA3jn8wb+9/8lVy+BNK42XFnWLoTnq5Z4BYXRQg
	WGZuVXtNCr853cqhG1pidjAUeE8+7V/kl8OfeNZt1Am66QS9PQJIuN8dTEy6aqUlcApOiCLGYAl
	pWOwC/0qBFkBg7TQGuikC82RLMTyQnbmC0MOJ98oSwAdFidj+aRcch8wu85q0NA1kLyPJleOdnk
	9P9Dvvpx1WNmob79fTp9hZDIW7UwxhUCFxSUBLwwsevMN7LrGbAaWbYrfvlWH+eqnfUfbpFSwl3
	y496MUQHJaWd34zezuWZU9YDkfoPPDgTD3SqyGmfHLYphps7BoX7cSNjDGN9yRQi1fVqKCuKkwr
	kCbsJ5WBdVQupTU0fyqAePWdxFdfvcosP+MPuz6/Z+UiUkfoHHVQqQw==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr489548255e9.0.1795793632378;
        Fri, 27 Nov 2026 07:33:52 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-httpx: Upgrade 0.28.1 -> 0.29.0
Date: Fri, 27 Nov 2026 17:33:44 +0200
Message-ID: <20261127153348.2880928-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127153348.2880928-1-leon.anavi@konsulko.com>
References: <20261127153348.2880928-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133377
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.29.0:

- Minimum supported Python version is now 3.10
- Expose FunctionAuth from the public API

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-httpx_0.28.1.bb => python3-httpx_0.29.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx_0.28.1.bb => python3-httpx_0.29.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb b/meta-python/recipes-devtools/python/python3-httpx_0.29.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
rename to meta-python/recipes-devtools/python/python3-httpx_0.29.0.bb
index 5bbf7475b6..5b10493add 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.29.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c624803bdf6fc1c4ce39f5ae11d7bd05"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
+SRC_URI[sha256sum] = "700928ee6c1f4213795e67c47eba8f8553639069fea89199f71d654e38edc593"
 
 CVE_PRODUCT = "encode:httpx"
 
-- 
2.47.3

