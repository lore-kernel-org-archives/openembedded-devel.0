Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.3134.1599324971293734135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIxgPOmz;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y6so2544003plk.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jL+ldrvedLBNvZpeNzTfZ3TPW2/oGg/mqQuDmzN0Q6w=;
        b=nIxgPOmzSPUkuV4WHjcohikH7nzIBQjnksQwX2XSiRFrFgxw3TVXQDwKVG5e1Vvann
         tuZiiZlwHER1owykUZVCzXgECPOtZI+uISmJnha2jRURZJHycVIMq8OUa/SxnXRL2DZ0
         O35D8utkbCP4rznSauN467ASsseMDv5ifUmZgoOqALjCkzHd8e52aLQ5U04MipS1x9qz
         0gMrKOlIyG2BcXi3BdcMCMLHBcYrkGcsmQPPkyljxECaveoR0NGs+aE/NlvjtkITYuQK
         GVCp2Hbri8ZrT4Q7BCJ3g+1CcKQbm5vmTcQ5FCHUp847Fyk9RZVA//bpyqLx01IktWVw
         8ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jL+ldrvedLBNvZpeNzTfZ3TPW2/oGg/mqQuDmzN0Q6w=;
        b=ryT+0kgPP3TvZbxbleRvak2LfhIXNWK99Pqj7mTGOGZt6CRKwZMVVlQQUAIw8f8YbC
         6M/JZE7vh9vXexHg1twHzQM0lLhdslVNaDA4SyR0+21MBINgPA+8MV9idCDz0BBwtkvn
         WfuXhW3rec5wl39+ieAjvu6ilTXhO76AXLD3MaP6rYc7F8a4YjRlqGwe4IdU+ja6Mx17
         Fp4Lqa6+B0Ag23bLVtMV/9DkUXfYAzMbDsV+BF09JB0MdDNwDe5re8Zw+E2GXR2LHb8e
         Uc0aq6JGTGPh//v2RNA2qLnPXnfARPJ5v+MNUdEG1UHJA05elhwkDCahHsaZWZaiDpIX
         oMjw==
X-Gm-Message-State: AOAM531PIaWpF/YiZhTGFzOhNlZmqJ30aZw1zhh61jhYvPRO6dBgdvoi
	xpB3N8OzyGlJDhrcbXAw4UYOVGNrAdY=
X-Google-Smtp-Source: ABdhPJyXTakD6ysxQi/RCnvjk6V887QEYFxGluTaltnce7nuwdBUG2/O9YIXRzZiJ5o7yhsBpTv3iw==
X-Received: by 2002:a17:90a:414e:: with SMTP id m14mr12448944pjg.186.1599324970579;
        Sat, 05 Sep 2020 09:56:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/20] python3-obd: Add missing setuptools RDEPENDS
Date: Sat,  5 Sep 2020 09:55:48 -0700
Message-Id: <135307cf51ba010dfcdbaeb8ddd08af5be9a65e6.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Alistair Francis <alistair@alistair23.me>

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9cf730f22266d63df3cf63998c87918dfa540fb7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-obd_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
index eb8a5a7474..8f17068a48 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d32681
 
 inherit setuptools3 pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools"
+RDEPENDS_${PN} += "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint ${PYTHON_PN}-setuptools ${PYTHON_PN}-packaging"
-- 
2.17.1

