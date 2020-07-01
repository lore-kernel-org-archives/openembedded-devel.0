Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.10577.1593562061385673231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jbQlTWoV;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id x72so719870pfc.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gwo7QUO/wr6hNiRiGM6ny1pEDLzPEDRnTFXW+dbFvlY=;
        b=jbQlTWoVJ/oKWlfYzLyYMiP0eYsxTcm57czro4oOEIVcQAX4WnS9dm5tdZ6/ehjwNv
         klBVIfqnJ/l1ZMoPO6Xj8/LqnL5yrP1kLoNLltUx5GI8LTvPZUybGU0Q3MFUSoftZUiN
         QFb/aTUIUWLOS1yFddRl6gg3rWMYmD1iRCySoLRxEaIhzKHkDPUmZCmKtocM6UQaQsJP
         DqdntXtA+xHTqp4BL2VScIpaxsQqaKPGwN6G+hcnkJvqa4H49WE0VXrrBEWrUcccO0xa
         loTalH9VJiALaSft7jiFp/8kD3Bub1JkADptOasRhvqJUIa5dATXpLB0W6BtLi3K6Lii
         5tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gwo7QUO/wr6hNiRiGM6ny1pEDLzPEDRnTFXW+dbFvlY=;
        b=rCjAEvonKERNTsXh3N/mmtyjwXoo3C9oqSzFOgW5vof330uZqk5DuVFaPkja3NUr5e
         cNT57Jzko6bFq9KtyVLMrnv77l3iSbejwEzsc4j/oZmCZt9mqQmOr7NBWGZT6+6yVeV/
         eoPxrNdgDbJDDwjZ0j/6TMOuv1HdbY/+VVgTm4nJ+4X+zRJL1NwyquzrkZ38AF3vgpbI
         KSa23FBI94w4PmczvT8zzu3X9zvQIsLERjRx5uclLo9yAhil/stEuN1Vkg2QgMqguzW0
         eaF4VNkVyjR7wZNUXZy/SAdlXEP/N99IsGBiqyKCyvgBNKH1vPU8dsaiueKdCcmRb8je
         YnJA==
X-Gm-Message-State: AOAM530EPu1zv1BioPQO4spWgw2kTZi0uzpdc75QgSuDJMHLflQTrdKr
	foirMQJzNS1qrAzBF5hTByVqPPWiV4w=
X-Google-Smtp-Source: ABdhPJxRXsyAOe4dsup1k3xC6PKnaS0sFAuHch+fCvUQoE1bgElNONZCivyIr+1vpjAtJj7AUMNPnw==
X-Received: by 2002:a63:541c:: with SMTP id i28mr18120919pgb.344.1593562060715;
        Tue, 30 Jun 2020 17:07:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 17/32] python-django: add RDEPENDS
Date: Tue, 30 Jun 2020 17:07:02 -0700
Message-Id: <d9f169fbba19a89e8ad705eae9bf7ada29b48a80.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Changqing Li <changqing.li@windriver.com>

fix error:
ModuleNotFoundError: No module named 'distutils'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1407d43bc4b2b8b7c2de35a4173556c08dca36a9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-django.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 54c77c8276..73b7ac99f9 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -28,4 +28,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-distutils \
 "
-- 
2.17.1

