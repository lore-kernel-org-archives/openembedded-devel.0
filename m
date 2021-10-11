Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB63C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2697.1633977721229282655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fy4ZiZF2;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id v17so59068813wrv.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xwBtOz4Jh+xoMKesDcO4+v/5RGPtarbPbRJgGPVWsQ=;
        b=fy4ZiZF2FB+LR0rbS6gY4XRHmuJgOhSVKHpYvDlWPPdOT0FF4uAQWdfme8FtQhxbhh
         P7rQefBs1H/mZj/TLwL6J2tkJ7vET0VBDpnG7APPwhntwmFDWoB5GzQl28W5QjoHuM82
         Z2RSojUXFMJ5ARKIyqkl+ys+Y8xLfeI2JXezprdAoq2XWvC+orNSldQIVB94klItJpVG
         qG+Gv0Y/Dw8CLQ809e1PQ9P8k6jkei9jD+kbz7XrZq+LB9YFLGfyeu1Q7nEf6aDVXBgr
         25pKf2dpXmSZmZ3jnniMATONDjUdO0Eq6h6/fvb60W9oVhJsmEvhLq+lkU9cr4pagewY
         //DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xwBtOz4Jh+xoMKesDcO4+v/5RGPtarbPbRJgGPVWsQ=;
        b=53KJ9AuXCMu94ufMH35o1D9brgd6n/JWScR4k/PDwhIxJXCZ4HJ0KqkUuWZ9aUaVK9
         nkOZz7yicjSpJfK1uVPoTR6J06YCsT0HjYjhkRz1kIpqpvggPkbeko7tG4zhYGr6tTrn
         zdCRcnj5lsuaGyV4wZrxn1NBXokg6ZVrOok5WwVGV/Kxez7v1zbBh1eiV5iAeXAkeEdR
         kgZj40WcGa98GGBNw/nFo67TS8RN0x3K26XrCL31tk3NvFWzYUHV8SAZis41x0XjWB1w
         NxRcVQhbz1cCFks4gm4LUZ8njMvbX0H3WDVlJv+1hDLwyjqj0Qai51KkPQdd3PlAsNGS
         jNCw==
X-Gm-Message-State: AOAM531EG94EhzxRgdRbN5rWCTuC0NnmDzO4KX1U0Q2lAuc1kvUHWUBY
	ok0q4hISW8blELecdq6nii9ORyFuKm5LFw==
X-Google-Smtp-Source: 
 ABdhPJxqKyCX27fpf+WUwwTFFCBc1Kn/HkZGeiS1wAkDl9yxxCu20FI50+zIqsyaeN52EJBIaZYGDw==
X-Received: by 2002:adf:bb52:: with SMTP id
 x18mr26980021wrg.169.1633977719839;
        Mon, 11 Oct 2021 11:41:59 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/24] cfengine: blacklist due to openssl 3.x incompatibility
Date: Mon, 11 Oct 2021 20:41:34 +0200
Message-Id: <20211011184140.653609-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93232

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
index 38efe6306..60c5ab381 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
@@ -10,6 +10,8 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 
 HOMEPAGE = "http://cfengine.com"
 
+PNBLACKLIST[cfengine] ?= "Needs porting to openssl 3.x"
+
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
 
-- 
2.20.1


