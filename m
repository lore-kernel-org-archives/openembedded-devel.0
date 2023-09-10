Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA7CEC8748
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 06:24:35 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.31830.1694327070001309560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 23:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BKWehPdD;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso3167411276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694327069; x=1694931869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91fl59eXG+EOtMKLRaZmucF0t1riG/YGuoHYRUN11Js=;
        b=BKWehPdDj6qnC2ZqeIWfYLXkGksvsRhaeV+TNjbBhjUTcAfEcHHHx44oj+5/ztjOJ/
         oqV+EV2wIyMYRvHgguHJXrthHvnaAfO9Z4L6KKbtX8V78eTHX2AM+gz1aq4d5/9YdtYC
         hBJ4l8AUdsI65Qn0hKAToCgwUBnUpqsanihhOK51dhVBBbPQ4xv7rK5P28deyIa3nbWJ
         kGxNZS/OvCrbp6CQdy7yFa8zG/GM6UJDrtMztzHB/Q8/A+jFu0VWOOvR8ACD25vm7z4k
         Uf2xJkrjTd24SubqhN+IxD1PKspUtF505gWwcRlpeJNskXfkEmS1fArSDkcmN84TvQfs
         +rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694327069; x=1694931869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91fl59eXG+EOtMKLRaZmucF0t1riG/YGuoHYRUN11Js=;
        b=RvAK84em73pNB9w3dTBqm2Fd+SKMZbjkCC2jSFK2IM0OqZPqJLWmp4V4GVDjAG8F5O
         k9jiJbCtO2qdLy9GznKMiyqxpYK/gz3K8Yt3109UcAGJXMaSzP7PQMliz6yzrSoG1ASx
         FXs9UxinOt4LH8eUjKCLsMdyX/PLK1Mq+O8rRreb8WSAXo+ryFZU/vgkZMDbFt+4Vz3K
         82HDpORyCEOXJJRgiQPd8ncYSWhh+C9qTAuXWQHJIWDEZ1kcqfDpyJMgfB/G3BQj/+k+
         Gj97FTiosluqS6fqV2u0e69RfWevB5MG3qKW6glZLL+Xjw38PvPCUyUddGaZk6psZ9rZ
         7OJA==
X-Gm-Message-State: AOJu0Yzo0SFkkeTyg9jIFheHSAKEqtG08pwMh7OPiT/nye3p7RMaPdZZ
	SVcsg2XUnObZzioxp8SrY4WVrGAuidVi+w==
X-Google-Smtp-Source: AGHT+IE87TeKURcV3HrZx9FqKpQtniSnwsbZImbtCjMQcGwD3MlnpWPrcJcnpbe4dhHiA6WtfoOCAQ==
X-Received: by 2002:a25:da0a:0:b0:d7f:d6a7:d57d with SMTP id n10-20020a25da0a000000b00d7fd6a7d57dmr6584404ybf.27.1694327068931;
        Sat, 09 Sep 2023 23:24:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d90200b001bdf45eb5b6sm4102919plz.284.2023.09.09.23.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 23:24:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] usbguard: Enable seccomp if distro features have it
Date: Sat,  9 Sep 2023 23:24:25 -0700
Message-ID: <20230910062425.40945-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 06:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104819

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
index 4e96b4f41e..c062f27059 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "\
 PACKAGECONFIG ?= "\
     openssl \
     ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 
-- 
2.42.0


