Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAB0C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:29 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.16041.1647763708513322419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V/aKA6Rn;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id s72so5491855pgc.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=88YIUTkNCoG0ucnELPdgdq7GHVKFSEFdOqn1ouhsWJs=;
        b=V/aKA6RnZG6eAcJ97tfCEfltFoP9MMQWszA9gzJ7duVYB5hy0F6uPNaAhr4UcgZxyu
         uXSxW01lnp7aNf2kangHyrRJg5lQ+LGYyGlTyb9BIHpfsKRlJHDUwI0fFZnfuRVmqqAP
         b4gqS0YNoDcO8LZbrl33y34263J7MUxfD19H8bDUxA+dYdCb3pmv4zFkcThwjSOqnBch
         Lg0ejMNQTcbfRcVoMzvhkL2Fy7003SoGUt4C85hNrqX7p+HzQT0FBzox/CDRnzblPVdJ
         XnbBoMyAVG0CL0t/5upP3k3aMuGOoRL/JYK6QsHgoiOgt9+Aw4a0y4v/uZWLMcWKz+sJ
         goyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88YIUTkNCoG0ucnELPdgdq7GHVKFSEFdOqn1ouhsWJs=;
        b=mnYJBFVtzxLWhpZOgE7peleE7zBzDp0wUzIt6QM1A/HoOERF157a3SW3ykakgR5U6f
         9PKdNOGt8db6p4wojgEWh9/KX/ZlpuwJtxTP0F17j9X3XaW25i2dnZXmfN+WKKBvz01B
         juBsPE6XsOSH88/7cbKanCifGC/wqAO3TvRPTF+MaOQs+3OqvDMvvD8H2KZVOdTH/XLd
         iEjYg6WAsVYhY71jRBSWWfqpD6G2jWb/7YzZsmC/mlVDT/8e0Wk6QtV/b/o/7/1KJRxk
         cC5sx+0jST99LvWmURy32zhUA2nFht03KYeSCY8611hxi/OInIhv6k+2POVXHSLYohtm
         TSGA==
X-Gm-Message-State: AOAM533HpvDMD2lzgTLJUcXZpNXCx/Nu4e0L/qCxEK0fDY1/Nu6sI4dw
	WJ9B7VpGOEvpfPxHXAw/pGgV8D8M9PMP+w==
X-Google-Smtp-Source: 
 ABdhPJySMmoQQEeWKAZDOBDx1cRX49sPGmjwlO2BWRt7Nz+saHa43Ffa6mtLeyTaI3/rd4Dx737thw==
X-Received: by 2002:a63:ce48:0:b0:373:ac94:f489 with SMTP id
 r8-20020a63ce48000000b00373ac94f489mr14201346pgi.622.1647763707763;
        Sun, 20 Mar 2022 01:08:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/17] unattended-upgrades: Package nonarch_libdir
 for systemd files
Date: Sun, 20 Mar 2022 01:08:12 -0700
Message-Id: <20220320080815.825928-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96078

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unattended-upgrades/unattended-upgrades_2.6.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index e528d72e8c..1ec205f8b8 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -28,4 +28,4 @@ do_install:append () {
 	rm -r ${D}/usr/usr
 }
 
-FILES:${PN} = "${bindir} ${exec_prefix}/etc ${libdir} ${datadir}"
+FILES:${PN} = "${bindir} ${exec_prefix}/etc ${libdir} ${datadir} ${nonarch_libdir}"
-- 
2.35.1


