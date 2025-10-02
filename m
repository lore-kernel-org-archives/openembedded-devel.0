Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED45CCD189
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.7968.1759409984285034124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEZRugA+;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so193736666b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409983; x=1760014783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HqorTRcSegnWvypbQzYJXyqizKORvIPynXwhFtdlJY=;
        b=XEZRugA+ZYdcyDtlaSGyM5qtGrAAt/mzAmNZy9WPIrNieuxpAuezLA+JNwd47r2D2U
         cEGaznCkZuHvvtgnmNsN3Ee4WBDTllc5Cs9ubiTvIH/PFSX36TYInfRqICZaxdg5OG9/
         rGFY07sgfwYcm2jZnwMchHvEYUwhQ48kAmpYSsliZa+wCJwkW7MjftHrZUoThhgJXG5M
         QhVpfKqCdidCXL1bS0u6kdbg30EFxtFQChKxUv2LrLMOKJvvXBUEkFvw3Df5KDh5Cm57
         aJL15W4LP3RNi0aMawWoU83DgmNyZY7CGOw5n6Wypw3PKPjXnzU0OyzwXo19MvXJJ4fN
         H8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409983; x=1760014783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HqorTRcSegnWvypbQzYJXyqizKORvIPynXwhFtdlJY=;
        b=W+NpCvLKFrdv0xJC22mtEefYk2Zvje0psPWFhDRvey3GdQOFKdw6pWZiVxC3DgB7oM
         dhXhkmADWo8OZKCUH1sWpR2GNVwcr6M6yNdwiFx8ZJzYcqbC8uWh7oNtbqyyfJe1DZ0b
         ZFqskui6c/8sfwkvyDpAOotePvyoaeHN86IZdIX+al3NhcqF/B86Qwrxw3s6Qw1APZV0
         TL4jJPC50OxWAPA/AaEWCJQ8fYuC5JeCEGECkZp/55EZgWCf9WPSQKx5UOzf6/qhsNLS
         tnspEmBH43CUdZgEJnDCDSArbzkWZJpfDe1nZ5+W9i8QlkG0quxEgpkrjHXqYP/IX7U3
         NpqQ==
X-Gm-Message-State: AOJu0YwP2KrFrXrGxr+YWa64T/062qPCVcPK9Yxt9Y71Zpq6yr/7P80B
	hdqq+O+5ZoB6aUflc/med+gsAYKrGqXO2sEsPyesb1bS7hZph+TPK9Ka3yN++A==
X-Gm-Gg: ASbGncuc2jGTDhljTDb5gWrPhOwKW9GQM5rZI+ztePsZtPEbxvUqEXqxxOSukJKxnZp
	i/e8p6AEktqXDjOW86cFzPlj/M3dR6mWMga/K3A7I0bh8qWja5ACbmWLegxVTvcPIbzYiHsj+5B
	MEvVOI98oeUzlxLs+Rnlj446pS9onC76UpJjyhDs08E5tfXE70boAfUvE4NqunSGaehsBE6ngAw
	SMdkTn9TBEk5CHa+pRhDfbgXe6RACEJ6WTwwkDyzXiCgfTGsf5wouNOJSEH/pWrhUvUgzJ20q3Q
	WE2Slz2fATpFvWYECwVdazyMVFb0r3484Oqzfotz1r2uL9iY/y3z3fZzPxw//ED1MpikNJg9taI
	qFw2SonA3qkWXs8EXRZon18DStfpIXxCwVsfUWLffX+G5hJwlKjvOY0c=
X-Google-Smtp-Source: AGHT+IFdu8UTyRTr59nzeZ7urGi00y+j33ZIpv5WGl51vfxpUN+qu4GKenC1u7BVbSYiVz5ApkJ0SA==
X-Received: by 2002:a17:907:25c5:b0:b41:3c27:e3ca with SMTP id a640c23a62f3a-b46e4b8ed49mr739835266b.7.1759409981614;
        Thu, 02 Oct 2025 05:59:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 19/26] python3-gsocketpool: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:19 +0200
Message-ID: <20251002125926.2624522-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120189

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6304859867a78b98253b9c9e15484b482031a1d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb            | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index a5581c252b..8f40fa5ee4 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -3,8 +3,9 @@ DESCRIPTION = "creates a pool of connections that can be used with gevent"
 HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+
 DEPENDS += "${PYTHON_PN}-gevent"
-RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
+RDEPENDS:${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-logging"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"

