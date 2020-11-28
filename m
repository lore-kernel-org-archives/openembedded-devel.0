Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.36806.1606592843239367630
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DxRoONnx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id f5so4278981plj.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=00Ysz5rLiEOvPa/BGdovmcWNxex//CfEupnfNrdH0Ds=;
        b=DxRoONnxI9FWo6tlwtsGVThHKTVhvmk1gkUmCfH/QaMkCALdALPmBXQoVLGQLZkQGv
         rntwWYk4rQ6g04Xbc2WFvceVVFtuMgpZHniRotUi4n7wUSC3FvO1aSUOBOM50Yaa22eU
         TAeS4mMzjDc+J2Adu38Aw/xfcqB0y3C7XTpVf58cWZD8st0zEihLZPHoDFG8H8mdbnqn
         5oBIo6EtlN4PB+JL4xPKhDNUHZmzf1Wog7HN1EIOAVsphFir3SOFJRK5L9T8hta0z6VI
         nm3HeQ4NlcII3i2lC6f4sO5CGf1elU1g5Kv4l7fySzYS6ZQ7MYKIjZeTJtaLBMQGHGcV
         6BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00Ysz5rLiEOvPa/BGdovmcWNxex//CfEupnfNrdH0Ds=;
        b=J3oOijlF8nemp9dgVxRj8xTFvZumQRdM65Q7oOBOvP5/Zc+JU8zFz8M8TIU41mo5oV
         2mcPMc05rffyjC7IsnFtSMQIZY/1ICGuL5AFA4V9rUxLkIGea1Y+sNCAW28kcCUPffsv
         rMGN83C/yT+uYSTbePjD3fqgu7WqfiSJmg+3Z7v1TGubSOHWJhDTwcexAO9aJMIBAfJ8
         G4sX3UI0TfdOs2n8JPDiP/92ZiYk5df49/vU+Tqb/FMBuPB1CfieYAYItRtIw2WZYDVi
         XrRkoq1VG7SYF1aaNKOT/iia7tR6t/aE9hh55tW7EgtA3vv6pC4XRx/Cii2DfZ2JW75H
         bCUw==
X-Gm-Message-State: AOAM533oJTlDYHDUxosfwjr2qDGIeflrhZWLIkaMnaw3flwyKUG2/+Hh
	bvMgBlnA1qIg+JXkcwzGwhsc+ouPMG5ziQ==
X-Google-Smtp-Source: ABdhPJxIoNdt0Ax8yFHA36trq6lC+IUKNHNF6O1BQi8+qVZI5zDMTdR1qA1uX93ABcg6qvOb7Pzzgg==
X-Received: by 2002:a17:902:788e:b029:d6:9a57:ccab with SMTP id q14-20020a170902788eb02900d69a57ccabmr12134534pll.41.1606592842629;
        Sat, 28 Nov 2020 11:47:22 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:22 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/16] python3-pathlib2: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:45 -0800
Message-Id: <351382ac620a64ffe7b72110ca8f5cd65d158f8a.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-pathlib2_2.3.5.bb                | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
deleted file mode 100644
index a022701ad0..0000000000
--- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Object-oriented filesystem paths"
-HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
-
-SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
-SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

