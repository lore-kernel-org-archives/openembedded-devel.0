Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884E2D64084
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 19:51:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2129.1731095472723683539
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 11:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPJPpfQz;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43163667f0eso22235385e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731095471; x=1731700271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+U0xVob3A0CRvE7elZJDKRB/YdaF8RRfp4xIhjc5xg=;
        b=gPJPpfQzKANwLoaYceOXztpGuMIOsy8VwLJRAgmNcKlghk4edGf5JCwP6ygZRazR92
         DFCMzmTc3F5jcX0szPterwggnQxsU4sfu8iEwSwaKJB7HMNjMySXlow//EUDTRhIvfV5
         pQv7aX2+lzn+f5i/N7bTbF3w8dCyiOxcbQoWHX+Ge8ZBtybKSmi4Jb7zJjeZWMTlNmTP
         fFRc9JWuEMttcOIeY/AsQr5DM2O86Bk9wepJi+33U2LHuSJ79KRfgmW/apONSI3TpZnE
         GoroK1Y1b5Ogy+AjNtPRM259MZHMz+n/UjEPedWxv9VuCVvzPZIlR84MNtZdylZ6wv0n
         3flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095471; x=1731700271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+U0xVob3A0CRvE7elZJDKRB/YdaF8RRfp4xIhjc5xg=;
        b=rFBUu6N1YRcrRYOnMDR+TxgQbNbZeaGVPU5IdbI6PjbuRGwXXYln57j/HQclM5R9hz
         iFepNkRdwWhAG/9vQqHgPNI/WwlthG3DKNjvCU/oo4xGVc9C00bZ2ubYPUHA37mMdRNA
         u1z/oQ7vd1aMpBXc0fLCs6+VWLcIzSnc8PPGkRxfciu1BL0sPc08stzXZi/+nulV8kQ1
         fgDiZnpq1upqCGEwx1y1695TQ7BS2UOuPMlmE9j2y1CuwuwQ84AgyOfRdMqHywdkzRP6
         Mpyd5yNhBFnj6J7XA2RjAWf6EFjN26TYiLUShtO5v5a5fn3CbQJqc9Kqle8tt1DkkDdO
         A/uA==
X-Gm-Message-State: AOJu0Yx9d5RAYO5OD1xuzGfLaLWYT3A0tPd6wx+r8FJ3/mlF8ywTL0B4
	78P54c7QQly2Sg/1P1khHEIg2fjnUNbovIdYZAH7rc6PouiKv79htVrthg==
X-Google-Smtp-Source: AGHT+IHOxJINAvQGui1bRtkSNqeg+5Ciz+UzsfHRGNhMu3aXCp9Rkgz1GkbArADy6Q4Kp4Mk2ZOQdg==
X-Received: by 2002:a05:600c:34c8:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-432b750b680mr35532315e9.19.1731095470782;
        Fri, 08 Nov 2024 11:51:10 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6bee9asm122108685e9.19.2024.11.08.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 11:51:09 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-spidev: set LIC_FILES_CHKSUM to remote file
Date: Fri,  8 Nov 2024 20:50:55 +0100
Message-Id: <20241108195055.4124519-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 19:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113767

License stays MIT

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-spidev_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index 807ee5b78..6077ec252 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -7,7 +7,7 @@ All code is GPLv2 licensed unless explicitly stated otherwise."
 HOMEPAGE = "http://github.com/doceme/py-spidev"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2077511c543a7c85245a516c47f4de78"
 SRCNAME = "spidev"
 
 SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
-- 
2.39.5


