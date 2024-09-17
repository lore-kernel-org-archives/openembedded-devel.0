Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E02C3ABDE
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14909.1726553074675832785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtN98wg1;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2054e22ce3fso55772785ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553074; x=1727157874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6OclQ/wUjQs+hGOwZODG92ZqoZN2w26J+A2rfiKwbU=;
        b=XtN98wg1pAZCIQR6+T1LxIXE3JLXWE2cN95A8WUgOrWFgZ/pZhjhjbW698momNsP98
         mJ4hdPL8OM5aufdPWMr9Z1NpdRkQKc44MvD/SgX+kx4hS5Gbd9caia5S3kZuTuIIejN1
         qUhbKgtNigxogXisto2G8vCRRZuv/wXAyor0HFnSwwvKmh2Rx53JgMaCgocKzWOQ1Ddb
         0nMWA8UbC8Ua4ZVZ24HHV85Mco9Bi0lSMZZESC6bTqsSd8lMEYTd6ywGkQPt5MnehVCT
         etkkO06yODA73NlkUyA1sSQawN+kDL9HQLWXMwmufn7vqAu/3O2DskIJTDN8eYvGs3ye
         NRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553074; x=1727157874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6OclQ/wUjQs+hGOwZODG92ZqoZN2w26J+A2rfiKwbU=;
        b=n/94aZEM0x2uF8/Id4sI/3NAUbHjemwQWFZXFfao6JmpqrRz+deNKnl6K1CWdejHV3
         whoCVIcj7sEHW0o8epn+hMJMs4e4srqTlsw3rHYRS5rwfpwTCWsu/DGptG8YjK3CzbPw
         QgTmQ59SLOICF44YH91hSeNT0f33vcpfniqftow6SYYzCqFQ4C6ENwGOYaFrbgfqG1qv
         cQCnKp5V9jm/ZOSKOf6q6cpcUHKEBOBH9VsuTQVu+MACs2q/5v2r2/aMt1CfCvT+7Wa/
         Qpv0GmY9uOURxk9iEyv7Qu4G1YqucauOKLcoxbod+DFyK3ylCEGibNSCb5iHxpEL0NjY
         0tFA==
X-Gm-Message-State: AOJu0YxiIL1ToQ/hxAtORaYhyMfPzx02rvw3KuwSoAEcJzV7Ki1V6YiA
	TDqm+WrVWnWGd2zsehYriL68lPAQdNAx0ZGWSDvmBT5dczKkdvd3Ul7rI2a4
X-Google-Smtp-Source: AGHT+IGl/H8p1sDWk+bDMe769IDBEDDBYd9D6My7OnhR95F7uD/4NgnlLINYPsdATj4hRhovd2FCfg==
X-Received: by 2002:a17:902:e5c5:b0:1fc:6cf5:df4b with SMTP id d9443c01a7336-2076e428114mr321790025ad.49.1726553073988;
        Mon, 16 Sep 2024 23:04:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/12] usbguard: Link with libatomic on rv32
Date: Mon, 16 Sep 2024 23:04:19 -0700
Message-ID: <20240917060424.1692067-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112333

Provides needed atomic intrinsics that compiler needs.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
index 752938057a..ede9a5f058 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
@@ -27,6 +27,8 @@ EXTRA_OECONF += "\
     --with-bundled-pegtl \
 "
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 PACKAGECONFIG ?= "\
     openssl \
     ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \

