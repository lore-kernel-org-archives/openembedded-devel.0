Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE40DEE6420
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81797.1767167680853523257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvSDheYj;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so60954195e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167679; x=1767772479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fxn/RzTRVWkPMNWwYsAv6EZi61pWsXKcFtAB+d+/NAY=;
        b=mvSDheYjQ3FN1+RjXCNk2R7/XP8hPNEpAq5R2YOkfxL8NqYjeSXigSTDdo/MmnUFQ1
         aFr5xDnU4GHC91Q5WuxaLCDtLY8RynbD9hIE/3T6A1jfAF8uKyRwN5t5yJDDFJET0z/t
         G4K75se8IoFwfZ8px/2OqiUTHuutGilLDPKBfzAVaGvvRBZYOozrzNQsdD3XTxMEYyZZ
         JjFzPfVtddvgBHYIuI7gfUwjOgx28Y2WFZI9tCRSAaOwqJzDU0FNO9AhZ/Tj2+WIGNVq
         KPPhhE5zqxjtoBzgyyDiANwRaV1tjkpUHIuOainQ0G5TVRh/lgHXBz/QcSWWumtDtVdP
         VEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167679; x=1767772479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fxn/RzTRVWkPMNWwYsAv6EZi61pWsXKcFtAB+d+/NAY=;
        b=rJfuP1BPQKD1mZ25O5jVF4Np9MgWovrflJGvM3GwT1oKpB8F5n9InIVKEMVI37bJWH
         zesN4UDMakgXiXJ6fZpsG0gUNwwuC6o5Qxz/vQPXoOx4o9VU+u2Q+gqRSQrHtqPumLkH
         ZHWMYDq8bkG1haTvXNCpYT42E6A6F0fLvNkIyVZhRfy1szjy9g5GpyUy1JuQQ1A3DrD8
         BhQNoIykWQD6gxUtZytmSdhJtQa9KVkm2AjHUobSUmLDQYcdT/eRKCn2vtMMwJ7Oqf1R
         V2D56toFjQvEhILpuTSylnquTwcc8SOTP17qwjWyKYLpXK+K0hTJYDqpCuJFyif3U5Xv
         XFaQ==
X-Gm-Message-State: AOJu0Yxb3wZMfzIeB3kUPqBzVHFcuREwDAVy6fENc2sa25xGMJexOsvb
	yRGt6XjrzC4uHlxCNFDQW03Tcc2+38LE1JNw8OhrlGlhHoKtsFJb1ai9oGMGWA==
X-Gm-Gg: AY/fxX7AKtl3NCGHZDB8+M/sRpTuWdbc0m1MhT1mDmefQDU9NTjcQ1VlKfgYaOeXRPJ
	T3wTcwVHYU0XPJ+kT4NQAcfSWLElfwvJjRw7twy7Asr51oPCVPYqMX0omp51vIrrqCiyEMUUqLZ
	nRTVR9Rna0+ci0AWmAOypNv+MwCJ5nXaa865YOJ65ALEfrYD9Q7hZPyFGApGhLwUi7TVZXxYOBY
	5verxwju9JIHM4RmOGiY4VXk75j0SupY7vuSdy198VxZTizG1a0AK4xbLf+iBSvJGaHyFsO3qJV
	rV2ltMCrXz7oV4dgZJ2jjasnPAhEx0bUVt8yWmvsdF6xruWFo3fe+hkPvRfV5caVcoXQDYOOWaR
	wnu65oEkyp/z3XhNs658FoJOawOcqvr6pzZ0z0d/Qttynq9vVIC7IXx7pX0boQdGIjMh+qw/a9z
	qmUpmbo87P
X-Google-Smtp-Source: AGHT+IHMrsm0AhKZ4mxrKq0whnPbOMtn+oYbW1kyLfNZfETx3aDUo9Yw7egcT4xWVxHT4REaGRA6rg==
X-Received: by 2002:a05:600c:8718:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47d19586ae0mr407394515e9.27.1767167679131;
        Tue, 30 Dec 2025 23:54:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/34] python3-flask-cors: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:04 +0100
Message-ID: <20251231075436.771395-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123042

The related CVEs are tracked under multiple vendor IDs (but none
of them are associated with the default "python" vendor).

Query from CVE db:
sqlite> select * from products where product like 'flask-cors';
CVE-2020-25032|flask-cors_project|flask-cors|||3.0.9|<
CVE-2024-1681|corydolphin|flask-cors|4.0.0|=||
CVE-2024-6221|corydolphin|flask-cors|4.0.1|=||
CVE-2024-6839|flask-cors_project|flask-cors|4.0.1|=||
CVE-2024-6844|flask-cors_project|flask-cors|4.0.1|=||
CVE-2024-6866|flask-cors_project|flask-cors|4.0.1|=||

Set the CVE_PRODUCT so it matches the relevant entries.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
index 6606b3037a..d3e97dad9b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_4.0.0.bb
@@ -16,6 +16,8 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0"
 
+CVE_PRODUCT = "flask-cors"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-flask"

