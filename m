Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78F0C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 00:29:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.23461.1744244943414893930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 17:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nnlg/xtX;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: alistair23@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-303a66af07eso167536a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 17:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744244942; x=1744849742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aoH3pUILXIzwtJ8q902KAUkyzYLmffRCdvRnCnNLzSc=;
        b=Nnlg/xtXYfWZbjYMWVJUDAjLVhqdFcKLFWBEo/ljJiAd7aDcBuA0RZ0EkEnuCIt73Q
         2Krj0yDpGmxcIdmRaM/JA9z2sGlRukHtMwJueB8tucqkK6w/pMTXV1emREA92y/Zoyoq
         KLp+0LOTpIUpun7WUEkY03YfRabNKlNvxDNygVAWEef6nROu3BzQgjjEw71V/t2mCh6C
         vGukpw1kSL+7NnCLoIebHBmcvHpra0mB5SGyEpECEiGgR9i+7OXgwo5OIj+xlxMUxwxL
         BCAh8LQpzZ5FlA0+z7UBQ+pOyI8cnchfjfL21WvODC1nq+IZ/S8yjG3ZiyVoaEFHV77A
         kCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744244942; x=1744849742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoH3pUILXIzwtJ8q902KAUkyzYLmffRCdvRnCnNLzSc=;
        b=a/XJPuRdEYxJP90CPVP+C5EZTLu+JpnuTVXeKJ6g8PCG67OzKWNePTOBqqwxDlHwcX
         4k0sNfm8qoyLJVluR01YWpWkAI4S6WT+YA48G/LhgDJnXXcAp4GyRDBBxxM3W3TU1ZW3
         qt2vKxd9WjOn56ZrYBHQAwvAigFdgTyyvP9HNnOdAuVVDYeeoFWHjIl6AUD4W+9R0AAm
         fXlVg2MwdBpenqSxj6MBHeARAzz4T7Fz+GGvlCrcFN0bk3ybk4PYWYTubIiJGHTMehAD
         3w6Hi8hAeNLqpgMfy7hq+2PoUjm8eKPwciG9QJ/DRujS2ebP9xjNOtUS1vhljR1MOmu8
         3sRg==
X-Gm-Message-State: AOJu0YzC5U/yaPotJGNjxZeGRf+505xgZ85ZSpeeMh3dOUcmhaUwQ9gy
	Q5PaSLiC6FwW9q+5XkFy5JCdK4F9jYAd7ZTpEHnk76UUMv77PZOPRiiFlQ==
X-Gm-Gg: ASbGncuEaf/y/rsz4JWF0CCdghRZxX3M1Yj1xtECxAfZyxo4SRzVib2Ulbebs6iaLkB
	/XPuaCd1454Ev3Or4GVMuGnf7pTtY5RUh1t0+vBR8DQOYDz37MoMVe5rFxNn+ZEB5znBgMJIHkd
	XAcXYN526Zhu1Pi4sA6krAicXgj601XkR6QLNgcQj9+rZ2023AnhP6H13b67hUWR2tuGtE3iEzU
	X9XNYYIbxj7fHvAs73SqFo0fC2NI2FtH6WmYt+BcHQZKU3hTrAnJKWCS9oXCGF8+aMbyO+ZfTUj
	GchFl6zm5uOhcXqwCFPfPN9dkhtFLdDLJUk+3O2aXjN1RdSOy21qp/zqINM7MICIDjDyh5Rq4V7
	kidWaRQ7vSc3L3AOTuBYnBCBTn4Vm2u1p7AGlXjMuNfUu+kkl2M6eB/L1
X-Google-Smtp-Source: AGHT+IHOuJrSMk2y4/PMEM1kDjzfkUOCYpaJuWkh2ympGqgOwcEky5EgJMNX1hm09I7nY0IiQTD//A==
X-Received: by 2002:a17:90b:5824:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30718b7f834mr1483665a91.15.1744244942341;
        Wed, 09 Apr 2025 17:29:02 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e666sm2340813a91.15.2025.04.09.17.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:29:01 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] libnvme: Support keyutils and openssl by default
Date: Thu, 10 Apr 2025 10:28:49 +1000
Message-ID: <20250410002850.435537-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 00:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116746

Use PACKAGECONFIG to support keyutils and openssl by default. This
allows NVMe-OF connections with TLS.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-support/libnvme/libnvme_1.12.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
index a80d34277f..1054f83487 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
@@ -20,4 +20,8 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-EXTRA_OEMESON += "-Dkeyutils=disabled -Dopenssl=disabled -Dpython=disabled"
+PACKAGECONFIG ??= "keyutils openssl"
+
+PACKAGECONFIG[keyutils] = "-Dkeyutils=enabled,-Dkeyutils=disabled,keyutils"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
+PACKAGECONFIG[python] = "-Dpython=enabled,-Dpython=disabled,python"
-- 
2.49.0


