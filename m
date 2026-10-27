Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14847.1793092866546447508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HA3oc3IK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso24779585e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092865; x=1793697665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFMOOOtzJe3lY+IXmfXLl+7tFD+1JFTYyWg476V6NvM=;
        b=HA3oc3IKKrQidD5blLkpgvslcC7pQWBBj/zTaKIeWTvRHptHVM3UdciwhiWYRftxKf
         KIQw/qMu6JzcZSY+X0WZWjbSlVJNVlC33RwY4R7lAM3Oq6UfXSjNf7sngKgVDhw3odgT
         +S8YurXswDOGHn3DSEzER9bgoR+fx5kbPJtyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092865; x=1793697665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFMOOOtzJe3lY+IXmfXLl+7tFD+1JFTYyWg476V6NvM=;
        b=u9yl9Ln9sVVvcHhNnT8AMIKa1h7pCy2uyeZ3ooViIocN2zf+GNTgJWzSauzV37YiKb
         uaaSXdOfpEezi/uZ1u1HH1hsIfJY9hFrUJzq5bmuXrYsKeX8lPc//lHFtjp4/9GosloU
         wDdBI8DfwqGKT5u7Qm6SpYUykxbRu7rDxJs7M6mUN2QpBF/xncScyluu4D8fCeXgMMpa
         S4Djp1ZFbo2Qstu26iXYgo175zHOsSSd5bBw/+0j/9j6hWI2xY33GQV0uO8XIBewydvM
         Ktfm8+0h5a9l/5onG9UGUQ53XSRETPaVynQmqu42gvO6R7S8WbZq1O1cASYgdT3DE+aE
         A/6A==
X-Gm-Message-State: AFq9FYLdb44JPBvR8hQvvI8E6AwCbCZdn9kQm7kRowhINfO/ybgJltUA
	wdZWOJMLP1KZoEEhmRnLVPGH5AkTY5x5fdo+I8tr8b71NlkoVcdNLCWGGWlSw+RN9X0A7Vnqsyg
	6cpH8
X-Gm-Gg: AYBFou3hyqsj7yExUokb836M9OjkBL4eisxBcg0gsqa/RKCBqurs7G/YZ7ajvxwNyos
	9dkTKC6votMOwx+bSmanGJoOIG7gFEvhJfshs7ybuhnxSsCWSkHEwRMtDirmBFzIrNh9XdHFYMB
	ExFY9BncVKYiKQw9jwtsa+dp9SUZC2pBkR0kSbajwfgUNDe//s4UUdvLsFyaKv5VWWQVwHLEaeU
	40GjRxcR/mFup+Byh93vlmGU9syDWN+JHoDMpl6I/Par2YPxVw6wwfsXVrF/oXoS5iSx39E5PfP
	0AEAot4qvqhWzZQVpBd4Hx0zSy9MNG0wNW7pn7ow2mlMpy+nTSSxq8lVq/TyjnUavcQveOMhXBc
	fit1yYUXQY9dNPskQAkKDxwIV9jLtbx3pgcEks258ACU2HtW9xIQ49Xl46Gokd7leJJD9hgz0lI
	Tzlr70qLy8+40jMJcBugQCv/gn4ErX+lgIGM30/QxvraCaC6G2Z07mqTRxHGyRhaiH9DrO7nJ7e
	4EPatXSi0k/lYfXVK/9vvod0FRFNtujGUrmgQgDKApSsNWObDhiOo6lHl317RGSk7A31/LZTqPo
	4TDzqpDGPX63lrjRosSdss9OK/oqrWs9LrU4Er9wdlny5kiRKXsIJUmdXXW8HbatAmx+r/xMu2T
	vc8Rf
X-Received: by 2002:a05:600c:3b11:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4a35acbeeb3mr181527585e9.27.1793092864757;
        Tue, 27 Oct 2026 02:21:04 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 30/61] python3-pytest-env: Upgrade 1.7.0 -> 1.8.1
Date: Tue, 27 Oct 2026 11:19:57 +0200
Message-ID: <20261027092028.782979-30-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131494
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.8.1:

- Respect explicit empty native env_files over INI fallback

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pytest-env_1.7.0.bb => python3-pytest-env_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.7.0.bb => python3-pytest-env_1.8.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb
index ad30107b0b..c42da7c67e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "0c1dc1101fb8d3ab3611e8f8d657ba06c3c0c167fc85c90457e5b27f2508f43e"
+SRC_URI[sha256sum] = "996f86ad78b6c7b5335e0d493f9e9ecd3e421174e056742856f91da439e1cbd9"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

