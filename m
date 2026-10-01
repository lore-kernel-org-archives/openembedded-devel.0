Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58AECA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7587.1790849220991914477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r825WZgn;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db710396ffso1968865ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849220; x=1791454020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=275DDA/+OADYo86RSecDXp52oUOGTN6hIoRmAI6Dan0=;
        b=r825WZgneOUKCJzdgnNH2I/Xv2mhFelma+QrfRb2QpPazR72oEcG7emwgCal0w1psG
         edPJTnNMMNwRfHTcp7tpZUBS2FbcjZ/8zFvhvdITUOIhuyGMZ4tMkKGZd9qfbInOI71z
         nnmjSXeVb9tzpHhExwAwtJ8491iqcC6ZBZveJFuo/BZk/yJNjgDLG9ZNIWldEoemnjDb
         UTNAtLys/dTDUgttmUZuanZ590ppzvFIuqzanCLwlQoHLXSRSkL7nunMPy1eC74dQUNq
         SSP+NkTJOq5t8l9ENNbpFkR94kbyebmhNvqSSFQ1q7BP8qt4JQGJ1/D/zcSEDWk+lB7q
         0yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849220; x=1791454020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=275DDA/+OADYo86RSecDXp52oUOGTN6hIoRmAI6Dan0=;
        b=AxcPW6tp3ikJ81hxwdSVSaDSGu5ZDEE0LHu+6qCpn8GiqeU73KB0SSySmWedGrdu48
         MzKiXeQGQRytng/+yiQqcScPQtknQHzxah7zqmN4GLqIohRoTX0I8y6aWvd5Ve06hjig
         yVPk92f0n/YBcWKeK1ccJAxq8vNRS6wqS5+b6GW94XDV0Bg7C8k/ULRbWpMY2b0HbAfe
         NlcWhm0aFeRDPUme5Y4D0kktSE7CPtpYQ26ni37lVXD6C9mgXzWcDLipLVYXtc1IyK8K
         mdemadHqLW12yvl2cGRC4AKqLgSGXc5k4YpRS6xlvbKZBEQ3S1UffxbMGIP/gmVRwUAS
         fY3A==
X-Gm-Message-State: AFq9FYIIhOJ5T+RqOrXjBZ5IcPFxZIShyX9yhOBy+Yoo+Xb5MLf74G20
	d1QYAdp4BDw70KXV7iKCr+CVw51bQJejdw8Owy/2bknRO0R+l2cu7ZxuxPhuBg==
X-Gm-Gg: AYBFou3H11BjNw4FermtPWIsHgxbC9I1J885XjyDU7FtRajvS18jXN0EWKRVf8FpYki
	9f7SF0gUvNO/g1LcZgw2mzeFuS4BrCnglw55SW5K8+QC8h9C9XKfYvxNcFSTeelJ983TJdn5T3s
	NHVkf/iYMsXwRPtrFFAm6PJ4glsjhrzyJ7LwnKbaqf0+i0n5lG63xO9x7Ko0O7ffzSxdDlwXL/Y
	jdudqX4wN0otJXbFaySZDed+5i8NCj4HYpTSEYhjrBF9bc4jpxvlHWj9OLty31VGCviLxO1rXPN
	r/HnkphYwfCKOnXKmyRxr7wUGi2d9lDN2Z5q9Zg1f+N23haF1MOXRWrluZ+1FbMB0L1of4TFUmN
	7LdF9RVCFHofTogQAp4T0p55759TuvaheNcgTy11seFTVA4B/1euFuV7D/1uMhBWL4rnhYE7/uk
	91kZZHlSJzWiziHkaZi8Jn5WTeXVmOy44zeNomjp1rjRrR4iGLl8Xnj41l1xIg0phDfHGPVfOnk
	ypgeekmk9f39AJ92BpIzj809MVITDrs+A==
X-Received: by 2002:a17:903:2a83:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2e30016c8eemr13213115ad.24.1790849220340;
        Thu, 01 Oct 2026 03:07:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/11] avro-c++: upgrade 1.12.1 -> 1.12.2
Date: Thu,  1 Oct 2026 23:06:32 +1300
Message-ID: <20261001100634.1992725-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130575

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/apache/avro/releases/tag/release-1.12.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../avro/{avro-c++_1.12.1.bb => avro-c++_1.12.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c++_1.12.1.bb => avro-c++_1.12.2.bb} (95%)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.2.bb
similarity index 95%
rename from meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
rename to meta-oe/recipes-support/avro/avro-c++_1.12.2.bb
index e5368a3d43..42eaf03a4c 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "boost fmt"
 SRC_URI = "git://github.com/apache/avro.git;branch=branch-1.12;protocol=https;name=avro-c++;tag=release-${PV} \
            "
 
-SRCREV_avro-c++ = "9110c693767c1dde2665b2b57939333478b12036"
+SRCREV_avro-c++ = "8fa2067f70e3012cb3fd9a8839cd97e8c7cc1772"
 
 S = "${UNPACKDIR}/${BP}/lang/c++"
 

