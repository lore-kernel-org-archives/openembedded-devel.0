Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80315C61DA2
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H5ER8itP;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133663oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPDXGKSmP4CAlvSoN4g7BjuFrv/2Q234NmQlSa4a1wU=;
        b=H5ER8itPBl6jU44MYQU3xFwhcqkIvwk0iOeMyHgDjwVHST+bj/vDc5C6pEQtB2TMx8
         DKrk0x1zEGt+XMNAXArwev4pRWNCn9Ywvcq8UZ5SrOCWcn/ocR5m9eDbJdTL3QePyOZr
         oiV/fzQ+pAyy0KKM3Tmoazcy7+084eCAK/xWkH3wGKK/vwynNcMcpyVUX8hb+l/zGGMD
         3jIBiKuvA+fiXPVvbJK72a6wUzzhpC7NE9TYnTOQqc/xhYxf6RbzoLd7KwHU7rDs2aoV
         gEvwEpgXnoDnS+AmdRuwJAPYlDj14KSijJVp+2dhLZ2fRZqHewZot+/YjPWSys8A8V8T
         +zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPDXGKSmP4CAlvSoN4g7BjuFrv/2Q234NmQlSa4a1wU=;
        b=djLD2BKZkubDggCMmMMmIfIpEmmYhyRzsObSDPEVmbMYAKZOTn6I4QuFiHC9xqk01S
         Y80e+uCyaQN57cGo7Uu2BcueX4Mv0WK6cU6uV2cCWVbUFJVoI8kAjqSkU+2nxE+ftQ6X
         7BvXd3tRtB30AWitKqwcFK540PThpISgS9UGtJ248nECpLYt7Bq1uXyFb/ChOJBunVdM
         Wuyn0c9txGs9icxwBq/jjY1EhLG+AILKZj3TppkOy8b1a6wtB6qlLmK1U/iXTdtR1B26
         R1XCA2YJV9DkfLykEyQ+ht+nJQeH4oEIYDrYFmgDWnejFvbZFE9Ntt1yyKcHLDZzJE3u
         8x4w==
X-Gm-Message-State: AFqh2kqPyPDsmDmFzwQ+MeCQONJYTcaBEsPdVetRFeimvzG6lTiOG3qH
	+RrhyCoVbQJ/KMUH0EMIZku5ovSkrbU=
X-Google-Smtp-Source: AMrXdXsTivbkfNd1cqIVvkaOYOGk4shleKpXbUP6Srt/ZioXv4jFPFqngkOuf+kA1isc9dgGh/fOZA==
X-Received: by 2002:a05:6820:150a:b0:4f2:875:5252 with SMTP id ay10-20020a056820150a00b004f208755252mr26279211oob.3.1674653503002;
        Wed, 25 Jan 2023 05:31:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 17/41] audit: Inherit python3targetconfig
Date: Wed, 25 Jan 2023 08:30:59 -0500
Message-Id: <627198a98fe5f8a2ec6f016e568fe91042e96783.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100752

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


