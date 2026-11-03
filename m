Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8044.1793701467453816238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NWyi1ePK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so31992855e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701466; x=1794306266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMtztowWgdmzZhSFEviImtD7+qYbVDHRn7I4G1K8sVY=;
        b=NWyi1ePKPcMA85UN07tYvHf1ubRDejFDphkKJpJrnrWl5YyvaUQSVJa2IhTsBiRmkZ
         8ED0cqQ8+GobL0F4MAehw4VZqIUTcE2rJeMVdsOGar5DhvFD+K4nUu6WoBe2Urk3XkeG
         rUlO4hFRnzLeuet5nNXplCdQSZ5AnmQ90qeqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701466; x=1794306266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMtztowWgdmzZhSFEviImtD7+qYbVDHRn7I4G1K8sVY=;
        b=OIwP7TtCfslTuJMn8KU3M2mayccaxoiFT+/NkzJgH7Aqjzp/ee5sBJ8gUO4kUja4vu
         xJ91i8T1eXpkL+kLNxCAguYLj/P2iWQa6OXvotf6xICx0k1S73W8YUmebefMlVYazeZM
         +wtr9gixekIMJfOuekAJ6JrVOx2jHxu5MvvTTCuPcOpGVADlB7AYPZW26JOJuMMTA43U
         DxO2nmA5YWHmWLdcS3cQH4fCAEflYHmw/Lx71b9Td+EzPerPsB8SpD+M+DAzeOQ3AEAu
         ugr9Mh6pYHem4/W0KQzpgBx6VX8UVuhfjKa6uFx8NAbJJR/pGFeVgeTs9i7fW5RgBWiV
         mFIg==
X-Gm-Message-State: APuU4Z/oteNMcUVMX5/htzI1F9dZrfM3Kz1KH7VQUoDqbA0/7x55Cg3t
	Rj3b9UvPWf9Y+R2581Lp0SM6Ub+ChV6HbLyVpXouP+Enf5JrUlIrI7FV1q0N98F+WS61/BpjV4l
	O8W70
X-Gm-Gg: AYBFou2Ex7R2yjWJABlRumWFezx0IVsIAfBzka/TT0HNtI/6kuV34mq+M3DTqBSb4hN
	7cK+wSwGXnmnUqPw3DsAcW+y1iJIdBzGGDsdKHpYifeIc9NU3hkMmMSJFkIGyJ/PMXhdTxyKc2M
	3lJm+mytapkKCd1GHecjzEGw0qSczvLhPqq8ROzoSZf1sXf3c96Fwi8hv1JAK4KlPQInP+ei/14
	EBJNY9ztm5/k4qbvLlMNX7RAFFvSuMdDRsA/Bv1dgx2sVIu6c7P+7kWmTfjQrd/feDe5Uhk3AX/
	FpfUdPFXWd0dbem202rYOKWNOO/gUp+Q/RHY9NAxcQEhFVuYQ5VaxoZGE60HleXtlY7lFzDHTKx
	sN/PX8a3SVr6SZcelN3zda0fcU1M/2w0jD1pEsGLEkAI1QULRA4bQjOSzhVWQz4h8HHCPBgozO4
	T6nZpIHjEXNFDNmWxeL1ObY6FgTFfV20lnJgqITbRvpubRHYB7uHoUGwao7S1IxNhk3j4cIsh7k
	s1ZkJzs8K5ueEo8ck2Z69CxtMLnHzgtjTKPLdnA/ZA+NYtadjGkXF5bGy+6/tMXymM3vIbTEVur
	7Mqa+Xolaqhb/I925YrD6zBzBw7I8zg/zoM8c924P+//IykYqKGixhGr/TD98Ll0D+BTBFWxFaY
	OOEcyigNQtAooz1E4yqc5Oqe/OlWTy+QfAkIxOcAPbuNe6ei8LOykHQ==
X-Received: by 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr241751895e9.33.1793701465811;
        Tue, 03 Nov 2026 02:24:25 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/22] python3-socketio: Upgrade 5.17.0 -> 5.18.0
Date: Tue,  3 Nov 2026 12:23:45 +0200
Message-ID: <20261103102350.1952237-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131780
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.18.0:

- Reject events over HTTP before the connection completes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_5.17.0.bb => python3-socketio_5.18.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.17.0.bb => python3-socketio_5.18.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb
index 027b1b85dd..c389adda0d 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.18.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0"
+SRC_URI[sha256sum] = "81ec0fbc34b82009272834145a8fab82ccc36eb057eb2c3798dfe253fa47ed72"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.47.3

