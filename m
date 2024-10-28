Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8F9D33993
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.126.1730140105318490185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+7n4hbR;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e290200a560so4715980276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140104; x=1730744904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saI1ubmDMAkwEFOCYjiCWX3fI82oVyJ26zsiA8w1vc0=;
        b=L+7n4hbRHVV1tqjUNOl8qXjQr5g++8XwvtU2mLnQ4XFWrhwNR/3hS522KtsowHtXKr
         mXACBUgAVPxCiAOu0ntYaW3lXigzXnrVviETP3diImkFANT6RZujQFkDHTYSeBgCNA16
         zX6dCXc6BUfsQXYJYHjSzh8Zug/yLNVXXs6IUHlV6tbQRLtTCvLWKCbX5hi7MKYVjI8F
         jKcSjZWqRBQZAATuAEtsAPc9/pC2T8TpZ9QxKs8Gmu4EZ08J7V/gcmftKRny7zYfz2fK
         2kqlE1YXnr+Ua9kohslNSplJ3M/nh5ZtMg1azuPDRuu/2IXfVD6p6D/g5roNxXCeDblD
         yGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140104; x=1730744904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saI1ubmDMAkwEFOCYjiCWX3fI82oVyJ26zsiA8w1vc0=;
        b=RuDHqjIc9fkYqcwvQGugWSAeema5Ap2H0Qa+PQSMDJUtKnC/n2G6I6qBPY+z6rexhT
         yzjrhxYn0RrUyaybp/wyxNxBZb2chaPTzChXscIsKSKsheLpPYkoMMDcNbe/QNNiY+Ff
         /a4ZJO/xneIGWClr2ZEiONBnxrI5OJNNKWyKUstYtZZMbeWJSTNPdzsHtpj6NgxvvIoH
         PHy2Kn8xs0BIsPGDr3JGvOjjRlr+0YU/qtrPvvycwrNIJ4RghP0OHynzxUvAzlVLVD+P
         omUSe5O2D4qGoHpn35ARsxnx9X76ci7qTjIXQ3cBAFZ05DlMoSemFxXoch5ZVYGIT0kG
         E59Q==
X-Gm-Message-State: AOJu0YxSrsiTrVpn+x0SqrMPiZJPu3mIYWnIKTP/vQBUg3lofMZBMpTp
	csRlebjZzBIcWrV81rJwDVsbCTJuhkkQ61VNWkQ2wFSPJL+E5G0cSINdxA==
X-Google-Smtp-Source: AGHT+IGWan7V+R8nZF53t1CZ00uphcgZEd7q3WI22pSlhjw6djKB7zBgryKvsbsiysP8Cs6FAdvHFg==
X-Received: by 2002:a05:690c:87:b0:6c3:7d68:b400 with SMTP id 00721157ae682-6e9d892546dmr79463217b3.10.1730140103902;
        Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 20/22] libxml-filter-buffertext-perl: Use
Date: Mon, 28 Oct 2024 14:20:36 -0400
Message-ID: <20241028182749.5058-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113288

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 1c3dc7d50..4393fbd91 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://metacpan.org/dist/XML-Filter-BufferText"
 DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
 
 LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
-- 
2.43.0


