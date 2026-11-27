Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10338.1795753005908855323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oUh3gQ+2;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so8911262c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753005; x=1796357805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+WVBJ8IHL5DiMv/C1BWPlYmNd0UpYBzJv9Bf3p3RKw=;
        b=oUh3gQ+2Brk6IwoV7gwmBKWx0zZ0Nc+WgBuKF2iilKBfZvyjssr6rM2/qBkN7Ie39w
         dZ5RrBXwivV1zBwTESzqQWAImxdd5+OO22DoR+1p6hMHFIWBhdkRUKQRTlR3ID9d69SK
         w3kHAjrspjdLHvKVaeVitMGv+Hua1PdohR6nEYexmVG+mRZxxjjNz0od5ubgmg1gen+2
         zpzlq2BZ1+dnbq10E+kHBdc+T/QFoE5DIND0D+afUU4bT9/N0svsyR9+Z+I8SMnTmW9f
         p7WewC/zPN2bhQmr+4sP81bT2nCXjjIwfYPbI5vSHingA7rOMMpHVYD1Ax7IXPqXHidX
         x9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753005; x=1796357805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+WVBJ8IHL5DiMv/C1BWPlYmNd0UpYBzJv9Bf3p3RKw=;
        b=T54kE0bXRDxlX5pfwysLussb4U1ENwPGIsCRuhX7qba3h2Ubjb6jNr7UwT1M9gRqPI
         Lkq+sWJnmN+/8epusLc//hhMBGoNvnEMsU0lrtZxuy+jvZiKOIaa6MxcbbvYG8ud1Ugq
         dBNbUdUd3L7dzTEyE0PW39+zDFFRpeJ6+yac7dTithAax0hpMmLwF6tyGRSfyjlbDiqd
         t6vQbFh97try5s8EmFF6Shvm8YMZG4kmb01LvGKKvzq3N6CXXK48Oegc1dH/4UzvI3/I
         RqfFGGBtX1l1ZFDRlq0zlHvNineD/YuLO9xkV6MNqUaFrxlRpR/vbL4u9VwhfSSLrTwo
         qbYw==
X-Gm-Message-State: APuU4Z+s04SRdTJBUMfr7rf3UukPmRQiH9KanrAOhLH8k17UPsipK+eG
	DU8OJFGvlORFiKZ5oColJZpNwFrfWJafc/uqFk2Z8ya+xp71P3COOFtZ8AxBpN8K
X-Gm-Gg: AZFdTZfrjN0ga5s9m7Ne3mTVrEt5wQZ4HqZFlWESfrcbC8oZxvK2jgIeqesq2dPf3bm
	eJlgZRQpGjgC2FIL2nv5HKNpsmK/B1hT6gt5TB882K3TtJiGPUPt+diTv6iE3zTAC6mNFQfYX5Q
	8YBsH9VZY8cdFYcg1I6zZ+duzc7jsNhBw5WrOeZPC/jgT+pdMyFyXIMMh+nTAlHLY2KuhTkmiP5
	IHIim4AevMNtLWp2kTz7knFepH0PVaVFN9Uynfy2z2xAK1R6DI00aF1c2zFRVQ31xoYctMj1Ctn
	Ho9pWU573KgTDraTvndyBb19oBkC/WxGNnz8AmPqYfFgNIOnNIrJufNOCQcyQbNfy5xpL6vgSqE
	pTXtBx3k/t/eHKhm/KLQuTaorFsypBOzPPshF2cX0aZbove7kys30Lb35G4QWCHm3MfmSZHf6Df
	Y2iFfVyG27AWjhgnjLPRG4cdezA8yXYayTh5b7Spg0L8aoee6AlhkNtqbGIPSv8/uea556r0840
	S4woSXi2OfgFlK9sX3FnTvW2crvx7kYtW0uOG5EDNDQEjyRooS68DD7fsxmZkYbggZvfs2qTFsJ
	WFGMUisYB4gQXEiaCi0YBd+hfQZxjSg3JqsGGwM3IryTXqNuKYUpGccUyT9c2jDyuQYgqO0bOZG
	eYYBw/DLDhEL/SkkT0/TMFaBAMcWSskhRvpFyFJ7Ai337fhXF9rAkBJupnLLFx99i2QdGzaqGA5
	IX4xe8SXXhHFW4WDZwzE2c1qQASTymmqqouKBg4yJyOa3VZCjEHYAa5VrnqyZRWKiyMnP5MsDLc
	9bgerQ8FKr8eN1taYgm8FSXEL47DqM+UbsD4SjskwOo0lx/1c39pX6dY4HspRVgqSa8yuq0YfPG
	awcC/+y1jwgVFNvALSShO8usXA==
X-Received: by 2002:a05:701b:4586:10b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b558384bf2mr21535130c88.41.1795753005213;
        Thu, 26 Nov 2026 20:16:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 26/32] python3-pytest-env: upgrade 1.8.5 -> 1.8.8
Date: Thu, 26 Nov 2026 20:16:08 -0800
Message-ID: <20261127041614.1775064-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133245
Content-Type: text/plain; charset="utf-8"

- Expand ${VAR} in .env files with the kept value when
  env_files_skip_if_set skips an assignment, in file order (1.8.6,
  1.8.8).
- Reject non-boolean env_files_skip_if_set in native TOML config,
  report configuration errors for directories or named pipes given as
  dotenv files, and name the failing entry when the OS rejects an
  assignment (1.8.7).
- Omit rejected option values from configuration errors (security
  hardening, 1.8.7).
- Wheels now carry a PEP 770 SBOM written at build time by python-sbom.

The build now requires python-sbom[hatch] with the python-sbom hatch
build hook, so add python3-python-sbom-native to DEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-pytest-env_1.8.5.bb => python3-pytest-env_1.8.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.8.5.bb => python3-pytest-env_1.8.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest-env_1.8.8.bb
index 9be0154347..9ea0feac6a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.8.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-DEPENDS = "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "992c37efdc1bde2f0783975080ac4cdcea85f36df9d6fe3a835edd01a7e06584"
+DEPENDS = "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native python3-hatchling-native python3-python-sbom-native"
+SRC_URI[sha256sum] = "5ff0688eb64b43edc4e0a3b2c3e7931f76a5f2859d755ae9ddfe10851e41ceef"
 
 inherit pypi python_hatchling ptest-python-pytest
 
