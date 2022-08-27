Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D105ECAAD4
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 00:02:49 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.44008.1661558565127921537
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 17:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hbNYmI1l;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id m5so2348954qkk.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 17:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc;
        bh=aS8E3QU/MoSCJAC4juz0ncrFICTsZHWQdmkc4fqyFaM=;
        b=hbNYmI1lPulH2X22xCcpFGWoEEyfYuo/tbhOvdg0IPcnUS2/L4RNyE73/OV1Cden0d
         qh1uRpnSL/SdmD3oQCNGNF8S/9dxvXl0PtX132zyVqe0vdiSoBoD3+U8j03WW49d0LrG
         1tDsmYrT424oWtg9y8bW6KAKXn4ZFOgJb+Kn1jCuHyC5ctqv+fHFugQ99lUAElvv78TF
         PUXlkeM7Q9sf6lx+jU7MVh1o9SMqM46sr7baO5I1SZjAYIDlxnF9LXTKc7V1MNEU9xhw
         j7XiOXPd5xLIUFagYdxY0CW2+QUcq6J5rnhyZFB7CpRXf34cQRHz9b5OpMTlPnID+l/1
         BGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc;
        bh=aS8E3QU/MoSCJAC4juz0ncrFICTsZHWQdmkc4fqyFaM=;
        b=7r6/NjAe3r0kJPAk4t9TOTmMd8eUzc6E+EyuqdvAHATQuytSEp3bJZDvul7uRNjMaL
         NJBNYQPlcOdrfcgt7vXETxvZ9yZFkoDmU69yvGS67EbMKteuUhzt7Ae4laJ+tzONlsei
         FOD2N/WRCj3OUJaxzca/iO5cv9wdeixC4MnYhLHgJ3ak4vxaJh0+lvQNQ0uzp+2bpkdh
         zSSlYmN4OPqKAoOwr5wq5AwZKItOi/5mBp0hVfZNy3gv5O/MkD/DiReIiNOrnta2s0ch
         vRIRTOPWFefDM0KTRPPs9fXOC/W8tMEYMrvMUvcBdUrKOhr83UgZkqofoUjA/YROegtN
         j21A==
X-Gm-Message-State: ACgBeo2tVgC0yPWkGhHtk+XaADFGFu5hwo5rQ8o27gEKjus3+2RTz3Ur
	xVbt4BHvG6e+k568u7KMh/UlOet1QJc=
X-Google-Smtp-Source: 
 AA6agR73M9+FFYeBU/c2al6LZovfZq3kGJ2+vbhkZmFkEDwCZ5jvbggzU7SCcjMT+XXh/9AStaaZYA==
X-Received: by 2002:a05:620a:1455:b0:6bb:e036:d24b with SMTP id
 i21-20020a05620a145500b006bbe036d24bmr1475102qkl.384.1661558563846;
        Fri, 26 Aug 2022 17:02:43 -0700 (PDT)
Received: from thuvia.hsd1.va.comcast.net
 ([2601:5c0:c280:a00:5b97:5b4a:44a6:6d49])
        by smtp.gmail.com with ESMTPSA id
 r2-20020ae9d602000000b006af1f0af045sm700392qkk.107.2022.08.26.17.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 17:02:43 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-python][PATCH] Remove dead link and old information from the
 README.
Date: Fri, 26 Aug 2022 20:02:39 -0400
Message-Id: <20220827000239.91727-1-philip@balister.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 00:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98483

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/README | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-python/README b/meta-python/README
index 01c51dc88..36c193957 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -19,11 +19,6 @@ The meta-python layer depends on:
 	layers: meta-oe
 	branch: master
 
-Please follow the recommended setup procedures of your OE distribution.
-For Angstrom that is:
-        http://www.angstrom-distribution.org/building-angstrom,
-other distros should have similar online resources.
-
 Contributing
 -------------------------
 
-- 
2.34.3


