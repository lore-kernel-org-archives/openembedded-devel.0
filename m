Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34350.1794851738349529181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nFPZShrs;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4831483eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851738; x=1795456538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAfkWmXGlNzoN6F4BluXloTS5ymD75bnstF4CqdA168=;
        b=nFPZShrsaVKUPna0aA1LBQMVg28jFfI0xGFZipi45pelWwLD/5X7JIdSbgBz/ccXhO
         sOjvSnXXnaPXlGmdM2YL4ABKJd7cox7qssVc50t3vUrF2RmcK8NS+p/Rd4bmEVkwgGRO
         oeOz+abKJ8lSalbkQfZ5oH/msx/cVy70yNzNc+YeTCyAAIpxbQ8qf/yJqMJAaLSug/EF
         2iTX/ubfGc8pci7KqP5Xy6nNpuuo+UWicNcTu9Pj842TlxuqAb81KsDkV1YLrFSt/j99
         wnBolzePlQluNUw0QTEMWRxa2/8dT404VNe119f8Y7WhTyI9ytakbgVqsweoNF0EjGic
         Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851738; x=1795456538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAfkWmXGlNzoN6F4BluXloTS5ymD75bnstF4CqdA168=;
        b=UI6PgnENx6VvBcs1sFP23MOu4QOTcjWm5OUEuRY1IkKlW/yDHWICkQdYvPy3rDCoto
         Zt5gjTIjmHtfhL8ht+ZPJnkNRq/c7msao0va0nKxYDFDAQEaDVq9Cms8vRy1Eb6qm247
         S4ziRvI+SoS81W64/w0m5HdONNcB2biEUa1mXy4bZprXHVyMCgcZrHCgqAuR43Do1RBy
         B7IV8c3homO4hWJ6sGUyLjOYBeItcICMqwsRS6jFnDPD5Ld7uqYBVDIkdofrPLxg7lwq
         LGKDVFzOAx1dJFicN4pYCJXNqjDb+KCRsFmQgY2w7RhRckWbHPrmo2PSwyeLWjWLUoh6
         LOog==
X-Gm-Message-State: APuU4Z/bqQ2MHZOV8S+T5pIUpYBYex++9bdiPG2uJHRHyB4J7pbBIIHF
	bBpT3Azx0gcRlsgKrUOwco3J6SNf0OOlskm6WlrOrA/zAIjXglh+WwhYzjvxArKC
X-Gm-Gg: AYBFou1E3zhyZcQALefQoi5tVEln/BYM5Ps+4Klibg6Pu1G5jxpgh0633CAySvOtAhv
	xDyzmhPCL6Wc0YMmjZPgf4cKEPXajuAy4GaZuBrI6BuFHrHRtE/+XI3IBWmcsVGrb48CIx/zMYp
	YAO2QwGFShJ3G97+sji01lJAuhL5Mw0zejUnMalHFlDbk4SLK/vbPvVS0DKNoQSSG9kityVV5TJ
	FBUi244Koc5irbx76MlfR9UBEwoW+1YoWADtwWHZSWjGSz/ZqM+IdyxW3ojk4Z+Fw6vkUBWtD8I
	eQxv8YrveFjakpiKMXPrs7QgVXRDxq2RaxM4zW3uFh+DM+/R9h7HPEJVCiYyd8jPcp+YtZdYeT5
	ZcjkaSTYaTmVwUNh3ZMRTRq1eCUPPOg9LhcFjyOgjpfnJ6hARlSrHzGidSZ+k4l0hC929ECD8wM
	kg92mo6mqPAXphbAMUWrKdpzgxUhlhftolW88D8t6erCdOLb2IrlZAK1ai3YcbF2vkSTxVQSVQY
	yFjQURAq/COt2rkEIm0H+uGRqrFgpUx1KjeFJEeJXvjk9c9ph/85GpMAiiY7TSuFYJPPoSD+bNC
	GgNh1soxciuiS28IAXEDy8R7aMtr0mpalxBnhL0fxIWViewLCJT+A+bnwZ/3jAD3ebQ9Y+Y772Q
	JFo4cXBzrmzrOKw84JO25J5K1YJsx/dM9+C8Ej04OG8mHeMz083WZPLKDwBtE7EcwHfQGc5J5BR
	Q7FogU4D8ZuuUzkiBourZd3wwfs8i2QRi57HXboWMgaNLsE78k70cc8ieMJ8H2az0lTVHbuhek2
	YKSowUIj0QL83u7V2SD5QOpJ3P68QPXQcfjBEvoleTamc960X0zg3qQTRxvn2pqAAxbbFZBlx3r
	sIi050rkHocOqWGttu5NjRbgwg==
X-Received: by 2002:a05:7300:d102:b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-37aa9db713emr8263325eec.11.1794851737680;
        Mon, 16 Nov 2026 09:55:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 069/105] python3-pykickstart: upgrade 3.69 -> 3.78
Date: Mon, 16 Nov 2026 09:53:21 -0800
Message-ID: <20261116175359.342679-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132525
Content-Type: text/plain; charset="utf-8"

Changes:
- Added Stratis storage support (autopart, manual partitioning
  commands) and RHEL 11 handler; Fedora 46 support.
- New --type option for the %certificate section; bootc command
  gained bootloader and composefs arguments.
- Removed commands for newer releases: vnc, nvdimm and module removed
  in F45; RHEL 11 handlers updated for removed commands.
- Fixed handling of files with special characters; spec no longer
  depends on pytest-cov/pytest-xdist on RHEL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-pykickstart_3.69.bb => python3-pykickstart_3.78.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.69.bb => python3-pykickstart_3.78.bb} (96%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.78.bb
similarity index 96%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.78.bb
index d61a844eb5..87032e808c 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.78.bb
@@ -32,7 +32,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            file://run-ptest \
            "
-SRCREV = "601ec2d2f254909f56e2ee961d2056e0d5bc4a97"
+SRCREV = "bca9c4b34ce2f00b582ddab2b8c948a8d45f3376"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
