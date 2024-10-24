Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E30D1037F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.6076.1729801145582437851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c4zbtfJK;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3d7e6f832so12757157b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801144; x=1730405944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml0yzJHEN7eC0AZgbrQELLDQvs5Yk17HvAL665UO7Wg=;
        b=c4zbtfJKju1MRjKBhSeMLQ4F2sy5C9ar1F8+iYsmWGhtqhdYMjqqsnmxVX39waf7C+
         zwYtvZXTtv6+HPFNUTZJeoHnLOupVDOYu6LRdR3RhAvP02J0zKfMRZ01UGsqPpCo1rDR
         eXrgYfxes10etv8l4r3DlD9CCZwhGB/NGqf8RXe+LnBp8qcu/twNL/Qqdko6PTI/VNUJ
         uvC/uYBm6W8AjbXu7Aesfgq/whb1nN3jX7RSmkauhYrMkbohF4os0ySkRQ+NEAumwA01
         J50GTfXOslgVw/qUgsfOSknz7toalT/TfhsugJgIdSol+RtZ/5RjnM6wpzLEnLTP7MRK
         XVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801144; x=1730405944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml0yzJHEN7eC0AZgbrQELLDQvs5Yk17HvAL665UO7Wg=;
        b=rzqEajM1ad1uYBWCkcBehhyt7Rt5fjRLSrlAXEP39TFDaaeZv8WFWjbXViuW36gDDz
         zPURVN/PGa5beM66LFL3f7vRiFCIPGXnFg8a/6PFRSSUr483eWv84/Hws76v5XFsMxTP
         ND8sSuIwYEzqkjAamIv7l2A+E9ChQm6uyc49GGnYlJ5lwy12PThWzLyF3OLimWqR8z7v
         bJbCKiGUlNp0rxFhhkYDTiUrQaiqN/Cxlnue0L7JciGYPELzTEwk+iGDqqVeBJ1YTo2J
         /v6ZV1XoRYw8lg+SBZ4ubEBUoGnGdhPxkPBwQYauHqjRdP9QX6T3rMKxaxaSn/1CJqiw
         3KwQ==
X-Gm-Message-State: AOJu0Yywevajc0NmCqW8yXD1l4OIJ4E/2aYvkRcAn1xmqvGVmEAvgSfs
	kAZjIveK8E4eVNiY1DH2f1oeXdoW9qvYsaHk268kecoUto2a35hM21r3jA==
X-Google-Smtp-Source: AGHT+IE0WYnofWS5XWCa1L3gxQURa4FIVsAHICOlbJIhrb2353LjTD1ipB8aP/YzI1X2eFK/VrD6FA==
X-Received: by 2002:a05:690c:dc9:b0:6e2:1467:17c0 with SMTP id 00721157ae682-6e85814c712mr35889237b3.8.1729801144107;
        Thu, 24 Oct 2024 13:19:04 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 17/42] libfile-slurp-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:36 -0400
Message-ID: <20241024201806.440273-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113195

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index 3f138baa4..b9ef4c8bb 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -4,10 +4,11 @@ DESCRIPTION = "This module provides subroutines to read or write \
   reading the list of filenames in a directory. \
 "
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/release/URI/File-Slurp-9999.19"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
 
 S = "${WORKDIR}/File-Slurp-${PV}"
 
-- 
2.43.0


