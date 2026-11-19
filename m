Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.503.1795102829822057270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=udkLh4fP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a358881793so1301397f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102828; x=1795707628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCVK1eCsxkJH3ke1JKijco8UbXOC5YXEDsETDAKhmow=;
        b=udkLh4fPJF+2jUgxp16igYsHP+o+0UOxN63B3VVd6uWnp37G4CN2tyh78L6RwaXwMU
         5XLMPtMJp7V7+DxqmXKk6iBgTGTHIIrZhZcGp6OLriE/OC+pwlwKeXSVXgenmYG270j8
         W4Y5i9x7U7PbzwGtGkAaL3rMnqqPPb6PTqDNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102828; x=1795707628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCVK1eCsxkJH3ke1JKijco8UbXOC5YXEDsETDAKhmow=;
        b=GWbAajMNhWmrdcGI2sC0dLn37w2c9/pJLvddLjAUJrWdWD1pUV5lpVujcfxu8zwgS1
         JIATEuO1UWN/nTc2GI1Of6fwGMU+i6qA5oL3CQRc0+izi+Pj0Q+MKbHTuD7h6meSgfhH
         zBkDTKZK9SLY0W9rVsd2h6Lb88IMcB/aq863/wgbpq+qNZiNkLm52OLSFD6f9eP4YFfB
         DwfHqDKcEGYTgF8UukWYhrnzlgwewZfzVqXSNdtFxTZIi0IvmHU1KojlHwn5LgOOJjKF
         azaduXI/XF5PgZKku2ixg67DkRuXtkc/P/tDcfaW226yqCI30Ove1Zi1mFDH4YvXArND
         2tHA==
X-Gm-Message-State: APuU4Z/KQGOrFke/q64H5gVMVESq9zr2JF4BUEM70HRTxloYIRFwBjIv
	CrRZeUXpr/vnRWYtFLN1q4qmbY8LhJd8sRwfzbSnjKDi/oSKzI5dQ4YvHdByMMckMiKXS4hNzLx
	X7pn5
X-Gm-Gg: AZFdTZdpLnuYD3NESVWbp2yxB2RGcC2uWW3maBQNQ0XpTiBWcR+8ABa2rOd0JnFr5sd
	rLuuM1dcDB6g1VjOjwa2BOwVDggAFZidCtRaMW5GawRBm1oOosEOwJeptF2PcD/GyRstZjWv2bp
	ay0+adktJblhe+4mt+i6vHEifUtkpyTbn20jIXgPTZYKayIqNVA5AVUig3iKHfLJl6Wg1Rd47L9
	JtXQ5Hwpnn/Ff3HY12HFQATXRDWJ71BLMNPWs5aUw0psvxA8pkSEtAb6q7bYkAEmRnt9u6BmWZK
	7o5M4Dn/MNgfjeGav94SkiyclzbfDcJJUXbIeNl2zvafOsV3k3KfjA+GO1iUT891C61IQnLF31M
	VmLhRilrfXd/kuRSfNSLiCPdkKoBWQ987/eK92XYBsjEb22uNp/7YmnujWmPLQssgvsZ+IDGdAK
	fYFvCm5AId0HFNn7PytE6a59j4g3H765gcUjUBJ7/I2srOY8Z9e37nh2lfItMoXYUp0mlui9N5n
	NKtjCz2RzY1hzKjbaXqlGuCr0FH7VY0TeMK39O/wk7IlJpO7YDaT64fcugmxyRyxTjwayTwawL1
	Kg2LgjditQvt+z8icdNJ52oddPKVdgKJKQeIdSgKDCBydW0822zMDle8YDa2ecJ+urQIn3gilW8
	KaFClaX1IC1woiMlwSSmOBFHEL8wU2/9QNXWApBgPuKPyy5XLpmlX9g==
X-Received: by 2002:a05:6000:25c6:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a63c1898fcmr14436829f8f.29.1795102828075;
        Thu, 19 Nov 2026 07:40:28 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/11] python3-telnetlib3: Upgrade 5.0.2 -> 5.0.3
Date: Thu, 19 Nov 2026 17:40:13 +0200
Message-ID: <20261119154014.1039002-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132688
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.0.3:

- MUD server resource exhaustion and MCCP2/3 compliance

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-telnetlib3_5.0.2.bb => python3-telnetlib3_5.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_5.0.2.bb => python3-telnetlib3_5.0.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_5.0.3.bb
index bfa49f14d5..bab57e47a1 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "30bee6ccbacc5c7540ae1a4fb990809eb81993d98900597c0795a5d1ad45e40f"
+SRC_URI[sha256sum] = "71c845a3cc339d462cd54e5926b16e5fb38b775febf2fb3ce1137b6bb30e92fa"
 
 
 inherit pypi python_setuptools_build_meta python_hatchling
-- 
2.47.3

