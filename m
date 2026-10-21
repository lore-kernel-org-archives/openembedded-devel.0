Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8862.1792580486910860773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=g0cPBfZB;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48bbb06e746so310893f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580485; x=1793185285; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IbQepS4HMQU188vUrQMCFCH/bPJZdjw0Wzc9T6fjn3M=;
        b=g0cPBfZBc9JqfyM5eRVENQaWiDp4l4MVrn1U+v0Se35y+eTIY4NedZ0vxTjOoH9kDc
         3iG844IuHgGsvwwoBY//4PbLa68V+CSSm4rBGY9iUQpNPIDUdwKv98Uk5NOn9f0CSZf2
         AA4cwGkBhghwcAH6Au9JPSNwWwH4nvoLqerzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580485; x=1793185285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbQepS4HMQU188vUrQMCFCH/bPJZdjw0Wzc9T6fjn3M=;
        b=BpyNze9SniDfvXABLPSvDALbyGjZiH2DnPom5mDa9Os6iwlbjf6Oq6elIX3GFDnvsY
         rBmb4gLsmvagflhDHWkRgkCGr3N3Dp+guO93EIRoQ6aHazfWSuuj+nAkphLcm0rl7qKk
         0WXcjgTjYwNMia1MFDwGDWgBA6Ev8bfTuhUrwdquwb+vIvz+v71fj6wUkVl+fGRerM/N
         hIqw8m+ctsnMe1wVNJvqSVAu7VILvEhHGLHjMRuVoCh7qqWj4C2n2u1XZrzYVPlq0u16
         P+SR1M/iBdYfxxRWwx18qd4jizSTOhixj6k0IttvVt1HQEIXwyFElC56zY849GGBKSxy
         xgGQ==
X-Gm-Message-State: AFq9FYKvc0s50W8/s++gtpZm6tcv9fxSC02RYnbXgMMX2yCyGK5yyUGz
	64tP0r0YcW51wHh8Ta46RXNJVWi9BJau/82t+8hqdp0dTOhGEcUMEM5Llz5JXq3iXSkocd1Dn1h
	RonMv
X-Gm-Gg: AYBFou1OAMowWwxNXU8R7L4PWzeYKS03nQ6iVwH/SRrTMl4X0T6ZvpsvWXGi/RZBVEN
	2z5FAUMABs/zk8WlyOr+vDbqj2c9bJGZpVF3jvJB1ODHA16dGmciJn3WQNli7xQpWgzQEctNsvB
	F4Qf/2Hd3sjm7WjbFfb8sQeWPBuUICYai1a97PwiP5P42te7EEpDxam6xmNZ6waql8/6pR12PTn
	KLcOtoSzWy3lC9FASRWmzTKHnOv5Bdf6EbwgNFBX2ags5s+PkAbeJlnHj8ktPhH6VVzNeAZ3Iqj
	czRAJqBAVb2+W05DIT4BHepqMpvziDTPZ4mgppOrM99a9zODDjoMILAXw73QDu1Chs/kq3t5e/P
	VbNSbq+kwD5Ssto7CaOyoK1SnM8oNkyRgO+KyBnxRNCsr6GTaXSBryusxuAqnBG7XhbUPM4Gweu
	MfPq/G6A7CCcE3Ng1Km/coWUUBV/wcNUdcZdgzGhzaOSFRJn/afM4Ay7rfNwQW6sw2+DR7OI68/
	RdlUZV+6n9JflhPUeH0wzZnmkxRvYb31o+ztko6Z2BlX9qJ5ZmXzgY6XBG6+tGtyknv8vJmX6EB
	TcCl/z5OTJfpgbIALsF35klUG2RjJjNCcIWa/CUqxgKleq3aVl7zNjsm+NQ/uhSwlLlmaRYO1al
	yvFCHLlvmNt0aBo6P7cSo6iF1mQ==
X-Received: by 2002:a05:6000:4025:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e265015acmr3208301f8f.41.1792580483295;
        Wed, 21 Oct 2026 04:01:23 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/36] python3-git-pw: Upgrade 2.8.1 -> 2.9.0
Date: Wed, 21 Oct 2026 14:00:33 +0300
Message-ID: <20261021110103.1943456-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131268
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.9.0:

- Drop Python 3.10 support, move dependencies￼
- Resolve deprecation warning￼
- Bump actions￼

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-git-pw_2.8.1.bb => python3-git-pw_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.8.1.bb => python3-git-pw_2.9.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.9.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.9.0.bb
index 94a51dd713..c50bb08e18 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "fed2afca4cb66832a416404ec02140a5311d8ce7658c0fdd92cc022b0cef8266"
+SRC_URI[sha256sum] = "6d7f5c9aaf57cdd9bbb7f8de76083d62a7775d36052ae81c6215d578e6c1792c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

