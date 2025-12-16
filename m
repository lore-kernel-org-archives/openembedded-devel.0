Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE5D5E390
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:41:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24299.1765896106468719623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZQTUx2H;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305552so2603664f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 06:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896105; x=1766500905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmSjVCE35jaquPQHQ8aQup8QACbviZQKCfHEVjzf4fI=;
        b=bZQTUx2HnmmDdzUyZqmyTpPbBAUXnbQ0flIUo6PRa2SugigZE0yheh42ucASu0wiIc
         D9KsbpksC112ksCpK7AzI/PT+cet3WL1GCbgTRFyJZGwxZgolHl/eozqZDvrNLYgf9Fc
         cviwgsx4cmohxN6doaE5TRB+pnV1Oj9oYHB2TAfO2M7ZnLSCTqS6eOaVEnBi8PTvc4ci
         JcK4XwIP5u/LPeLPnxRsVGlhFZFji+AlH9TJ/2Ivhsg4PapVxffQihJt4cvX433d6pPE
         axVun11mDFzG7CelBWwDyIXIqoAugMfjM7FQEMnyDzQnFcAstaHwtjeXuu0YclKpGlWG
         SqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896105; x=1766500905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmSjVCE35jaquPQHQ8aQup8QACbviZQKCfHEVjzf4fI=;
        b=hxVKqDngRA3sAnNG16LpxCe/BFx6IqMF1zhJZ4yRYQNYFI8izMz18qFdVfZZB55HkE
         YaE0+f/xynL0MQB5iQQzfZf58BF4zzrTHjy0ZhoFoIbNy0/oaoKmCktC1uL0IWvIZ/4l
         onzO/KT0+ZfstyMIYOeIo10Rp9DgKm3WbbxT4X3q1n0cjrMEVoF4gcXN7w3um6/re4tg
         hyQqOqLFikBm0YMAUfKPnAEOqrwUD+HVBQ63Wzm6s28ythDKD1uSqpRm4u2jaE522072
         3ZePJ5gTuLWwNbVTFsbRPTqoMromc84D6sERPblql4n7fvwWDnofBhoPLAWcugEsenIg
         a2bQ==
X-Gm-Message-State: AOJu0YyqcCY+AJ2hVlceyzjXFKe2S0P8zt8ILIiEywWIpwMbqBZXtpsn
	2AwCOnFmhDQj0ROMinAEw5aQUx4yR+3Up131ezZU72kHnbYsIzbM7yR7HzT0fw==
X-Gm-Gg: AY/fxX5B/se0dexoEIGf95T86pkOKAA4uwcmEFfA8Lfcf+PL/xSgpJJEDnoFyYLaiXr
	Fh4jFYcuSO/+tWxo9T6bNxaFxdrMy95tvyL1Kzp4h2maUktn+kiN3rkCCgoi8c5WCUjx7f0eaKt
	2Z1G31lvX56tXZOlIFurziN1OMbgBRr5mYGKvfcSJhR6X7ObAsMX7amZybouDnl2FiUXNB/oW2X
	pd1W2J+WMsYsMVcK50aiM6D0okxc6XqU5pPZgmtuflnDFP9lxHTrmJk1vWjAAEJDaBigwGKJFcS
	mX5nviQxQlPUz4OHYCQzKteRp7Iz6sF5zNMzjgkAe9xh5NJAlzOr3m9b+eYwXKU/ioJn2/SMeyV
	Cn9/9vXua1VwlfaOAcVeXou9WVDA1jsBRjl27XYIZJAuAeIRWRQKbQnDa4g8WjE8OVe8Lxmn27S
	Ejpv2ZW3d732varVbFcnE=
X-Google-Smtp-Source: AGHT+IGlvN+M9jBB9Sm+PsDybhMOMlg9ft0gYAowvcPxPzLnpeBWyB04cn0aln3eWhLloxmxsWjGpw==
X-Received: by 2002:a05:6000:310f:b0:430:f7bc:4d0c with SMTP id ffacd0b85a97d-430f7bc4f91mr8545657f8f.28.1765896104500;
        Tue, 16 Dec 2025 06:41:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm21450696f8f.38.2025.12.16.06.41.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:41:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] fetchmail: upgrade 6.5.2 -> 6.6.2
Date: Tue, 16 Dec 2025 15:41:43 +0100
Message-ID: <20251216144143.2555675-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 14:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122697

Contains fix for CVE-2025-61962.

License-Update: added a warning about linking against the newly relicensed WolfSSL.

Changelog: https://gitlab.com/fetchmail/fetchmail/-/blob/6.6.2/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fetchmail/{fetchmail_6.5.2.bb => fetchmail_6.6.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.5.2.bb => fetchmail_6.6.2.bb} (85%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb
similarity index 85%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb
index c1def016e9..bf891e9464 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.2.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=46d2874dd6a0c8961d80c805f106a35f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=61ae62fe6df00649035f6b096c24c0f1"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "8fd0477408620ae382c1d0ef83d8946a95e5be0c2e582dd4ebe55cba513a45fe"
+SRC_URI[sha256sum] = "a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 

