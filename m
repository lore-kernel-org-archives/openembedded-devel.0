Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644DAC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 10:45:52 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.37198.1640688350924087647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 02:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OXZF5T9C;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y22so72261174edq.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTkm+loXsJ+Ir+NdHg2rKEDFbC5YCb6yCeezHHHtl5Q=;
        b=OXZF5T9CcdwNSLCifOtMBmirWMsZsIdZiPeFVeuNWrGefOHudNtCJcDhYwC7ii7kCE
         ZWZnyXbFKIN0TXlT18g/jG6n2RBaa/yV6htBCWz2rMUkwXfda4Y11drd+Cah6iNN7nGo
         w2TmJkLkpD5aeSv9cTOH/4PDIJaeUshCVm+Iw+vt6mDVB5o6/IFnPHGoYjcF1zrZhVXc
         CF5bDCb3RrPVKv3+sPh3/VE7P7tILEPjzr8MOXhK/nJCj6y7vyoET4dZMSquvUBqVSiw
         niVcTX2aEabMUczUfg19YvtSXcVFzf12McBiemp0t738gpZGnUgkJD6fJ1vGrlGLgKbS
         NsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTkm+loXsJ+Ir+NdHg2rKEDFbC5YCb6yCeezHHHtl5Q=;
        b=WoLTevY8wXJHUHd9BSZm647wPj0XbZuX5fP6dBCIv2qR3NJDANAxMwFkPG7H/IuxgL
         NFeCIV0bx7SH04gJxtravYI0szYpKLfIMi9Sj6EKR+ieNK6fVdLwdFs0oFmWzCFoT/iK
         TWnwIEOwznMBKiLij8biuW+iI4gezHOTNrPN6rjehXzrl470HcrSuBLHOydF8KwOox+p
         OPYUWXh9q3bKmSh7QCpDNEqYGQv9/LW9WZtPI1qJxeuBSSbDrzHce2gnWQXT8hE7tHFc
         hACy9sdHCMdaMI4miPtYMJJatop2auG4fAaofOy1HMg1ID/dgevPvnag7joi8u6ehl/m
         GeoA==
X-Gm-Message-State: AOAM5322QV8b8w63d+Rnbal75m4lcOvGgrzrFFsXy2qNDoIrv1r30eIL
	14iEuFFdIqIWvvA0fx+A7U2QNghkQXA=
X-Google-Smtp-Source: 
 ABdhPJxg4613HVZs0DSEdoJAuN+f2ldNuyCXcq8P/qh70rU8HXuWfcgZwpLFcOdqfReRhwZnvi4naA==
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr20288561edd.332.1640688349106;
        Tue, 28 Dec 2021 02:45:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 ne39sm6011348ejc.142.2021.12.28.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:45:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] simple-mtpfs: add dependency on autoconf-archive
Date: Tue, 28 Dec 2021 11:45:46 +0100
Message-Id: <20211228104546.483195-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 10:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94556

This version fails to build here with:
| ../git/configure: line 3778: syntax error near unexpected token `noext'
| ../git/configure: line 3778: `AX_CXX_COMPILE_STDCXX_17(noext)'

switching back to older version builds fine.

AX_CXX_COMPILE_STDCXX_17 was introduced in https://github.com/phatina/simple-mtpfs/commit/19e7bb9b608b0c0dce2ee6f56fac75901bc69529#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810

Adding autoconf-archive into the DEPENDS fixes the issue.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
index dfb7485596..2335771319 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
-DEPENDS = "fuse libmtp"
+DEPENDS = "fuse libmtp autoconf-archive"
 
 inherit autotools pkgconfig
 
-- 
2.32.0


