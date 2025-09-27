Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D47CAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 14:15:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.13074.1758982530448742728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 07:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDzmiyY5;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b33d2f0f5f4so505793066b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758982529; x=1759587329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IPUuRxuOMr+Qze3mEy+fVMY3tCW1eaW363NN4UTCV0=;
        b=UDzmiyY5C/PPldTk0qYs1LMwZe952KYF+Eo41EUJaVpVlSJyIUn5vJgOZZyjPm7elf
         6IFIKBYVhrkHU4RZpgCvETqbiL0Jt0mcKyJwQbFfTVa1kGSQWPd5It6IxdL15FmsUqby
         swCRGVxAdBWFaCLfW+TKW2x7Czj+Dh25VGOyo0MrzC/byZyYcNZcKP0S3JK+tioJXA9D
         chKY7Q/8dmHRn1gfiBeIaK+UqG6BXmlrMEPhw/w4akGrH6QlafFIr5xLg/K5TMdgmT4r
         8yh7z4mLqvvjO0m9mmmQr9JqMpZk6/G1aolmsBPUVrHH1UDakDuAgseusZLUJBJqVlmf
         wObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758982529; x=1759587329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IPUuRxuOMr+Qze3mEy+fVMY3tCW1eaW363NN4UTCV0=;
        b=buOmFU2JoPYBHs/waBP2PGWyOwNA9NJAtj9NcQ8OXWJgDgXbGRLpdzpu8ekEpEM4rh
         2ztg7bdcHhLoZPgrlCI1ldJWuJ9YyQBOPeFHP3AqoGX+jWD43uHExGXKMJcoGVYdKoTJ
         2kqEGaFaiCb6S1gNwpsFUQo+IKtvpkbVbERvAbxCr+qDc9H3Airxpo+WvxDeHrhvIKr1
         vmxJcLl3fx54qiSbCmqA8D/8aHU45LWWdfDWm7dg83ixJHCFPGYZg/q98mGD6KW7c9vR
         FqU7iySbgCh8X0z2I32vg7Aly3VVXVbIpWW6THZ0NFzb5F0bQRfqop7p61eTCQhO09fu
         yMmA==
X-Gm-Message-State: AOJu0YwsXHivx2Zub5TjHuIwZjjjf0QQ8sOYn+A2lhhsaTXLo+fW4eSu
	ufKJ/c4gASezaQnKLptrlISO5FvqsPu6/SlxbVySv4nkzqxNG88/87yj+2R2Rg==
X-Gm-Gg: ASbGnctAbvsQg3py1dRZ90weHHfjtmqzrWWnUQhNcgX18/sqFuWaClCRUJICC59whlU
	vCDYu44aYASebMp0t7ZgxVCVU8oCjGhpXv1WkksawITKaw6jNpxOVDwgMbGvydXIS5bmJAoDG0x
	5ondGGOG8PHZ4+iN0Ho81hQBo7bVzDSp0tLiwamKeUYWzxyDTiVA/Xen/z4gRLLwnGGPxFHIrHr
	RZWIey0urQjXK8LJNOBieN7mWjUCMf6B6AZ44cq0OmRQEslHMF3Fb0WJN2YVVVQQbMkgAP1+qx2
	pIQr8iSgj3Ud0zKw2OD3xsMcorcBQQxJR9HkXGy5kxWsi4DoVBMCk5UcRNlS2hYawPAWJ5Qx+oe
	guGidcTuG0FakR939eTFl
X-Google-Smtp-Source: AGHT+IHjOLzhlQI0o8ivEgd219wQfc3dsC1qmDtCM9h4QSOkcn81u5I7Kvqunpuo/k5PsvRrPI1vtA==
X-Received: by 2002:a17:907:724f:b0:b07:c814:adc6 with SMTP id a640c23a62f3a-b34bef99a23mr1247100566b.55.1758982528536;
        Sat, 27 Sep 2025 07:15:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde29sm575953566b.74.2025.09.27.07.15.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 07:15:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] collectd: set working SRC_URI
Date: Sat, 27 Sep 2025 16:15:27 +0200
Message-ID: <20250927141527.2695854-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 14:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119987

The project started to outsource the source hosting to Google storage
and Github.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 36aad73b19..f310caf0f1 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
 DEPENDS = "curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
-SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \
@@ -18,7 +18,7 @@ SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
-inherit autotools python3native update-rc.d pkgconfig systemd
+inherit autotools python3native update-rc.d pkgconfig systemd github-releases
 
 SYSTEMD_SERVICE:${PN} = "collectd.service"
 

