Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB95C04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:28:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16404.1690986496011942819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=liPtEo4P;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3174aac120aso6349967f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690986494; x=1691591294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkcBSTAKIrQyjPuQQSXthc9kE6331VzBpoxp9QXE6M4=;
        b=liPtEo4PPXLSfTliVDcdS1guQ0C/23SnBGNA7V9X5sr9+AR0CpjHGPXjj+gwOlzUXs
         cXbhfjQKWe7DbtPPijHA2+6AgfRlHOupFRqWK5oZHYCdxqM+Q7jy1HPVctJ1Fva3J1x9
         KxHpmOPqvaHZ8+m7AgBo7E4G4d02F1Ilme5fthkbiexSlAXivsr02MCTzEdjT37Kn5CR
         vsJVWqIuuUUvTK+69lxcSnqiKqRm4QY/XFyW3S7/3zTbesIwg/vSMtI0iio7kSYdQykD
         lTdAmE1BR5QhiAIf/rKAjOQUfVKf/vUYT/+PQJD/xV4ymsOLwccPVxrVpvblN+IvrYdi
         ijYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986494; x=1691591294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkcBSTAKIrQyjPuQQSXthc9kE6331VzBpoxp9QXE6M4=;
        b=IStI4JEidMSjDBimRQUGgRHoUHE/AFph70rYhrZA3p+5/zAdykcbBnuuFOZKCgY2TH
         dDdCxlwYMOyJLPOBVeBPzcTMzNp/7SLd4QaUEK8V3raKSWuR8rb1z7gjfrnRBzhn7iyI
         sGFTjP+GzOEQCQbNEHJ6ehcoMoL97WzU8qfEUSAn4IvCdL9FlG20AIOMZ0aGOMgaR2IH
         +7J2hbh1E8YCmMbPHw91MBzqIf3aEeVICSardjg2LQ5+h+DEBU/A70SVU3MlSaaspkJa
         uYa+52KsCUiIuncEcsNIiEDurwWafsQOy9lW5yT5+M7DwsOJgMxuw/QYkLMt3J5fyrq0
         QnVQ==
X-Gm-Message-State: ABy/qLZ3WnEk4sYspuYEsSwgqReYMxiZ/m1fFJgrJ1Zac7QT+k6lTMnI
	DhiBWVlQ9S5AVrLwLkW9zwCO7W1+Sow4Lg==
X-Google-Smtp-Source: APBJJlGWN0t4wfq6P9kwDDjdYMwQYOD582psgV+U91yF7JBkxkf3jVU1WlPwyfLPuaRzjMHI2gVZkA==
X-Received: by 2002:adf:ec0d:0:b0:317:49e9:c57 with SMTP id x13-20020adfec0d000000b0031749e90c57mr4963419wrn.43.1690986493764;
        Wed, 02 Aug 2023 07:28:13 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan (mob-176-243-18-136.net.vodafone.it. [176.243.18.136])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fbbe41fd78sm1843918wml.10.2023.08.02.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:28:12 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Federico Perenno <federico.perenno@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] gpsd: make sure gps-utils-python runtime-depends on python3-pyserial
Date: Wed,  2 Aug 2023 16:28:09 +0200
Message-Id: <20230802142809.2600810-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 14:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104202

Pyserial is used at runtime (e.g. by ubxtool)
Reported-By: Federico Perenno <federico.perenno@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
index 245f8728c..a755e39ed 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
@@ -143,6 +143,7 @@ FILES:python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}
 RDEPENDS:python3-pygps = " \
     python3-core \
     python3-io \
+    python3-pyserial \
     python3-threading \
     python3-terminal \
     gpsd \
-- 
2.34.1


