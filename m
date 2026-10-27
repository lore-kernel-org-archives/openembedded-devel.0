Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14871.1793092906100526824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ILjG/rX5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so25898955e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092904; x=1793697704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIz+750Tzqf0O7idbS4pbagXOvBQ7vT4/vZC/oIP2fA=;
        b=ILjG/rX53nBeD5QKLjnctmeNo7g+XF2jYk5xIfR1Q3n8E/i/qhZmtLQ9WnEeyvwh5j
         rQ6bcSJfxTtwniZTL33so3p9WZ27ik8yUlbUGmF3xxlcphEBqp5YjcVk3StFonIzX2IL
         hxdx+p9s7OGt6UmnwuJ/gQ4EiAxT7Yj88Odgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092904; x=1793697704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIz+750Tzqf0O7idbS4pbagXOvBQ7vT4/vZC/oIP2fA=;
        b=1ht+FqmFq7SgASt0rk0uiSTeVYaf9xp9TCF4QCUvcs0TqXvaPgKZcORREyWi+4Tdki
         204VjAV2Bs/C1P5kzh0AylbycRSLbuWbywgbyZwQQRaHDY4SehjcZ+ny2O6IlNHhm3QU
         OCjdj0/Kvn/eWvgMagousRq3xmAp1tezLKRz8aumgYVKsEfwWFe79e2JyjrH3ez6lK2R
         ScVIgenE4NyLht9pz+f4niG5hoCn5Dws6dOqVP4hT0N4SHgJx3jQ352Bv2vLeM595Y2Y
         YuQQujLmgAdhPfafU0Tf5rpSeFgvuAFq9W73LltxlDyclXgfjMO4+w3nr0KjhWtkdLR1
         gJwA==
X-Gm-Message-State: AFq9FYJKq568cmiR6D/vb/+tc8urrg8HrGA8z1+btjzMbgRstIZ93UjJ
	PCZ9lByD2xNY7JouGWpzHY/Yzr1CfeH8GCHSJEtY1R0mQ18GAefZQiNPlqOC65fM/6CYaq4gIwc
	V4Rc/
X-Gm-Gg: AYBFou00Q43TPWOryVvfsnaizNHVJqQ2tf3t+GGduowZMIko7SBvi/tUG/ncdza0E5v
	3waNVH0maE60TiVITdvghrt8KJuAsfGN32gRHrxN9Zs56Md74xDKKgFrKXWzIBINOJUPbxrVTs4
	TIZRuuuTLZtYT+YJ6MjE4PyK+TPtL/VBDbxpfLnqUP6P5g/qxlWVuOgj05TfKBNaDbOSG9Xm26b
	z2sUwZpACPzgfqe20oBze9FJni0nZ6Cd4OMb3LGrHaFNuMQXbFh6GjUqqas7acxOub5j1lVvN6Q
	vFTLPJr6EvcI2zkczyEst666+zc4toaQd4KVGWfIE00tiRHq4iPp5ab9trg28bPyp1Ictsh7dIy
	/I9aqd2y7dtLPox3MUsLJChKKzogkPjAly9xUZpUCrDdwm+rQ+EvoPACE0PXazfjlXYy1AEiL9W
	GqK/PzesdVM+g9J3IZFBf1fSsp7Uifjw9wRHiluSZVe3WHQMlRBWe/Bo/XylbDVDsVdMLwyQiBj
	6HB6zAhnTqTciNVDGq6LCi3mmrhjkhAwzrA8ZgZ9jJGb8dj1E31jEVvRLICA2SxV+LABxo4JrV2
	6AobFfAUwxRhH4EaFBtg6ntxV1w/O/5jICU33M7NI1s+CkkxfWqtuVKfDD/da+ffQVcSDGA7+1x
	hjVaK
X-Received: by 2002:a05:600c:4f56:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4a5a5cae166mr146692185e9.30.1793092904401;
        Tue, 27 Oct 2026 02:21:44 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 58/61] python3-xxhash: Upgrade 4.0.1 -> 4.0.2
Date: Tue, 27 Oct 2026 11:20:25 +0200
Message-ID: <20261027092028.782979-58-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131522
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.2:

- Improve type annotation compatibility with hashlib

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-xxhash_4.0.1.bb => python3-xxhash_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_4.0.1.bb => python3-xxhash_4.0.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb b/meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb
index 4a9a995414..fd2ce3be5a 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_4.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6a4f6d709b13927e4d5e9ff13cf8956"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "d55bf4ef10eb09b8b6866790e083d26d087d84caa3cc0946ba87c3ca7ecaf7b7"
+SRC_URI[sha256sum] = "af3d1b3cfa5280e84d8968e9f30c9eca75781db4915eb6d6acb0dd4fc93e0f47"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3

