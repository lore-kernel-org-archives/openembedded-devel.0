Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.1210.1616604425230646699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHXed4zw;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id j3so28370783edp.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QLUsb227FemcYnkINNeu48jYWXD8ixjnvnxgSpKEHD0=;
        b=LHXed4zwbpAU5OOQzTpP6106RIux2LIKU6sQvMifBfMdLGy9lYZXZj7mN52Cv+VERP
         6qsz9/5O6MguYHCAHlSRTBbbZ23rdKczQbXqRMJFvK6bt3Wpd1W1cHvLf27lGj0ta3EJ
         frZulfEkZgCEuW6xmvTaESVneoJMQZypTkkPQlcRNpRb+L3506R84JDHNQa7C4Q/8PcE
         T8QiI1B9Aq3DLHJrQax5vyBOZIVh0b++FDq5LSoy6VP6mJVM0NJnOUxtrWIrgOp4WM3G
         dyr8DFkZ6m0BO5060SaJz4ojogYqaFJMwIOrwcm3tV3iTVGJ7Kv9URvjctzdPKW3lN3w
         ezfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QLUsb227FemcYnkINNeu48jYWXD8ixjnvnxgSpKEHD0=;
        b=P/K7ApWlaCCIcjItY5oPnudeVtth/L6eRTO0ItzYThW9/VvrDIoIX6igNl093bkcv3
         8etziBL5913j5X/ttAz/E5qeS64EIae21OWaPO33i3ld04BhJqYoYdztz5WzSiQ8DMg8
         KzjlLWqa8+h4Zz+29afHFrPCPQMjggXOx+l1u6DipZON6lChT28CMUA3cMUxAGt8Jxmm
         DDccRRq4/n5833CyYgGWL59gs8KBxtMvidE/I82uGJ5R0GCsE6ixvJ7rf8yAUNF7KeG6
         TXBaScmkxDvEVN5tVVs55GHpQMXZw0OLTLCjNOTdvkYTePIHnErXPJNGVK/CpXk+ZblP
         aodg==
X-Gm-Message-State: AOAM531wVgV4yZouM3MccPz4Ls73VwuGmE3RI9LiwKI/vJXhJjSV+hA/
	DMx2L1AI6pAC2RHddtUeqbX26vFm0EY=
X-Google-Smtp-Source: ABdhPJxTecXX/s+OFRpQa8ozGtW7y91OnEjDTd7OsKVPSmWyQEi7OHUu29K31EUQPb3LMP247o7BJw==
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr4414237edt.12.1616604423690;
        Wed, 24 Mar 2021 09:47:03 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k12sm1379859edo.50.2021.03.24.09.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:03 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] packagegroup-meta-oe: include nodejs without meta-python2 conditional
Date: Wed, 24 Mar 2021 17:46:57 +0100
Message-Id: <20210324164659.390543-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164659.390543-1-Martin.Jansa@gmail.com>
References: <20210324164659.390543-1-Martin.Jansa@gmail.com>
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
index 784c5d325c..3c8b970668 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -263,7 +263,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
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

