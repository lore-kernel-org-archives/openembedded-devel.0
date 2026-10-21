Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8885.1792580517260908859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U1Kl1u8+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df54150dfso366147f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580515; x=1793185315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNRXEi5KY7QcH7Hzq17w3Qa+Padz72ZAbQTdhKlcZNo=;
        b=U1Kl1u8+mrbC8Gbocdx0/hbAD/pVDrAwnDPvHHqbuXpL70SYj5Vz2KdELCHRVn7eFu
         eijjRN6woaFIvIt0gmTcmWwfKwQFowXqb61v8W4mAZXwfBVnZrgmHX+kniaOpyXxhh4G
         UYG4PZDPBQ6PguA7tVF0qLhwQ5u8ysac9x6aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580515; x=1793185315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNRXEi5KY7QcH7Hzq17w3Qa+Padz72ZAbQTdhKlcZNo=;
        b=z1SgQZozwSPNccGxMfU/gwT5fRepOT8nsnzy6aTsw79Lg6bybNmHBYZkAvEIv5MaTC
         zx/1rkYFNMWwlitG/EmIZVOBlAH6lZLO2JP1AwUm02SCIdZPXiTukHtVI5u/abSvkIqw
         GRivBFE8lwPT1gyDEiUOmrJfenSOpUMogQlJDSVaCqeogwvXsD1deY5nKFg/PgpFOJZc
         fSixn16zOevoRKsvu05Co3aMjvuEuDyGEryGPJGFCCEFmoAUbpGnZEj+U8bN5TdMnDV5
         R2a7wOBGBHUtyVgD7Xea16TPqkUGuzk6dlG+KoiGz/HuCOnjZWaFoxaYNN41eAignA1p
         p9DA==
X-Gm-Message-State: AFq9FYLTDT22A8ITpLM5xs5LAFfLnMhI+zvxSaPsdRSA1tNXWLI6Giln
	Jk15/77ZPImglARPR3SzuZpizoAISZ23ycjxm+THz/kzYoWf3tuj5lna4IBIp0JXkT4Qo03I1uB
	ALgXG
X-Gm-Gg: AYBFou0Hjrj9c8pWoikBJGMu9uBEfBUZXZVIs+tAyr/P+8c6bNiq+tADOZXqvNiO+UM
	kZ6TSG++VWag1nAgmhN22Zjh3ZpMSlooC9FWUy40aXTeumjKY6knUd0DRXZXQsnPW7Cg7dKUbYf
	Al+OS4KbO13WezjvHUWAmhVyguALDO/U5WxVuured5mf6iN+OVTIhBS7JTfkBPRw2U6EgZuxA8+
	7gUaAgO0nDMfUwRombZhHsmM7hB9YwS57BGpYNdwTrdbZyluTGwg4vMhA3UjuKdr8Zf7NMCeXqu
	/pU+auFQMWmNnD8ZidyGGnv8B4I1hgQsd0O8cONwXmwT5xsA8CAgEPT2j7WcHoqJJIyXnEvT6HB
	9sgdytHXRZ5dVoKF/yY9EZnKhbWoSDBELVsolD8si4168oZ+EYzU7h6a4mngokyijGFaxz/Wpev
	MFbZEz25a8F3gG7J9CiShCGYoR7VLhCIxauEJQ8e3vRr597aH3XoZ6+zqjl6X+nML7+zwoV4Gmj
	rxw4xgICapW4Y0trzL6cbnfKguHzFoemu1mCM6ICWGALVFyBvsqq3Y1amlnor0N/1YiaPfizFez
	WitxcK2GqgwWDfVErYn/ccQxQyNEDkoLazHSEW99sHdhRwtcdJkSxnzI+PD1due0zqMK7p1vGQp
	da6IfMMS8nOJHK9GQmqKAma+eVQ==
X-Received: by 2002:a05:6000:46cc:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48e264c989amr2201472f8f.9.1792580515314;
        Wed, 21 Oct 2026 04:01:55 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 28/36] python3-msgpack: Upgrade 1.2.2 -> 1.2.3
Date: Wed, 21 Oct 2026 14:00:52 +0300
Message-ID: <20261021110103.1943456-28-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131287
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.3:

- Fix memory leaks in the C extension when map key validation or
  container hooks fail. See GHSA-j586-36cw-2gc2.
- wheels: also build for pyodide using emscripten.
- Support packing Python 3.15 frozentdict (PEP 814)
- Reject negative array and map header sizes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgpack_1.2.2.bb => python3-msgpack_1.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.2.2.bb => python3-msgpack_1.2.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb
index d71a99fa74..09e1180635 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a"
+SRC_URI[sha256sum] = "32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186"
 
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
-- 
2.47.3

