Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDC0C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28165.1786651847482623790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SoPmamSy;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38deea72eebso278756a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651847; x=1787256647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jaBhK1BGP5XIUx3wINaeIibGk4hYmawPJLk/JJGifs=;
        b=SoPmamSyZ3YdtclKqQZ+kva0Wydpntp5/DSoJLLIYryGuWQaKByXd6PehJNHw5Stmq
         LolVbY1gEDZgH9gRV0ACYkj8N9HBX07uI2tw4m4i/r0xaOXX/ZF8Kqf8HztvhJlvgF9g
         +1aap6DymhiO9kzWORbCtJbRsv8o88OZ3tGyQQxvVi7/cFNaTvuIfqlEmaxYII3e8286
         a+bk6pU8PicLjXLHs5emR4WsDHJbYuiEk2IukAfbdFlRwLTuCUNYNLjEoF/S/QbQuuZz
         zoeqlJydxiwjj4Ue9p2ZOLxfe/YlnVL2MFSvTGFns/5PcssQp1ygxdYpoxAkzkhak2o6
         3DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651847; x=1787256647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jaBhK1BGP5XIUx3wINaeIibGk4hYmawPJLk/JJGifs=;
        b=ZsHLP+IzTuE84rJSYn+4E0QYBdm2uJCdfz6WNcIOuSyrSp/Kr8lW5xjG/PwdCpEJzt
         l4qsseu/a4uj7oTGDiS0oPbamnBQHNcjhqsrETTBFkAkRsRuLPgomHFx4lYeH4gF13Lx
         3eD5moZmAJHW08MwbOCA4dsd4nAsyR7+T0qwZskwvQLJZ/r5LNpzD/tj1ZBIB/p6V047
         A95vZ9yQHs4DWX24LHl7COhc6t3e3URrCroGNTKw4AGCqmAhJre3XS3cLBtqy/qlOEPf
         zW/yHmOz721zI7sk8i7+V+ZQYBgc2S8u2/zpsTHYijFfBNaVHQMjH1Vu4s0iN4RFlsKd
         O9qg==
X-Gm-Message-State: AOJu0YwE6VRRxkksSJ8DMW+Y7ANhaXJHy9pXDh46EC3WeOPiYwHlpAi3
	U4sfkk1spRGpuAZFTp72j2BDbZQuR0oXnno1LkWGgtZYVi0zGOPgkbGG6KaFphXv
X-Gm-Gg: AR+sD10OKqe/VKmKDVI/xtVs6vWujjjLpkroXtA9WzFK/RpYhTIWMN800zUueVgJFmE
	9mDUx5AW5BhiH72YxvBh8WcXI8Ju/f4CvVJsfts7PCRLdGBUm080q/Z6Jtm52L8KY5xBO5vS7rO
	WqdovhWrqj9jMolliHUQPqG90n6FUGfrhevA2b4p+YiCf5D4aXurZ+SHKZhAOLGuMCRUudhuwiE
	lHcfISzepdILeQc7z29p2nvib5rsh6Nu6kbEWIsxV8c9b9PJVvm54j6Ew+1ewA4mqpRiWz9LP9h
	lxTadNLvB7VEr9gozu+sMrOFg+iq/G49H+LRbRyFJ7sLeRkgLNdPp7gUEfRdqKQKKEfPTPwRoyW
	ywy45NREpxmXcnLurzjg7AJSxmGW8m6dH2XrUEPJg4s7181wVM1XvF8Dvs3SXJTmFwGXHJv/fkA
	vIKYmFPGJwS4uWyE3QVpF7mwVHtmtPT6Ok7U/xrmr4P9Q36m8uMZ3hS6S5N+YNI41xg2VBBEvk8
	GdqOgQxkJpjFQ3MWjxc/O/IllPO1fD2a8US7u2LobFOn3KXLisbTz8BxQBW5x2bYu9/cDzQNmUZ
	NahOnGhpckl/DvgqtVtaVlvV0Ce6j2jBD7XXH8No9HSQ0l/XmERh0876SlwT+sfebW/lDWN9Yxk
	aGLVPVP0NtESMHQ5sv7soEehdH8+FxG/LNzVf+gXLsZwvdQ==
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr688128a91.0.1786651846867;
        Thu, 13 Aug 2026 13:10:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 73/80] python3-uinput: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:27 -0700
Message-ID: <20260813200834.1302829-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129017

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
index 164a6e902a..f63cbf22fc 100644
--- a/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uinput_1.0.1.bb
@@ -10,6 +10,8 @@ PYPI_PACKAGE = "python-uinput"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "udev"
 RDEPENDS:${PN} += " \
     python3-ctypes \

