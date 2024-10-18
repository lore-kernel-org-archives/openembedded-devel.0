Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D9CD3F29A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.29981.1729278826130876967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jBDI45MK;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e214c3d045so20734317b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278825; x=1729883625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsdN2dJHLRy34GH5LLqBbzdBeXu7QE7MVlG9zWVPGqI=;
        b=jBDI45MKt19ft3euXAMpD2HPf/b17VmBh35A10EkZstWrUwcUPvZ/xSIrry+M7s+pM
         okX9hD47W7Xg09uqFcXPxrcBigg+iaxSeODI/w4M1x0SmLzrEA4cU1GDFM6IfFXw5vvD
         dqNQnOaeePPhz360LUk0WBWs2CBqHXudUV5JRtpEH0O1qsKFBi25HEqAxbgWJH98I1mA
         TPavv2ujIFDk0szVMiAdmAZLkOXJtyhI806BFdik87N7dRz3TOfk8nSE//icLVnnuBNI
         ZutUtrbd/SZU+z/mG5QSumfgAe+1/Z9mfnf5ohos4MXd55JAkSN6GMs3KiJG+SkJ8NsZ
         yTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278825; x=1729883625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsdN2dJHLRy34GH5LLqBbzdBeXu7QE7MVlG9zWVPGqI=;
        b=acjlB4/J3FSCRY2NAicJZrkAEsG1P22RlhDX9jck6eo95/N+C35yJi2ecGkufDYeo0
         vm0bfx16qiojI5tqOEFNr83gLVOQhIVFJNhj/sAR4vefFjcOneQ+cibRNTnvX45oZGjo
         +KIRvvcrqbTjapEMotMUbMHas0sYJJkzC+55Rh+OfUYuyCyU+ER+dbmv+iM3PGTUZNlc
         YcC5sSPEWUReYE76A80VDKta60CATVRnirxCyq5jpEqrR+Z+zkXu4oj5zx8aQhHZeMgJ
         IVMYPVz3CgINCP6s3rQdvvwKbu65R4Dl1XciYfoDo7912ls4SZLg+5j4YIBuqBGhUS2f
         cXrw==
X-Gm-Message-State: AOJu0Yx3gqipBmNuh2jK8dSGp0J4X8aIff6TBoQNpYk/S+Q4CLRXabt3
	8Er3XTJ7DUPpRvRy7/eRo+KTV81SgcNfIop5i4/kKUYJbI99rqvbNyPNvw==
X-Google-Smtp-Source: AGHT+IGjcT/Y4JkOrnpnWtCShfzPUrPMn0ah7Vh88QKH7vLdvpSQN0DGVYyWuF0fOwFfUCaMC+uNIw==
X-Received: by 2002:a05:690c:d92:b0:6de:1e2:d63b with SMTP id 00721157ae682-6e5bf72c562mr39305637b3.1.1729278824866;
        Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 53/68] python3-pylyrics: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:40 -0400
Message-ID: <20241018191101.25184-54-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113040

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
index 1ac95e8be..49f4f7da8 100644
--- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -3,7 +3,6 @@ SUMMARY = "Pythonic Implementation of lyrics.wikia.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=14;endline=14;md5=95d480cd6f8471abaeae21bd0ed277ba"
 
-SRC_URI[md5sum] = "1f3c997edeba149a8fb2b861cbad89c3"
 SRC_URI[sha256sum] = "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d367dc1d1604b4cd0b"
 
 PYPI_PACKAGE = "PyLyrics"
-- 
2.43.0


