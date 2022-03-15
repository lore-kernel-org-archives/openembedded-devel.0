Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D5C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.12866.1647359765824429465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoILEGea;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d19so13107760pfv.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhsEJuNfIOeswsCt9gO1LRBybtamyQZMmsk0+Xnb0e8=;
        b=JoILEGeanoCoHtOphg+/ueROOavzFUU6pFEbkWcf/pda3DImjWkvr9TmrQatqwzOK9
         O24+3iGLiztn4jIxOaBQhRlzSqD0pnuqWcKGESEwIav07PW1aK+1pg7xA7HE/bnjEFLr
         aYA51c5ESoK4fcD/ZTivN4y6mfKswJERmQWlg2L/jlS8rg1YepXCwq//UN3xj4K3/Tbx
         X04pU6+6XC2oETLGpt4hi9idvBeNw869aJv7UztG1/Q+m4f0phjIsvlXRjQ66hN5oeRo
         jvFkuubDFB5BYuNne/f+Vz402PTLcTVpIXi/td3q327sN6ulxIMbw10P+bjVImcY3BSD
         LNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhsEJuNfIOeswsCt9gO1LRBybtamyQZMmsk0+Xnb0e8=;
        b=CxH+AcfVXTWG/tkBJxzkRZpmRQCoWOLu2YWR+U1pjPvHDA5yro70Q80wFlosc8BLr5
         6+ukt5KUzFEXQe298TMCpcfPbUDtPIBF7AfZ2mARTOFV6k3R4tvDabVL0/yPqAPfgiUp
         q0FBcXlhy1YPY8ErX0EA4mPB2c1ca7vENUOSqwXD52mp9eZ/PWdZIWS4EE954zhik9kM
         nrsTARxCrnABxWcyaef6zLIRkHm0/BAo6NiLEtVfK63FfllJi2i56fpAxOE5rsxubpLr
         88AWjZ3lflOBQtGx0eRDjNZJssZrhrJxLdemu6vqbHFdAdwfUqPJGRjinxIria0Fu8tQ
         A6iw==
X-Gm-Message-State: AOAM530mebCGzhzULMwvlIYdLb+7+n21YHzIUrF50lI5W4TEjtNGxodo
	blPyPkCSpJegpW8evnWhNn25UsIg3B0=
X-Google-Smtp-Source: 
 ABdhPJxpDDGpNqBWZV66GDITRuRWHcZ+z1qQqku3bJqOEKyBzVsSMa1i14HivMUEoFk9r61h7IgZzA==
X-Received: by 2002:aa7:805a:0:b0:4f6:f223:a459 with SMTP id
 y26-20020aa7805a000000b004f6f223a459mr29214028pfm.4.1647359764625;
        Tue, 15 Mar 2022 08:56:04 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-iso8601: move to oe-core
Date: Tue, 15 Mar 2022 08:55:53 -0700
Message-Id: <20220315155558.969249-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95994

This recipe has been moved to oe-core in support of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-iso8601_1.0.2.bb               | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
deleted file mode 100644
index 93af233d29..0000000000
--- a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Simple module to parse ISO 8601 dates"
-HOMEPAGE = "http://pyiso8601.readthedocs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
-
-SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
-
-inherit pypi python_poetry_core
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


