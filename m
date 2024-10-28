Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AE8D5B86D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.1074.1730142307909399233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WN4OyAx1;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4746877276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142307; x=1730747107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saI1ubmDMAkwEFOCYjiCWX3fI82oVyJ26zsiA8w1vc0=;
        b=WN4OyAx1TrAoz/6FQBpf0fTonmpbRFtxELSe+pAO+hreEyqmS1MKDsPc45ma4BAc39
         7mLSPbI5BstJcS6i10pIxRkpOyQG2JMk/MtWWch+2FroExI/Yo31V3LSLlCi0aASZWmo
         kstCpYWyNQMSO4hw1CwOH9k9jp27D3/JZmNx3mRnjoPoGn9lk0CxQWa5aUxSqcs0ELF3
         VxgAlnw2T5u1lsyciEHzPZL3GSKYbNseDRd+eI83oo+GjByMNm82Qx/frlf6ZYuKOPWH
         f1i+qu2xM5vyWY5xgiCBbeBpXYwTfVP3DbT3bhPv9SdSr5erY5ECw5CTxNcL6HyrXDGI
         flCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142307; x=1730747107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saI1ubmDMAkwEFOCYjiCWX3fI82oVyJ26zsiA8w1vc0=;
        b=Y+2l+pD+FmFhXlf6LD0j7AZAeO02x+mZdPaEN9GKpX67x6pew3hgUWWnhU+z6oeazI
         k97DQhIzkoIcF/v6FBHuN98VYIspiiBEE2YWs19xd9bkeylGq9KfmqQjtkFmZsb2gyeP
         Ubpjlt1ajyoWgZGV851EhckiddMhKrZ1FAJM3jGGREbYMC7KJqXU8NO8YqaxxMU7mDEe
         mLmwpwNfqF5As59BoVySUnwN9onmRvcm41c2K68ZjvNi6epZdX/sB8nZEj1i8wPdvdnu
         TiaXsvqxi8FUXLBqHUMHwoIpljwWNv+BryMxqmR/pWQWIZs4BQASjyK1dgDn2y/e1MEf
         H5YA==
X-Gm-Message-State: AOJu0YxQnHrYMAC2RsGN00bPvX00H//6dy1tTJ/5B2ffwvN+zBga+YAk
	rOGsIokH19+oVOI5TpMKj+VS18hYc9kte5GYukFORUpTjcD7ctLra/F0Tw==
X-Google-Smtp-Source: AGHT+IFI3wthGR3ag+GFwS50n8g5wzRDUWxu8WC6VFfb6e7h8uUUq3bglF9JJIqo/X8zwfu45d4pKw==
X-Received: by 2002:a05:690c:4a0d:b0:6e3:6b73:be66 with SMTP id 00721157ae682-6e9d89e1674mr94142807b3.27.1730142306574;
        Mon, 28 Oct 2024 12:05:06 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:06 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 20/22] libxml-filter-buffertext-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:56 -0400
Message-ID: <20241028190444.10522-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113311

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


