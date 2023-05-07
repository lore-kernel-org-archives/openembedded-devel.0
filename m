Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDF0C7EE2F
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.69135.1683477205695705061
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QbaRNr9F;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55b7630a736so55062127b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477204; x=1686069204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMmHJ9EL2seJ9StAWnIuygOeGGZioPUxI4HkemcrnCo=;
        b=QbaRNr9FTS8gGphxsNkhpKFQ63uDjGUbPl1Uhs2b4tDa5sa3PjckqWdYT2QUq+2DIL
         nVBnjm5LQ2L/nSDmotEQQ2e0vgVh4Tuf6aCs+MZF5mfKd+lGSlv1OSOj7csk//Un1p4H
         BdgsOT6k+XVzayDUJnzhLd0bh+ImQKJ4yLR7VZdwXThzQm9Yl/bcjjJ0yG8bmgc3HoUd
         Wzn1Y7I83aRHylMB+qvH7weAKxaqLlTYuXINsPUWfzoESzdih230p356sDusT0s4UBh+
         6mF2EZz5pXP0esxpSFU8Ka5r8bGuwJ63Td3D5+WJqLngf0H0JQ68FQxHieDsFwmKGrHY
         Sc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477204; x=1686069204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMmHJ9EL2seJ9StAWnIuygOeGGZioPUxI4HkemcrnCo=;
        b=eWke8m4J17vAh+hctQpLenI05rsyOHfbgGsr3mxcu/6DM9vL4YkTTxuaeUP6i7InHe
         iQHPP0YAZd+QIzi/Zb/yc39mxejAtfHdHOlOlNsYij+pICoQaurfBvIvqdy1paA8RUx0
         KTUl4RAIV1uUeesKJ/OU6j9mbHnGH9a46IV5tjjPRxpNJ6ZbW+qwft96XjhKNnAkYn1y
         pW/X4duAsFs8GOhCR227+SpRxPUJAJoauDZoBjE+ov1Bn/O6nByLf/h0WnLUoo6eCYhr
         oi0yfPQVlZnLqXb88/0ZKrLfAh2wDM4lsCjqnL9mof8Z/gqyTRXbfoIXeljRtTsvDP+d
         8sPA==
X-Gm-Message-State: AC+VfDyHM+HgJYIVttnRNpjP9/2kaLM5tH/8VqV67JPhPn2g/Xe17ehK
	eSGp5aD9t8QG7UXABpPgxidlVV31m0I=
X-Google-Smtp-Source: ACHHUZ669Qc0S1NPigm+3FSlnJovYbxAI/cO6kRBxiCHoBOlivnoqaCSOg3kVPnJzQTnQ5V0ayDS8Q==
X-Received: by 2002:a0d:d993:0:b0:559:d294:1c48 with SMTP id b141-20020a0dd993000000b00559d2941c48mr8165050ywe.24.1683477204524;
        Sun, 07 May 2023 09:33:24 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 17/29] rp-pppoe: Point SRC_URI to valid location
Date: Sun,  7 May 2023 12:32:53 -0400
Message-Id: <20230507163305.3261044-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102347

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b2cc606ecc795e65d5b551ae30c8e0cef429bf9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index d990388abb..c19f7d847f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r11"
 
-SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar.gz \
+SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/OLD/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://update-config.patch \
-- 
2.25.1


