Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036D8C02182
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:07 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.48487.1736119446649365239
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0aNN46K;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so6805089276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119446; x=1736724246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io6nIVi9VgsUPo2qG8yDzR6NWUlwwRZZeIMBhqursxI=;
        b=H0aNN46Kq9C3QTiHTxxarc5wq9MBaXrR+QPASKUdL8OiUz3OOXGkJ6eEsEQEd9Sqe4
         aOaoDoF2ooCpdw1siFf+vexeWJoAYvcSE99Hl/v0YJrLwfv3qvVYIDqBa3igsF8rtzUe
         dZIA/OgknTflofzHNEeaM7dQ4zeUlXcZcMV4f3H22xTIFV3u8OiIj+98y03k81YilB3l
         p2eDvLxkfPpTE7SCE+QCWWlPJeDMOAJAWoVLOcdF7QReJIgrCnpGaXKUv4d6BVxSKdmN
         50KtkbBlzNeR5mgj+D55ZaKS2bzMAZhRsyHV99ERpeaGHOsQBa7Bb0Fa7lRTqc7ixMta
         O6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119446; x=1736724246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io6nIVi9VgsUPo2qG8yDzR6NWUlwwRZZeIMBhqursxI=;
        b=QtpdOaMNmO8YMyZPuYhaxP35VS08VL16x1df1U10Jv34tLMyeKPxf0jI0WFag77men
         v76brKqYLIQ3LU60QDuZZMSvrsr0CA/ZB6cObkdpY8f68zqum0uZSQ4tnoY85+u7UBWG
         PK86hSLIYQ6FTSo6X9J6SF5Xvg6ssoiutRzZlndOB0PfnORinBPwLRqgFa2TnWFOYtCf
         q5c0i3Q2tpRzEB14hr5zKeIz+wwuZFjbZBUUKm/4g0EgqT3HRrBfMIz14tFvbY1DwoTt
         XAhhVot2X5xDHxD15R3bw/mtbVe2pm7CrsymGEduk1cwDydvyyyPM7loiT498rkKmpuG
         kG7A==
X-Gm-Message-State: AOJu0YwxQbHyYMDNJoLb2HcyRn7ccLxyDrFJ7S80NCis7D6GpD8mfNrj
	7FC9DVl9YUJsM8Tou6ECBJ1AEUEY2m5VPksyjvystTfaVzutt3MbArtuluVH
X-Gm-Gg: ASbGncuY/UZeyNsJ02/mdYj49N3swKVYqB71Na7CmsX1ni19NF+YcpHpx+eqo20x8+I
	vINcC/m+wKJEYbom2fMtzjSqyDPOHrgU1PNdMt4mjsm1jcQmIz/tNd/CDeF+Xwsag7iiqY0C9GD
	i93tbqmudMu1pOplsTgY8Z03z48awFTLC4IyfGTDLzSFbu36Usn2HyVvM72ZK8bVf2q/0/8GzDo
	GOh4jE/goxyuvXM7chC09qX9Og4ziyrzxFS5PBp/qraDrciT99Jvb9/hABxx7h8h8Sl/Q==
X-Google-Smtp-Source: AGHT+IFCotUBYkfjRftyXj8qGz6nxi/kHZ4FdiCOYR1AeWDmdVzB98CqtS02IcAU/IM+JOkRgiPGxQ==
X-Received: by 2002:a05:690c:fd2:b0:6ef:7290:d478 with SMTP id 00721157ae682-6f3f823f1e2mr396379437b3.40.1736119442389;
        Sun, 05 Jan 2025 15:24:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 06/24] ntfs-3g-ntfsprogs: fix CVE-2023-52890
Date: Sun,  5 Jan 2025 18:23:39 -0500
Message-ID: <20250105232358.1502946-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114641

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport fix from upstream

  https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c452799c4df849b3e573e9e4cb937ca7a474ec30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...use-after-free-in-ntfs_uppercase_mbs.patch | 42 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
new file mode 100644
index 0000000000..3160f56880
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
@@ -0,0 +1,42 @@
+From 7b6210c5be46e5120b42c09f910e8f104bf3edf1 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 13 Jun 2023 17:47:15 +0300
+Subject: [PATCH] unistr.c: Fix use-after-free in 'ntfs_uppercase_mbs'.
+
+If 'utf8_to_unicode' throws an error due to an invalid UTF-8 sequence,
+then 'n' will be less than 0 and the loop will terminate without storing
+anything in '*t'. After the loop the uppercase string's allocation is
+freed, however after it is freed it is unconditionally accessed through
+'*t', which points into the freed allocation, for the purpose of NULL-
+terminating the string. This leads to a use-after-free.
+Fixed by only NULL-terminating the string when no error has been thrown.
+
+Thanks for Jeffrey Bencteux for reporting this issue:
+https://github.com/tuxera/ntfs-3g/issues/84
+
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d]
+CVE: CVE-2023-52890
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ libntfs-3g/unistr.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/unistr.c b/libntfs-3g/unistr.c
+index 5854b3b..db8ddf4 100644
+--- a/libntfs-3g/unistr.c
++++ b/libntfs-3g/unistr.c
+@@ -1189,8 +1189,9 @@ char *ntfs_uppercase_mbs(const char *low,
+ 			free(upp);
+ 			upp = (char*)NULL;
+ 			errno = EILSEQ;
++		} else {
++			*t = 0;
+ 		}
+-		*t = 0;
+ 	}
+ 	return (upp);
+ }
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 37a8106bb0..be2a5245ce 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.43.0


