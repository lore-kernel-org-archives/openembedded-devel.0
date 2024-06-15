Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68000C27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 04:46:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.6503.1718426795055199745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 21:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2QNk8vV;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f44b5b9de6so23079105ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718426794; x=1719031594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TMddszlV+Mkr2+a87va+E5z99aVS1VJpbHjoOvQdFw=;
        b=m2QNk8vV0OSzR2s4qHz2XoHRDaovhk2bG1YuRJSaVHUERi3UngyM8AoIE1StPPILRs
         5a+faeH68mxP8PTRL+Kym6wbH4x+Ag9G2khnamOgy+hZm/5MUTKD6BvXcjT36yW5WVXk
         MuXIVgJUWLYSVQP33XquWO6lmXxTtvNDRNfM5owJIZyh7i0slvH9keWXPVPsiucsIkxq
         OaQMlXwLC5eC5y8eHGCyK7BzNplH3AYmxfBRFtlhEKtVxBY/V3qvqXRpbonE7WZpUYaV
         NxhiwhgemGEoZ+Kla2k3OJdSlPmusiUI9gdNQo+s2H1f3YgIuaDTbpZgHBZ4N22fyKC1
         2oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718426794; x=1719031594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TMddszlV+Mkr2+a87va+E5z99aVS1VJpbHjoOvQdFw=;
        b=g+e4rtsScWNDvb6SSak3V4CZ8FcfgObqAxEqSYtP+VylzATTlG0GT/ZjLCs7bO+3U5
         JnYvMkI4kX0UGvRYl5sSbvMAewYiDAMbXXNkHKi0aT07X8TEhRcMI1QJ8w/SxiNnIhQq
         vrgk/xlqk+KLKRLpfFtmBWBP2b05+TwxkuAUss9KCEFi14DsKU99nk+F33rfgCURSROC
         +HOKjpxAxKetCskRXFgJ5XdWOU5givw+DeSOMugFRZb5Qq1sa0fbpWS3zOnyfn9Bq+O8
         SR8emZDqFRkLRZOMTdLfbNl2/0QxWPJ5AlboNbKUP95yqsxBzKrzu0X3SxEaRwBvM14a
         uOKA==
X-Gm-Message-State: AOJu0YyzeEJGZSe308EKK2GBC6bZLVxWw30EkQxrM7DndFGWWuKX7NRc
	2jtlHGBEf9UTQueDCAnsvMsCoGNoEbwwRsBjyvBXwLZN1rmdq7mNaEn2eg==
X-Google-Smtp-Source: AGHT+IFynzHPpcE/sXEfq3CiqjISuIwZXW28qYZZ/P8oBtr6JnQSvQCUKE0POsOH42P/DB5IXwiIWg==
X-Received: by 2002:a17:903:234f:b0:1f7:13a1:cba2 with SMTP id d9443c01a7336-1f8625d4e51mr49127205ad.3.1718426794061;
        Fri, 14 Jun 2024 21:46:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f598bfsm41124785ad.300.2024.06.14.21.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 21:46:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libio-compress-perl: Use update alternatives for streamzip and zipdetails
Date: Fri, 14 Jun 2024 21:46:31 -0700
Message-ID: <20240615044631.1738587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jun 2024 04:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110913

these utilities are also provided by perl-misc package built by
perl recipe. Prefer the one's provided by libio-compress-perl
if its included.

Fixes https://github.com/riscv/meta-riscv/issues/374

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
index bb4013ae5a..ca04ffc8ef 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
@@ -38,4 +38,12 @@ RDEPENDS:${PN} += "\
     libcompress-raw-zlib-perl \
 "
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "39"
+
+ALTERNATIVE:${PN} = "streamzip zipdetails"
+ALTERNATIVE_LINK_NAME[streamzip] = "${bindir}/streamzip"
+ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
+
 BBCLASSEXTEND = "native"

