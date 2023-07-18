Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46AAEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:53:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.6731.1689684784442670276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FDy6mL0+;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e29ede885so8103073a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689684783; x=1692276783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIihqkPzFw3ozxIUA9YY1SRoILXFAiDIbzps9GGFY5o=;
        b=FDy6mL0+83vTpZL/KE4lNmTtnBTxwf6HAkYH2qnFVFiSDxDKnYf/nHagVEbNSdqhDQ
         m58baaFVQdJGgvuozkLz+xasKuvoTRUItflSc8RC1nPKrUUKx+UzJNcxG5pqu/p65QNO
         /5CSzZ/ArI6aVAFFpMH25VeaPOmksgIEYdAQzS7zpW4Pa/bXKAO51jBmgru5Vjq9Yuvc
         5W0+FWitdFRaer2iuMAmUkN3Duxn8ZekzYpbDnIQHzbatpBtxvulIqfzYkvvol4aKBD0
         sW7TALNlF7hLC/XChHMktKiTmq0oxQNcrjQlicKCtahSa8ZUyk9i5op6CWeG0XY/xlVT
         s4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684783; x=1692276783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIihqkPzFw3ozxIUA9YY1SRoILXFAiDIbzps9GGFY5o=;
        b=Qx+VJVGQZ44hDTKwnuvU1wtVR8T1pBDMyDBqnYlwrHg6B8Z5XGhU4JMSOK6SRIAhrx
         /gPT1EpMYxK5rnrKto310/uZIHrcvyfBAGvBLf5AZkOacTp6nemJkoVNvBiMozZBJsX1
         319jz7gIUfP4ITs5Mo70PGFJJ7yfNy1t3OaJm/QpuG4HgfAb4r5nE2BGUVsXTblzstEi
         9VeicNs2umnKAQ3ckbrNmZ4Mn0Bh3XRpdALUeV3n1xKDaCmTQAMuyQMRghhOdyUyIPWA
         MLocXdiFlnRLjH5SuNFAMB83dluyGInkUf5EsjlMmqRNuUQPtuuLPrk+8rRVQvh3qmgk
         opcA==
X-Gm-Message-State: ABy/qLbCUFjRtccXdm+xYw90jF+9Oas05jLguo6dTx8/32asNQiXLrDC
	ahP6Wo3Vls+8pNR72HjvuRrkVaxeRvI=
X-Google-Smtp-Source: APBJJlEh1fnpWhSJYt5rOQItmeupk71ofr0Eu79a+ItaXW5xVyW7l2Pc0F2rfzecMaMVqOQyLa7tjA==
X-Received: by 2002:aa7:cd52:0:b0:51e:1927:6ade with SMTP id v18-20020aa7cd52000000b0051e19276ademr14193094edw.11.1689684782655;
        Tue, 18 Jul 2023 05:53:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v16-20020a056402185000b0051bfc85afaasm1183217edy.86.2023.07.18.05.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:53:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 1/3] libtommath: add recipe for LibTomMath used by dropbear
Date: Tue, 18 Jul 2023 14:52:29 +0200
Message-ID: <20230718125229.2253976-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 12:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103944

* When system-libtom PACKAGECONFIG is used, both libtomcrypt and libtommath
  are used from system and we need a recipes for both.

* libtomcrypt was already added to meta-oe in langdale and PACKAGECONFIG
  was added in dropbear in:
  https://git.openembedded.org/openembedded-core/commit/?id=b7c2edd2d6ded287d8b34dd047ae84d3fd69d4c6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: drop explict -fPIC as v2 of libtomcrypt no longer uses static libtommath.a

 .../libtommath/libtommath_1.2.0.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb

diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
new file mode 100644
index 0000000000..34d7f4cf6b
--- /dev/null
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "LibTomMath is a number theoretic multiple-precision integer library"
+HOMEPAGE = "https://www.libtom.net/LibTomMath"
+SECTION = "libs"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23e7e0a32e53a2b1d35f5fd9ef053402"
+
+SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
+
+SRCREV = "6ca6898bf37f583c4cc9943441cd60dd69f4b8f2"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+
+do_compile() {
+    oe_runmake -f makefile.shared
+}
+
+do_install() {
+    oe_runmake -f makefile.shared install
+}

