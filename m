Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8710.1792580469556210673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=A29M+BYk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso477404f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580467; x=1793185267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nGdcsY9ZWCjQYlQK/9Qj6LAJYjCCvaQwq5owrMRZic=;
        b=A29M+BYk4DAm/wv/EkvSg8ST9IFNAsHdm7HEu9YPc/khx9xDN50BUnPD+K6e4gVFHw
         ns8LvOepMVWe0/6QeWBgIzkQzzKy1NYWiP7bJYS+1xxNsuu8SXT3urCj6TLpP67UNuQu
         SBP2pKuuJ5pEtIrL5b2o5FRAdw4UcdJ1QbE/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580467; x=1793185267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nGdcsY9ZWCjQYlQK/9Qj6LAJYjCCvaQwq5owrMRZic=;
        b=VPRM7LVkPSbuvuymARic2r4FRSmJyfimjc0cyHsNzcovE3MQtOuaIiQ2vhZOFNt0gX
         TU+CKZtk9d3sbGPzQtj5874B0bTeUPG5HM5ggSwp53q4E5oNQ2e5kdsgUaXvARcNYWmX
         sI+sPPZ7dsKraCswVNejTVp/yVlJuHErE3Uk6OPXoF3/2azTKZrpN2ztFbdLzPrcS7gU
         nEsXJYl47MLWpeUzU6zm3BdJBLOFd97Z9olfS/vVQf3skvRrMVL9BfFVq2KoMMatkvcV
         Mq+Xr4+ZSUwVogi56wlSQ4Cnu8ww8W/IZ9RaRijl5lrn+A+EozuzkuQudj6AFkZLGnNq
         VsKQ==
X-Gm-Message-State: AFq9FYIJFXKsGKAD9f2wmZZKvqwD/IF4NO0BbAu30cU8xt3LImSPRT1D
	QjaSXz9mDj2a8OVo9QXSoymnSgRICkxIg5XF58jDCjnnvLCsYoOm3z44K5pUTty0vXGX4NRbq6V
	vF0N5
X-Gm-Gg: AYBFou3D3nv3giFli4OGpqEoa3Kq1pYoxapmDoGUwqfFHDxwBsyfdkd6j7cb/JgkhQl
	2G9M3LKmy0D/N1zJtRAu++OWcFAknEXqRnxRuSy6E+uBZdC+kIvh2EMqsdGcfKkm5TFXILl+H0m
	DyivrHrOJOt7RIcVDLPxZURMcvffiNCd+VV7tUnyTQNsEgZaSP30NDGolFXqvzSCj4uGPaylSss
	aq7BaNgcYgesoyFEXcYsd9zyhjbQkEmUWXEc/nQAGw72fGBHTpOL6wxWMz+Xo2iem03ErcjFr4X
	MjNpNIOlD3X/lWNVUpPmmeiIFiOJ6C1ahBiUo99q/SaNi5/8OnXRHxODtQ2EO370LKUYXO3ITI4
	GSQz83SYuUd7RnqZAmd9gN9yCNB6XY8gHAcvOGddw/LCq0lHDS4U2vuTP04d8LCdyYGwWUek06A
	NK6rafVHCPoecunrjT8IdYziLXqDBO0pO9OYpzTTYLzGU6xtgk1wXYTtnUgf8Xd5oz9FfgjbwfA
	RNd3vYxLfGDffNOyJDDvHstcZqyfsKepAW8vS2CJmjJ32BTJsq4Pa99uXNxsR3D572rcDd/126d
	KX3v75edfY6wDwayozjCops+Cp5J3Px8qaIE4bgV+ngrqDuIjie5Supy2+0L8XZjXJ668DkleYe
	GMjWVVARKVmakzFnjuBL36zODhw==
X-Received: by 2002:a05:6000:4906:b0:48d:fbf4:8961 with SMTP id ffacd0b85a97d-48e264ae1aamr3305022f8f.23.1792580467332;
        Wed, 21 Oct 2026 04:01:07 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/36] python3-cachetools: Upgrade 7.2.3 -> 7.2.4
Date: Wed, 21 Oct 2026 14:00:25 +0300
Message-ID: <20261021110103.1943456-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131260
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.4:

- Restore autospec calls to @cachedmethod decorated methods.
- Improve branch coverage of unit tests.
- Minor type stub improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.2.3.bb => python3-cachetools_7.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.2.3.bb => python3-cachetools_7.2.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb
index f5df92347a..8d3662103b 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.2.4.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a"
+SRC_URI[sha256sum] = "e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

