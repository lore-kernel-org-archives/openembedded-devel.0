Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF925C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.156005.1703876555358130945
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=craiSMEM;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5edbcdc323dso30244337b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876554; x=1704481354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgrvFAUfcRYb1H5IATvCn1xUWxyCRnAD8htiTotzsBE=;
        b=craiSMEMtn6y3rutdxzvAjwoZRi8yCdorX+uu38NRXqkIQeaajm/0T7U3PFjpMvWMK
         Vfv6yaXEz1GRsmLI9pRVb2XH7y2TQ+g3aAy5Y7ySv2i2dPaE2kjGRGR5oJtOqaoaBP5t
         6AiTmfc0eNihW3vlLjGct1FFVw5fEb3pRvl6z7YL2k2yQbypxyOIn6PQmx1tqRzs+L4e
         JxENQSy9gYIT4QxFZFz6UwQJsY93SarEYlFgkqcUszHBMUMGja7cC05YYwq3nuzaMeUi
         /4jIq7iv2wRsbKS6emsgdhbix8lbIrKWRkc6LJPJ3Yt9Yxmt2Ncqmn8+M62MrbMAOVDa
         pLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876554; x=1704481354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgrvFAUfcRYb1H5IATvCn1xUWxyCRnAD8htiTotzsBE=;
        b=nrJpsLKZBTJeCwpzmShz6FK4+7xbndFBc7rgHYW3YLcWw9vpVCR1odFmUaJHLVzPSS
         AxiLa6TdhnfzbS9GlsXpIjtucNJf1F5ucZEKzAPT812NWleRtU1WCHMJoUQQWfmfrCLA
         PF9b+qO2ceX2aF6MWQukflkuUgkXrUz3qFPfJdqi8SOBTeoUvZiNtTuDuf0ogRqOOOts
         4swOcaAUXo7IYXrnlzAxe0HLuU0NRokJdMW/n0HlIeuePH8CgvO2NgP80z/z0Op5pBG4
         pFC3Y/FeIbzIlYOuyWTisenxbBNGTrF1UYx+/46B0ptbXPty96nq6LtKPC+sZVNsvIQY
         cGCw==
X-Gm-Message-State: AOJu0YzYw7O4YsjGdl0CyAk8O1qtC6VVlbA4g4pnbn4OiTutx66fVWTQ
	4GxJKFkjNhW0KLwTjcJv5Ey5jv0RWcllXw==
X-Google-Smtp-Source: AGHT+IGupF/Gong35lEDhhIGP9fza6Tc6lCZPimvv+Q7lCDINrlZYx9QlpjPTZa30FQxxNt0T+x3Sw==
X-Received: by 2002:a05:690c:708:b0:5ec:c335:dfa7 with SMTP id bs8-20020a05690c070800b005ecc335dfa7mr5323969ywb.42.1703876554344;
        Fri, 29 Dec 2023 11:02:34 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 02/17] python3-piccata: Use https for github
Date: Fri, 29 Dec 2023 14:02:15 -0500
Message-Id: <20231229190230.135480-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107884

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 240b95417e0c3dc6b9a22179c73ed318fee36419)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
index b72589368d..fadcc32c24 100644
--- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
 
 SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
-SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=http;branch=master"
+SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


