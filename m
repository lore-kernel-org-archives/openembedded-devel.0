Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088D7C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.11804.1639668210875056633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFG6A4Jy;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id mj19so5892372pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HNOsTq/VTyRHuRnP1otoCMnbJRdth6l51S/um6a/XqE=;
        b=LFG6A4Jyc+XSBmVQX8TRHJw2v1YIRsKOQw9ZM/vA0Nbqh2U7B7QMkxrNLj1JWAaQTc
         zNenNL11rSwvr1tBti+8zJhllUxI4rwloa2G1sUDR2Dlpyc24GkPSSRj37/7XQp5JlIi
         2b8vwBcIBNmDCIssL99x4ynU9h0bhoOpRNN6RJUtGHkjo/W5q/gFAQLrBvU1+q4owRGT
         G1B9zx3nczZhJjfw8N2sBTURra5DZAIqN7Im5gHRpIGXyHHBsyAkqdNeDzM9Nb7JoluI
         dY72g/PxeyMB0B4eDsN1R0IBgAHOoHU/LQ9BWrJRoKf0k7mivaDlYohD0dEXvfdQy6g9
         G/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNOsTq/VTyRHuRnP1otoCMnbJRdth6l51S/um6a/XqE=;
        b=X4i1ClV1GrrJmaRuaRcq/1lXFsqMBsgRZurjDhzmrt00oypsYu0Hboe7IU9Z2kNVVk
         8h+90c3spEYakX15yFrw/lS1ONnjORCIGzz+PjT3WeR/Stp7IlZQj63uXbhm8yTyS9ue
         ZGEWTfiYz44P7L9iyYz2ngAn7boxvQDjqNLvV29k+k1eW0ezVa6MlBZvlBY0cYDg7Gfr
         6yEt+bSCzsBBPO9jYKV9HdN3lGKJiWnydID5zc0wbMK1lZChlLK76kZPlx09AJCbWL6T
         b6lqSOcGXtasReffOxDVfHQJPueo1K6xYb1eLtuCz/gzhMDCeLVEcuDtlxMEPYH1qtzC
         QO9w==
X-Gm-Message-State: AOAM533RbwFKyFv8IEiXA8SkbaCzE+JC1NzqJkOo97UgYSi+XXeED/WK
	lgkwaXLkKsPkPMjX4Wp+O6lLoyXEPhM=
X-Google-Smtp-Source: 
 ABdhPJzH+G+pskpUhJ68gJ2LOgiWTpuvUSozXiBNP6lsN0c4vhPGu/vcy3bSUCVzT0H80t2/gGqeMw==
X-Received: by 2002:a17:90a:2e16:: with SMTP id
 q22mr6714286pjd.156.1639668210239;
        Thu, 16 Dec 2021 07:23:30 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 04/18] xmlrpc-c: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:09 -0800
Message-Id: 
 <b712b3a1e394434a1b0b147621aab927b0aee280.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94389

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 11af3bd25062bd63b4c00918e4f08cf6813ae7de)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index d3aa6d2ea2..e119420d2a 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to h
 write an XML-RPC server or client in C or C++."
 
 HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
-LICENSE = "BSD & MIT"
+LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
-- 
2.25.1


