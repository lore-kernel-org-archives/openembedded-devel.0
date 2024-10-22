Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F68CDD0E6
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.21959.1729612102607585026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLwUrUAM;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2e3e4f65dso63812267b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612101; x=1730216901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH8L1pJlWrds7cFEtRs71qU3jNm1q62GaaePGAMy94Y=;
        b=eLwUrUAMhE2q3PDwYeFlh/D3WmY/56hN6dloeDbOuePQhg8nZSxiAHkecJ/3tbLgdF
         vqwFacmRvr6+QzjRg0/L1m6DSJCCetdHI6p47EPyzE/k6C+fhFifaJ8BsLSAeqOSOqOL
         P/LMMSQeWD6IoZFWJyzunJYZNTvYpNPrAhRPLGLXltE6CFrdoB3De7lgU9Nsqx8BSy5F
         5Wm/MYy5a84tyojZI+jr4rf4QVb9N1jIsOfM5yqgMQIz6h2KDZLftHtaOnhUrN3IeyEP
         gRTh8vHSR0G6DjqN3bdcLlFyao/tOB8WLhAHDAQ4+NWLOJ3ta4uEUh+6c+CYSja8vLku
         UklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612101; x=1730216901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LH8L1pJlWrds7cFEtRs71qU3jNm1q62GaaePGAMy94Y=;
        b=LsjH6QsqDyP2kz8mYSxuB8VNzO6sNOPYQZfS40jCvgVSa4Q2HeDoR+39llLjx7uYwC
         kZW811FLQVQT3FkPUZrFjsCUohxrNK7+dsgcMOlu0avATIp+mLqWb8uokt+G4OCvJdot
         PpeYQ7HFTSy+3GdtFMzdnAxPDYisddFLnY1JIlQqP3f4JmUV35IgAeCfe8YQSkYH44gi
         w2afN1aog3sZLAi7hRXEmewhQI3JCUAoAakH2nOu9NHFbQx3pzc6II2/ORTUzLySP3qq
         L0gIj5S0rRZC2ITtm6V4aPY++/iakbbjt9fReueh190Zb0C+0tdj8TfjEFKpZO7sYs/+
         CU6g==
X-Gm-Message-State: AOJu0YwGiKYNKMSiyhhz9yLJHXf44C2hJkMRRhdBgI7cUr7JLsO7HrWE
	bFuvsK/F+N8MjoERON3FEEN8APtBfrhf06hQVGJT5kmBUcF3/c7fjGbovQ==
X-Google-Smtp-Source: AGHT+IFQ1WTI/IVvQWXm1m6VRywGblLE2lAuxSaOXEIGqH4nHnRp2bFPwfsTVDTZqExFEEc03q/vsQ==
X-Received: by 2002:a05:690c:fc2:b0:6e3:39c1:1692 with SMTP id 00721157ae682-6e5bfbebc36mr138162157b3.6.1729612101221;
        Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 41/46] libtext-diff-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:59 -0400
Message-ID: <20241022154729.20331-42-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113132

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index 9dfadde8e..2e89b759b 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "30d56e6dd5551ca16b8e16cc7299dc21"
 SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
 
 S = "${WORKDIR}/Text-Diff-${PV}"
-- 
2.43.0


