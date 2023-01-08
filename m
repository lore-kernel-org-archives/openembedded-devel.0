Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242A1C677F1
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.46812.1673191295134889553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fkSFD3xJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id r2-20020a9d7cc2000000b006718a7f7fbaso3851758otn.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPDXGKSmP4CAlvSoN4g7BjuFrv/2Q234NmQlSa4a1wU=;
        b=fkSFD3xJA9aJu/CrlGJwqFC+/CwarHa3BNI1VHmt+r+bzAPzgW6aWpDrgP2oH8wLl1
         /SDX+UguwqnkcOX82Mh2TCuNcgFbPP5LFO/pTDZSDGJYcKyXbPmFaLr19o6p8Q7uUpTU
         qrgx+xZrMTL/9BVSNsYB5o575fgdnEJAfBBVWHcigYOcTO6DhNgzw3p5hBx/I4bRDOhn
         KUltD0/e28sLkw8huvBYiKcIKUzUuPZHqzbNKBfCQ8WQQc2SUWBx9AemCMvjxuQqYFLj
         XRg+VcoKLxk1lBG5+pI47ElxFg1zqhMpjoomaUOt9NtbWAnqUJHYRe4ymqyJPMl3gT7S
         OUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPDXGKSmP4CAlvSoN4g7BjuFrv/2Q234NmQlSa4a1wU=;
        b=klFcLkivxNJpX6SNZjn/MqmtWGwKJksO6GMB2CJe6FPdw6r22lCnj9jWnvaSSa7dgG
         S02nYaSEG1I1ftjbUgw84p8qA6kqA0mjWpaOyCT0FEGoLuPu0H13139L6Ocx+ji9Wdaj
         XOBfvRKxZpIBuRo22qQTya/2j3HxFTUmLjIBgHYEGjqSs4iTKMP6LMlRXb1wPTaMkO3H
         wZ9z4AIWBag+qq0GFHT/p3FI29+mYtyZpd/TqSNICnZGQAERLaYXaR1ETscjWRe2P1Ja
         tbPfYTYP3vPOHWmFw4hSBL1v868aSObtC+V0TGFzxRvTQbE39oXAlwepb4l0xKuWtiCM
         n/Kg==
X-Gm-Message-State: AFqh2krvOb+FciAubbs29BMAk4AklvJQb3jA21+/ncHt6gLitwzKsmla
	j4Uq2mreMxcv3IhnQbwxfjq76Z/LmWA=
X-Google-Smtp-Source: AMrXdXsrVj0ft0X/ZO27SbZhCpu5irtaTLyK5PckQsL1eoWTHYipdhspt+myAQMz5QjFoQsJOVxrZQ==
X-Received: by 2002:a05:6830:1652:b0:663:d2b5:38e7 with SMTP id h18-20020a056830165200b00663d2b538e7mr30552862otr.21.1673191294364;
        Sun, 08 Jan 2023 07:21:34 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 17/26] audit: Inherit python3targetconfig
Date: Sun,  8 Jan 2023 10:20:52 -0500
Message-Id: <627198a98fe5f8a2ec6f016e568fe91042e96783.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100462

From: Khem Raj <raj.khem@gmail.com>

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c7fcebd05d18c118eccbf6bc6c75ea91d0b89063)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/audit/audit_3.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.9.bb b/meta-oe/recipes-security/audit/audit_3.0.9.bb
index dcab7dcc88..9621d9e335 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.9.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.9.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 S = "${WORKDIR}/git"
 SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
 
-inherit autotools python3native update-rc.d systemd
+inherit autotools python3native python3targetconfig update-rc.d systemd
 
 UPDATERCPN = "auditd"
 INITSCRIPT_NAME = "auditd"
-- 
2.25.1


