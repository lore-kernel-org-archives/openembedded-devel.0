Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B911D4A60D
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1314.1768549099628856779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JA2hkxDp;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso15382095e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549098; x=1769153898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lvFxJjHeDBA+OlJNsKT0bX3Sk8yfxxDkFoflMRmlIY=;
        b=JA2hkxDpLEJ3zlJEYRqrLO50/wWwG+wShFhdcIaPyVmEyiR4B7spYHlGaBEOeoI9zS
         jTygf7lxxN5JKLaCxYlFAkcExoTwF9R3oAKxH1EC+RePwnv7bhy+DyEfBTarJMXd/ILm
         rxJ/6u/G2VzlpolAFxkGMDrQGXjdia9nnfNEoexpvvpmGuRQgqFj8DMWrP5pYGMyKWKi
         T1rAArTTg57FNTqnBdJtxzliZD0IDaTXVT3MEWawYvGCyAHS9hkW8HO/N94rNGAGwhnf
         pykMC0Syk3dzQBLDn8041ot8tfPuehBJ4UzzLgufpzVRat61k9wVI3IjQ0OAETy+4cye
         DBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549098; x=1769153898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lvFxJjHeDBA+OlJNsKT0bX3Sk8yfxxDkFoflMRmlIY=;
        b=jMbwfx1hU0T8rvXykuNhNXmvJh4cHz9CyKlZ9lGt1NEwHnuKbe1WlWydYgVP+4+BO8
         mYrvQKKcKKDRVy3qFNryVkw7F86GAZX2vrRmFxAwzS4+0ZK0Oci4FL+bBxzUnrs3hnt7
         8bPv8dRwgYZYERyBVjZySDxSL1Bv6xfSSS85lNojHhLm/WsxD+MBznm9Cd+W9Mrkne4D
         KoX9IZF22QQNrAfR8ZI46nbaxZzrRt3X2ZBncsS9d5PDHvBSnN1cFD8sbIeH4rhrnCJW
         +xWeqYXa1Q1L20r18SZ1BmIJ6C3txLT0c24pOkIK9dwGu/AnTkYl3BD29YMOB7vrJ4N6
         ldzw==
X-Gm-Message-State: AOJu0YwmsB27qhWhRvyYcyc9zI1tw+p3Jl1m83f6wRMRedrpZR9LPmmW
	nMFb34OwY3gICpvo2KzuodSqhn2DRQ0m2qos52UBTl5F/aoak+tkJuPp0zGKzw==
X-Gm-Gg: AY/fxX7lGuUps6YV7V/bUQW9Jp2O0grhA76IMs2uexQJdaYKENT0kbCJrlC1HxnQt3A
	xt/ta2TA5akBARhrYc6ogc1xcC0mMWVfmjgg89g7aJtXbJa1NlxqJfysdX2ebMvIEzEtruYYlaq
	vHmdjeUPGZzYpOIaEQDmxoHu8xIAPjIwPNzXudgstWYJGWk5uiU1JwEey1CMXjoDMZD2HZLEnH9
	WJRCqzAoAYHlgxPbpQs3OWgm9XVOVclJxSPGnoVEgHboeFd3krYfnfPKGWB5xgzcNYPYPa4YRwZ
	u5O+OnmtSi8I4WIGWY3/dhnKu4my06JbV7OWjyZQtbKjGAPhZZk5NdvQ4l7Sm9iC6xNZv03aKpf
	PTyXD8MQ00beeuFruTMlwgcpW+PWePX8XD1DxExPnGc9iBZEiBvWNq2bojCnLqTfG99DGqyJo3v
	+MOiqFYyTC
X-Received: by 2002:a05:600c:4447:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-4801ea2a21fmr21334345e9.0.1768549097940;
        Thu, 15 Jan 2026 23:38:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 6/6] python3-smpplib: upgrade 2.2.2 -> 2.2.3
Date: Fri, 16 Jan 2026 08:38:10 +0100
Message-ID: <20260116073810.3290097-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116073810.3290097-1-skandigraun@gmail.com>
References: <20260116073810.3290097-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123526

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix: correct UCS2 part length following #184

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d4cb5d585ddf970e575dc71a9175a541c3c02269)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-smpplib_2.2.2.bb => python3-smpplib_2.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.2.bb => python3-smpplib_2.2.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
index 5c635d6fb0..25f8f6afdd 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "f2191e73b24dba94f2889bf2ea1a60aeef6bd43afd3ddbbc632d7e41d9f30e47"
+SRC_URI[sha256sum] = "5215a95b0538d26f189600e0982b31da8281f7453cd6e2862c5b21e3e1002331"
 
 inherit pypi setuptools3 ptest
 

