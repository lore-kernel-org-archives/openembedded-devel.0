Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D571FCD6918
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.87071.1696930789120000244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ec41A1b+;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5174616f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930787; x=1697535587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fXRHCe3Y7r4VaUHWEWoHkPdzVqKEqwM3LRPEftVcjg=;
        b=ec41A1b+xikWbgEe74Y8YDyV75OStCKNIrCQ6Jiw8FrmI0siSrO3nAkb1OVo6LRk57
         +eC0tiiGhx6QTOuuXgUQwCHRcq9q+IzFaqhJ0qHJPuS+pte/S0fXyUWpXBMoN7LCV2WF
         /GOWnRyjXj5CfUzQpvumSiyH0+I8VedNzWyTB/kRbiJC7rUBoZoPjh8JOozsrw3FP+Ai
         vN+HfIY768vjT5jeulmzj2LHfb7hws+k2X6K+h7VNueeNZDIeKy1lIsQeMiaid6ppyFO
         8ZuUOaf3coEIGHK9EVor12+IxvcFzmtHykbRc0TK5gblT2Vk6MMwbGavCEwZZ2WL3Zex
         GGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930787; x=1697535587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fXRHCe3Y7r4VaUHWEWoHkPdzVqKEqwM3LRPEftVcjg=;
        b=YYGK5KmM+rCtWRoNHmqdNBwR7fN0n80Bua21EXURAxepVfh+7HErR3FNaTQWeOjnK/
         8HvJF/PfaVH2EXs70gkAuNLHjI66wjJHpFg4bekMJbN8H5WQWLRuNQwAnocS8DtI8mEG
         jBEeSv5gJWV46uD/FftdmFXey4D+bVosfXcADz9xCeConlb3rzEbcKxTjydDC0Yp6EI4
         kkLCZ0OItHdGyB7CfDlVznuX6GWu+zVbKeBBaFDKb5Slw9IpNVgme+g3juR3ZOMHCWP8
         aDGX/graiGorK1rNicQPsQQq3X4wG5nGoSd3r5XjcyoGf/ndJC4MFKBmn/p6GNhkuVRb
         4DlQ==
X-Gm-Message-State: AOJu0YyeN0zJG8kQL69phDNq2sl/xY4eenliKx0KvwHnsSHGVGrfcLnB
	w7eTsZ4KS3UKtDZ8Tm4qyLThvOcicDR9EOyxmcY=
X-Google-Smtp-Source: AGHT+IFw4yChxb+yBj0WQocgU0azo71oOKJ7NlyzZCKFQqIAa3EHTrh8eb2iTLUbTY2K96StvZWvVQ==
X-Received: by 2002:a05:6000:1102:b0:323:37af:c7c7 with SMTP id z2-20020a056000110200b0032337afc7c7mr15112151wrw.69.1696930787154;
        Tue, 10 Oct 2023 02:39:47 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:46 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH 1/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:34 +0200
Message-Id: <20231010093940.75037-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105397

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-filesystems/files/static-passwd-meta-filesystems | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-filesystems/files/static-passwd-meta-filesystems

diff --git a/meta-filesystems/files/static-passwd-meta-filesystems b/meta-filesystems/files/static-passwd-meta-filesystems
new file mode 100644
index 000000000..157697f3e
--- /dev/null
+++ b/meta-filesystems/files/static-passwd-meta-filesystems
@@ -0,0 +1,3 @@
+fsgqa:x:700:nogroup::/:/bin/nologin
+123456-fsgqa:x:701:nogroup::/:/bin/nologin
+fsgqa2:x:702:nogroup::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


