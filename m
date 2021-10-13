Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C53C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 06:20:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.4392.1634106041944029249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 23:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WKCixigC;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id r2so1306164pgl.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 23:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SprfepzWkl/Net7+i2RIGQIbIRaB1lliaCMipM6kNbc=;
        b=WKCixigCqdFcj/6ouN0N5h7wklqOKYnzFHiN8jQUhbouEkOeGH/dm3UsDwM9pEQnvT
         eOPlEyZ2dbFf+g1ccaUPRyxU38s5jd6W+T/Acx2KioGqOsXfE4VcN68X9Usmg1ji8yAV
         F8YEtIrvvyx2zvsrjry7Q89LrHyf+Ww7RSJ1PmvGOZm9KBGm5eY9N083WEb9GBMbb+18
         YivtzMPNbHimNvLM2L6ruE9xK0iB70EEdI0T9A4G2/VWTmhXtBefrGUFZmKfFYI9mQ6T
         ailhaM5aM0nQ+S7RcUx5p9fQ8nL8GHdFdSkTuP6j+9LM2qKIrkly9zvPcGA9p/YRXNpL
         VirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SprfepzWkl/Net7+i2RIGQIbIRaB1lliaCMipM6kNbc=;
        b=oXgNJ9u1F/lPIIY/oYZ5SPx7lo/3ivHoZatVU4IwDCt7KpenUMrin6l1U1eI0xS6j/
         /pCKWO6LNRqOJLM5zNudNHLpp6k06VKP2xn2YeET7ThFmU7HABETqJMxcpNBFVFrGm6t
         5ByD4PvOiPQNQKUAnkIMeysxXWNuQ10BA6aMBi2K9AVpjUlQgQmPoAIVT3BoOzmK/x8s
         1hk6PZXYzQgLeZLitT8Ah5cR5o4abJUGNKrqixBdCCQkfkl9FuybGNS8od6tvVUGaqap
         bYa2VF80mQfCNgSFupz+ci/xd/Cn04nXOchqPT5mPqF5WkGR1OG+j/6oEkrJPo4s5xPF
         N4EQ==
X-Gm-Message-State: AOAM531sRc6vjE6TczP8G7U8uI3oAU4AO9JJlDgh1W0YKiGW2qwSHxef
	d2vmh2iSSx3+fAJsTr6tq+WTDOE+Mp2SsA==
X-Google-Smtp-Source: 
 ABdhPJwS+IEpxDg846rhKblNWF38aB55QyQTuPN5Yf5hc9/xr5pPvDAEBjRHUfRaRDRyIUtx4gkVLA==
X-Received: by 2002:a63:ed03:: with SMTP id d3mr26568049pgi.24.1634106041110;
        Tue, 12 Oct 2021 23:20:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 y22sm4668303pjj.33.2021.10.12.23.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:20:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-parse-type: Do not ask for 2to3
Date: Tue, 12 Oct 2021 23:20:38 -0700
Message-Id: <20211013062038.434748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 06:20:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93275

It seems to work fine with py3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-parse-type_0.5.2.bb      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
index 39812a17cd..7eebbfb503 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
@@ -19,6 +19,11 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
 
+do_configure:prepend() {
+	sed -i -e "/python_version >= 3.0/d" ${S}/setup.py
+	sed -i -e "/use_2to3/d" ${S}/setup.py
+}
+
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.33.0


