Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0314EC41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.15583.1689967537720781911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=TaoejFLL;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635dd1b52a2so15958376d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967536; x=1690572336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvspb082Yb18WrFdTcnUQ3Zl5DT21Cz1bGLaLziXoi4=;
        b=TaoejFLLd0XdQK28qKe3pUHbpW0fhfFkDbho+1umY3O9B3igUrqYoB9pAYM+xzEeQb
         Gb5wKLhlG0uAWRhF0ErcnaK2OfKmnsv+CTh+r2MBRy0Fh+J9x/8VrT99RDocD+1s+Jhs
         di4fQelwJY20ouXmATQik0tZdI/PEb5NfMnMflk13FACalnk717ALBC2eFRf5ZAQFd49
         AVrsNsN0xM1ANL/anWl99fMYkvq7pZoFMfXDEL+PYvDfCTPZX3JBjBPt5LPqmqRtyC04
         i55vWENTJMNu4wmd0cnPCbefKwaWBtPtE1fCDAv3V1691FjlzIwSRthBT5VqdIk+E4c4
         X5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967536; x=1690572336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvspb082Yb18WrFdTcnUQ3Zl5DT21Cz1bGLaLziXoi4=;
        b=DuCTpgPlPxA2qeXXq0QTtJXYS6GogGdx/OwM/DOBkHOYn9vuqso24+n3xax7pcSIg/
         vF7TXqvw4ulcEa6sZIVR4BIZZ6hlvEPwGDXLrOm1ACMl245SuMmJtttavrkPFqA5DxQi
         k2RWcxB5W0lvwnGVD9PCzb7CQnmnZqqTno4XD0CoAdA+J9vik4APR7oMFAdZ9hbTfK+w
         rHY9SZljnZiP9Mx2zvvXMFjDKrXTuTuxZtlFJIAOwmYK97AWNRaIr3oj3HrWX0XGNRmi
         uuGMCffRg+Px/bQAXjQGxt1qnsYYowjUh+WW/jXtnFo0uMpjgD8PD9uI0ETuEpx9q7eS
         iDSQ==
X-Gm-Message-State: ABy/qLaNJQYKdZTjFVlrZ/2iKhbDuAOXNyRZT2WrAsrxUONnup/2kMPR
	mfxXrn0xbVI9nWNizvYVtHegH/laeVcxT2P2OzQ=
X-Google-Smtp-Source: APBJJlEc/t8AUNG8oCfZg2uVn/egUxTIMsRLETN2W0P1JXEqKQj9MErHnlDihJX/MaLUDEttDMB3fQ==
X-Received: by 2002:a0c:e944:0:b0:636:39ed:4de9 with SMTP id n4-20020a0ce944000000b0063639ed4de9mr1040150qvo.51.1689967536747;
        Fri, 21 Jul 2023 12:25:36 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 9/9] python3-flask: add python3-blinker to RDEPENDS, alphabetize
Date: Fri, 21 Jul 2023 15:25:30 -0400
Message-ID: <20230721192530.2515633-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103982

flask started depending on blinker in 2.3.0:
https://flask.palletsprojects.com/en/2.3.x/changes/#version-2-3-0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/recipes-devtools/python/python3-flask_2.3.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
index ec9c62a170..c4c1ff7dec 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.3.2.bb
@@ -15,9 +15,10 @@ inherit pypi python_setuptools_build_meta
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-werkzeug \
-    ${PYTHON_PN}-jinja2 \
-    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-blinker \
     ${PYTHON_PN}-click \
+    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-jinja2 \
     ${PYTHON_PN}-profile \
+    ${PYTHON_PN}-werkzeug \
 "
-- 
2.41.0


