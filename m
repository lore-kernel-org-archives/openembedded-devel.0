Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C29E9B258
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18700.1771933480013433770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HjSJfkTm;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so4071726f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933478; x=1772538278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly7Xg2ErPQGWXyawX0rQecD0x/OXzt8SXukfd2oUPAo=;
        b=HjSJfkTmCosY43anCPpvNgnGwabu7hW4+eWcGz7hPLhh/FlcS5IoxSJnBNsmiVyHhQ
         N/KuD4As6bQCocxUfpBlZqz7lD/nMsnvXJUuGANWrh1Cn+OyJI1ys1+vD2eIR4u8mRNj
         EXqhyiVStjiZkd5bOf4p0w4f8uQR1Fj01f8HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933478; x=1772538278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ly7Xg2ErPQGWXyawX0rQecD0x/OXzt8SXukfd2oUPAo=;
        b=m9uufVyDOu8YcCeXpA17FYIKgacuDyGRjZmiwdf5qyKd0+XtcwVEt9xJAM223wfs6D
         y5a5XoWRrAsHmfHPu+z/fjLvIavr9tMg2yxW6q0r3M9nApliR7kYb2ea5vaTuS5VtJt3
         3bFybXSAyFBfsQna/GD0oeo0Ab+fR6c3+7LuFg4bgc6mvqIVYtCS9iNfpb8/mgDO6GkM
         X5FVHYj0+M66xwWQKBbnw+9guAjWMwgQ0N5CPJ7suZd/967aUU5/l3izXa7Pr3SpkjeO
         QaQcloAZjT8U/+/+9kL9JR3Finos/1vAM+UTJFQZ4gWHW8L+ZPtAszg9e7JNB11KeGPg
         pa+A==
X-Gm-Message-State: AOJu0YwZGC2Cgf2h9keHCGMWUkBvdOFciJBhsjxy9CnlqoM7JfS9Zgqx
	PvxBqs5yH4l9p0lKwBfxFdLrueKQMEoEutgAnF0ryk3HPUekfy7UOA6R78x+o3SCdN6P3N7caEK
	2WNs5
X-Gm-Gg: ATEYQzwvtCNOXdSKSYj7oJezSWrGmIB1NjbiN5I69jXY+uhaeBUroY8hx50Qn5GffHm
	68ALQe0trvO7jyPiwjdr3+l8O+qknbBGHPrWaRwRF8jqmRT3ipIdMS1RVnE4WGduOGOitScRRVb
	jUwnxtorTocOOra5lbiCWL0lihxSV8yDtvkI7zxpsIrBTkoCNIfEazeP6YLtdeuZ+DxAWX3Bj/9
	Ak7HpUHc/Z0KWKjUveSBuJ2Bdj08d6fw5+9A6Ong5tfbd/oxSYCo12V3WxRmqK4I9ASlJt1GC0c
	k0BAH8aX3g/yrc7XSkAFnVlEQgxqY8XpdSrcEkIfDOmDm/C/TDipAUzWGm8V+Iu6BSfJdd587Rx
	YsCHBisCSzrfwN+bArYMOe8VRkL8DeJoOcf1NOSdkmcy9evZnk2cdJQQmg2rCFJPyvAygrXld5x
	P/++eP2Qtb1fXDDvTN8KPoYD4YUOGPog52raCc
X-Received: by 2002:a05:6000:615:b0:432:84f9:8bf9 with SMTP id ffacd0b85a97d-4396f194d4emr20486161f8f.57.1771933478048;
        Tue, 24 Feb 2026 03:44:38 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:37 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/8] python3-flask-cors: Upgrade 5.0.0 -> 6.0.2
Date: Tue, 24 Feb 2026 13:43:45 +0200
Message-ID: <20260224114407.1760757-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124578

Upgrade to release 6.0.2:

- Update license pyproject.toml

From 6.0.1:

- Invert regex sorting to make it correctly match the intent
  (sorting by specificity descending)
- Fix README file extension in pyproject.toml

From 6.0.0:

- [CVE-2024-6839] Sort Paths by Regex Specificity
- [CVE-2024-6844] Replace use of (urllib) unquote_plus with unquote
- [CVE-2024-6866] Case Sensitive Request Path Matching

License-Update: Use line 6 from PKG-INFO

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-flask-cors_5.0.0.bb => python3-flask-cors_6.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-cors_5.0.0.bb => python3-flask-cors_6.0.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
index 1fead4f8d1..6134b5ba10 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=118fecaa576ab51c1520f95e98db61ce"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=134f1026f0de92fd30e71976590a2868"
 
 PYPI_PACKAGE = "flask_cors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 CVE_PRODUCT = "flask-cors"
 
-inherit pypi setuptools3
-SRC_URI[sha256sum] = "5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef"
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423"
 
 RDEPENDS:${PN} += "python3-flask"
-- 
2.47.3


