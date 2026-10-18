Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A1DCCA490
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18074.1792344019213503537
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 10:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XnaBTq6L;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so13878365e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792344017; x=1792948817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLmiw57Ef0+ToIvfv+D354rOL20pLJP8kOnHU/5DHsw=;
        b=XnaBTq6L9NkgFLbVBp+kICKPjSGDk3Iz4FGW/C9+ZM9IzyzAe+ojFfPUVtGtWT9uZE
         nB+xSsAfqSLvLu9CxmG8ig3HjVmMchLRDsKIeE+hoh/scd3aIwcI1DrqBHilJTCa0G4C
         G+vJC6TCBwZfRrjf84CLzp2iBwcFetqhePn8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344017; x=1792948817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLmiw57Ef0+ToIvfv+D354rOL20pLJP8kOnHU/5DHsw=;
        b=ruFkSEa33VmSVMXLIgNdOObqzjHKxgyZJNzXrDncItB6qFwDfNUV3+isCsxDSSmMSG
         rSJwBzcUt6Jva5BepeQ+1iJpLzDpN6nXakjaBfOoMfg4WkpY0BH0kQWKAKodbHFlZGTE
         i1n1Ih+MLpWON8KdqaG5FsI5Pc68nHuB5Vx6epulgSrPJZnOrJEtr04ZehBG9JUQaXZF
         PQanvTLCDsHyD4K6kQRKqtSZCBPOtPtdK8tgJxRhGG8971Tfq4w/sX5i3Uizzv6KoL3W
         oPZoMfoEQ3wg0ze8ERxEJlRgCpiZxy7MaLlVm6Ll5zuv6ZSAKsHRTLM8Z8TI+9lftF0l
         SeMw==
X-Gm-Message-State: AFq9FYJZCSzFnMuHYTPN9s+vV8w1riqo9i4+j+7cqnmbZTiTD8zP2lyq
	tyxf8rCFMpgc+7QuXIgOQBPrRWNwB+UsEXxovB86kEWxjgOGCSa6dZLFV1/40HGuvBxlGE2+BXt
	O0tD8
X-Gm-Gg: AYBFou3xy8HSdJtrQFpVFXdgW7fZDd2/qv+x9JYsj8qBB6Wol0B349lPgHuW8XtwhbP
	4xDztYr7hTbAjGUWcVhBDfg9tcJLyed1tmD6ICbV7ks7J+chfYIYlPHpYfh4Xntjn7vAAHezkHX
	O0nPOBagKnJ+oT8+KBWUwj7rP23dGuSbrd9zDhoxKup9LDIYDd3/Hg7t28e4XoLkJSChwNGDBDE
	yt7IXWuXHqZG3BWOI3iTiE1rp44TLJRDxKlPBejfFP4fX/beW5IbaCcOIglG6yOhhg9Fhm6CCzd
	zidCIJgdTNv5H/QJDIPcdNZ+mm+fzRW4ka4mu90vLQIfLvMrbe2IMPgjC5awLVbETwRl0+wOLpj
	NfLyIqnpeE0PU27xmURSOMapAGT1z3qH7mDRtap6PDP+ciXvVa03Y1Gxdv7rbrmZpbFc2epwW4l
	0/euen0pUQC7OVjXYoo98JsMhLgTX6Itsi3KapjxjPjAXhbOwTKJFa0WhEADTSA1v+gMOHCWPgb
	jfXdGekIAbWDMivfvP9h8dCh9Mm+KSxmZro/GLCumeCMEmSS6KUZksmM9N08IYonOIWotZnAYsB
	SrGC8AzFOecriHiD5k4JVe5xruZLc8Ms/A==
X-Received: by 2002:a05:600c:1909:b0:4a1:dbdd:d56b with SMTP id 5b1f17b1804b1-4a1dbddd68emr97352645e9.19.1792344017396;
        Sun, 18 Oct 2026 10:20:17 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm156755155e9.2.2026.10.18.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:20:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-unidiff: Upgrade 1.0.0 -> 1.0.1
Date: Sun, 18 Oct 2026 20:20:10 +0300
Message-ID: <20261018172013.925046-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018172013.925046-1-leon.anavi@konsulko.com>
References: <20261018172013.925046-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131096

Upgrade to release 1.0.1:

- Parse consecutive added files sharing /dev/null source
- Handle empty (incl. DOS) context lines in metadata_only parsing
- Expose git submodule file mode via is_submodule
- Raise UnidiffParseError on target header without source
- Handle binary diffs without a target filename

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_1.0.0.bb => python3-unidiff_1.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_1.0.0.bb => python3-unidiff_1.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb b/meta-python/recipes-devtools/python/python3-unidiff_1.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_1.0.1.bb
index ddc39da626..ad6d30c907 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[sha256sum] = "5e5d5cfab2dc98be819b74747ab7d9f5af8695369ec8710b93f9ab0f0ae6a449"
+SRC_URI[sha256sum] = "d9425bc516390c54743a1045b2c1c97f02d245a913a241dd499f958adb2df998"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


