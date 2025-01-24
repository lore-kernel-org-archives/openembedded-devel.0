Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AC5C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:58:52 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9325.1737716330001052839
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iRK7pe0i;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so6435285a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737716328; x=1738321128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRu8d8zT7GeXLrGb/4m40qBE9uhIu/4YTJylY3BRYPU=;
        b=iRK7pe0iLHLVKMbHOc9goA3PLeF3CbkMzBXbE5wKxKQ0fm6yYye93cTtr3ywWDjruK
         Pl+PtP2GEVWG/hklJreSRAWW3S8uhFV2DsL8hqETh/8Whx+NDrs1thZ6a1lpoNFtzfcK
         9gaTPLtKcY5sLejSBOPUHO9qQR8kkGLGOzTpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716328; x=1738321128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRu8d8zT7GeXLrGb/4m40qBE9uhIu/4YTJylY3BRYPU=;
        b=OvxX5Xvhd/3YIRQTNetQpvR8pzw3Poq0QsjhpdLh6cj3iqDUUkuDbi9Qmf5/NM194x
         Hu6bHPv2xYf1/MsVc1MWDPgla4/3pW5MD8KNOoFR5XotZZAaALx64V/dzzme6P12bpKn
         78ych6SQilgc/mMFw5gZHESARGgUZ5IDtczH8/9jtCeuC/5Z9Upoz/x2K5YUfHbj6v6S
         uwlhivkKfGECXtVgt/Nl5mLShgXIVT25bvlLnm0QuzNKcSVTRYG2AnolL/1+jGtwhoOp
         1CGPMppX/+LUxleAX5bGKoYpFD/3ej5zTUZvAwloGQTYRcHaYApv+vEKjorrO0A0fKL2
         8vcw==
X-Gm-Message-State: AOJu0YwfYLap/nzSGfBYyUR/4hcZVjnzpraog5jWcPl1dlch0OwcGQO7
	Uf+OQACps8YTPI1xdPNzHXZ7sedI8WYMg62ZhIRdj+B0VftMkBoSEhihZCqtHl1ba+lLgsLjSEr
	C
X-Gm-Gg: ASbGncu1wRRJBvBSwz8pbcvWTCqUl1wrRSF/UBzOxWyT3YlMWUkym7G6oT3ngqtT4Xd
	N6ibxXO+rerpTWYUXa/CSC9QAYG9c5MpvEaqYOJaVaNONTLM3KhGGy90rEqenxCtz5Qi8fHAGFj
	p3z29chDnbu/Ou8P9S8bJDu4V1aZrySaQKrLDq72eJEhy9VH7gptr+wt1s1Gz3Pq3iL3TezuaNc
	VPxBxVhp1LW7HD/EPCUIQcYXsE6ulC5f1ol8Kl+oA8ArnlqwZj381xHEnK8IFCgDYgFyyb1UCwk
	0MYnaEglyhI7+vlJih3hdRRDbpw99A==
X-Google-Smtp-Source: AGHT+IGd334voRTbHKoqqamrb0IL5so8uiV4xdgnTxVALcDZKjr0Z13l+U+8e/p9flYPS16mgiex3g==
X-Received: by 2002:a17:906:7308:b0:aa6:489e:5848 with SMTP id a640c23a62f3a-ab662a398f0mr519453066b.25.1737716327874;
        Fri, 24 Jan 2025 02:58:47 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117260sm107842766b.185.2025.01.24.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:58:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-wrapt: Upgrade 1.17.1 -> 1.17.2
Date: Fri, 24 Jan 2025 12:58:41 +0200
Message-Id: <20250124105843.2035512-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124105843.2035512-1-leon.anavi@konsulko.com>
References: <20250124105843.2035512-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115054

Upgrade to release 1.17.2:

- Added universal binary wheels for macOS. That is, contains both
  x86_64 and arm64 architectures in the same wheel.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_1.17.1.bb => python3-wrapt_1.17.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.17.1.bb => python3-wrapt_1.17.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
index b40c792535..2da6c88bc8 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06
 
 inherit setuptools3 ptest-python-pytest
 
-SRCREV = "c41e6eadb39f45ce96f488cecb250e417926b49d"
+SRCREV = "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
 SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=master \
 "
 
-- 
2.39.5


