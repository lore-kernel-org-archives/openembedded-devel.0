Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8030.1793701451371368064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nS1/PgKk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso40014455e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701449; x=1794306249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGf+5Oy6HxHetdJkmhOcUDQm9I6gLR+57rLAbHJkZ4o=;
        b=nS1/PgKkdy7RFy8V/5mMpFC2KHItGzdyma1QQjc1W2WPm9Nj/vgZIOPX3HwionijN4
         sck9X6U8Gea+6qB5N/JhAjciMBtTd4ffday0MSKG1BFG9kORgjRorPJ8A3K21W0Pq698
         9C9GBj5F+AMZgJPsggFp4Yd34TJRvFM3GL4eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701449; x=1794306249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGf+5Oy6HxHetdJkmhOcUDQm9I6gLR+57rLAbHJkZ4o=;
        b=Y8YndQk5c3nKZ0YQhTWynoaxX/SBw046qsIKk5I/v21JuKwfoSW1SCKPDL5Kwa0NId
         kWqbxCkuqjd8zWD+uVaQzTe6FcuriD/cQhsKZGupbhsWyuUC4BZY57op0DMRxen+ww/i
         EU5X8gO00lo1hDItmRnltzr/0M4cwjS3OQrJCXjYEuL4jgx8T9BOO2CsaaWBCaVTMcUW
         NZu6NWADSAcE+mHKEeqAN1S1zTv27RGGlBH0X++8xQ0qqm5JsLAChICa+cvZBcxkUWV4
         0tBB9kzgPxCejjkw0/oVWJ95IdDiPZRheAA5eRrhM+37JgRyZu9uJpf1zfqm1yOi4Jxw
         aBlQ==
X-Gm-Message-State: APuU4Z83Fphg8ByQbgY1VZVoXmvjsT1Uh5XDY2hYgzYsqdE/YKrMlvGU
	AxAaUpkQ9uhDQwlS3Mehu+xETYKxRRGA92jJ+/gvPl7Cf652mt8e1VHg400W9b5TFgjhvmnAx7L
	f9W8k
X-Gm-Gg: AYBFou1VwUSt56+I1ewdpAIWKQYd7QASpNEn3tVMLgkOKuWItlIDUFtiE8NWOdCHoHQ
	787L/8SdWsVuPHflPqI3o3KYLcm+YIVRJEJaDnQqxhExI6lIrf37zVyylJAQr/oy6i2J9joyITG
	2G1+m7mcgux2tzf+8wxzu0sPKhnQFP0I5hDLxvt1dtS/LNx+qOaNM1CrU0bF8jWVJwoC3vwzVxh
	cPWNl541agb8OlYHyfG1YTdWKJhJJKc+OiHO4seRK8x9rzetMSjiz3jVP6kqiu0E5P52h5vme6N
	cEVq/bJ290vS9Q3rRKt51NHMc56dtQpGFw0LmtTCsNd7Jr+vUXgmZO0+yodcYTPqVSLxuJC7nnc
	fGADX2yCIsdqczA3on3GFYmflhEIpINsFRRJYyfQgMXNwrd+i58cp7e+czv2j+gujgRF89LdRbR
	GkcI9vedbC6/yq+B07fFvSGEC+l05/OR2WzuEGuZmhdXts+ESMhkH4ssTIoRTSBpby4bLj0xoR1
	WdGJ6qYP2XDC3oa9GCBgHXssnuX+MiFHA6k9d1Krvvze9D6BXf5gG1GLPEP6ZQLitK3aVauYwYt
	E+Eb5Q3pVA7Qe4i5IawJYRFh0peqPADQNTqT0+Zlm7e85nrVvAJWjPNrTjbqJo6yEvG5Okc/fyO
	XyNzLujA+uEX2f9gSYyVXSE0x1qqbxdqnr9gkbKUXW9dVMKjGNwf9EA==
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr283316735e9.31.1793701449650;
        Tue, 03 Nov 2026 02:24:09 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:09 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/22] python3-flask-socketio: Upgrade 5.7.0 -> 5.7.1
Date: Tue,  3 Nov 2026 12:23:34 +0200
Message-ID: <20261103102350.1952237-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131769
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.7.1:

- Update version of python-socketio dependency
- Add Python 3.15 and PyPy 3.12 to CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-socketio_5.7.0.bb => python3-flask-socketio_5.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.7.0.bb => python3-flask-socketio_5.7.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb
index 4020606494..8471fd8711 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "aa01e50106962808dadc245407c3b6354295b1526e888bd154dc7ff4801a7c88"
+SRC_URI[sha256sum] = "6dcbae88b40f2ae99d0f106c751ca2e119b7ccf4a8df95cbda64f56262db99c1"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3

