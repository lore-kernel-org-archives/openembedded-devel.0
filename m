Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBCDC43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 20:51:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.4186.1657313458143490494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ivc9yBnw;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id os14so9338838ejb.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghL2CXomTUSSpLhCvl57Gv3VZAKrvfpf6zMTcFgrNiY=;
        b=Ivc9yBnw+ohPgjA+Sh98cBLR610vjEWBtAKKdvJOA9pUl3H3BURU5KiMF1Do25WfqZ
         hh/cIkfzanmI104GQcpumeeXCoiBnr1FVrwjUJZ89jvxxhZrMgKeJKErZ4SLhqsDcwcC
         pK4h3u5yRZzgBs4AjYamvuCiFYA0QiNW3rNa1djAbB9ZG/GWPWCtOcnzOIvrZlOLxgjt
         KRvNc14JSM0H5FdUNyQG8RPXoUQQ7qVEAnWTiUsnszRe9ie+JL+ue/+a5j86P8VhehfZ
         +ViHRcPmpUsd9RE+IipvR8eHAnsPikWHVccTQWwHjgJOz1cA2wqyRNP8522NS9HJPorg
         cOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghL2CXomTUSSpLhCvl57Gv3VZAKrvfpf6zMTcFgrNiY=;
        b=iUxUIHpeaQZzTNNpLu1QdrJCU0XNv6nFMd6Dbm3gzTuNIwHSwJQaNnn+iXKtRevs9C
         w3pfSohel+/MeKmiY2d6M1CD3Kfpo3pnnULxjKo7Z4aNbrzg59CxuGNK8JxURtigRiP6
         5SbVde2RQ8afvGk/ypBQV2fhcqofKvkPRR8t/IOORc6vBhBURYJPSimyGvahO/XzIu1g
         qk7n02BDXCTpHqm99O86Wq6D6nZd5rZqo/9QCVbaEvu8NE0ad2zA4usjvx0ye8Fb09OI
         gFQ5rmN2Kh2VQTC1xBQgAVac96jMB//2+1ttW/9TuVYGBe1wIkPbouw3Fc3OdUaNJSX4
         0owQ==
X-Gm-Message-State: AJIora+R+xdRGQEygmTP8ik4E8RyK29hUbE7kMH1Xo49myn6D5V826rS
	viwxUnyG/kit685OJb7aiY+vZo/OBb8=
X-Google-Smtp-Source: 
 AGRyM1vWXgQ+QRJ9nQJ6fB/4wZ0jU7AmyD/YoXY7uh3tQi1N6cgfPnhmk3ZF8+vZLuLanIPVd86T6g==
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr5432957ejh.720.1657313456306;
        Fri, 08 Jul 2022 13:50:56 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a05640200c300b0043a7134b381sm10268512edu.11.2022.07.08.13.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:50:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 1/2] nftables: Disable default python PACKAGECONFIG
Date: Fri,  8 Jul 2022 21:50:47 +0100
Message-Id: <20220708205048.11990-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 20:51:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97792

From: Alex Kiernan <alexk@zuma.ai>

The upcoming buildpaths QA check fails when python is enabled:

  WARNING: nftables-1.0.2-r0 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/nftables/__pycache__/nftables.cpython-310.pyc in package nftables-python contains reference to TMPDIR
  File /usr/lib/python3.10/site-packages/nftables/__pycache__/__init__.cpython-310.pyc in package nftables-python contains reference to TMPDIR [buildpaths]

The way to fix it isn't at all obvious as it's not built using standard
python packaging, so disable it until someone actually needs it.
---
 meta-networking/recipes-filter/nftables/nftables_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index e078be79a1df..f1cfb4910138 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83
 
 inherit autotools manpages pkgconfig ptest
 
-PACKAGECONFIG ??= "python readline json"
+PACKAGECONFIG ??= "readline json"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
-- 
2.35.1


