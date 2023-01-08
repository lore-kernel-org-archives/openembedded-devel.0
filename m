Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188FAC678D5
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.46766.1673191269921502018
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RN0JiJoZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id x25-20020a056830115900b00670932eff32so3848495otq.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNhUt+MkqmZ0PO3IIuF8CduZCOQSpcg9MHZEi2ripwI=;
        b=RN0JiJoZ03mI96lHdn0smsk7d3YhibwiYuwW+NjQgNFBnIwihEIzu6pfwDY/HZHx91
         dMq3hLFGAj2C4dt4IQKUtYk5mhiBATNg4rZLo7yc14Gwfhljv+YYID08fgg7oPx8Dvi6
         9s7rZAm09JrS69UANIx5XR6xtMDvOp95gP8QnTPG9OHaJINzM9buDvQe1XIjym3eaY2o
         Hps8qxJHSafwDRqHZDxmyc5RFJXBM3vrdVtn9mYBV+njpsu+jx1O37NqA1Ri2RHCtQhL
         HRSEg/ecDcBgHPlcKF0TbfFNNOrc6nuUFs83aPuMsBPhPr59fzQ9NEhMPrXXLjXROo9H
         g5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNhUt+MkqmZ0PO3IIuF8CduZCOQSpcg9MHZEi2ripwI=;
        b=5m3KrmRpD+xOMhG30wXFyeSnSrNHqnJZ71b+OPhBIUkoDXNC6LK1ZRegPG0cKQWSvE
         AUSQB3FTpRfGGYtz45TEs82Vwk0VnSGMn3gsMJjke4qnNdnDLV9gl9NR3Ra/GfFhCIdn
         XNg4XATG3Qb5WewfFaX2R9N0hc/8RX8OS8J6H3u/zxxIEI35fESSImI0lCWqy31yT5fD
         P47/htCjCdWrQVS88J8zl7CiHYgy/J6DJoMLVjnZmPdowCBZXYpMR9/a5SUfOXcrXuSh
         qwnEvRdb9GAd5ymOC22bblREgKxVPfyQ4Ng6ioRH0vCoqBiLmC9RSO0NAjLGs13jHm5z
         oUwQ==
X-Gm-Message-State: AFqh2kpq6ZVx4TRVq1X5aZBpI77TgYSqMXsVtsSAyouihIuGeBE5Zw4W
	6L06emzUc5EcEgKm/8DUr48N+MJ2mLk=
X-Google-Smtp-Source: AMrXdXuVsuZxq+VX+FaeElzSIfJHfI45LLilAOlpNmxhvGLHERrlnXyqUCCaObSvdFUnz2ipfN5q0A==
X-Received: by 2002:a05:6830:1d42:b0:670:5ae2:3e71 with SMTP id p2-20020a0568301d4200b006705ae23e71mr30881913oth.37.1673191284736;
        Sun, 08 Jan 2023 07:21:24 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 13/26] audit: upgrade 3.0.8 -> 3.0.9
Date: Sun,  8 Jan 2023 10:20:48 -0500
Message-Id: <8dddba5045929496838336d3ad89925fcd2e19e0.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100458

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    In auditd, release the async flush lock on stop
    Don't allow auditd to log directly into /var/log when log_group is non-zero
    Cleanup krb5 memory leaks on error paths
    Update auditd.cron to use auditctl --signal
    In auparse, if too many fields, realloc array bigger (Paul Wolneykien)
    In auparse, special case kernel module name interpretation
    If overflow_action is ignore, don't treat as an error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 01eb5561da2823a8bb80e790bfbb6cdf320ce09e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.9.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.8.bb
rename to meta-oe/recipes-security/audit/audit_3.0.9.bb
index 78439f66fe..dcab7dcc88 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "54a62e78792fe583267cf80da717ee480b8f42bc"
+SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1


