Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE4DC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:39:04 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.34579.1703111940072261802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35d74cf427cso624875ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703111938; x=1703716738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uneT0l7299+zCTJL+OnQvP2S9y4sssVP+a8qkf98iak=;
        b=Ht0jgWdrhcNcZXgHneTuFOpajixYYPcutC52rcSgV0DIaXqsrrJb1Hk/T6301cdz7S
         pMMcvGrvw4kLJqAw10eEy156PAP1GfI9gDz9xRsVYXm73dn3Ng5d/QPmwY72zOcUuVlI
         E4sNw3v4yg41095NccCv8TPt/FLORhdX3pWehoJAoPfjb51krcwlvmq/WQC+5/Mwi121
         WP+bkkWlgdttXKd3MyMFZDWw/VpJP2xxIMqHYFY/Ivdv/hlJAW/COALJY6qMvW2/E6RX
         G27GREfAcueXZxXb1PxWIQFLdatE1yJo5PIl+yquir9CBJbSKoYh3/UR6O83URGQjRWy
         FCJA==
X-Gm-Message-State: AOJu0YxbEtm2D6GJknVU5kY7OEs5wwXExk0mVTSQ7chFczcief08hcAQ
	2PXC5F4qOa0+BkLmQxjKTln8pYukSdFrnQ==
X-Google-Smtp-Source: AGHT+IEh/u7OEVQMPvWIrFe0yCc9VTwdiE1LgOTmfswgvwSXpBpwnNjIGgsD8DcK0r6ifW1tKYlB0w==
X-Received: by 2002:a05:6e02:220f:b0:35f:c678:94f1 with SMTP id j15-20020a056e02220f00b0035fc67894f1mr3257467ilf.16.1703111938473;
        Wed, 20 Dec 2023 14:38:58 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id v7-20020a056e020f8700b0035fabab7985sm140705ilo.21.2023.12.20.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:38:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-wtforms: update to version 3.1.1
Date: Wed, 20 Dec 2023 22:38:49 +0000
Message-Id: <20231220223849.3814301-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107684

Updated the license file and verified terms remained the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-wtforms_3.0.1.bb => python3-wtforms_3.1.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.0.1.bb => python3-wtforms_3.1.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
index 36a0191dc..c9ad1be48 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "6b351bbb12dd58af57ffef05bc78425d08d1914e0fd68ee14143b7ade023c5bc"
+SRC_URI[sha256sum] = "5e51df8af9a60f6beead75efa10975e97768825a82146a65c7cbf5b915990620"
 
-PYPI_PACKAGE = "WTForms"
-
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 DEPENDS += "\
     ${PYTHON_PN}-pip-native \
-- 
2.34.1


