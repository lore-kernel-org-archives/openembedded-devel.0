Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BC5D5B840
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.121.1730140102600912966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLkyrwpE;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e3b7b3e9acso42602817b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140101; x=1730744901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIQxcGbQCewyTV+jIXpHwCSX6b+HxZA7EDHvLy86Nkk=;
        b=XLkyrwpExyTVRtwTN0tWXCopR37GCNNgzz1w2UvQdwkOMKopJtV8+Ok7uicKvulqDI
         UWqeJYeBHvCMd1nEOPZbGaqH+vwdAT9g82BtsVcVnhXEALT155hAYNgCxDN855jQqNQS
         nqBYzKSpM0v5pY2B5rxSdJsQo8TIHM4R3LvmHp6EULwqHWQr7dHadGiQUfIrPKjsM1Ff
         Q/tzwc07g47rw+Jv5aSeUBQPIQXrOiIN1JOPXOby4cO65VsyxLwmkBW3aD1i1mEI1M15
         NEQszwvNjh/ZjgOCvJLwAE4Rz5ZRveTxJ83SCUVWT8oQgKn+zARwQSAzMYJ60nlxAfiP
         JMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140101; x=1730744901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIQxcGbQCewyTV+jIXpHwCSX6b+HxZA7EDHvLy86Nkk=;
        b=K9kzaFGWeXlB0GDGbWqTI/Idkwyclx2PZA5p7+nqqpPH8bbUgqkxuQuVqfqQ2VZAKP
         s/eCF6aPYJFI7VNDQI/04AmreCKWeOQVpTiuh6/lDUa0XcWueYTechSo3daCC9r3s5KZ
         ORimzVY1kzQPugLNPI0yEPnrwId9QLxa1CFMZaJe5K4TjLznxooIaj8VXGs6AAUuzniP
         e3FYSt5zu/NH9aAoURFBtkjigmka/wb9KOQKwn7L739MLVAhOOBqPhyfYgwKh0AK0WyH
         5hbvnvuLftNO8nXYWZUn2/c6ZZhwkeFclLYwhp4oJL9ANqJ2OEcfYg6+T25D/jVK8nLR
         ws8w==
X-Gm-Message-State: AOJu0YwuRDgJecqONdkc8Ehw8HSv52+IJFuLPnaRAGaIl3ml2/rXVPqY
	+YKmwo0Pew+J5Np5zByOklavMQj7bPLB9xMdGuK4Cm9NhQ6o6OtiGXACMA==
X-Google-Smtp-Source: AGHT+IF4XKZVBdSOJ9ZnLtrctA4wisrxxJegU/69u1WfOCwm4YB5rPeLM0WElCFaLRMu1splmI/rUA==
X-Received: by 2002:a05:690c:668b:b0:6e3:2864:c6b3 with SMTP id 00721157ae682-6e9d8afc8admr80773707b3.37.1730140101155;
        Mon, 28 Oct 2024 11:28:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 16/22] libnet-ssleay-perl: Use
Date: Mon, 28 Oct 2024 14:20:32 -0400
Message-ID: <20241028182749.5058-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113284

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 707b9fdef..d09f756fb 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://no-exec-on-configure.patch \
            file://run-ptest \
           "
-- 
2.43.0


