Return-Path: <gdelaende@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D27BC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 09:19:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.43516.1669367948457423456
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 01:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKRXmiTr;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: gdelaende@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id b12so5858214wrn.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 01:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CZYnLJvu818Bhk4hG5yYrsjy586RQ+RznOUBBtzAvA=;
        b=JKRXmiTrxykeZNMaxiCbKIyMOgzuOygS1XHOadT0wSii1qhzUMnVDeAac4NPQxB4jh
         uELsMmWw/5NUuOmnoi7k6wPNFwNZYLq5KdrU16PlzdzbahDuJYgMt1HHjaOmvUN0It5D
         BrxiesP+ZngmrEZoZztF2rMLm7hOBMqWBzuWLTeSSAEciEbb6yxOZTo0IX/0GOYErMEi
         3rqHQd9n8zNYq7Y8t2nQEck37Qfmto5vSsQkarebLX0pQ5OBbu/cLjhwUbRGM3LamVUX
         aTHFPi0Wes3BHwObgnsvbQ9L96GP6yUrlM8avceKNWqDBdhpVl77QqhQ9T3PMvMeg+q2
         iitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CZYnLJvu818Bhk4hG5yYrsjy586RQ+RznOUBBtzAvA=;
        b=KRoigrvlJrdYkfBdDJKg5O9m/QxtClhRjJVBuu0zIZnmqDincV+IkAU1nXGY1KFZv0
         0Np19JeD80/jIscjbOmBXu1Hf1dnZGdM4AJX2N11G31PN5kHC2OdELEfhQQgXdLWTFii
         h6pdzoaHt2UnYu17mSDap7N8AQE9LfvmekAjgS6i6/kp3gte7VrWNVbKvOFdyTnaoyH/
         r8DLgYcN8SX2S/Wa9WzNnlpf/idR9wXfKjB/Lw9b84Mp/2ZC+zLekfb1NLChSCcln/F6
         fokngjM7XtqL9g2D76Jh4LS9TM2k1sXW9Nj2cb/YhagZx5j4A3Nn2kD47f6NwoJBknfR
         fRFw==
X-Gm-Message-State: ANoB5plI4Ql0iYT9iF6mu9pfIjSWAbSEmeMtUphWKnh0wwepKvkbHezP
	PAxGteO2u98/gOx+NlvN74hXOyuj33n8cA==
X-Google-Smtp-Source: AA0mqf6HfEMFB3cOMCtLZZoegpuHSALct0cQ0DoCdrSDeRJPmnF0rz2L4sB2TEyKxiiu7xL1HvXUhw==
X-Received: by 2002:a5d:58f4:0:b0:241:e7dd:db14 with SMTP id f20-20020a5d58f4000000b00241e7dddb14mr9254836wrd.271.1669367946693;
        Fri, 25 Nov 2022 01:19:06 -0800 (PST)
Received: from OP01570NB.oip.local (178-118-188-85.access.telenet.be. [178.118.188.85])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d668b000000b00241bc4880fesm3190491wru.111.2022.11.25.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 01:19:06 -0800 (PST)
From: Gerbrand De Laender <gdelaende@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gerbrand De Laender <gdelaende@gmail.com>
Subject: [PATCH] python3-aioserial: new package
Date: Fri, 25 Nov 2022 10:19:02 +0100
Message-Id: <20221125091903.446-1-gdelaende@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 09:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99727

Adds a recipe for aioserial - an asynchronous serial port library for
Python

Signed-off-by: Gerbrand De Laender <gdelaende@gmail.com>
---
 .../python/python3-aioserial_1.3.1.bb           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
new file mode 100755
index 000000000..7ef47a2f8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "An asynchronous serial port library for Python"
+HOMEPAGE = "https://github.com/changyuheng/aioserial.py"
+SECTION = "devel/python"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=650b9179efef1ea560df5c08bc32b494"
+
+PYPI_PACKAGE = "aioserial"
+
+SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3b58228"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-pyserial \
+"
-- 
2.25.1


