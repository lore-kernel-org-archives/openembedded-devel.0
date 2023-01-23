Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45755C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 15:02:00 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.44671.1674486119084259932
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 07:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8+wfguv;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id z9so9833630qtv.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jan 2023 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS46n65Dqu8wLnE63kiXsZxece5IP5LLhIe/Egk+lpA=;
        b=H8+wfguvAPA7hm3fiVSKb6UnYsXByFmxeTdTykVy1NaJvqAe/IqgQaYxE2JS8gsSLw
         P+jy9AMzi2QHmFnArowxG/zmvqpbfTXP8PeN9uANUpLY+FgUpeB51YCiVa4/XBF8rtRc
         EaWXh/0zivRSgXdlUcaLHA9f7qhmZSsVb9SlLl1/Oe/DvgnVRy42zbNBM8Ww5rEYfH3U
         kONLdK0w5XvUBaHd2cZdQyIexVR8jVMp7dLnk9+T38AGwM1Qr0OC3K8iVXbRuEqNBtf7
         j4IozzfIgftgiI6GEyjJG5PTmLVzB9SVbMTtcBDA8dSGEir5e7w2ix3HCyY2U20MBy95
         fMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QS46n65Dqu8wLnE63kiXsZxece5IP5LLhIe/Egk+lpA=;
        b=f9yOpb/JsfC+2hLgv3BV6e3LUjPVZfjH36mPz+4FIMZmR4RvH3QYGRwsrwaOuJvOSI
         3Y4pql7YBdawpizi2T+cN06qZStl/jM62UY3s+vaety4H0hKByoUqz5GuOXgwl+dldu3
         lSi5kcyJ0n8CKyjCpbhIm2pw2DKcR9YGTDBlTzuNlSQY4Gte4D8zpxkTKwtiyYGfdCsA
         o4VPNQcQA2w2DNyOvopgSe2HS6tbzh2dB3x1lcF0vOTRfPDcS65LCqfiMKT1wzlI5PsV
         KaJZQjcjQVaxEFa00Wc6DqQMCmig5s+bU2t3IHQcIlolrzz2aWARLUTl5B+YgIkIQ8vE
         8b+Q==
X-Gm-Message-State: AFqh2krOgz2nvzMgn45uyli33UGORB9Frm1OKBhEa74PF6P+jafQp2CU
	Bxp63JukORCeufTmMhIICXehTK7UgLc=
X-Google-Smtp-Source: AMrXdXsQ9Ehg29BNTE32b0ic4p8z6Vws03x1W0WvQMUkgIi0RfybF8qK8hWGCj3GXmvNnUBU7t9LAA==
X-Received: by 2002:ac8:4b50:0:b0:3b6:8b52:1358 with SMTP id e16-20020ac84b50000000b003b68b521358mr23218163qts.9.1674486117880;
        Mon, 23 Jan 2023 07:01:57 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id z21-20020ac84315000000b003b7ea583c7csm241713qtm.58.2023.01.23.07.01.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:01:57 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] psqlodbc: fix HOMEPAGE
Date: Mon, 23 Jan 2023 10:01:36 -0500
Message-Id: <20230123150136.26469-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jan 2023 15:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100711

The HOMEPAGE URL is no longer valid, update it to point to the correct
location.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
index 299abee000c9..57ade6162b4d 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "\
  software to accept ODBC clients. \
 "
 SECTION = "libs"
-HOMEPAGE = "http://psqlodbc.projects.postgresql.org/"
+HOMEPAGE = "https://odbc.postgresql.org/"
 
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
-- 
2.36.0.rc2.17.g4027e30c53


