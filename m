Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E193FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 02:18:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.112997.1699496314751374846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 18:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOXWRxfH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso3003425ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 18:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699496314; x=1700101114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTTOqVBCKZR24o/q7M5+xe4ujVWSLN4yysjHd00ARNc=;
        b=OOXWRxfHXy8lKJ3oaO4LCUyUBDRBUuuRFd3yaRTF6lajIm41Qt33OnjUawJvkFiyPw
         jJWhMqskj43un5Iicx6FjmaN9/EKw2lu2KFPJMBCEOXZbE4bzfnwZ4Stsara6FtqfnJc
         OiX8ykoKB/wYodRfWFYARL5/xGxgx3WyQPuagJRaEPtu29gZTJrVKCroo54LIKAvdz56
         J/rVNAae/uDbFOHSsM394ms85iXrg4I/eC+tTsXfToH7H47DwlY3LgsD+TxF1zB1qcnV
         iqMMKtPD8y0tX+qzWs6rNUSV+wJAs+a4HYhUYdnV8iNKPgS4zZ/eoLszcStj2noyUdOD
         8yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699496314; x=1700101114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTTOqVBCKZR24o/q7M5+xe4ujVWSLN4yysjHd00ARNc=;
        b=FCsnvDchcLgMA+7nn0DRB7AxGd2OhRX6o0ahzvlNJl53fN90XShdZgRnQ8ADaPFt1V
         ryFM2AUCjTqZCI6U4uCSOlTZqyaGmAeW7CcfSkOF5lEYmlhf49G6sOgap3r8XkWgS6TS
         tNP4jAP9iHE9DeS0/vqGinI0zfFjy93RBfAeVueEVd98sRCCNXJA5q39GnxgNQ+tj8Ii
         A5h3I9DXe3JqC4kUn8Kr1otA7tKDwz+6KCNv1UAldh2szP4He4vL44VbYX+ml/8LVuFV
         wZHM62jmeDaU8e4BlPxeKk8V3gCcrSroPYNscYAjWY9ABDHZvnKgDdxFYV3WjaYSAGGF
         LnEw==
X-Gm-Message-State: AOJu0Yz7pYlhE8TDO83HDlnnPB6McyqU6a7v8W9T3uMgWiJxCNX53Ygh
	bVm5uM13n2JLwKiyyRFEGUNgaQAiwSeJ3A==
X-Google-Smtp-Source: AGHT+IHNuruBltFL7DuybkDQ6GjO4k6eTwQI4S2DvsnkU8Nloo8j5fNOWD31p4o3IFoGqqcSrBz+1g==
X-Received: by 2002:a17:903:4281:b0:1cc:68c1:cab5 with SMTP id ju1-20020a170903428100b001cc68c1cab5mr3655881plb.14.1699496313752;
        Wed, 08 Nov 2023 18:18:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71b7])
        by smtp.gmail.com with ESMTPSA id bj7-20020a170902850700b001cc3fae08basm2336211plb.52.2023.11.08.18.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 18:18:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] emlog: Drop SRCPV
Date: Wed,  8 Nov 2023 18:18:31 -0800
Message-ID: <20231109021831.1279673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 02:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106490

Its not needed anymore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 160a5a9f87..631e52f388 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
 SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
-PV = "0.70+git${SRCPV}"
+PV = "0.70+git"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += " \
-- 
2.42.1


