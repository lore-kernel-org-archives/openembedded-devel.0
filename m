Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34304.1794851678932640970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vF/yNyNJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so7645823c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851678; x=1795456478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roZohq9KlhUlngNIWhhriteJQG+xhvQs3ttuHRJODy4=;
        b=vF/yNyNJqtGLtwvFbWFVHDoI92ocZJ+tw7hQhUiQ5SkLRbI8Mc9LleMZjHZjf7gule
         0jvJIrnoxMot09kJQT/seEgdQvtrpZGt1uVHQiW4+XP8BLeOEBF9C3tfJN1ohLx7N77m
         5Cs/vdfB8NB2cJqBfoD7e55TXiYMUT3/6erTpDaM72RYrj1jir/9zvg+30JvP44p7M4J
         IZwy0P5oj6gytWLVF1L4Anrx1kWXl/kHK5zu8gR1WWCsI5QcybrFsSd+A5C/tPGsyq4p
         BU3OZ7K3i3pxbGQcA4H6rfzNcN0AfEk+REWAgtp5pUS7x5Wmfkh2UHQgappJosmfISSj
         t3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851678; x=1795456478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roZohq9KlhUlngNIWhhriteJQG+xhvQs3ttuHRJODy4=;
        b=f3en8SJaRUjbt1joW8IF9D/oJo8iHOR3rJmkPT9jYZeKnVmt8sdmSOGPixmlk1thOR
         5/3zrhwCJabCxkShrS4IoOsQEObD6+PWpyIZiqHS+YJ/c73+x0DaEQVsz8qAJGbJZmMj
         mMEnaQV9An+DhcEUzqLBlmE5kErnsANTU9Wv/ZU1te8bu2dqjCT12M1ByswyRS/FNH3p
         K6SKkpNHj+bKXF4rZXmRgTcrMDl2OnEkpy25+Y+RKboMtSiqzVHyt595logZniqvIO31
         cYXW0CJaUTTlkDiQZbp5VE24gHbxGTO/G+eMqeFc3TRFeL0zukFfzNVmPTLboKXqtxwA
         IqtQ==
X-Gm-Message-State: APuU4Z+7gEUEmUNVmjJ48U+8fjKVEsPtdYHTYLAQC6iu7NNmPHNT6MWq
	4kOQcGxHr+ejZAzKb+9HBocBzDiubzwYDvrRw3obMo44MHuDbOK9+D913C5zMEhC
X-Gm-Gg: AYBFou2Ol8zaTO//nMYT/kLqWMnTNBIX3FPxgSeNQsPJUPRbQgGHncbgF0e5LBqW6B4
	PzbIUlQZpgaqY+k426f+oo1H3o78gv3Sg5efEWwauICDRa1tMyNPENAjZTK8kEAdhLaYP5jXh9R
	iQWntar6U0xBbG6XaXkOqlZwVQHt6RiBmQqgOgXDOqldOuHN5VMq//MdMzuXqI8tG0SbyqF+5HW
	RYcE/AeJGWBoo8Sb5JlamkpNzidxApX1xbt5OCFrqNmRxaFItqpeJF7qpjEwfJ0yEYUw69HDwLn
	1K100rT6Zunh7o9W1oHT6M93pAl1Up9rxaIpliCXGd6S0SZbNyCcRuRRL0WygICZfIV3e5XSAcA
	0GcmzGMcLfICS17JeKPeStBSUsElzPCB38fHEENYhuJJTf+G21bX/Uz3wqEQbMsU7fP6tp6+/oL
	eg/q4TmmZI1vGsfCFbOLrFCindp8cqqCEiA6FT8I+f7/CIf4aEQnG0ytDVZ6snsbDroJAqlEu4m
	trGz4FhPFlyNtQtWCGshUu//KzhDSjoa0FfZq2ky4RPwOClUkNefdOxCNvbo2N5Bx3pGE57vExn
	8/uhe0PcrkGbK/iMUxj6GBjlW/G70XXUEv3BGK/kYqTZpHRDvDhzRuXCzZCfTH4nIW7RaMriK2W
	JSfacLK+zvsiGkjuF9wskiVkMTov58B0mcUufgGTLGamhK3sYlOIUvnMyZ0Lfz4BdjF4mCw0mmT
	XlvXTvzuxkD5UaD5osFLBwcs1rTcFN6Zd9wzqfTmWGvmaeE2mp4TauFDuY6NEq7WTdNlui0xUIc
	t+hiVZCLdT1JzbEWgcXtVDFCWKeDETfKfk+y0wUvcZKt9HEMIWsOk9NqILAXLFOxCVwO50UWxIl
	uncU
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr12517499c88.0.1794851678185;
        Mon, 16 Nov 2026 09:54:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 023/105] python3-django: upgrade 6.0.9 -> 6.0.10
Date: Mon, 16 Nov 2026 09:52:35 -0800
Message-ID: <20261116175359.342679-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132479
Content-Type: text/plain; charset="utf-8"

Changes:
- Security release fixing:
  CVE-2026-108147: memory exhaustion in MultiPartParser via
  base64-encoded file uploads.
  CVE-2026-111211: log injection via unescaped GeometryField values.
  CVE-2026-111362: SSRF via the crs member of GeoJSON geometries.
  CVE-2026-113593: private data exposure via empty and missing Vary
  headers in the cache middleware.
  CVE-2026-113733: password hash disclosure to view-only admin users
  with custom user models.
  CVE-2026-114582: SSRF via SpatialReference string input.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-django_6.0.9.bb => python3-django_6.0.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb => python3-django_6.0.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.9.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.10.bb
index acdd2c21d0..e2ac220b86 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
+SRC_URI[sha256sum] = "6005d030df924f85088454c18bd35dcf082b058aa355ad3df520d8de9aef9f41"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,
