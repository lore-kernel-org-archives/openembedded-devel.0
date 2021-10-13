Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0604C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:59:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.4316.1634104780546362933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RN14AaS1;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 75so1287753pga.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h02/bB7ayzI6HvYT/+R89oTKXbHg8v6HT6U1oDPLM48=;
        b=RN14AaS1HBOWtiAetoVWQqzu8+kWfCcwyl4GVf+zqJHUQP2GJDppfNA5ZxKJf1mUNr
         Q+Kj/mMbCWZqrVnzc/lEzLysENziA4eEQAvoFA9Gz/95olFkutfpGFAva+vneUtDVbLG
         EQ67a/sFAGPVs/KbdvvMnIKOyw3jbzfOnOoZGvUsxg5D7gcrjKvCZrAcV4qg+VCm5g9v
         YR1eHanMyOukT943OWJ9e9ymUH2ztkUG8WdPJmGGPB6hrWUd44HnIFdMz3nE63fkD/g9
         xVQbw2nExo6i0HmPiMg5xBublbB4Lcarb5jyMAsMNtrBdavVks3DVQZBZg8GqNnmtSjK
         tFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h02/bB7ayzI6HvYT/+R89oTKXbHg8v6HT6U1oDPLM48=;
        b=Cx799NAOa6cEqLuA1jf9m7kUL3NMZy3vXUmym2Tiqzh6cY5NIcGGZmSq2eCrrRckvr
         VKrTqjvnzSKSZh1jTBUDvUkaiLSQ2nZzfCeFxGjHqbjkYKK8bmyQNbMMrZnSM7LejO5H
         i+q70i1lFx9vG6xvZ8VLKo9A2lEiDEhHPx5AjTOy/ry4NA3tcRc7+SLEk1VAQ9Ts8RlG
         KqEjkK4x+Hrvq/wQknqpdx37scNuaOxxKW+Lm1vJyRDxTt+8nFqdSXZy0M5le4gdTAbJ
         pbJdsluYY1lWlPB9D+JRfSZRT8eGWecabheYFxBbpVaICVmOsvWL0K8mwUlePH7aw8gn
         ILUA==
X-Gm-Message-State: AOAM532hWQgzYX7sXrHgXJ+JiOJePX1ED+MHoQQpeZtxpRRWwZ3La0+J
	kDKGhFTwVmQItVZ553yVDX9tG1LYf+pmng==
X-Google-Smtp-Source: 
 ABdhPJwMFA1hSTkIX06OVNRi4izDAPJuX/eOP3BP6RgCo1M3raf1jgG/AMNFUHz+lihEEzIWAJjLCA==
X-Received: by 2002:a63:fd06:: with SMTP id d6mr26514839pgh.466.1634104779579;
        Tue, 12 Oct 2021 22:59:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 x184sm9564460pfc.44.2021.10.12.22.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 22:59:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-behave: Switch to using github src_uri
Date: Tue, 12 Oct 2021 22:59:37 -0700
Message-Id: <20211013055937.426394-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93273

1.2.6 release does not have fixes to work with setuptools 0.58+
the patches are part of github 1.2.7 pre-release, until the release
comes out switch to using github

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-behave_1.2.6.bb      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 04e24a607f..89bf29fd7a 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "https://github.com/behave/behave"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 
-SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
-SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
+PV .= "+git${SRCREV}"
+SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
+SRC_URI += "git://github.com/behave/behave;branch=master"
 
-inherit pypi setuptools3
+S = "${WORKDIR}/git"
+
+inherit setuptools3
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-parse-type \
-- 
2.33.0


