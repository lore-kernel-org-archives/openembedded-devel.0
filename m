Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B9BC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 22:55:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.7898.1746053714479315555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 15:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LZ/H2ubv;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: alistair23@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so481094b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053712; x=1746658512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awn8qM6fZArLBLBtebP3dKZeOJ/gbFWCysquETFoLFs=;
        b=LZ/H2ubvxB6oFVFuAHKlPztly48Ng5qYvEUps/vZiJ4tMF1bwxZ49rZE8IuIMvRqmG
         3aqWaUj6slJm3cOfr8AwYq/eQC/mpVN0ZhyaafXY3Sb44FvhATJ1sgBJaCBUAtuZKxd7
         cxf+RfNoQHbsUr4X2ioQkxuFvNYnamcLOzNgcFV410J8xrwgJ5Tw3/TU/Oy7xz4Dvy3l
         Z8uySr1jljC1VLJsT5O4eoCvQuvHkgCdcke0skDS691y6fbhtVfiwpkJPxUHwmZC3riF
         CE1FAn320I6IEcTaZ8eCiM0YyPJFT2a/e2eAufxcfgz1yassUhc3eSK430vnaKzdMOh+
         Ps3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053712; x=1746658512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awn8qM6fZArLBLBtebP3dKZeOJ/gbFWCysquETFoLFs=;
        b=bWWW+cWxgl//GkW6ZdaXZBWo8oIcDKFcfrAI2Y6bTvaDDK311PDH5lMEFcQagBbZ/R
         7pIHGepm1hf8BsSAlKTZjdPX9MwITdwsPy57aAJfyezbYJX2hqI0zmfIkPEZDJCrq0cx
         OByNmQX6QxRXxgx/9twuU8JSvu/H9dGpTJ8t43XRxGJ9Rw8kVnNwlV3+600laTt+HGVs
         6uirMWnWiaeyDWKiEgEHNPI9e/6UPol+eFUqvtfTgH5amihBpXoi/qNVQt6gV2DNiM8g
         ww4o5l1uNzlUZpGzJMR/LvDSJA05KYLafDdu6NmGVnT72MCW02GnP6+LMzTvdnw4Fu2d
         9wXg==
X-Gm-Message-State: AOJu0Yz/idevpb4dlJD7KixY2P9HprkVz1jZp6s4s3dJgtx/RMo6V7dt
	6kV9VSrrcKtUkYmsGG/Zrvhr+LuSjLfStNwaJwMGWDvBO/Qfe5ELQzqocA==
X-Gm-Gg: ASbGncvKYvyXv5AldwXwdksz0YK0talCTnm6fRTrT9gGegic1cOAgG8yCZyBx84p2IM
	6mQIEfVrOZFQ3l/t34ilrFrEskFce7sglS2I+oH4mSKF0KQl5Fo1GOIgGiXjglyTzJ1xmC4XRee
	IijKGs4FL2WoifblXH68IVA/E0ORVLTrv2tVyaq98nYuCKi98oIySoxXIF8EIi5yEV4FMv8lLYJ
	5rt2mjUFdXLswE6GNkN1KBL3z/vmkLqiKkVWiPVa54oY8ucYyYWhvVPzSQ9Qs3cLK08J/AEm7bO
	/QzHMe0CF0PG/bTGgs03AdTmMCJ1Dgn7mToAzSBRnBu8TzsL5awImOkYCxXhEmq+s4x1LJaEQIZ
	5bSreN5YDHVVfo8wNT9irGJSfpINL6feHn1fryU0wsstpVw==
X-Google-Smtp-Source: AGHT+IGz9wnDezVSNNzvU7q1OGxSqGUIPVn01/mV0UE9ZWVlLLhxdIDgHtStN+A8HocMdpoewgBGWg==
X-Received: by 2002:a05:6a21:8ccb:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-20a89325382mr8021956637.34.1746053712260;
        Wed, 30 Apr 2025 15:55:12 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded634sm11404372a12.73.2025.04.30.15.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:55:10 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] blktests: Initial commit
Date: Thu,  1 May 2025 08:54:49 +1000
Message-ID: <20250430225449.194437-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 22:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117266

Add support for building the Linux blktests [1] into a guest image.

Once booted the tests can be run with commands like this:

```shell
cd /usr/blktests/; NVMET_TRTYPES=tcp ./check nvme/062
```

1: https://github.com/osandov/blktests

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-kernel/blktests/blktests.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/blktests/blktests.bb

diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipes-kernel/blktests/blktests.bb
new file mode 100644
index 0000000000..2fb6db9184
--- /dev/null
+++ b/meta-oe/recipes-kernel/blktests/blktests.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Linux kernel block layer testing framework"
+DESCRIPTION = "blktests is a test framework for the Linux kernel block layer and storage stack. It is inspired by the xfstests filesystem testing framework."
+DEPENDS = "gnutls keyutils glib-2.0 libnl"
+RDEPENDS:${PN} += " bash coreutils gawk util-linux fio"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0;md5=d32239bcb673463ab874e80d47fae504"
+
+SRCREV = "9aa2023312bfcdd6b31c24b6e4a4a5c2d4f870d2"
+SRC_URI = " \
+	git://github.com/osandov/blktests.git;nobranch=1;protocol=https \
+	"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
+
+do_configure[noexec] = "1"
+
+FILES:${PN} = "/usr/blktests/*"
-- 
2.49.0


