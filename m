Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFE7EF584E
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 17:51:25 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10510.1771091477825458438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Feb 2026 09:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3F9I1Lj;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1405308f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771091476; x=1771696276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcyPN2ULppmd8lIG5eJgFrtBsTQqDirVeyD9m/9XRB4=;
        b=F3F9I1LjeyGPkk2eoU59JEBNYThrBg5GeoUlOaj8hIH6bw8Xo0WrluVyi2Ev+li1/G
         iCqQGFZxrGzOzRYR7G8IUWZwUnCU4OlHOze2NBT4fvjVdYVHnuaAsCz013IDLFNu5AQ9
         gQMm37b13sGF5u9BiqkIwM57IvNblr06xsZ0hYjKt5g7KANtJOmQMCI/eA5rmoPM6PXf
         BaYhmK7JltzPm/DlZ3cnIg4yNDRN20/4fqIIZDSD1OraKyE6/BCd91XYpoN2BHehKivz
         5EOqnj3riRHNkHyXVC6E30z9Sg1l9PCq5hEGZAWNCqOOimTnvn2HBWZs4veX3a8BaK8E
         uYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771091476; x=1771696276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcyPN2ULppmd8lIG5eJgFrtBsTQqDirVeyD9m/9XRB4=;
        b=kzvZHPJfMmIA79unducn8CkvcGivWpC4XG/dH15BaGfkya76YZxe++4p8He0+RZfYa
         DvNhXmEJMYkATbZhagvZbnedO2p+hkXGeFNJ8jy/At1HggSjCzLUovnAePbfHBSlskMI
         x1Xaz0G3u/0iYbLoa5FhmROoc2QV97sUz0CnlHEFm7zGwETFvkgK0IH45kGttbRR5DLN
         OHLSL0pCU8ETBDaW4qGuCIdbpMD+za6ClcuEAOadv6IzArlBI+xD2SGNg8TVsUg+/Nie
         47yAMbAGUe580Ly4kb7Sp8GNH2Lm30cYMmo8aLxcKfao7+yn6YrwfRsAugm3ylHXcQOa
         eqdA==
X-Gm-Message-State: AOJu0YwoQrFqyHKW8WZZNKjDYoKrI7YkHJYW3tBoO5t0o8RW+YlBi7fL
	NYDj9Bo7vgwid4x43RVhs0a4uk9SD25/GBHl+ecoEl9+EHZoMNsaaqLYLv0muw==
X-Gm-Gg: AZuq6aKcmlS3ypYEt50O8eujTSYnz0cWRnRbdFHySneLu4w8OiNnYlQvjU8xluAVzpJ
	oSGItOGdUqACkRHgVZg+ip2XAHab86ELGxH6cEpL5OWgyh64CXt1CsOWagVU14hgQS1rF8dOx5N
	fSmwSO/SBM9pYHMUQa8a59Usl3R/Q9vIyYjNctHpDc9/YquAaf00Qbw4pFo3jAnYOpvoByTSQAU
	tf4hEDcuc9I1LWRet9IpY6Sf4nm3xNdYoq8bhH7YC45R42mfOTeN4P92eQLPfo5rr21eu4EJd9i
	1euJV7plSjvwESEN2YkK40/9W9TKDkshqIdMdKmJwae1bE0BdhSt5ydzxgMKGdV9vnU52KvK3IS
	nfNKy1aXmPD0cIyjWw2hbdrMS0EJinXEbGayQD3Mx3y+5zM/PWnWUkrbfjX4jWtVUf7bEj9H7Da
	OcMu4Xpl40Bg47fPjE7hjs
X-Received: by 2002:a05:600c:6912:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4837108fed4mr104255055e9.25.1771091475736;
        Sat, 14 Feb 2026 09:51:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a298b5sm43320735e9.12.2026.02.14.09.51.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 09:51:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ntfs-3g-ntfsprogs: fix SRC_URI
Date: Sat, 14 Feb 2026 18:51:14 +0100
Message-ID: <20260214175114.26707-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Feb 2026 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124402

The SRC_URI has became inaccessible some time ago, falling back to the
Yocto mirror. Instead use the Github mirror.

I ran a diff on the files of this revision and the files of the original
tarball, and the contents were bit-identical.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 7cfafcad39..c91e18a0d7 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -6,12 +6,11 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
+SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
            file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
 "
-S = "${UNPACKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
+SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
 UPSTREAM_CHECK_URI = "https://github.com/tuxera/ntfs-3g/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

