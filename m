Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31AACCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:04:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.951.1762185873815984033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZDseELdJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c4c65485so3158347f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762185872; x=1762790672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocrMjDAQU7tzKnz2X0Ql9cLlprOaiCDIiPtHwxssr0I=;
        b=ZDseELdJ9kUtJQ0N/JtJQem6fc30AA0ziZKUEmy1iWGSXyzK+cilgi7EkM67OmlVAI
         l8bNfugQl8TOhLoQpZYGI2Io2Yo0CF+iQ/WaF7Z4bU9rFuLLv1U9nYCQXbsTj6bBCECr
         t/UhYeA87Ooq0QIaggBQssaEJU2h9r6ri7qeTyQbrpiefbqveX09RDkHwEK4amkiw/Rc
         GCoFXWk8GIJnEC0dk3yNJTFm+E6pvABuViy4cF5FdCBTr2V/F39YnG+7bWn+67YPnkCJ
         DS3c9r+lC3UQACLMIw5nIM5SdIh4OXCtVKyCCKMtchjyQpjiqHmnMdcyNY0DDELZ5dvO
         g7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185872; x=1762790672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocrMjDAQU7tzKnz2X0Ql9cLlprOaiCDIiPtHwxssr0I=;
        b=uwtOK009xU2hc3g01khuYZLTVhkOIEjLKVHtITf5+wK9z04TxUO1l9BkIzqFtKLjLP
         Pv1tKVggUBPJX3B5nWKYVurPwO3CAOMbZSjBfaz+O76HsvQJp8vFsHHWgiDhi8YmLEzV
         WswS686Ec0FgN5reDGFKYv3SuKLh2fUCDSLbMO/wVvFXOCEwobIplipoX/meQU8kid2g
         BXU9MopD/1p8QYR6QTI/THEY9tTeeZppB2H9MPZ0/xspGb8J8n6OX7j53Lb7uVpEbqGm
         7qJax4vEDaQmOLYEhlyssj+j+9qO1amlf4bH+BOQvtJNVhqRBWreVzDDbWt+MSGJhUNx
         NyWA==
X-Gm-Message-State: AOJu0YyKklQppRlorNSZHoIVYX8zIX+HlMTfgBU7GhWjRrpjjKrCLfYP
	CmXbZC/ZmxLAL8LFS4L8FZargYvBzAIzLzIhYQyv2QP6p2sS5hjPgUmSAcOeWLo3
X-Gm-Gg: ASbGncvZd3kCqKLUggyLQ0RRMXABiaoyNTRzHHuR+ipCCqc8fd2PJn0kCl5CelRdo4p
	AN9C+RTO0mJnAoXpFVYsJos4AkONWwSNGoPr5MCzOafMMsPNl6BnMu2Hl/aW3iB6o50XM9J+VS5
	YdjtFgU7SqgUiE0Y+keBU5MywGGhfDR3lIgeyQPxvzqrzLyL/V5FgY1SYAgCWPjokFPX9mAzLRz
	IUC04/oiJhche4EuzfpAei+JEEXrRoDKCleARStxAA34/bsi9r0zWY2lMR5DK9Q4JWvPLtElAKD
	GTpAh2y3E/GVyrjzdP3im6J7w6EIXjq1Z7fPAOgTT4k883spU3Hq+IAOV8qRXtpMfzo/3eU73YO
	lzsf7zfaHR/0fCN7yF3a7H93Ukow9foH//rKUaeFJac7JsoOK0tVCcMUmEFYvjJSWogAX8/l1BB
	XCdiREM3Su
X-Google-Smtp-Source: AGHT+IEfk07QBlecniXBc1DwRplpVZTffbKhRScGFUzUa2oDUKIB34lNhfTEzinWmI7qVXPEA38iPw==
X-Received: by 2002:a05:6000:2887:b0:429:bc68:6ca5 with SMTP id ffacd0b85a97d-429bd6d574amr11493376f8f.59.1762185871628;
        Mon, 03 Nov 2025 08:04:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1406a45sm20759074f8f.47.2025.11.03.08.04.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:04:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-11-03
Date: Mon,  3 Nov 2025 17:04:29 +0100
Message-ID: <20251103160429.1858992-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121276

List of all open CVEs (72, out of which new this week: 5):

audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
[NEW] frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
[NEW] frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
[NEW] frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
[NEW] frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
hdf5: CVE-2025-2308: https://nvd.nist.gov/vuln/detail/CVE-2025-2308
hdf5: CVE-2025-2309: https://nvd.nist.gov/vuln/detail/CVE-2025-2309
hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
hdf5: CVE-2025-44904: https://nvd.nist.gov/vuln/detail/CVE-2025-44904
hdf5: CVE-2025-44905: https://nvd.nist.gov/vuln/detail/CVE-2025-44905
hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
hdf5: CVE-2025-6816: https://nvd.nist.gov/vuln/detail/CVE-2025-6816
hdf5: CVE-2025-6817: https://nvd.nist.gov/vuln/detail/CVE-2025-6817
hdf5: CVE-2025-6818: https://nvd.nist.gov/vuln/detail/CVE-2025-6818
hdf5: CVE-2025-6856: https://nvd.nist.gov/vuln/detail/CVE-2025-6856
hdf5: CVE-2025-6857: https://nvd.nist.gov/vuln/detail/CVE-2025-6857
hdf5: CVE-2025-6858: https://nvd.nist.gov/vuln/detail/CVE-2025-6858
hdf5: CVE-2025-7067: https://nvd.nist.gov/vuln/detail/CVE-2025-7067
hdf5: CVE-2025-7068: https://nvd.nist.gov/vuln/detail/CVE-2025-7068
hdf5: CVE-2025-7069: https://nvd.nist.gov/vuln/detail/CVE-2025-7069
imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
[NEW] mbedtls: CVE-2025-54764: https://nvd.nist.gov/vuln/detail/CVE-2025-54764
mbedtls: CVE-2025-59438: https://nvd.nist.gov/vuln/detail/CVE-2025-59438
minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258

====================

Removed this week (2): 

freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
hostapd: CVE-2025-24912: https://nvd.nist.gov/vuln/detail/CVE-2025-24912

