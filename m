Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6300BE81815
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:29:55 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.10428.1695788994470389653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77575531382so16438085a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695788993; x=1696393793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaaUOlCkDe7oZ8hM1AyXLbcTgvo+lufBbzBbhywxthw=;
        b=rqGdQi60X1sNK5r/cTb6IaMDV6u5e+O6HhyBON7Kk+Ke5YqAlVbPxx+8iCB7Zaafrd
         AHB0nmOsj8eDRZ8Fc6G6Oj74nMzAnL0rI735Jc+h3VdmhFjW1NR6F5G5B1WvHv3afJlf
         MT8DJQbXIzULvl7UBBVBDooY+eEfBZ0YiLTS8GTpkQHadooAGSp6FsR8iko99XJiPPDr
         IpPWlyk82oNgC9Yu7crcg/e0Tc8iTurR7WPUs5oqb3DwNfhxVngVkyqo7f6dceH0qcij
         Hfo0WBWZ1apiFr/6cvfmMKPBC1QIJL7yysLrOaV6+M9vswxxyvtCeQYwsd7ofZdl0h/+
         ZCgQ==
X-Gm-Message-State: AOJu0YyUZciMKYe4CY6NGYIA2FlwdCZTdfgY2JL9J5cLIz6GK3pXPsos
	F+Xnvuw4aem1NdGc4eZmusi5lEKfCRpllg==
X-Google-Smtp-Source: AGHT+IF9dsVJJ6SlTWfEs1NDnHDG7NLyidJRejgD36Rn79BsAPT5b3M357spa0qkUxPU1EhCaUKveQ==
X-Received: by 2002:a0c:aa52:0:b0:65a:fa53:ed07 with SMTP id e18-20020a0caa52000000b0065afa53ed07mr909150qvb.59.1695788993041;
        Tue, 26 Sep 2023 21:29:53 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id x10-20020ae9e90a000000b00767303dc070sm2957584qkf.8.2023.09.26.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:29:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyproj: update version 3.6.0 -> 3.6.1
Date: Wed, 27 Sep 2023 04:29:43 +0000
Message-Id: <20230927042943.1659824-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105157

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pyproj_3.6.0.bb => python3-pyproj_3.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.6.0.bb => python3-pyproj_3.6.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
index d8708f5e7..a4121c393 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5b111865b3f0f8b77b3983f2fbe4dd6248fc09d3730295949977c8dcd988062"
+SRC_URI[sha256sum] = "44aa7c704c2b7d8fb3d483bbf75af6cb2350d30a63b144279a09b75fead501bf"
 
 RDEPENDS:${PN} = " \
     python3-certifi \
-- 
2.34.1


