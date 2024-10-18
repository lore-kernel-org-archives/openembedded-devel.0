Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950AED3E1A6
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.30073.1729278797374405219
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2eAvvMX;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e297cc4b134so2497830276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278796; x=1729883596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUJ2dHbiF4XAhetx/Q6+HHqnzaBGVVfchKUcC5Ek3FU=;
        b=L2eAvvMXmglshslJU3+8piHqD5e9oRQfCSADo5Nogxx45iE1cRRn7yqag12wy9/K/n
         aSytAyqW2uoZ6h7n96r0x/pvWyXLUqozZlmBhGTlbJfB0gj89FQeBCJk9H0gEu4PGkZ3
         J67aBLAkNhpVT64EHAko6EH8GU2pAIBHMhQcKpb4UuIKgsD1E+Db/KYRX2MCJ12AWGp0
         u9P5CvZFEb3sElTexfJtZpnINCzc5XIDifu2Y8d+Xf6FdroK4sTED8jz41A0IMi2ZH8Q
         uXEdJqqhfJvWOue00i2ux2EuVLYsdvmOgjkCJqvpHGzfJeeKPpQ2P9M9YI0FYZBgdOkX
         9UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278796; x=1729883596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUJ2dHbiF4XAhetx/Q6+HHqnzaBGVVfchKUcC5Ek3FU=;
        b=IdXEOT+2dq+VYtBu9V/4TGQIGZYjmEwUtrr/867OWw/Q+422icFm1iiJkJ0XAVHetv
         D7+cab8QAR18j5Zmvc/4cBjdglo9yaiqZyCsP4XiIIsc9PM5KBQ4TZI/0o9mEA88gvJr
         X0B5/XQAq6Jia1r2VWpRz/CxwqEu3AMmjTAc+/fEggi5W3sODecnhFne2XhlJWTnyrYj
         Jihyf0BpuwogAUnZLeG74mBaAv+TGzDfVo9pKjEbJF15d5IyvXTos5wStrS+lNFwz0vp
         vQ2gcAH76vgzGuwI76rHajyf6kNemGsVzBcHS+uZWBjOor4Kbtp6FPCdlPLGgSBKmDcd
         TTRw==
X-Gm-Message-State: AOJu0Yxj6I82Mxb0VJ31r6R/qpc0BTNPQnTK2osgbryMdr1rLboU8oAj
	/95P/cmBnBwRcYs880yuL4kB7TZeeoXQi/eza26IqYrhjCU0a2oZ+n1jSQ==
X-Google-Smtp-Source: AGHT+IGIlMq5syYV65ZhBKvTW2IMnLarRpiPexsZMWlrDrGcwisbNYxEfUPuCIKOY9VV2W/xyxfWOQ==
X-Received: by 2002:a05:690c:25c1:b0:6db:e280:a3ae with SMTP id 00721157ae682-6e5bf9fffd9mr43822997b3.23.1729278796026;
        Fri, 18 Oct 2024 12:13:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 08/68] python-flask-xstatic.inc: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:55 -0400
Message-ID: <20241018191101.25184-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112995

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-xstatic.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic.inc b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
index 8434d2610..6fc32107f 100644
--- a/meta-python/recipes-devtools/python/python-flask-xstatic.inc
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "XStatic support for flask"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=659968f6ebd4b70b6c3190d20b4a924c"
 
-SRC_URI[md5sum] = "2f56023e1444c8bd1fec41afe93de743"
 SRC_URI[sha256sum] = "226ea8e97065a9488b59bfe5c94af4c6e2ea70a25052e301fb231a1381490133"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-flask-xstatic:"
-- 
2.43.0


