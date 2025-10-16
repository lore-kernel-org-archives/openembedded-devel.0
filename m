Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E733CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 20:17:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.165.1760645820823416708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 13:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BoVD69+/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7810289cd4bso1172702b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 13:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760645820; x=1761250620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnvtDOrVibGAs3xS+v/N05Ct/tXm7KQNZzPKm0taHrQ=;
        b=BoVD69+/Qcj6XDrBW9z2CyMyqgg6hlzwjXnueQ13AG7fmGpDGp1NRPCKlCtu9N/ISU
         YEJcMDKdATp+nyH/hbRYbTe6u7cF9ybGBOtdGSwi+B4boAwY6z3bAeETsUP12WFRuOvP
         0tYLXtrlm78OPJ76ZzVVH5r3g1FP6ifqt1MjcU29E+KR8rfZMAZ/0+ugQj+90QqWaChL
         AFAyOuARsZtm7FpzHHR5NXmVBRdtHVPOJ5/tu2Y3E4tm2cj5yc8ijLHwRvSwRnfFl22Y
         kvDXirnYbfQLTGja+7yJRs/cpTth7Zq1N1PFqdIYmfKf+iK67oPFGbhmetP1zzDm786E
         F9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645820; x=1761250620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnvtDOrVibGAs3xS+v/N05Ct/tXm7KQNZzPKm0taHrQ=;
        b=uL5mRXkAFVnMhFZAJuCocxvXOJEVzttOa3ctdKxBKyi9IXXvBpMwZrWji+9JWM4xQP
         BOEqfab3UyOOOnTy9qf5UXnfhPp9JR5BW5jARjAy0IFDlv5Lb+xm/b8gRDOALQir4fz2
         XD/WW/q7xIQMmfiY0hWbdMUvncjTbGkbxKhkBnQZYuORPNocqGe7QYu1gpuCbEtVqvcg
         xau52/Qo7Ky4Tn63X1VSGcygXBQnTK115U14eV3IzcZedJXsfdfj+JeVhNfapFYjKJBN
         bVNbC+quIl8IU4cUvdRyNvlE9BHEwkPa2X/K+dus3fvqs9+UlKBiHlZfKVzYmr0N/Pc2
         X5ZA==
X-Gm-Message-State: AOJu0YzAhrfiwG9KXXkAb/pWABYKk84VD+MWbWccrB1VrOH5aFbxOgc4
	gBbMFsv5fxB98sCmPe6bPqg6DJOxnFlNYzAQSXTRCIgWqPSV78L01tfuoEtV8kSB
X-Gm-Gg: ASbGnctqjXPywJwWYQ1urfDnUBWH2jNtzmv+vBMJG/nVakYOOtxgQdV7Lyj/cmQlA7T
	RhWAC/xRPu2ancV1HxWuGXNr0VR3GsmM0+tssJck1YFMJRKYCZqny/oQameoBwdtX9bUPfUxdRm
	kfUdGn5ycCdR+/NEPh+Q8sgO1qDKqTQ9SK3cY0qfDNI0d1FybBTDHG3CrH/S14WcOkaeBlyzZGh
	RWAFTbebPqLkWU6g7Do67LdcIteyq7ks8hvNOJ5yIFWEIKbAEderMhK4FC8JmSlhtpAlLkax7yg
	CBklt/h1gGALi0kh5DbTxwpNx/AqqLh+K3LQuBBnfd7LrUs2wFkxRO3Agco+8DWId/Caa0IW/9X
	wy/rr11HeCS3x6CW2pb/8uUXaTQOF7pdgxqmqG+COeN5QnlIDgMs9+0vNsGc4O0DldSav3K+Vl0
	u2SQWVWb1Wk2iGE+Tf4u0w39AQ8EuDBYrRpg6tOiYugCJbqgI8n0+kAZrQy0qywg==
X-Google-Smtp-Source: AGHT+IFZaJZNbUCzXTVCfjFJ8ep1UOrJt4UybqZZw6pfL8k7oP+ei+V/NNlZQEhCdMFX26uo8/XSzA==
X-Received: by 2002:a05:6a00:1895:b0:781:1a65:f230 with SMTP id d2e1a72fcca58-7a220b1e3bbmr1308619b3a.26.1760645819926;
        Thu, 16 Oct 2025 13:16:59 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b73334asm23247082b3a.21.2025.10.16.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:16:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-txaio: Migrate setup.py to pyproject.toml
Date: Thu, 16 Oct 2025 13:16:57 -0700
Message-ID: <20251016201657.414008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 20:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120741

Fixes
WARNING: python3-txaio-25.9.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb b/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
index 3e41c05801..0d5e629b33 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"

 SRC_URI[sha256sum] = "e42004a077c02eb5819ff004a4989e49db113836708430d59cb13d31bd309099"

-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta

 RDEPENDS:${PN} += " \
     python3-twisted \

