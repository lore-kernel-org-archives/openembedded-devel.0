Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.10229.1616404038585544142
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 02:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=eSStcp34;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id b9so15793286wrt.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Mar 2021 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UADEZ0MslDplaEStn1Vh4qQ2E7MtuvQ+sK0NrW9IMz8=;
        b=eSStcp34uGR+nQp6QS0qB5pMhIsXqTmNNFsAXloM+CJCq10emc9uAwf9XhaCS/Nwsl
         6UI1xu4vTCk5IfN8j+oxytsg2UGoX7WLhXevpCecfkKmZGdTLLhO0acHVdOFxf+3i7wR
         Wz2g1orv9AxLM/iN6Rau8BF8s72g2B6ndZkvxDcy+sUlVnvh0yC2439pcsMkGcVg6tMQ
         0h0z3g+jS/7GFYQso2FUdjuq+YiRFCBnp4J7joh+mx/nbj4ed3G6/ADff7gTz4rvZ6nH
         Bg0uxUF4qTMmifsoz27OoqHMVvdcM+5qRBeszP0FMZ7h8UX5enCHGzdB1S+cG9kXUS7K
         5glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UADEZ0MslDplaEStn1Vh4qQ2E7MtuvQ+sK0NrW9IMz8=;
        b=a49HcKsJXQrIBxvsv6IbD3FIUjUF5NMG4feWS3v0Tf3YxeQtjBNB3ndkOaiMCvyS9J
         7LdeeMYB6PoBtR9bg4FyA9ZNOAV/4fMxbDkUcUwi8rQAsVbJA2f/ojNXGv5924Ne/29B
         jwTYBeGu13LfphvNSRAHu2v4tnVSLSsKq3IsVT+ag56ErTK6uMhmcpX84O0lDiRvb4K6
         t7omh1055Z5lGzYBTjSGYuFwdO1WEXekSZ7oxok1n1dqAXPF/a1hDJI3sVHGLwz+DjOU
         0etsQRPq49Z39zYIZTEL7Eh6Xs6bxbiU0+Rm9X9/zqDvzmgG2fVjPEfINwkUZr58Um2d
         xGVA==
X-Gm-Message-State: AOAM5316SVqbuNDma2sVnA00aDkChYppjaw1cISF4fwkPkzdfeUKfMYU
	78oFueSJrmbEEFGVT2zaqQdo6A==
X-Google-Smtp-Source: ABdhPJz5vJFZMQD7gjItsj50wZD7DWJFBg0yxO3HTNFhUtscNTUiJORUR4PSR9zrxJrsKiVnIn1Mxw==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr17299778wrm.1.1616404037010;
        Mon, 22 Mar 2021 02:07:17 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id 91sm20755017wrl.20.2021.03.22.02.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 02:07:16 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-txdbus: add missing runtime dependencies
Date: Mon, 22 Mar 2021 10:07:14 +0100
Message-Id: <20210322090714.5900-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add runtime dependencies for txdbus: python3-six and python3-twisted.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
This is a follow-up to the patch adding the recipe for txdbus - as usual I
forgot to include the runtime deps. :(

 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index f521a9a68..cf2c98bba 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "d397357dee78750385f92ca9c6c1f063"
 SRC_URI[sha256sum] = "8375a5fb68a12054f0def91af800c821fb2232949337756ed975f88d8ea2bc97"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-six python3-twisted"
-- 
2.30.1

