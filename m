Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1877BC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19824.1786922648403796450
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j4HOjSpH;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1623105a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922648; x=1787527448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuCmkzm73OJ6AYrmuCyIPG09SuttWLkCFzl95smfy3k=;
        b=j4HOjSpHAXxmv81tui/rPP58QYgl6VV3u/Ri/Cj/Yu/pClCjk3GhzyApvymZboxnmM
         LBwRBwJ6YyyFWmAYv5cTUNk5rTn0/88zKPnjkGSX3uOCxCQxbBLiS93LhTjXu5cfOtpa
         al3ZGQix8DSg8hOnZfGbw8OGzSgS3JAn8ya0Ye8hx7ObVojjidjoLdnRxgYuT1Le+yzD
         2Gv9M//jFmOe7koWRwLeZN1vw7t1oxHAxne/KxiKLfqsI1TZFLDMhGEDjumTI7jfPlZT
         YrSO+i18XX75ziTx0+9mK1GxbbOCzj7j4HCu1Rk468HerZknquAStBDxHvw/x/00a+qZ
         TvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922648; x=1787527448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuCmkzm73OJ6AYrmuCyIPG09SuttWLkCFzl95smfy3k=;
        b=nQ8o8mRigUQtWuy25HSWigXlXAl55jrHzcr1eu77eHF5DVGX8vHCm8rVCDYodUdGbL
         V2+5lI2RpODeVkEfy8xBoW/13mFfiJMiPeX7pljYRjW+h9NAimAs5k/5AdTfMfhfNvy7
         NxqiUggJWcpl8XnO266Nc5zXXMh6Pk3zLSamZyjOkp2+JWebg844Nk8/xes36rDpo+8A
         zJTerTJg/0MUjE/kP0Y/b1qn2WZ/FuVCuGdVmQ2uZNJBaS4/xYHb9KFLAFIbvoUmyQyj
         wjIXOwmUUDmkdVv8bam2NbSFkNC7TUUd+cLZkFzFKNmqzeS9XzCaajXiT2kSYNdNi4Ik
         2iDA==
X-Gm-Message-State: AOJu0Yy2jAGTIU+czYqbRqWa5/i+nPT/7qer10nL0hvwh51jh7+7R88e
	4479BEF1MKBNmi+lvPkOXRsj5tgX/Ex4ggNXiG8XEiVqS/10x8f5P8nleS316mTA
X-Gm-Gg: AR+sD10Ov7I96ymb7DgYUv01NJ7C9n0fQ213q615jhkdd4DtinuJbWlcmQOZqdbOrzJ
	iOJYtNFPQ7XS9SXNTBcXXWKZ9toTMren90mQebUPJpddM/cCdpAO81z+T3OTEaN1TIkRBmoh6fz
	qxR0zDeGAGqBwczQ0wQiiZabq8yQYsc1EpJj6JxAo5aOVD1NbOQJX0t4x1IuK6WL1gHL8rauUSC
	Id9FG0gTEu0Osb7FY9jCINjluEBXAhw39VIJe9AjRDKtRvG8L31nj7E1pKLUtwyvpcR+63/M4qb
	5IkqrlLNF175hUkX4SGpp+ro/e2GwEV8L1G1cm7FcWw9TPtGRetUYlHz1XPM9LiPckEbyTOlOSv
	jLPNtK6hrFUoEAwUjZ5rUu6bbjE56E+VHTg116uQB3BcyLYxqTv/GP0E0gT9l5OIw1jStO2c06D
	OUyVLofwKRY6y+Jc2n6bJJF1Fzv19zRrBDXkJ/4I6ekOy4B9/4RwVtn39Kyoca7xlPchxZzvGJ/
	dl8sdym2NJoNRAjXZxVETDp5C8kn4XVGcjXFx400cFSb3SxKN69TSycyCZrX2/7bF44QRTXMpqY
	WJB6kG/a9/bNt0UHjm2Xqj+2cCIJiXo0XSVpDXDfQ8WwPniuJlzCJBW9t7UrVxfPyLqsMItGatn
	e+EI8xA9y8jQ7eUqT82UDYi4S+UVPOMRyfSPX8l/lyXGb1w==
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr24953068637.28.1786922647597;
        Sun, 16 Aug 2026 16:24:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 04/12] python3-fastapi: ship docs_src for ptest, drop pydantic-settings-only examples
Date: Sun, 16 Aug 2026 16:23:50 -0700
Message-ID: <20260816232358.1947922-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129181

From: Khem Raj <raj.khem@gmail.com>

Copy docs_src into the ptest tree since scripts/tests import
docs_src.*. Remove the two settings examples that require
python3-pydantic-settings, which meta-openembedded doesn't package.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-fastapi_0.141.1.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
index d26a0ff070..38a691953c 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.141.1.bb
@@ -42,5 +42,10 @@ do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/scripts
     cp -rf ${S}/scripts/* ${D}${PTEST_PATH}/scripts/
     rm -rf ${D}${PTEST_PATH}/scripts/tests
+    cp -rf ${S}/docs_src ${D}${PTEST_PATH}/
     echo "import sys; from pathlib import Path; sys.path.insert(0, str(Path(__file__).parent))" > ${D}${PTEST_PATH}/conftest.py
+    # these docs examples need python3-pydantic-settings, which meta-python
+    # doesn't package
+    rm -rf ${D}${PTEST_PATH}/docs_src/settings/app02_an_py310
+    rm -rf ${D}${PTEST_PATH}/docs_src/settings/app02_py310
 }

