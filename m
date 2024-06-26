Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4929AC30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:44:49 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.23050.1719398674903603276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RIADEMmi;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so75041771fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719398673; x=1720003473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=joT04qSelk+POeBGaJVUGWEONh8TaxW33q6uRqNshd4=;
        b=RIADEMmiXVzW+B1ZX1AXqgo0rqBQ9vtlDMq79rOGpS0MNJQj9Cif6nL4KYgWHVbTaT
         HhkzZunjiy90Ecu0bicG/bqLVtn+3xuBdDMx9K5mKSB/WpWTsT2ID9Z38a2KYKB2htkV
         WhgJVDrn+F73mZ1opRb2J4SU3Bpcq4i6UbO8K/pKuGjJOtvSCLKqZSwlghCHRYPpFuFv
         +WdIMBtRsUxd3estdB5mfaTZABpy+ydPTyZHprZLW8elL8WPHbra8i0jS5wFDqU4iGFN
         myYwueFrG9h3ytNUBZ/7YDaBxhlCzSudutwNdhq8Y6jwuqSRNtCgoveGvRM9P99Ue5bd
         PzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398673; x=1720003473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joT04qSelk+POeBGaJVUGWEONh8TaxW33q6uRqNshd4=;
        b=r9dKgzElabsE8fFHnHgvnc6e/lDsbFMqsmYBIQcteCxI5RVPP236U6jUKX1mjs1KWs
         sLrQ3t97ruJxEkdS7vqAe00QOzYj6poZzXX/sNR6syXRNJHIs6icYhWN1tuV2R4NUR9m
         dI72lLVaolUnf0JBzNgE+TUNTSypSARfLb7upT6X94mKbEoVdmL8sj1xuoUjHYDJx07w
         MuFWacndjc2UcoI6bzOzCw6C+msS94yhAeWVnzYGqWAw0gRYNqOmk9/tOuczuM7A9qBX
         Y3NTvqd7a9VGZ0Ri3QoT6gUtJMQ70dwzzFjiA7dAKtSPgxlYNdhM8j5MtOXkAXe2kUs/
         FCiA==
X-Gm-Message-State: AOJu0YyRM0XkCRvjYOjocj3JCuFPeis0s2YROnbDkjGyOml+JOVH1Ov4
	VsFDuF2yg9GT96i/r8NWdvwYWQoIijs/o8Vkawv/fXoGOd45sT3fYxwqdjhk
X-Google-Smtp-Source: AGHT+IEzQ85RsBAk2DM5SBYJeqcpTahvhDI+SsrkEJJSBGi8TO1iCmLAGrHq8saiCv4A7Q9zVSkM1g==
X-Received: by 2002:a2e:9887:0:b0:2ec:51b2:2cb6 with SMTP id 38308e7fff4ca-2ec5b345de7mr56564961fa.27.1719398670456;
        Wed, 26 Jun 2024 03:44:30 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246828sm21326025e9.5.2024.06.26.03.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:44:30 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] gphoto2: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 26 Jun 2024 13:44:27 +0300
Message-Id: <20240626104427.1298483-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 10:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111091

WARNING: gphoto2-2.5.28-r0 do_package_qa: QA Issue: File /usr/bin/gphoto2 in package gphoto2 contains reference to TMPDIR [buildpaths]

ERROR: gphoto2-2.5.28-r0 do_package: QA Issue: File '/usr/bin/gphoto2' from gphoto2 was already stripped, this will prevent future debugging! [already-stripped]
ERROR: gphoto2-2.5.28-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index 513845194..aba590aa0 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -19,3 +19,8 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
 
+INSANE_SKIP:${PN} = "already-stripped"
+
+do_install:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${bindir}/gphoto2
+}
-- 
2.25.1


