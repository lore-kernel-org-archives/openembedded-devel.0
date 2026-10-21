Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8838.1792580887622377357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m+bPRJhZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4070875e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580886; x=1793185686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wW4cQtnnkdx8jRFvbVy19e/73y3PRI8ktA18U4yi4R4=;
        b=m+bPRJhZZwltcaK4aCCkFtEFVRzFSiAqVC4ZKqzq3FAHREIlrCUIK3rNjgBALNZ3ts
         oxtbwh9jfdWQ5OsX2ylmVDkH9Nz35cr/qdYOlhVG8TqiLqOHnd3hTG0ctcs2vYT6i1Cb
         9zSW4O9KdSLUh2YStVRNbes80MrL0xuu4pvNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580886; x=1793185686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW4cQtnnkdx8jRFvbVy19e/73y3PRI8ktA18U4yi4R4=;
        b=HB3yLHoKFgDHQZ1R7H7k6SlpkU67B/NjhJMs0Jv/++aNnhmVxSve2DG5KKthLAJVEO
         Tw8WsHketGmIAWaYuHdBULV1XhyURNlqwLFHE6rnV55WfOZsMpWwBLLWC4AAf/1pZW1D
         FiKet5FHidbNQoy2YR3feNLe1ThikOlVp3Ke8OfadtZiSb3RPJwJadPPGvkb6CHfL4vL
         g023W8/4QtJI2H8irVpm7B1quH3zhxfHEbfq4OQI+PE/nTP6eu3qKvWm5fnGFyAvi6xb
         l/E1C047isKGS52n/PIZBqAKKQfUJFMg5OOpnbr2z0YYMA6nBCRSuVhmlMAWk2kqE7Sw
         bQjQ==
X-Gm-Message-State: AFq9FYKiVaSgCS2y1NzCO82oFzzp5SbTzvSNRKfb5utE/un3wP7pYvWx
	dlD/egeWHSI0UMffmZVxEu0mSMqpPk0aa+Wko1XNEoJpEV1aH3onvqr0KiknN9sBP2A/ELVvyJe
	2tbOP
X-Gm-Gg: AYBFou2yd6McAG+2qOxCXoafr9PRr4fKx9WabjBnfwoYLHltz3u2vq94SeH+z15+4nQ
	f121nxZqvBXV3np9oOtT4hqLLPJVyg4XRUbA+MAnU5pIdXbld3shP1ue0Y7bXOTGGJLJJEF94mI
	0NraDc6wgGcU8VVCTqiC89yIBLRH8yavP/dSnSmFwYjxUVY3zOFSgGURC2Nl/WrC4UM2WYlaBzr
	7PHclovzL3GUMv78rpoXpJYdTpfCT61q+wv5s1anXgrcJHYmL9xLbN29SgQMaKlMimjLDA5Bxu0
	OE+osSlsG1DBlIr8/SZTgtuKYmaDQZqfs6IzrvSxphz/H06EbcTGZRSWDkNR+MR6UrYVQf470Yq
	Yyz2DgX0ggZmMqOA9mwLaUS8sXyZ1RP7R1lHQWYepBjTxqjRfxgXuzTCibD9CFtO/Cvv5Hkgan6
	b3CemRqmjHPCPV2lj2yc8veoqbo1kGMXLbsFGnBfxo/RXJh15Q0wn4JWj/TsvN2s674bZPbOLc0
	H93bEwN5bilAYP1Eb9g0a7sV4FEw7ATmKsFTuJ/Dt3YbbaFPi2ere0lRvU9hET65niutQ7io1SW
	Uzx+HgloqEmPHhojDqDfo1zEoh1L20f6UVv3EQH44dSuMolP9u6t7YgShC5v+tSJFf0cRnqW6/I
	fURt4
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr33764505e9.4.1792580885728;
        Wed, 21 Oct 2026 04:08:05 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd0b5aesm36757615e9.2.2026.10.21.04.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:08:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-lazy-object-proxy: Upgrade 1.12.0 -> 1.13.0
Date: Wed, 21 Oct 2026 14:08:00 +0300
Message-ID: <20261021110800.1944726-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131296
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.13.0:

- Document explicit proxy evaluation and identity checks with None.
- Fixed some broken tests on Python 3.15.
- Added configuration for Windows ARM64 wheels.
- Added Python 3.15 wheels.
- Dropped support for EOL Python 3.10 and 3.9.
- Dropped wheel building for Python 3.13 free-threading
  (experimental and unsupported by cibuildwheel anymore; details).
- Fixed typo in __annotations__ (basically it was broken).

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ct-proxy_1.12.0.bb => python3-lazy-object-proxy_1.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.12.0.bb => python3-lazy-object-proxy_1.13.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb
index 273211a3e9..0517eba64d 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.13.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0cd92fd68aacee0503822c05a3ee6a2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d907de309286ace60c424a81666867d"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c124c0c61"
+SRC_URI[sha256sum] = "ce34046cb021d69c72d05ddb83821ecfd4d2d0a5d43a93c5cd01c9e34779cf14"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

