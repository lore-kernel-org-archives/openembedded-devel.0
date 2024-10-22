Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ED0CDD0D7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.21941.1729612083252050058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnHP89k6;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3c3da5bcdso60013967b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612082; x=1730216882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1pKNq1PT5r+TFjl0xgv85LLYV4CHvCB1EZmcInjX7s=;
        b=LnHP89k6jJnk7YPS5pIrpwkUxfkLFKUAH+SngtwtwCnTXbST9yRmZVjwEcX796VigU
         Shchp2FueCJJ4QHauBCK9rOeuUGWf/Q8tgQ+JMU/FE7qvk7U+yvMiKPZSbgWw0w8IP1c
         x2AafsW5Pd4hYUX+EH3/L5MyYoDKLwj01Q6GUkbR4Jw6nGO4CUZiJ9Riwp/5sgU4Z3rh
         NOrzJjMBsKtDn/1oWfT7KpIw74EPhyy09iDADV4udZGOUJHaLhZlkbb2ZQ1AWKO4ilbv
         eNJXDJP4z5AZZ6WpYLwUUWMLqmuLox7a4dT5JHiwAZYvNPrupKwjsaTaDnzuc5ZG6MBg
         Ok7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612082; x=1730216882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1pKNq1PT5r+TFjl0xgv85LLYV4CHvCB1EZmcInjX7s=;
        b=lf9MEHUM5C54yvrTFdz2rRkRCevU+e7xcOdbwsMIA4DgEQkwFu9rTSG137Q9YRTTx2
         ykLPJ/+5VBHBBBkRKSQsw8ZWCTiDu1FNtOoAd9BXfhhMTIcmolY72vtHXVOAndRkOrsA
         mwPnCBPyTwUCPsMp2FScVevpHPehzHzeEWsf/5TM2ipHvCA8X4yuDx9RPrm1RH0cIvYV
         S5/uHm1vAd1I2hnLYdRtIl+oeKxtyeHkdyKvmksXppjyvCzd25GG/2ASbD9rFpIHCvk7
         cNHXfEouIp+MbRDaIFAFgTPtuV4kSr2g9YIydR2wvl36xYIObsoB0XSHdtUK7A58uMkF
         dPKQ==
X-Gm-Message-State: AOJu0YynlMjH0esn1qsfMq8+zh4GVghSGy4MyQ9CY2kFZ3LTiiGjqg3b
	pjTRmgyvsOW2/cUY+P4XYXDFwLLg/4AJ+misrqApFG4HF757Dv6/DOAQnQ==
X-Google-Smtp-Source: AGHT+IE8lCY2+FriGqbrWQMCL054XzGbgodlhFOMpUf+LDiqbitp/lgt7VFklK1MGgae+dcsCL29SA==
X-Received: by 2002:a05:690c:490b:b0:6e3:d5ac:7d59 with SMTP id 00721157ae682-6e7d3c17f36mr37292137b3.45.1729612081977;
        Tue, 22 Oct 2024 08:48:01 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:01 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 12/46] libenv-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:30 -0400
Message-ID: <20241022154729.20331-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113103

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index 79fff9d52..fd34c6d12 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fdba5c0690e66972c96fee112cf5f25c"
 SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
 
 S = "${WORKDIR}/Env-${PV}"
-- 
2.43.0


