Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.1308.1616604447219585647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hvBn0lq5;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id b7so34022549ejv.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGQgfwf2wMzKS5teDa0753NPC0/hEXKPriXOoM6yZZ8=;
        b=hvBn0lq5evEFOLDtwJmsMKfvAhtSQ83D+mGXEFPm4Q4BY6O58vCRN0Tb4HmfgvEqit
         B1lz7eMMucLWczPeOzzg6FQ8doeBQltWkl0rlzl/rS1oDESz+mmT2g3iDHLKsP0tubGt
         9DH48A07E5PyUjFJNzj6AWsz7hvExKAXEFUwIrrgJBwwygSG2pnBCvbtO6+jfz+8l/vE
         XOcmxFsR6izgGFz3EnjuPI5dfHLUJvWWl/bmkeiRfD0w5qZw4x5TNZ76Kq4MRNSgU0My
         CjTECxcwumcHWp9AYmwSrgHlxibc9Pai1CP/aB4mvLFkZz+YgrkTylp6q0EOWJcWuOzC
         Pkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGQgfwf2wMzKS5teDa0753NPC0/hEXKPriXOoM6yZZ8=;
        b=JfL4EE4VsMWzE6LkFxt+Pj7lnw/yBkCUbOMvPcEmypSyXxz3n5dAVU/yTFZLWCnub8
         8yHewTRcTdei1gK5h6TlC4aZmAwxPTANz7a3ex46owLne3DQ/gWs7nd3rq3WgMY7e/Vd
         3ZwtDZVLN8s9r0NVUUyxwHhkoX1+znBfWhWSUoKMonHo8megOTx/1PMSlE2JO0GaT0M+
         Dj0eteQBg7RCuZ/hxwZqciAoc0VwwD40lfB6aGbK4cQ8pS81h8zngTR2i4Gj3YlMfB3N
         Au5Jox7o1+8qBxcSDIk+JKeGVPLqQOEk8u7l6lhf7Ku/iI67wb/8zDJ51RpyO8a4vr36
         8HtQ==
X-Gm-Message-State: AOAM531VouyKQDNpRCVfw+16YRIRWkTxhaWNM3VkEfRikvU2T9NzhZpa
	Pg+Jtn30aILbU79rfAc+mdsNiDmKbFw=
X-Google-Smtp-Source: ABdhPJxzQsXKX416aDHZ0jYQ0g/A9vE3QnCtmRkz1HU92M0HdBIoQICKy0+i8qPqEzcI5YTTYbK4xg==
X-Received: by 2002:a17:906:4955:: with SMTP id f21mr4939011ejt.74.1616604445659;
        Wed, 24 Mar 2021 09:47:25 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a12sm1356558edx.91.2021.03.24.09.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:25 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 2/3] packagegroup-meta-oe: include nodejs without meta-python2 conditional
Date: Wed, 24 Mar 2021 17:47:21 +0100
Message-Id: <20210324164722.390705-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164722.390705-1-Martin.Jansa@gmail.com>
References: <20210324164722.390705-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it doesn't depend on meta-python2 since:
  commit eaf9cfb01864a7a64c6ba4142283a8cf76cadd9a
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Thu Jan 23 17:44:06 2020 +0100

    nodejs: use python3native

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4d86ef9775..e252c0850b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -258,7 +258,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     mpich \
     msgpack-c \
     mercurial \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
+    nodejs \
     openocd \
     pax-utils \
     ipc-run \
-- 
2.30.2

