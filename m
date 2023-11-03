Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AE8C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:10:45 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.50602.1699017043729536745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=fAZ11lwq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.176, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7afd45199so24813157b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699017042; x=1699621842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaTRNQL1m7g2omCKTNm36xHJmAsoWfee5y3myRxUgo8=;
        b=fAZ11lwq6ZBgx3cFFZJxFnb4mzG/2EOFygfN5gnkTy0kkpzd8SR0/bOAr1/nRetp9w
         Xex/RlIohd5cZYUmxvgGInSuaIVX1OSjw4Xv8+CL9ogBPYDJUJ5j1Y+9XqRjYBLgA4Ow
         9tyM0Y3K6U0ikThT1RS+P1jC2Iie9VyuYTaNTzTOmZAcLN5EEZBTUFvsCUU8TRbMu5sA
         84Imdztim7XeK0I4BXJR+GDh3JNw/BKcmwHCRRBBpbuyUg7Rkh+lOqnyZpoBaLp2CPhg
         HsSQSG7y8DOxz8D7tbpgzPkBfZbjD3Tl0F4nWusJOSqzLTI6Yeu+2bE5ezAnVyTjyaKh
         pnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017042; x=1699621842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaTRNQL1m7g2omCKTNm36xHJmAsoWfee5y3myRxUgo8=;
        b=xT91Plu67ZI9IRMjCHgJnqkIu53qkV35ZifX9oHiHvZjl+4N9S81yvUBn2+R+GVmBq
         vjMSnXJDzgT30osDLomZiDB54HxkBW5ZTP4EvS12t7wpHJbjnH1+fclh6YawBCgs22YN
         UA/3fUJVlFstNUBzIWcJdRorPnPH8Gfs9n3rEIYxezX2BqtEfBflnTAehqKuAP5ubBju
         Q9fezhHerb4Zk/4W6B8qDnXBlCzC0ey/3qWrgBJuYAZw8KzpbOYW3CtP/aQADgL97JxD
         5/tZiJ8VPq75rlO1olq+yAtzLbUo8ROz0Y4xRIj2vLCUpmYsENjTWYRrRrSKM+UASbNs
         zlxg==
X-Gm-Message-State: AOJu0YxMjlIZdos79qRmn7dVODkGMN9SaYayWJRuDe0McmFCk5zQlojT
	TWy6MgHS5mnKYuSM0Lq5P5S1Pldqp2fsh+AH9miSrQ==
X-Google-Smtp-Source: AGHT+IEd2jJ5PYJUwUnLl5mvZOiKhsAoGKmxwV3t1UE1zN98se8MQE8TGa3xiIaHbcKWzSZ661k9+g==
X-Received: by 2002:a0d:e646:0:b0:59b:ec10:915e with SMTP id p67-20020a0de646000000b0059bec10915emr2601785ywe.30.1699017042471;
        Fri, 03 Nov 2023 06:10:42 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id z145-20020a0dd797000000b005a0f9718a5fsm894927ywd.78.2023.11.03.06.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:10:42 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 1/3] python3-flask-restx: Add Flask-RestX Python Recipe
Date: Fri,  3 Nov 2023 10:10:35 -0300
Message-Id: <20231103131037.2997335-2-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
References: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105858

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit introduces the python3-flask-restx recipe, which brings a fully
featured framework for fast, easy, and documented API development with Flask.
It is released under the BSD-3-Clause license.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
update license to BSD-3-Clause
---
 .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
new file mode 100644
index 000000000..cff797139
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Fully featured framework for fast, easy and documented API development with Flask"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c96dd911c6d9e32868b6bc667a38a3e2"
+
+SRC_URI[sha256sum] = "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291305af7a613ce6fc0"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-isodate \
+    python3-jsonschema \
+    python3-pytz \
+"
-- 
2.39.2


