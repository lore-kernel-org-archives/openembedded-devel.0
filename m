Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14663.1793092865196701190
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J0jbfBVI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso8527265e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092863; x=1793697663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQA5kN66dgY9AZT3TKsC/eyWlBZ4PBN8Ut3m81iQPxo=;
        b=J0jbfBVI5IHvjf34W0iOa8Q98uGNLLzhTB6xnFr+RpWlQrI22UZBGweV35M79DsL+U
         rIfysq5iJzmWNC+ZblY+pdLQ+OWC5yEPT8nBOceSvwaKVeaJcJbWMV+++PJF+W4sEHJa
         t6rHibP8FjmHTAJas6Bd/BGRS4CpXNr+99PI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092863; x=1793697663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQA5kN66dgY9AZT3TKsC/eyWlBZ4PBN8Ut3m81iQPxo=;
        b=n6q/Cdt0/dL0lib3JZEqkp8bMJamsbw3yTTkXY4OTdPg+R7//t9/1LMjbPIeiK1z8a
         HERXKOQM4YC0HeGAtjl55rhiDRoFQNwJcfXaaRvm6/Eu0xcEL/fiXkvu6jkOcViIPEzY
         ySTeY9Y//un+BEAdSntt95tp81abT3nQLpQfoym/++skTxpH8wB0R4CVhoddJz5II3i/
         fN+7pLpFjncNkuc0XnJJgkOGZi7Dh0p0rRV7n2xUdVTH/Um3MgOSmqBNZX7ZHpZDN8gf
         /dMT2uu3JGcF1fqUpmxE/aE0J7UdD6WdTnSuhy4S5lKpf+mYN+w7zUh0M8ws2YUMrIBU
         Wtvw==
X-Gm-Message-State: AFq9FYJHfOtP3eY1wdaQcRtgfX+4zBkMQu8tZ3YlR6nIqpdx1uKmXhW/
	Pl8QqVDO+lLlNoZ2fIX0ceiiudIlhtbKaMGbXkRS+57+AdYr68T2Tkt7vd4u9CftbrApECY9kGJ
	3chGX
X-Gm-Gg: AYBFou0S06pOSvkIYhNQvoTgIZtW3QYEqdKuC4jT3IXHWG7wn2XIPGg9w+tU2tUe0Tu
	dmpjhmnMcAKTiuagwTxXPAx8WR9R2iYhCrsdpKse7LCvMvQebMLNb0Phed1Xh/L+gICdJLsvUSN
	4PIEIZgsrjRDfQ7g3pRbWMMA96V81//UPaKBueVksZM72c1Fff7thgjmSz9ZQY7Kcn2GZU0ARPi
	v5xdlGQIC8K3Rz9O60Ppo9j1/GOVGYBI2wfgOkuUH48tTQvoa0HEWUsKwl3WmOvmI6XgV9iYnAf
	h2E4Ag2yc2A8s13DbrdzXNSqzk+WrVggnOZ/N7FAcW37ccF8L1UmsCO2oXmWXUVkaElIFNTjn7L
	15AcSMMnyUQTdIlyG9xdy6msgeIu4yBVwYtKs62PTo7G962D5P7UXUe5qG0H3tfaAri8JLAVeID
	Zxjv6Cut3hdfUE3b7caWFfA5jBoTl6GczS2dLMHGku8uyHAzraufwtdKSM4uBHfFACaY/k3LhZ8
	5nofkhw9QKjE04mMRUS5Ll+Jc73wHabDuTd5LeFpobqrnoK25nmyisBb/AnzJwY/cSulU8dJAy7
	vkAUJmoldk2m3/8FFVF467nGyLsG3Dq1aSEvUjBsaVXftsS3BDw9DW3EozTUeTr9VBEz0rmLQiE
	13rRa
X-Received: by 2002:a05:600c:840e:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4a35ac3f101mr172428335e9.3.1793092863282;
        Tue, 27 Oct 2026 02:21:03 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 29/61] python3-pytest-asyncio: Upgrade 1.4.0 -> 1.4.1
Date: Tue, 27 Oct 2026 11:19:56 +0200
Message-ID: <20261027092028.782979-29-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131493
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.4.1:

Added:

- Declared support for Python 3.15

Fixed:

- Allow *AsyncIterable* as a return type for asynchronous generator
  fixtures decorated with *pytest_asyncio.fixture*

Notes for Downstream Packagers:

- Source-tree development dependencies now use PEP 735 dependency
  groups and uv.lock.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-pytest-asyncio_1.4.0.bb => python3-pytest-asyncio_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.4.0.bb => python3-pytest-asyncio_1.4.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb
index c1803e3eb2..9e49d949d4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42"
+SRC_URI[sha256sum] = "e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

