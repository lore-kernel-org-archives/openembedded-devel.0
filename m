Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA140D5B870
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.1013.1730142306921295570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ln1AiFNI;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4746863276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142306; x=1730747106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVclBNueEV2e5hZAmvAuvEc6YiY6hXGMdce3GZHOK+4=;
        b=ln1AiFNI14IMj6AEbWpOJ2QuRm5z3KweCm4Q2RMk4D27/9PDSHUpypBLsBNM1Sv6nK
         Q0WV/FM4CAecZZR7JXlud4wRxygHZIe4wtdxMJIDypVBAE44lKXWtVQMlgjUJHINoeAz
         a9axCAIFXMhJ/0R5uoxs1qvTSMT+pwocVp5RXDlv1zoaOYVEo+QBWTOzsOROV3DEu4+8
         DcIparkj940vqrXtaN44MtS1qRygQfXdFKCsYOmfZq4tYhb3wCol0fIpySH23GQ6iHgY
         ljuBzq5fFWqcH74ZY+dasJi0hiUFfG16K8/CZXEL+tlBii06GmrSYQ4bvaUHs/c6Qknz
         lG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142306; x=1730747106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVclBNueEV2e5hZAmvAuvEc6YiY6hXGMdce3GZHOK+4=;
        b=Sl7mfXiibULejIYWZnpNq83ZRhfY3TRTjMuJ+Kxvn3QyV+cbnPBSpUEBrmoJ0B3MVB
         /oJWUb95ak5DhDYgHC5LG/GuFid643aRASIvlIvtT1K9q458VFA7ecb0gm4NxxeE8RyP
         Uk+kw7wiqsZNEwXf/iBZ1kRN9HHosxAd8irsPAsKL11yGRbJUoALRJp6hvGnxN4sh3dd
         36QCbubB42xQHK+b0i3efVkjAzxWqP5gc+u/g15z27XSX4UEfYMihZZKApgIiRpSDBut
         KT4xULR3oScegpUYBiF6sb72G+1mpkCoSyTLaBQWonl7vWClLuh5s0pFzN0z7jK976or
         70vg==
X-Gm-Message-State: AOJu0YwDyTdvk4wb3d/cYZ8SYHg59cOds1rOM0z5flQulXXwZhaJOlka
	XsISjq/e432O0rokXL5+yv6ykwvCJxRYQZ91NuH0wyUHxdDU8SHtONTBIw==
X-Google-Smtp-Source: AGHT+IHz+rijq4BIlmrkETJnBSgHMTqHHNRhsT4ziTv9EIv2+e6jy3J2beGu3LJLxF70tTE6ajQ9vg==
X-Received: by 2002:a05:690c:660c:b0:6e5:e714:3be1 with SMTP id 00721157ae682-6e9d88b8af2mr83847837b3.2.1730142305276;
        Mon, 28 Oct 2024 12:05:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 18/22] libproc-waitstat-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:54 -0400
Message-ID: <20241028190444.10522-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113309

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index db7ca17ad..d9424ed4d 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "perl libipc-signal-perl"
 
 S = "${WORKDIR}/Proc-WaitStat-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
 
-- 
2.43.0


