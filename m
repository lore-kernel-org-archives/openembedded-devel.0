Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BE5F3028A
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:44:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36643.1773607473176147810
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nK50mUda;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b04d051664so7778725ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773607472; x=1774212272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAPCbObE6mMt4U4wwikHdCDIzixt9sQ2Mwsjy1p3QIo=;
        b=nK50mUda0yinK+eBYHI+HJglFH6R4j6lL3yy4cwTYn86Ya5J0/vfgfu9AyKrfi7ZQF
         AFRY4qRgBr3yN6tbwifQtaOQaP+qcd/6UNHYJXdtOAhPy7RxDi8AUqwQaeVDRdhnKFAl
         3cLapc6pCNj7AUuQ0O8JMQLgA4v0SVKB6l0SQdoBgSHL9xsLGh571SYqTnQNRaFXm25L
         l4KGNf1qOeMvVpUl4oobklvRHec7ivQcw2/ywe1UoR1MH2Yldfk+xF50h/KYwA2f+6WY
         JDODNLwD3OoN3NvHZEJqsVI9gPbRafj17e5u3zgPVlcggKejo3P410GXbWMNYgXYpc+m
         Jocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773607472; x=1774212272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAPCbObE6mMt4U4wwikHdCDIzixt9sQ2Mwsjy1p3QIo=;
        b=Aqbf8VCvMDupbOQ0kvpOuXX2pDyXkB82ad/Gl/C/hdSMpysQXevdLm5gj7vzs0ENfe
         08yDUuLtIqgci8GtWZZ1AUgl5p3+vkARhSnaFpNPEqk9MF0S7hlCK289VeEdW3tM1yFA
         qjRN5EqCNfuYANXIieoNe8EPJg3uXSR8p66N4sO0kjC2sIByw/qZ7SfJsq741UpCix4h
         16Njxb7bSTgKOJGFRN6ElnF2llm4U1naSl8Mv0RmSoFtCXDRNn0tOnOT3VmTfW+cA3d8
         ORGASB2yTXGzoeqcEneULl6vlGWBPsU4yxMcYmqivZr7n1pq5Pd9JfpFIozcLK5PMb+1
         HbCg==
X-Gm-Message-State: AOJu0YwsKHvUijRhZQpjg+XE768AaynzKv3sOE5HZtamh2x45zhuo/nh
	9dELxQJdY/7BZXWdFXRq+uJN2IHC5BaoxpHrCCW5BpHIBVq1/MJjIiQQ0mSZVQ==
X-Gm-Gg: ATEYQzy3Zqs6c2+mNa/RnOURiCTZ0orNMqRjuP/iedTWHQTEZk7O0G/UzbqQDfFX4XI
	oJhty8BXMuo7GU0JP4H+qkB0cU4X9UU+M3jv7OzRtoRZO2n9N4yTJup4cudmgXX5mTCMIGz+bNC
	XNX54vKg/gYW+bWGI5H/ma1nxlQb3PGg6yhU2mF62MeJaK6kC0qULfRf9jffrIIABjc3OgFj7w+
	maUepUX2xHFgS1u4/GGRmj/fwnDIamKDDaFCUvCCJjZwqHe5fg7zmfoCcH3fGiLrY7ZR1Wbw0bw
	ooC+OhaLaRl2ioIMqLcr6NXQ6DztnIgl4cGmm7YeWKSTFRN2vFLcPh07l7gecJcTsRMhjDKsFv6
	SkGqq8SvWogPwF+agEbBkJzs/LKUEFTQwWJKnSwUKxBrWtpu7Wl89PDUEyt303sN8X94a1pSs/E
	KRuj6T2SdrM35VRcGzfP4LjVnU7IGcADAyUPkdP5O0YOgfDg==
X-Received: by 2002:a17:902:ea02:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2aecaa0b2a0mr115287185ad.25.1773607472303;
        Sun, 15 Mar 2026 13:44:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3ecsm107873255ad.42.2026.03.15.13.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:44:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/3] webmin: upgrade 2.520 -> 2.621
Date: Mon, 16 Mar 2026 09:44:20 +1300
Message-ID: <20260315204422.29217-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 20:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125247

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/webmin/webmin/releases/tag/2.600
https://github.com/webmin/webmin/releases/tag/2.610
https://github.com/webmin/webmin/releases/tag/2.620
https://github.com/webmin/webmin/releases/tag/2.621

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/{webmin_2.520.bb => webmin_2.621.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.520.bb => webmin_2.621.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb
index 16a2ccab56..bb5ac1c755 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.621.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "f73bfff803c8eaf566044fcdcfe5edb150bdeda721ec9daaaafd17a23919f529"
+SRC_URI[sha256sum] = "88381e8bcdd4733b215c114ca2158dc044892ea68dc0da4d235d88d2b1db4bb8"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 

