Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDE1C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:16 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.744.1790224452998049638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YLb6C/Jc;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35611so793651b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224452; x=1790829252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cSSzVvvR7/fgCYqNTFy/f4WWti3goPRIp+aP5xwuxY=;
        b=YLb6C/JcHae/3rKxd/6+N7yvzqhqUNbF3NVLaYetxbN5GPktSdh3Br7eLjVRLjV2+1
         3F0O2PIPhhrV4dhoSHEhSwKvmJq+373i83ErYkEoHHPNkQwqwCLkPQWeTbg3HNI7RUjc
         rbHUJf6F84wouLrjDFOxBccPsb4cHlMtwPfccUUOuEw7SCuhbeVgTVsbyHmzXA3bXGeT
         li2X2SetO5sDU5vlwQVFi+aHdBstKLyD4kiqh1xPubCUrvvHZD66hdHvI/MCgfAuuxzs
         a3nzxwRRM7DIF+hw/CojMKQv6cJMhDa9oOYnJcLoRPif14eDCl12uGOtN5rakUylyysw
         zs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224452; x=1790829252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cSSzVvvR7/fgCYqNTFy/f4WWti3goPRIp+aP5xwuxY=;
        b=Yv47x5aFDOr/GzOj2BNSAFN8Wlwpu6QINS9BW8FROFbZtqOJsSmkhDhoq1kUaJgh6L
         BvOAlSZMWr33EEYeXoYnpvfBuelu68cprg0SledDxC9HNRAbL3bfBN1ahDqzzBnNeJzU
         MvpHIwVNN2FfPaV0z+/sBDZUqW/+unyLDBUb2se0ujd3jX3WVr6XrW+P7XUoYLNThVok
         4T7bXg+wpm0vovqBMGs6hw6JeJ1SWhZ8cxXlU7QR7QzVn4rCoA/rj7nf3c1EXxDnA/pp
         5jy8Ifohm49omTxftjr+bHYs5nPOuiCT978UPPlHjVrDDYxXm9tMrPDUJZZSEK1uUBus
         JEyA==
X-Gm-Message-State: AFuF++nLgT5xo2HzgwgUVzCleEsWXgkiHl3GiQopTH0xI0Pehg4fPzg0
	2bO4ktI1eNwvQGZD+iMxNacOVFaKFQ2sy6SpYoyg0Ek0Xh759kj4rXGdC3JFNw==
X-Gm-Gg: AYBFou2MQeTj8M65i/BI1el6f9XtugRUD/JLY597TNIljIfC84sS0BhZqYkt5Vmas2K
	YDT58VjlE5FpHJ7ndp6tylUgGssAQMHT2V42ERS2lD/SOhVnwdZtTcbt1XEF1hLBxw9eHaLwwXj
	muDrXk2S7I1hGiDv9lIfjFM4CLILTqUCUFUXhSfhxu30/Of25dkQ7CT0HPJaysHbQ8lDMBznRqs
	5o3RPELnqIb9rX+iw3c8BSMw1/90xJCQ0NQh7JuDASGrJFHWMgVvz/Klr/jdIEAvzqnmAS/qJkb
	JQwCBOazm+0etFEG8Ctw4AttlaX/bU2IeSelHgBa3UzWnsqXt/Zt58ycrbeQ+pLOJVPRUcPtefF
	BTPzhJRC9/BoZ9js1BDJOKXWLvaB0GqYSXLAux49gMD5tsnGL+2fjhxLtP4wTDsBjlcIVtAD3nm
	ydJX8nqOEYg/N4oA8gRAvjHt3bAGAfkXbGG6AJ05LMeXGKJ6SFHUznXzf1T2gEkk2mz6QZFl9VB
	IHm4+KvtTwegiIanj/MYDA=
X-Received: by 2002:a05:6a00:10d2:b0:87c:9094:b72f with SMTP id d2e1a72fcca58-87e98789dbdmr1078355b3a.12.1790224452275;
        Wed, 23 Sep 2026 21:34:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 24/24] valkey: mark CVE-2026-86227 fixed
Date: Thu, 24 Sep 2026 16:33:14 +1200
Message-ID: <20260924043315.1663186-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130272

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix[1] for the CVE is part of current upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-86227

[1]https://github.com/valkey-io/valkey/commit/b7c39406bbfac01068c1469df28b22ccf1ecc102

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/valkey/valkey_9.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
index 7b20612130..d31a5dbfe5 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
@@ -76,3 +76,4 @@ SYSTEMD_SERVICE:${PN} = "valkey.service"
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
 CVE_STATUS[CVE-2026-56684] = "fixed-version: fixed in v9.0.5"
 CVE_STATUS[CVE-2026-63639] = "fixed-version: fixed in v9.0.5"
+CVE_STATUS[CVE-2026-86227] = "fixed-version: fixed in v9.0.6"

