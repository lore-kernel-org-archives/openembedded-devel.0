Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E7C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.58248.1752419436715776376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Db2jC46e;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so6848279a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419434; x=1753024234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWEbIMOgm2MvWdo2AWMQcphKb9TFHt3GqGzlIyynGQA=;
        b=Db2jC46e7szj1i5rqXx3h6fwQt8mUrYJXy9NvYe8LPCasVRhzJaPrA5OmZ1Xzh4ROE
         hQt/sj+ZTqkQGdcLGwMzdYiOXf3Nxzy/AJFwO/N3HVTWELYOUAMCM9pTJPWrcmUxuTj+
         H5RDJUCWHdBiJkMBeIpJm7pR5vQSiQdcRAmzfp/9nZLMu11ZppuibVcyDaNf86s4JS83
         NA7jenY7ntzNEkTgJElvsqnky3Q8wnmb4oq+o6W0tPmn0oWhb/il1fNaUiffm2NeBavh
         d+dD3y3Ih9gVD3EOPdMNFERBwrmetULvIusSgxhlg+5ZMUp8GWxPECi4zqGkd6+e91dD
         PXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419434; x=1753024234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWEbIMOgm2MvWdo2AWMQcphKb9TFHt3GqGzlIyynGQA=;
        b=sBt/IdK9iqk33BrvgelpMia4YXjjXNZj0X8EowW5yPGK9RxR2+pBSEJU+1zRpATUab
         8zzA6nmgpYWtRO3UE0A5CE7pTZw+e14O/lTYoyMoci+H8C3CPtUdj1FyMNTZQy/9/QYb
         f6AuNaVoHD1zebWtDxgD2cUrbQwh0EYqB0NRJ2L2vWZGLzwv40p7Ntp0HU/Y2C4v+d/U
         9MilRXiwQ4t4hjZ+h4OZ5eyIxqeSPJ2AuZiZ6LVhGdGxCn+g8b3dSeJ9S6CxHypH9tqq
         +ghNYb7uALAOLvQGEl+BpPclCRCJjkG3P8EDKByj5Ggv6L6R6nxSubVayFr2bDhWjxDQ
         zkYg==
X-Gm-Message-State: AOJu0YyRdDFThKzjlqbe4tOpT0K5KdI53Iqln6M0qwckIx/JoSK3yyhB
	idiQrTpLnZAkZxsoKIak/4huE3lkcTH96W2GBP0tSyr8Ofu6Z69H9u7LrJY6PlbC
X-Gm-Gg: ASbGncseisHL4dW/u7GlxxRPxmUI+jW8Lazm55HqPKGREc3jD1MPw5sHatsrojLvKZg
	BN7fZ+izcuVCKKbuycMeuoc5x/SYsWyN8usNHYcuFVNhdCttnQMBeEGrFDX0QvNl7g/pfvaHMdE
	VDRrmOiUotiklWmJB/AEAwnb5rfluh3TyuKgsvz/2YWtdCqimbz9xQ32jdCRywzJY4JQpYFUXje
	g+wxFl9O66Gt2w5HthuYkVElDOl1DEKXSxjzUPugZoaE84TZDL+0kLTPaMniIHXbB+jeoa8bUxE
	3nTtc51xAR7KpHz2nOVuCaNKiuEKAuGiPvJWpppaXHW/I6jqByn9vOksqTRyIAxhPtXYGDP5FwQ
	dThlVuOjovcbaCXZ+grJXm+4Sa04OkFMEUHdQTjDPgcaKFtrBlWjPcEuOA4NdkoxcOHYZmSYyAR
	Ug
X-Google-Smtp-Source: AGHT+IE1Q/GRlRW+IViJQlPXOC8cAZzKAARC9NBYt8kl7k4uA3tDeIdHIbI9o6e/TSqNvutm9lBB6g==
X-Received: by 2002:a17:907:7208:b0:ae3:5ff2:8ecd with SMTP id a640c23a62f3a-ae6fbc8878dmr1061604766b.20.1752419434084;
        Sun, 13 Jul 2025 08:10:34 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:33 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/6] python3-pytest-timeout: 2.3.1 -> 2.4.0
Date: Sun, 13 Jul 2025 17:09:40 +0200
Message-ID: <20250713150938.2992477-8-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
References: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118511

Update PYPI_PACKAGE as the package naming has changed
---
 ...ytest-timeout_2.3.1.bb => python3-pytest-timeout_2.4.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_2.3.1.bb => python3-pytest-timeout_2.4.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
index fe9d814c0e..a376d02e38 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
-SRC_URI[sha256sum] = "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
+SRC_URI[sha256sum] = "7e68e90b01f9eff71332b25001f85c75495fc4e3a836701876183c4bcfd0540a"
 
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pytest"
+
+PYPI_PACKAGE = "pytest_timeout"
-- 
2.43.0


