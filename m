Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE10C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:45 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.4343.1634338664735150773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=WdZpBeu9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id y15so47800782lfk.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HL+AgDWB1JI9kxGWUSNKHCiAS3o87Lhzsew5OKx6Y7w=;
        b=WdZpBeu9bt6evMFDoB9QCsulPZ23dvEE/is/JDKMqIJN6s5eSgygGveE84WP97T6Tj
         CN+hjF8gUb9ePOyayZCZ02xX42ux8QB+s9quv11d5BCdMXOAfGR125mXtKbhO34Iyt+L
         zS3pYMUKKxeyysnQ/3xsCZIEsQfoOyf0Aip4XNj4MSsf5Wy88aIPlhd7cGTn0z01/t9+
         yoyQJB/k9aSzJoJIIX0pqv/oSTM8glqlToJbWiZBGq+WZ66unF2HCyr6yKSmY2Y8rzmE
         Ti1yfIGdlWxD4qQkaaQQHo2FQmNxbTsluCLgPd5RcvL5xuds1WFTqbrn7kfKGYw7YR+x
         AeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HL+AgDWB1JI9kxGWUSNKHCiAS3o87Lhzsew5OKx6Y7w=;
        b=13Gbw7iL4l+aim4TbeD8ezCPO/HVJCSAyoWihqG1rKGzBJVDBHwy0KFcg8lQ1raP0Q
         /yMYmJ+nKJaghzUIOI6tjabLOrtV1mPGLOVWU/58ql5ZNcF2owGhiuis430YY1nCFIHi
         GPqPI3Z1yjK1DjgG6/NwXH59lgiY31smETs1cN4v3sDqRBUumYBW94VSG6Sfe0GbKwsL
         ZZuyqpfQV8lSySse8p91FGPutg3h/kYWgwhysqbMzpvY7Cu6NfnSOKpCypAIlD508oTU
         rAcvEBlq3D7TdWOz0Jqx4ycHFezTs81KKV04XBMWB+ihW40g6cCiSoS38lL7PN1c3Pcr
         v7pA==
X-Gm-Message-State: AOAM530xFVtlIbNt4qa+hbSDlmh3uBuB/gCNiCMjYqNzci7Z4sxzeZk7
	j7s8luyEJr19tZYABoDjs6OMG5L71WHejA==
X-Google-Smtp-Source: 
 ABdhPJwDkUBPFw7PyCddCk16IB+5P/V1UKO2777EPiX7R3fRy36bZ8oAT6WejYkFOvXQ6CVs2lRcvA==
X-Received: by 2002:a2e:bf05:: with SMTP id c5mr15281145ljr.330.1634338662796;
        Fri, 15 Oct 2021 15:57:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id 5sm655449lfy.156.2021.10.15.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-grpcio: update to 1.41.0
Date: Sat, 16 Oct 2021 00:57:40 +0200
Message-Id: <20211015225740.4163968-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93370

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-grpcio_1.40.0.bb => python3-grpcio_1.41.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.40.0.bb => python3-grpcio_1.41.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb
index 1cfb96749..fb6f1a3e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "3d172158fe886a2604db1b6e17c2de2ab465fe0fe36aba2ec810ca8441cefe3a"
+SRC_URI[sha256sum] = "15c04d695833c739dbb25c88eaf6abd9a461ec0dbd32f44bc8769335a495cf5a"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


