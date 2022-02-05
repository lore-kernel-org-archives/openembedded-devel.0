Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7250C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 17:55:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1102.1644083718978029312
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=osOGAle9;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id h14so7913945plf.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wDZAUrkVOFTa0Ry1bxtVzSubCTPHn2x23CZQLzz8CyU=;
        b=osOGAle9S6WBECvIDOtO2vdBP+jSQ4CKK8DndH/qntCzi4jGHP3bLa/LkTrpcBGy3Z
         Y6VmPzUTM8465Y4VJMZRGlBZaYHaRIvkTa/8Kfb8iVcRsfEExRYqIMAM8dsKCDA5UZhd
         Rmef9CTgG0a2TFGXhHhnbtUhDVU9rf0Sweo1IHsz+AKq8hQnWNAxy3tYxeK1Oh2GoUg0
         fnOXvVA+OGI7DBw88s11cZuKVDkRzFKglzlo15dUw60N3v+fpOdBhFe9QBfJKBsHKwxO
         cFSuFqYoxY1Xv1uk9F8zJN6TIFEqtKJbuP1yrEmImNg5bf1EsFtk1gXwNMSmSvij/AZw
         pXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wDZAUrkVOFTa0Ry1bxtVzSubCTPHn2x23CZQLzz8CyU=;
        b=70Y46vUKH2ZHNnS+Xyq5R0voa/ZW3xUVQREJbNeongYqPh+ZWfhkiOfChrkmdzJslv
         97gNOhu7gCYx9eMrFQu7KMfq3rbNvkD4P4ZS2z/tlooqCJfQEPmek2RlO0+I/O8ehSnT
         AbEbRBPi9aS8zrrEmEOwytnL6Cfarnr63+5iPY1+esponhS1sQabtLablOC38j4w9ePR
         N12J6WD4FmwsJky1TcBh1wBqFLrnOcNtbmP3ZiW+xIMRP78D8eQCdTjl/k0W7mFIRHrl
         2Xv4hbJGPYIhboy3yF84RXqGjWyCi5IjFVoocNSXaloVTOlsU6ir6HdJ+4Q5al72/2Rm
         eyHQ==
X-Gm-Message-State: AOAM533dXI0NIx2A+csiU7QgkmZrtw5V/mCdpWh8SZZnu6307wErxng7
	BuClt+3n/z8Mh3YdIp5HYutxXDJE7dU=
X-Google-Smtp-Source: 
 ABdhPJz8uom14zn1/FAvnmaE+SH0QofYdqaUT1uf37gNbIvMel3dvwd+OVBxMguvEJ88A46dG1FyTQ==
X-Received: by 2002:a17:90b:3ec5:: with SMTP id
 rm5mr5352860pjb.28.1644083718340;
        Sat, 05 Feb 2022 09:55:18 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:c500:ff16:ca75:f2cc])
        by smtp.gmail.com with ESMTPSA id
 pf8sm1140677pjb.20.2022.02.05.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 09:55:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 2/3] cmocka: use https protocol for
 fetching
Date: Sat,  5 Feb 2022 09:55:14 -0800
Message-Id: <20220205175515.1767488-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205175515.1767488-1-akuster808@gmail.com>
References: <20220205175515.1767488-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Feb 2022 17:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95230

From: Tim Orling <ticotimo@gmail.com>

Upstream gitlab instance is refusing git:// protocol.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a935801692a27b152041bd996ecc1b789a2f6ad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
index 2e34f6ab44..554d582a57 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "a4fc3dd7705c277e3a57432895e9852ea105dac9"
 PV .= "+git${SRCPV}"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;branch=master \
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=master \
            file://run-ptest \
           "
 
-- 
2.25.1


