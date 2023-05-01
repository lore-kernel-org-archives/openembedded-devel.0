Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B476AC77B7F
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.87296.1682921127258198987
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MGovtz0V;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso1479539b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921126; x=1685513126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNR0ZTNAbQ0mYNqjQ7xC7YdZLV0d1xCwUrVNec1+ITw=;
        b=MGovtz0VqH+upRl9Yrll/LIvyIKLOhHkrvWmBo1HFOmNd+MDr6E572blSaPCPvWWwM
         sVTjWqbp8tl1pH9HMYmpyE4Omr8mEs2j4JeD4Dq+XCdvzFDDcIzehtTPtSxRAEw1iA5O
         310ZvpDB0T5R7Y+3AJjMpMJCC9Rb0yqsrXGMuMkjiJPF81WvdDj1UMgvQm7bIrsIAhv9
         Uv7ox8CAo4OLF0dXXavewVpyreXQpTHJ+xncnSF1ih0K3aXEj0EmJyudfHOqEqdegTxJ
         QEP4Kys98MklV2ZkRmhPR7sNLxUiqj8+pSHJvxuToB3nY55AB7X+IrI2wBwqegSEjAi/
         pDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921126; x=1685513126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNR0ZTNAbQ0mYNqjQ7xC7YdZLV0d1xCwUrVNec1+ITw=;
        b=b5zlQVsY+LfJpCh3MOeJDwklqyPhfXKf9KS89W0qtyJTAEQY3+cdgfp5wMSspXu+Md
         +KsLoF1nC+yRYnsqym61Lx8xQhnVOrRLrUY87v2RbNoQxaNREfSn3yGCtvhyzfLq9Nbh
         T159SL3H0Ed2EbxBhQOlKS065kawhqj+4l+2kEE/oDBJNCDBnDFqFDP85M6HX8NbmP8M
         G3xD74rOIy9IsZQqNpN3aOQFJg8x42jjk31DWe3DAXXcl0IN3YwT7uQ51B+n2RjYwwIg
         9wLG9wNw3IUXqdDmlPKA+4sdHUzR9U/PyjQSeWLGS2Nl1zU2xt8T8ST3Q9wn8+0AsIfs
         3xuw==
X-Gm-Message-State: AC+VfDwvTUEB6r6Xfs2MJi6bUTEDLtTCOdpdiynz1E5CgSRuLBsDNncy
	QbMyecIYny2DgHiAhs6wbBz2NaLOGIgvSw==
X-Google-Smtp-Source: ACHHUZ5JFhWLOAaLwzkqxpOG4MoKtwVDAMAWRqHq9QzlAkzuJrsAR5/afxsxeFajzNXWr2SZ4iroyw==
X-Received: by 2002:a05:6a20:c892:b0:f5:b78b:654 with SMTP id hb18-20020a056a20c89200b000f5b78b0654mr12832000pzb.15.1682921126398;
        Sun, 30 Apr 2023 23:05:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/13] nicstat: Use SOURCEFORGE_MIRROR in SRC_URI
Date: Sun, 30 Apr 2023 23:05:14 -0700
Message-Id: <20230501060518.3505068-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102238

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index 3875f0f605..bf742fa062 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://nicstat.sourceforge.net"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 
-SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/${BPN}/${BP}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
            "
 SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
-- 
2.40.1


