Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754E6E71D5C
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:14:58 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.29454.1696022090725252606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4180adafdc6so78419681cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696022089; x=1696626889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfnwvq7RMRely3m/5F4qh2hQ9fhM16nKPPWMdrj3DY0=;
        b=Sy26EZ9IxcWxYfpbjPGGAuW9a0reGV9qS3TCPn9bL6HGQF6B80i3P1xDofMqlQuThe
         aWup3RDiY/5mKGDiyAGQciaXh4SgO1Axh+Lssn6VaSCIa1bhuOq4DGRxn6RDtIaIRjGg
         TrpCCv0CSIzzkIkyJovMusIuuRCv6EeFTe8HR7JrhEAE7O+MbLu2MCEDb0ZxsZsixkmq
         2hI0e76UY/gf3vf6g3e+dry4bR/XTi0/a97yRDgnwoBuIXcVVBPS3nA1ldLV0B5+nlu2
         ds/iKG4RDyHLJUgvMadB+EKlBqG7ILpnu7LUKMnppSt7JzSoT76g0aL3vIZuvV1gA5JL
         NAIw==
X-Gm-Message-State: AOJu0YxyPtQUcrkzlNQ8AxgfSuwhxHQTcLTpJqdEAo/5Xb+fWjRlUzIY
	o9lo0vS7+kVBCvqg37cwK/ITay6OnWIpLQ4V
X-Google-Smtp-Source: AGHT+IEr7F2hn55fzzPStE98pZqPyPMa4yiPgfIpmDhURlie3G2Gjt8WUFHjOZr/yhJIyTOfP+VZ/g==
X-Received: by 2002:ac8:5f0c:0:b0:410:9b45:d7ed with SMTP id x12-20020ac85f0c000000b004109b45d7edmr6505094qta.56.1696022089323;
        Fri, 29 Sep 2023 14:14:49 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id fp6-20020a05622a508600b004181aa90b46sm3909425qtb.89.2023.09.29.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:14:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-auth: update version 2.23.0 -> 2.23.1
Date: Fri, 29 Sep 2023 21:14:36 +0000
Message-Id: <20230929211436.2132697-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105270

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hon3-google-auth_2.23.0.bb => python3-google-auth_2.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.23.0.bb => python3-google-auth_2.23.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb
index f7fb76b3f..a3228be23 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.23.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "753a26312e6f1eaeec20bc6f2644a10926697da93446e1f8e24d6d32d45a922a"
+SRC_URI[sha256sum] = "d38bdf4fa1e7c5a35e574861bce55784fd08afadb4e48f99f284f1e487ce702d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


