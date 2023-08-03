Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269B0EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:48:22 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.870.1691084899460425856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IK5c6dSp;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: sweng5080@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b9cf7e6ab2so1094472a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691084898; x=1691689698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebv4xjpNpaHlQiJx/GKHSYHXqySKK4Q+XsJxzQMeN9A=;
        b=IK5c6dSp3ikfXmslDGfbhrkZgJXylbjADhWV1FpAzse9cthXLf/n32k8BnHw79tB4K
         84HndFCf0pvMZfy3HX8m6WnGVdzEzACwCM4eoOK8WOsardZIndF6YETvDvjjFBCb9sjt
         EwTgrqWpeTPM4MhAGYLeONFI6Wu6OFIh1bEUDjV9DI5Iyk15g8ShljJhE+O1HrgWdkbS
         NAPyg8jqCf3xssQ2SrK2F6E8ALFxA0s37Y9+qt43W7dFSuN1JmNWnMcTJ/R2svREFY/p
         lzaB2+jJgBz4+QwezagPHeZPcIxL+lgFabbw1cYvINqIQB8jKfqLd7KBPsUSbeAvCQIR
         q4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691084898; x=1691689698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebv4xjpNpaHlQiJx/GKHSYHXqySKK4Q+XsJxzQMeN9A=;
        b=JQWL0zZwFhqAsvPU+buwX4Xoakn4yWPvvId5C9oncFY7pMvekhpvl1mSLH7+nD1b4t
         9XdZXOunAUxVFLE0KlID6GDY5Ux8QMITfTzLbcToZSIZyzAyqvRmtdWhEN0voT+7gvb0
         26yPX/CEPhT8r35s/y9XzVx7T782HrhmYsVwBn2Q83sX8JRXZf5rb8KMs/+4m19lXud+
         mbk267PhKuCyRwDHcQmIBMHBONGdAG3VHUEptjzHW8wQfeIIO8DMO+iCvW0jkWjqJVIv
         8OzD6M4wFL0zkPvwvc7je1rYAR2466j6btpSmLHgvaDUl+qnJ8ze1zGkw+pNiFE0kPqx
         Ce0g==
X-Gm-Message-State: ABy/qLb2Uy+f10tklvj5geTmHYf9oPPH16B0x1EaJ/jC2a8zEX7FXydX
	WUNASADcy76DED07NQ9R1C/G5Ozt4S8=
X-Google-Smtp-Source: APBJJlHxtOsy644bnM0QG8FM0raOQeqUdMlgQgLvtlFoyW7hzV1qYAFSMSOq1eUJUsMWDh26jqAAmg==
X-Received: by 2002:a9d:62d6:0:b0:6bb:1049:6919 with SMTP id z22-20020a9d62d6000000b006bb10496919mr20922402otk.12.1691084898364;
        Thu, 03 Aug 2023 10:48:18 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id i14-20020a9d624e000000b006b92509e76esm227680otk.32.2023.08.03.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:48:17 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [meta-networking][PATCH] Fix groupname gid change warning
Date: Thu,  3 Aug 2023 12:47:47 -0500
Message-Id: <20230803174747.22211-1-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 17:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104221

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
radvd: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
index f9f810abd..36c921a16 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -61,6 +61,7 @@ do_install:append () {
 }
 
 USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system nogroup"
 USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
 
 pkg_postinst:${PN} () {
-- 
2.37.0


