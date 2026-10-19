Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20747CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33882.1792414585163109671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iGOKavgE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so7992975e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414583; x=1793019383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCZMV1LQKk+S0PcUoW7s/PO6WTWp5c5vaiWLvfGjqwQ=;
        b=iGOKavgEr29SORl43/+1cqsXkZMrI4j9zMwWuLQw4gx7vDv5xVdYCejgFgv/M6oAes
         V77DVr3404vBj+32NGE29TtZuFojNTOYopS1rO1FR2tOaDer689wuzUa1LQv1rZHt9s7
         RYLeevraZzUVFSPPt4jiNeF8vNbtrlDH4jwbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414583; x=1793019383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCZMV1LQKk+S0PcUoW7s/PO6WTWp5c5vaiWLvfGjqwQ=;
        b=NQY75l4kL/anZGO7+rqB7NKTRuUcyTO4/1PH/oT3fwynNMBXADAAW5/L9xbZy/kct+
         vn075IGnEyc0fcuOvHCgCsEf4CI+FMmjIlQX/6grL3XBxtnPY0/vxgUyDEHzGz6XqB2U
         Jvqb5Iy+PdAdaANSnO0gSMLsNWz5v7m/egM99mC3D9Ww2+vdeD7WxOp+XgjxYAViBrP7
         DrOXFTVjBATKSH8pn3O30pySdc73htrk435qjATusbZfkcvaoFf6FjIr86E4SD+YQrtD
         hulCXPoPsiSggevH3voM3fQiFPtWV5INP8HD+YBCqLhxSjfcS1/8vulQJ+xqsyIwQ31p
         Ddjw==
X-Gm-Message-State: AFq9FYJuKQ8OVxpJoMvgOGLs8tURPhUbBnnftwY7k2uieXr+9yDKXHaI
	EtgeK2mXp5hMEQHcksnEnDoWJjPk/fRde9PZpxOLHIjY6fRLWvgB8NKqcIEKofhMWVEYrDcX2x0
	mM4OB
X-Gm-Gg: AYBFou0FvCBfnW/ZkYI7h4JORZ/2hjdwA5T+0TkW/n7RedSz5x5CbS/0U4Kx2t2DnQA
	mXQGhGNJXl+Enc9lZT/qCXPc5tDNyVbaqP4K94cauNwtK1Xa/+EQGeZmNSFmZzAUq5wOmsXgFVT
	51cAxYUIindSpz4s2+0r/WmKl3MSPUZkbGe5Y2KIztPIjx91GJBrqYtlKXP+1tE9Li0q9cGDqJ2
	SRnBAG4kDQfADzwvAGolgfAqhPtidaA4+9tIF9+ZyGHlLavHBmLeoswwqKclbF6bMi4RxoY4lzr
	IOJElEnJ1wI0GXCePUJUXNhUDzCtRRviHEjNKuJ7KsgipBIA0C0cVa9tFbt9vqEWdZq1yRM5HB0
	kEJcUZ0Q8CEAlqG0RoszxKKJmlqpBZwr5n0x87lpJJ5b4vh6kHX/ThHkp6gSq+kW0arGEirBgLp
	VI/XWsM5qQY17BhLHAzsDHxoDaAFrcT9CAGrC/NOBNIuRJOT3ukCpWsYH6STyLGfpOIF3fPDq43
	rwDRZEhZ30zPV6WRFvT3JAW2kN0xziBcHkGM7Q7Vq4wiC9Ziwru1XALILrzRgTmvNNBQH0osatN
	I5p7zBy/CiM6UP8Y8uVIano=
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1d75ab235mr151509195e9.4.1792414582719;
        Mon, 19 Oct 2026 05:56:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-breathe: Upgrade 4.36.0 -> 5.1.0
Date: Mon, 19 Oct 2026 15:56:10 +0300
Message-ID: <20261019125616.3888504-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131119

Upgrade to release 5.1.0:

- Dropped support for Sphinx 6.2, 7.0 & 7.1 and added python 3.14
- Strip leading spaces when making initializer
- Fix duplicate constexpr qualifiers on constructors
- Handle C++11 extended friend declarations
- Keep template arguments in class template specialization names

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-breathe_4.36.0.bb => python3-breathe_5.1.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-breathe/{python3-breathe_4.36.0.bb => python3-breathe_5.1.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb b/meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
rename to meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
index d8dffcf948..9745605394 100644
--- a/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
+++ b/meta-python/recipes-devtools/python3-breathe/python3-breathe_5.1.0.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://www.breathe-doc.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9e49eecf36fc015de7c61a0247df75d6"
 
-SRC_URI[sha256sum] = "14860b73118ac140b7a3f55446890c777d1b67149cb024279fe3710dad7f535c"
+SRC_URI[sha256sum] = "ff56af8bfd0b50ebf10c81a07b8a5739787eb015d26b4ba162b6983d6e17c7c3"
 
 inherit pypi python_flit_core ptest ptest-python-pytest
 
 RDEPENDS:${PN} = "python3-sphinx"
 
+RDEPENDS:${PN}-ptest += " doxygen"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.47.3


