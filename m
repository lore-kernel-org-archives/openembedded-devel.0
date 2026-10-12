Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1C4CC6B04
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5098.1791839512264141219
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aUGzQYsx;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so992300a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839512; x=1792444312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xqt7+WrPGlXlXY/CP0KQGUH1Hkhbk2WHpDFTYBLBvAE=;
        b=aUGzQYsxrTzZ/ZXoLAAmOiNumQcLjmOofA2g/9rlUyvgOlTJV8U/2ddpkaUa/3A7E7
         h3F4hiDVnKkmyTVceJWZs/RilGk6BzyktmTr/5lvfwbRtWP/qTZVwSJLPgeuyEPXC2+u
         Uzg1ck7FDmYFYV9eZI8RLzZftkXJvCQW3T00Y3uU4rvXkdQn3gY+j3fQZfOQuXc4Pzei
         2Vkatz9HLSnw59pKilo4zwWCXED1kTZ7qcPvPGb8vkYotXqTjtORKghUYTadm2ctsFBb
         INMUKSroGhGBb4ydzNhNg9qyDm6y+Sss+nEJIy+fwiJTNg2Yt2IqMnOvmQbY7TCAOWFU
         NobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839512; x=1792444312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xqt7+WrPGlXlXY/CP0KQGUH1Hkhbk2WHpDFTYBLBvAE=;
        b=W1DhxE2pvOUzBO7YNze1B+z7mfa/62lflvdIxv7GAPGLpSu/eV8q2tA6A4OLJ99SOH
         /vJToen14sSs4A4Iym/7GoGW4RIfoKO7/Tp4f9wnzbbqxGG9Cdx+yVT2J6qo7boRk+CG
         UAiumthcTdOlJAzOdLEy4yUP8lYRPeBXBq+BgxkqREokZzPqkTVIYH1av2RjQ8TKfNzd
         lNw5YPrKZmXn+5p+540Rm4GrTSsXXaZdyyqfUalzXDS1Jjdgy6AbEEAvNBp5EdAg97MH
         Y0tSAkZR3LTrone4MZZCUXo85PYXzEcThpmfykPRsju5F89uIxBJ5W+3cUm6ydy/si6r
         4g/g==
X-Gm-Message-State: AFq9FYI/3v0jg5DtSxSUj+JHFVmT9SofJ8fogqW20oeEwexKIL3Oiwpr
	xe2OwpaWamdOnUmFR2+kva4LAlNPYwEB0jPh0kMsJjd6Zazb3/ITLX3+kEuLY+e7
X-Gm-Gg: AYBFou3tJvMzdZw/gcyRlelgneC/dZ60cipvj/Htt8auTM9b0Ty3EUMNtCDr53mi50u
	8ER+Ou0s3Xy880UvYKI4IqeR35PoqElcLvFJ+NJwY0PA1Deism1BDiNX00YcVJJOBBQmCl0XQxK
	Me3QR0s1/auPFhvX/TRyfiIrJquKTT6Mte/BYKV/c6nLDiCvQfbnwXdvXW5j7yP7grd9QUNr4q0
	4+SeV0D0/iBo+2PortNiQjDULW5qRg8DNZJT0BrlBNPnkRdqVnFs3ahXq70UWPbE3IK9jpHhe2y
	w5hCNY9R5pkY532j+4AVqG6+RLUcWGFhdCYL+yb7ssO8/aGLr0bv70A8j7+nYF0xAFIesuPlKqY
	PzAK09CPzMf0iCTR1yChZh++IcIt8cUmWRSaCLA5tlbxoyjeokp5sbySkKrdCBBNNrx6rA/z4At
	BrqhrhhMC5tFp2SeaaXKsdPJlg+4ASXVpRoNzVX0563X1Ov+XHjpDMNhK0Y8PGwXcoTOJNtQPmT
	c7kdAiBZNKWSxkI+t8zDtkFAVWs+VRCpSDiKncmx1lzLbgtGA==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr8637663a91.30.1791839511578;
        Mon, 12 Oct 2026 14:11:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 37/43] python3-astroid: upgrade 4.3.2 -> 4.3.3
Date: Tue, 13 Oct 2026 10:10:01 +1300
Message-ID: <20261012211009.3352822-37-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130807

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pylint-dev/astroid/releases/tag/v4.3.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 486ef820db2ec71ff8da90f4c9634a200d6a15bf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
index 55f4d011946..c9a209aba0e 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8cdaf5b7f3f4f39557ae05ed8b0852136b43a04ab686db7d39255b206233677a"
+SRC_URI[sha256sum] = "d03854b09d92c08e18d8e7d9185d393961186ed0747136d8fcb2d1c008a504ec"
 
 inherit pypi python_setuptools_build_meta
 

