Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5566BC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 05:02:35 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.5532.1634274154275187516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOvC01RL;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 187so7362850pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uj0Xtz376CzjleSfqnMQQRi6oXBr4m72vrAyoQ2qB3w=;
        b=NOvC01RLt4tMaJHPPx0nlxfYBDOZxMuFRH/QyBNkSnECcTO8uwzPD3BvK4D8+nQV3P
         KMVV5DlezuwPYJk5HrL8Xt8ZZ4EY8atNulIHdJOhlMFI6HcEnOlS41PygU0cKuxuXd9V
         23eupedf4uaHsyCR17ai6S1phzTGuZ9hWpvHrQOXHL/cSWPrGcUP8oJhNtdk7nOb0g+z
         xFJVjPn5PpkZXLv5q0lSWlxKzUb3Ae+65YQ2Sn4oxME9J5H1YDMncQIQnKQaLkiqi8wk
         Jn36ukAYehIWlvnXDXd/GIf2O+ykq1b2muEOkHmts0fVtep0zxqZoHJxudF4FDQZmEcM
         Kr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uj0Xtz376CzjleSfqnMQQRi6oXBr4m72vrAyoQ2qB3w=;
        b=6IFPTP2wIVXOOTyX66u+fxB8OifRcdzaDM+yRgLZLNiL60z5uDVQphqT0NvM6Ga2CO
         vSDbMRLqymf2j3V/xNNMy6gBwXzjdY44Vz/bRsImSCOFOUtZgQY9QNJk0/6miwwRAyE9
         L/Z4uaTvLeLMt5rzMo/EMNX0RYAqrjKcfd03dDXvTLnSflkZilyiAhIVJ++qqeWYw9E9
         IKLHVE+RuHuJtw0PIRyfvbQrlIt4pjbbFBdBPM2MJHRYb25fNI10juG3s4V/8yJah3oj
         vPKx/G5U9KKH+7d65uAfUdvTOi6tm2zAUjBt84LvYKscblYGjNDgOTSQoyndFF3XJ2F8
         3SOg==
X-Gm-Message-State: AOAM530e7h818zKkt9fOD61Jm2wTJwrPsixfURQFfCWogqNBLieBuNXU
	mk0uxSJgDt/Mi584EwdjbfM4qR1IrlfsaA==
X-Google-Smtp-Source: 
 ABdhPJwB3fn+PDloGBqJrWEWL+G5tSmEG4hVUA+fX5pIwYwEVcXSxSZir/MLir8/18Zb5Zv3+tMDqg==
X-Received: by 2002:a63:e057:: with SMTP id n23mr7645726pgj.183.1634274153436;
        Thu, 14 Oct 2021 22:02:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 e2sm10437671pjl.31.2021.10.14.22.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 22:02:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xrdp: Upgrade to 0.9.17
Date: Thu, 14 Oct 2021 22:02:30 -0700
Message-Id: <20211015050230.2982557-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 05:02:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93320

Fixes build with OpenSSL 3.0+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/xrdp/{xrdp_0.9.16.bb => xrdp_0.9.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.16.bb => xrdp_0.9.17.bb} (98%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
similarity index 98%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
index 6d8659844c..0a643825ee 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
-SRCREV = "a4c7ee077c049202d73f82f518b2de958d722890"
+SRCREV = "58088324956d94fd2eb5e7694a318cccec6990f1"
 
 S = "${WORKDIR}/git"
 
-- 
2.33.1


