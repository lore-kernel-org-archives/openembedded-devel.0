Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2902C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:04:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3365.1785492278719947170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r5fg5yi2;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso1411378a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785492277; x=1786097077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a57QFRv/JKpvV2WXDS3FWAQZQfhhn6DRODynJD1T7eY=;
        b=r5fg5yi28iFO/8fVRyn5+qFNq+hHDoxJiv1O0/n3ub6l/05kWrUYazGGQ8qzfmqUZm
         YZipQHJrSBxJLIDEe9BUqe9fBJEO2g//xs9Qr1MYkbXDozPxBbiNSjyHC/TZA0HFvTg9
         oFxrmqzkn231p/bQ1E9bnnFTra3YdlsrJWtLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492277; x=1786097077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a57QFRv/JKpvV2WXDS3FWAQZQfhhn6DRODynJD1T7eY=;
        b=qDsz9kKwjCb9X/12MmOQNscoDpaDE5E24ha4pwMJojFSETcR++b7XZIiOOTsuq5Kec
         1zMAoTb9zReh1sB07ldfQB/2+glitNkYz8/aHmjcucQXM3DJ+xBiem8zqkGN0NbtzMg4
         DU5DO06L1G83F07X1KPft/pdfz71qUxdwlzMcNwhnZKUL9ZlZtunP/k4wLVsWg8mN48h
         VZcsZQMwFz8HhGWVbZ89gDxjoGYn5NqYoLzJZSvnt/+IhW+othwvye7eZiey5l0XlPDE
         obfGFOtuTKQqGP56RCKcVBgnsyzk6WlGLeg24DH27JadnEOcbkXSX2LsAjerUHUPL2Y/
         fCcA==
X-Gm-Message-State: AOJu0YxsWbjClqLCjUs2mN++i95lP3SFXRVzkhFIdZzKch6yK5ukgcKG
	0PUmQb2LaCPrGelWhApdSBimu01wHSmwAn3hUj1abeENTZmxbuC6PzDdappJot0ajdwggAmKUjw
	bq4Dy
X-Gm-Gg: AR+sD11oGAd9BHdtMux/B4v74zCJSssjAXOyVtGI09SOzJpFALyoZsIxaeyuboqANc3
	0NyZ8D6y+h/5tw4/6y8Llg0AVqlrM1GI6NS6sDpoyaHvqJLvEiRWyFY5bB4RKFwBU0Cif57OQ1P
	ZtB6G8id7kPaU5j/D60WEvv/raEecp5vIf2iacG6Lbv9pn/JXR7Bev1sNqVBVVJzTfoCEhqolYT
	e5GlzA2HvGR59dwxI1u5CsikCKogBAYyV1KXnS3LmsFmu+mlmgmXLfUQaOUxzX/gocjX2SZ++iM
	NHh2xeqRFXbUOVz7CcLGQW90jRsxa9Cc7Y5PZadb/XN3B29GaL1Arxuhs6X+WwohG04Dqmxdpx3
	PKnYf1t/iB5c+s/HG8vuHU+P2Qf1gPW4ZVYyf3h9hZ0NaoK6F+DsYv9rz3IbhxPzYR7UjMG/boK
	U6lAkIQQB4+UG5ZBxt8j88USNVpPYMwTDL5eCv/nRzHk7mNZ1lb2kt+jkkXzUrmSyx9DzGsx12J
	QfPHOGD2F+tn2fe4fvwirK/hyd99GwMNotNLXU3stDVqQLCmHFdVmZ1EBAleYwp6PVfxSPADyZW
	bM1INgI4KexcKg==
X-Received: by 2002:a17:907:97d3:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c1fd238b1f8mr69233966b.7.1785492275921;
        Fri, 31 Jul 2026 03:04:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e296csm3119808f8f.12.2026.07.31.03.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:04:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-annotated-doc: Upgrade 0.0.4 -> 0.0.5
Date: Fri, 31 Jul 2026 13:04:29 +0300
Message-ID: <20260731100430.3141022-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731100430.3141022-1-leon.anavi@konsulko.com>
References: <20260731100430.3141022-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 10:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128582

Upgrade to release 0.0.5:

- Drop support for Python 3.8.
- Update security policy.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-annotated-doc_0.0.4.bb => python3-annotated-doc_0.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-annotated-doc_0.0.4.bb => python3-annotated-doc_0.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb
rename to meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
index 10d567d46c..28d05166f4 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fastapi/annotated-doc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e36e91f278975b8bb76a769f32582892"
 
-SRC_URI[sha256sum] = "fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4"
+SRC_URI[sha256sum] = "c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb"
 
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-- 
2.47.3


