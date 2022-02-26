Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8A5C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 04:18:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.3235.1645849084027945120
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RUbDj+jM;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id l19so6422066pfu.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbpY9nlNBnq+LMO7smvLfr9hSPifm1uO6/EKLwUu9wo=;
        b=RUbDj+jM8W3fVi9A+6fPsDXCpUPw4VJaOJSJZn6CALFtbeU1bh6GIFYq2/zdDpXm4u
         OPHRjGPOZpvXSfjajDnbMPSlHfXkcD6MD3LEvpyjVB2qaYkrRZeibBvltzYRzwLnIJAX
         Ex+rPgCglD4U2L4UKYfiXRt67+QdOSaEZF+UTIJ4EmKa9+WMGWclG7G8P7xvhGLQwP67
         OMYLUnAx4QsF03yce5UeUSwq5AUARUp5HPHlRBXtK2fuoC6TML1UKNUVnc6U817Z7bTh
         /qHbpH5bEZvYjYDtJXSoHNo9pKAfrnGU+VXZaKJb2B5EalBVq6VVBruVGmE9ghPWZy2q
         ztVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbpY9nlNBnq+LMO7smvLfr9hSPifm1uO6/EKLwUu9wo=;
        b=ztcO3Gx0MAwHbVGJiGSkasIsc/7J4UKmgLo30hcIiY0prayltp3rcRW8/zIfkGoP+1
         2NKntXwPc6PD2st1PifniWus72tRlMcb176qHvb5x/VqX67avMLCvQU39f204F66PcrE
         7JWF0euU9aXbpRpPhAndEk9HVepb5IgXzRyse6Cf5x2+hbW25FdpQ8fBzKWPDY6e3WEP
         d9PoFK8Okly5Fq9dZO4WR/jMQXL/INBGk/spEgvQF0MWPhpWZjhtY7tMHy8Sq6Rz1Xiu
         1hT/ncm3GmuZDqaPqKouhF0tzcvgbQf5fhDn+I0Q/kpCRHA27LRll+ndT3a9SSdY6eQ6
         pqwQ==
X-Gm-Message-State: AOAM532qQpyI2AmgZ24+muy/GpOf34p9XK3+F4rEgBfPT0R2Nfdyevpr
	T0Mq3iTSdEr7dW3Db6lW9PsTOfF67MI=
X-Google-Smtp-Source: 
 ABdhPJzRyucIknTI9Q2yHJTFCNDk839X2DLYw+2XH4AoQ/fSryZv2DSFQpKoUd4y3mOctTlYhynvyQ==
X-Received: by 2002:a65:4144:0:b0:374:315a:7dff with SMTP id
 x4-20020a654144000000b00374315a7dffmr8829980pgp.506.1645849082978;
        Fri, 25 Feb 2022 20:18:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 ep5-20020a17090ae64500b001bc56af507dsm10614475pjb.47.2022.02.25.20.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:18:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-monotonic: fix wheel build
Date: Fri, 25 Feb 2022 20:17:57 -0800
Message-Id: <20220226041757.1401198-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 04:18:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95538

Recipe does not inherit pypi nor would PN be a good guess for the wheel
name so set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-monotonic_1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index aacc32a6d6..2af7b57921 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -11,3 +11,5 @@ SRC_URI = "git://github.com/atdt/monotonic.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+
+PIP_INSTALL_PACKAGE = "monotonic"
-- 
2.30.2


