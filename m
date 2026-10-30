Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8935.1793358204175018578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PIzSCVML;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4322d310e7so81512966b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358202; x=1793963002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhrFYayO1qCnRtteLdg3qTIaDs/ilnM0eRIA8QpJQjQ=;
        b=PIzSCVMLogN9nrhrH2IXQv/oPMcIs8+/XOz5jAE4fqzozVrs2ZkxB0housT6oZP0ON
         LF/GSCudqpTQkpQCxeBiqytvQG3uVcmlilMl/cIhApJKYgrNGECsCwE56ta+lseO7eH0
         A2DAUbSlXZLl0znQxdHY3KFSBBer5lYaX8fBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358202; x=1793963002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhrFYayO1qCnRtteLdg3qTIaDs/ilnM0eRIA8QpJQjQ=;
        b=W8/l2ZtKhNTtQMCeE4XeX3nPpKnlhYTcir5Qm/ZKM5E27k7TZ/yYy0dmdfCYRKqt7U
         bg9NEEHu6APkh6Ka2ZJRGCtvD1QGNpD60xt23QNImVhOmSu6sgrazng2BTEB+Ua0rOPO
         Z8RaffLlqQQWpQ8mW3Xfki+FZfqKSXfHuTO0omsn3L/LPgVKv0xRAXX/nJpJbA0ybBjq
         RuALP41GLae43F9Qt7F8nUubx6yP6z7ZMZUiV1VvuhBHrzBbgYSR6MhkMYMLcIgYtd2s
         /B1fNJk0CvavzH44QoTRqtBx7xu3yWOMrQOCBksaTGhpCK2haMdFvnb4+7duE6TQpuIf
         +hDg==
X-Gm-Message-State: AFq9FYJeQKUxk6fjbzOl5KjBA8H4lxbN0d2nd8DFytwoZgPybF4NXvDD
	kfLJeW+Mh/4uu+4tmCthCpV/pV/kXyn9MajuGjxgL1OJFZlotc5BLO94un5ZBdpiTHQt29ppRmn
	qzzKJ
X-Gm-Gg: AYBFou0VRHOFqB1zPqBmdQ18zGMqrgA36rCXX89PFZTJ4cDfZ00evRQh/x9hfJaN4Y1
	+mMIpdjq0k6i0rhyt3TIaOJ5wCOtjrCPs3x17nsdvsgb9x+yoeFKlRmAHAzLu5uoqnsx5gjra8v
	mO+dLpGSgd47NzqVvKVn3c27dLgX7gM2iTfXAF8symuNVfS6k2NWHyqbMGOqrwcIbTfa6o65tog
	uqU53rGbFaTeL9Ufjp0sRIgEk3U9/TN0/d/v0/+8DIrsTkCmIrIlXNYdh1W6aK4c/xzpg4aGpzF
	1ISK1Qtda9KVBjkRWBIp29pgya7ltQJPyAf7nQf2iFCYjWXW5AGAv7ztLFYcGyeaTdi/sDtJEaI
	MkAIITVkDSRPs7OTNurG5ECWs6tUzE9yB+FzFhJ0nP5ZnPhMAyoZaUzdLZt/ivZwf5yVj/6EQLB
	YRU4amj6RlxEaziFpCkur1qYBTi9vNcKFXOeszjj0nSHUWqlZVVdyCKUhtkwddsJyFMzh6LruFH
	MwHs1gWi36sh08iLBsb4OTaQdQe9hr8OKyfXW42Go/ZlA/C8Lyr0v9Xz1H/z90YHmXUXviqBJM9
	NkRp6i7i3lj+XAiRDXbEpug9YF0YirGexNTVZ2PnPnkk+gUpv4+6tqVtDUQ/Pzs0+Nh1OU7BSk5
	ZcMgHqCjKrSFREEmtXkNRwDGFVq+g4kA7uhRZasSZNKs2kyzFKaZ0n9kXRLEcOuNmbeC1XB/xP/
	Q=
X-Received: by 2002:a17:907:9614:b0:c33:923b:ad51 with SMTP id a640c23a62f3a-c4ca7aeba10mr177602066b.45.1793358202081;
        Fri, 30 Oct 2026 04:03:22 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/25] python3-importlib-metadata: Upgrade 9.1.0 -> 10.1.0
Date: Fri, 30 Oct 2026 13:02:52 +0200
Message-ID: <20261030110309.1124614-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131690
Content-Type: text/plain; charset="utf-8"

Upgrade to release 10.1.0:

- Prefer valid distributions when collecting entry points
- Revert "Prefer the greater metadata directory when a path
  supplies several"
- Prefer valid distributions when collecting entry points.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...b-metadata_9.1.0.bb => python3-importlib-metadata_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_9.1.0.bb => python3-importlib-metadata_10.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb
index 0cb85498e6..10ceed1515 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=affe5a7d8b988c3db245c01075b29e17"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9607fb24f95d4e0b1c17d57ec4604357d76d3f0d154f19fd4861f2e31c8e4065"
+SRC_URI[sha256sum] = "82b04047fa09792c1a8cfeddfe08bec79e4b13c29c8469b0d3949860f61017e8"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 RDEPENDS:${PN} += "python3-misc python3-zipp"
-- 
2.47.3

