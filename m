Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D954D3E19A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.30076.1729278803327405591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKZLRyNW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e35bf59cf6so34604497b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278802; x=1729883602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnWKrxhjDtnm9Cby4CIlPcjD+UeLgltnlU51EXuOJVY=;
        b=WKZLRyNW1V0YJDQyeUeC4V/odiyJ2o9j4lN3c5Fmynh/cdf76ge0yZ/bRt4X9OqWiV
         BK5U+X7sCJfL8pfKI4spChChH7w8VlDKTLIIuIvEwYAcpaHuTRcmy4j1P5W9p7c1IQet
         P0TMGcdb/Amq3jAOtAl5to/l78A+A+fTFgzGY52pDPqAXgn8sn0FR68S4mzgIUEnLEec
         6dVcA+TvvbR1OtxpljQ+EVgDQMHr+E+ScmpE6Uxoq78KYCV7d5vhAw1hI55wQDxTBcJF
         UAOwC1kKNCuUPiKTU1Q5QoIxQBanIlMCF4GFLT7RNXPhQ0Tof14zZjKEzbo26Ye5l2uw
         Uv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278802; x=1729883602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnWKrxhjDtnm9Cby4CIlPcjD+UeLgltnlU51EXuOJVY=;
        b=kIwADtRaF4y0230tSC3v549oSNwxhYh+TT7UT7s7M+jahxGc6thpfHOp3oPK+HQoIQ
         3wcVdNkOQxhRlCTTDjctfv9wiYUWuGcm9XxbefrFXwxSq0P4+3vzM7ujiOeb5GwR4IFp
         +nYHCjr8SS50SSnb9J6/tRkP9ZZWPxNFc+GgsLBk8EqLE3gvDU0FZ7vVXBbGDc5U+IQ2
         Vhs9E6Ob3SsFr+sqYJ6nG+IR3l6Pe4nwQCTveiWIgjSw5gHXvgJrRHc+u6Pw7QKk3ncd
         Ljo19bX2MttrAIbkz4aPNn2e5V5B+PV92p8krTSdsalj4DlLuzJUxMoG/2TIdUzi4Yvh
         +FeA==
X-Gm-Message-State: AOJu0Yw43/8CiVGNFbZArDp5sF38MCV0qEU6VQd3n0luLi/BgTIaeUp3
	tum2r5CXvDOBcjS28fFNTXxlbCFPAFhoasKxB4MFrM0trpdNdjSrUQ147g==
X-Google-Smtp-Source: AGHT+IHABB16CndacOj+1kaqo0TchgJRNYnBWfI0Bsj9vrOme8fGxnfRSzbOOBK7Ie1ZMDBheOq/Bg==
X-Received: by 2002:a05:690c:4883:b0:6e3:7625:15f7 with SMTP id 00721157ae682-6e5a3d5743dmr71342577b3.10.1729278801897;
        Fri, 18 Oct 2024 12:13:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 17/68] python3-editor: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:04 -0400
Message-ID: <20241018191101.25184-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113004

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-editor_1.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index 335461c43..6ec72d02a 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Programmatically open and editor, capture the result"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
 SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
 
 PYPI_PACKAGE = "python-editor"
-- 
2.43.0


