Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F0CCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 19:42:36 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web08.1318.1655235752751608226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 12:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112
 header.b=4jBolM8k;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.182,
 mailfrom: troth@openavr.org)
Received: by mail-il1-f182.google.com with SMTP id z11so7333642ilq.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i0/vJ6459dpJszrX9kmK7V3bHPCZ0d38es+b2/hCYVE=;
        b=4jBolM8k4Im3f+d71dzvxJixiulk9tDuj/7iSPQI6U2MFY5HdVKKDZrGIHN6+YtBKO
         Q5zwZwUp88e40/IJ+ZftxYcGfuFrAbtrKT5O2YrM/Clqx3WUmDtH9/4gdxuWm4Xk8DJP
         HFN8/ZazifIV9q9uL8WwmyOBH9emqHbKstuAZhcArIvv54Tm/yK4sBplLRutNkpaFXoU
         DHz+7T97XBATgYLFxaTwkGT+08cfpgkuQCzmckyIFT5Ky58PO89NTUWvmumulcMHQ8RK
         HpDCH5JhJKJLtbKuMEUIztGkSPzUWAIhJ3LogRJEPOfBS4ffK+qr3vCm1jUAfCms4Dph
         YOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i0/vJ6459dpJszrX9kmK7V3bHPCZ0d38es+b2/hCYVE=;
        b=cRE8zYsDmCJ7BdmBjvPxZBvSOHzoy+XzlfXhZkA3qmzDyZZY7SubIkIeN1vuV+E3YS
         p1bY9VadpIVCpl1eEKv4Spm81oE7jmz+g74YomeijYsdf1YMg/SEP3fnTpIWv/IaYPkM
         BX0+P1NSHfMmdTZSj8gO4YHr3wo/4It2GGWEbyL6bHOV8oFO6tG6IKWaLa0ngUeBDgWp
         sOd2K2IIj1SZPBqnhk2brTDGxlj6poP1K3xthR6a2OV0nG29vNQ6ueqr9gxi1iAXxsT/
         4V8s8cN+RHdapdYN7aCZvBNXTAizo2LvMPbVTTa0cQS6aaimsvvdHXSHtloFvlSNA+Y3
         VIdA==
X-Gm-Message-State: AJIora/1T2Ntr6xi6kfgT1cpyuXVHo8aeIqID+S3jaYP8R2o891FTL97
	mtFmBNWOgKPhITurDBTGOQ/ycfs8xCUcnqbtyW8=
X-Google-Smtp-Source: 
 AGRyM1svWMAK7E8FrwgiDqbb2MXk7jYwDYJ4Z+udnNOYp3V8QbIs7IQbjtAsfN4rYfH8TBoOS0obIw==
X-Received: by 2002:a05:6e02:1885:b0:2d4:6583:b890 with SMTP id
 o5-20020a056e02188500b002d46583b890mr4021543ilu.297.1655235751474;
        Tue, 14 Jun 2022 12:42:31 -0700 (PDT)
Received: from beast.bozoland.org (c-24-8-35-226.hsd1.co.comcast.net.
 [24.8.35.226])
        by smtp.gmail.com with ESMTPSA id
 v18-20020a02cbb2000000b0032e1486f723sm5198188jap.167.2022.06.14.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 12:42:31 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Theodore A. Roth" <theodore_roth@trimble.com>,
	Ben Powell <ben_powell@trimble.com>,
	"Theodore A . Roth" <troth@openavr.org>
Subject: [oe][meta-python][PATCH] python3-can: Add typing-extensions
 dependency
Date: Tue, 14 Jun 2022 13:41:31 -0600
Message-Id: <20220614194131.2229740-1-theodore_roth@trimble.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 19:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97518

From: Ben Powell <ben_powell@trimble.com>

The python-can 4.0.0 release introduced a dependency on the
typing_extensions module:

    $ python3
    Python 3.8.10 (default, Mar 15 2022, 12:22:08)
    [GCC 9.4.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import can
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "python-can/can/__init__.py", line 17, in <module>
        from .listener import Listener, BufferedReader, RedirectReader, AsyncBufferedReader
      File "python-can/can/listener.py", line 12, in <module>
        from can.message import Message
      File "python-can/can/message.py", line 11, in <module>
        from . import typechecking
      File "python-can/can/typechecking.py", line 9, in <module>
        import typing_extensions
    ModuleNotFoundError: No module named 'typing_extensions'

Signed-off-by: Ben Powell <ben_powell@trimble.com>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 meta-python/recipes-devtools/python/python3-can_4.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb b/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
index 2cd2e624b..b1ba6849b 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-sqlite3 \
     ${PYTHON_PN}-wrapt \
     ${PYTHON_PN}-pkg-resources \
+    ${PYTHON_PN}-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


