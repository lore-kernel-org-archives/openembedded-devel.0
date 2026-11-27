Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8108.1795739776561543132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0v+WwhDe;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9ae391a05so51927625ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739776; x=1796344576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzVBFKRojmVg5zeChl/357eWj03DaDuwDaTKkg3W5k8=;
        b=0v+WwhDeA87mDr3pm4oy3A5RIVnilTRug5A9BCXFDUwYxw0Xue3+A3uvsOMlaq9IfM
         EryJ8ut+6n/RLD5p5Venix9CVaJlFhR95ZkuyABBriSWbWQyEHytL67G8MCAVcBoCeWk
         SKkQNUaW2RiSyj9uypqtZrTnft2U91ltmOMeC5tynPvNieSISVza5LbioY5Mtz0tQ6CE
         HVF/6mU2ZXxCAcjSVCSVPiSDOkXgmLKlA1Y6ElL56wCNT6ospzzM3nyKaZKb7MkeuYTG
         doXiTV5QIeUzzl5N9vlV5iaye32K4RCJMNq3UB57gFeC1nRumaDtMMKU+vJ5/N5kd240
         WgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739776; x=1796344576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzVBFKRojmVg5zeChl/357eWj03DaDuwDaTKkg3W5k8=;
        b=T2WiRIaXaH2SvD1QzFrGt46TmnMgoLwFr41M+/CO9deQsaPnhxO1sTkE3cCeW9NbuR
         vNMzO1sEmWl2uo8LBU//OHGtbFUh1gCpIqtviGM0rtmPpGF9xqXq0AlRQEzg5P7BgGcl
         mzqyLiabi0L1RYA51FpHH3wXZFYtMk2sBXby3feEAjS8xBCxsSh4WUC8+id+kjhyhJZe
         waMxwp+IF8jg6LZodmNVpYh+AyVSuaXo238MuYgdx9GO03MkO9XmQGtlyfdu+h9htqp7
         IYR4jCtdMTeXyv+Q01W7eLnXb4RqkxnvD66L+dig3ogZJkUQVMbSsTZCdcK5ZZOCN1Fw
         iEnQ==
X-Gm-Message-State: APuU4Z+yJ4nDMDDU/wigWOaD8/CwxsLKUhTu1Xqbq1fzDQpBmrmx/3Dg
	qXeixgZJzIM4o6engIjEUtQR0ZvgN69IToXgRVY9yIOqumsFiGn6k6Y0HfJQY04w
X-Gm-Gg: AZFdTZdasISlFE6U3EZkZxQEmPHkNWgdzNS6Wqrxhe7zzzWU3o3gU8e70Iy8JGmOjPE
	+zobTFM7hUCkX6JhZwxQIypP+cfR7Qh5mdrDnq2vvWYXL5c00cicBWUwCg/78hNHHEbfO3cqw5o
	MvPeKf2gW0Jbmg6Fo+t9qd7UE+tihh/MjsuFXefjkTOJ5GxuNWc7jIy2qw/H8Dyj/VjnAOR1+Kb
	Fczq89At9XISWiSBxYKHcL3nYVlZT1/uLUa38/TrZW8mGUAsR/WNHYsF8SwyKcTgDck3/hVPeQq
	TwedV3Tiw1kFDRebOccq5TSWunTZ+Ltfk7O2tCuqT8OAh6QVlvqk6ne1Zlie11fgjSJWASyZLcB
	3Uc0Dn082xGtnzO7q2KzP0BdtGrSOAWKDwkobZ+bVGkRJJIFn47AmqvMoOzFRAFkVgPS9T4e5hL
	F3FbA2E2QpwImQmZ+A4wlD73MiWPq5qgBBllnCwYdoaI/QyPVO5rQiAp0mbHBAN0B2qA1ptTe6D
	wJJmBFvrLRGWti8jBkxQYVl9Qe2+6/kyS8vcJ9USsWs68W4rLYG5T92pkJ2cDnfkBwnO/JWYYyy
	wvf5hZb3ab713/OKdTuyz7tKsNs3+oaeEAsiEl100aEGwWXd2ofGIrDEQ2ag2rOPhPb59CBhRhL
	Vc9WWgd5S2s04OlCqGV1b3sLW2JeqaBfQRUh49flR//142rd4M5YBeXGGgXlV8ZM9yBl9xRFOea
	qbKWQgK0tYk+iMxNBYQc/6Qa29nvW9afpqEcdFsHYMgRETkBBUc0HA8Zo8K/vQ93LftiBIkP/kW
	bbG8QmYywr/6PrH+uoELbgmoo12NYdhuo0mhXIihGl7POvjxG4nk2JVNORBGNbdjswDL0DeTqQi
	qdqU
X-Received: by 2002:a17:903:198d:b0:2f0:2f8f:a421 with SMTP id d9443c01a7336-2f03f1e986amr173938765ad.28.1795739775844;
        Thu, 26 Nov 2026 16:36:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/39] cryptsetup: upgrade 2.8.8 -> 2.8.9
Date: Thu, 26 Nov 2026 16:35:14 -0800
Message-ID: <20261127003543.2167775-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133180
Content-Type: text/plain; charset="utf-8"

Security bug-fix release (fixes found by the OSS Scanner project):
- LUKS2 OPAL segment digest is now authenticated (new devices use OPAL
  requirement version 2 and cannot be opened by older cryptsetup).
- Validate that the PBKDF2 digest in LUKS2 metadata is complete, which
  partially reintroduced CVE-2021-4122.
- Accept keyring keys only if owned by the calling user.
- Harden null cipher detection, minimum key sizes, BITLK key entries
  and LUKS metadata (segments, cipher specification) validation.

Add UPSTREAM_CHECK_URI/REGEX using the gitlab tag list, since the
kernel.org listing is split into per-series directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cryptsetup/{cryptsetup_2.8.8.bb => cryptsetup_2.8.9.bb}  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.8.bb => cryptsetup_2.8.9.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.9.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.9.bb
index 5400e63c87..010f00823c 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.9.bb
@@ -24,7 +24,10 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35"
+SRC_URI[sha256sum] = "8667085a4f59174928948b501b4a2a68f7f1cce1cfe46170b8f40fa6534742b3"
+
+UPSTREAM_CHECK_URI = "https://gitlab.com/cryptsetup/cryptsetup/-/tags"
+UPSTREAM_CHECK_REGEX = "/-/tags/v(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools gettext pkgconfig
 
