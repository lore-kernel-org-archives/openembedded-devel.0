Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8998EC41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:49:16 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.63.1715813347336456341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 15:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c24KC0rh;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b27bbcb5f0so3828215eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715813346; x=1716418146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMQxIQY8NftR3Z9tD8vJUdfDLhhJdrn0TKHYiSCWVzQ=;
        b=c24KC0rhoJ6QvynUfPGChZKyrxUiRrtDUgECyXID0141myhrrz5JSZwv1H2m+H16g0
         qyvjV74D9NjP1yxRIFGceubWa6FoyoIqdV9ltGwsMN7YI3SN6FxLPgm90P+dh9G2U+bY
         Tf/IEzRB59mLLAMCaUiwwl5osL3+6KtwMb+TmYdcxD0zgF9pSOElDj3UXTtkMjSIRHQ1
         h1EX3aLntEzJv5akvkO67ihSubidJ18LJpETC1Z2uPDqZgR/U/jrgyfLm3jx832SySZM
         XUQQ9ZmGcz1Ij4wvokogr/K0UIeTODzWhHFPbcOr11WN0Kt9JLL58IATK1neyrF8bb5j
         z/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715813346; x=1716418146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMQxIQY8NftR3Z9tD8vJUdfDLhhJdrn0TKHYiSCWVzQ=;
        b=qZgGQIhplwqQE6tMmcNHDqC+cRqQOjvgitrC+fMRQuSl2BBDzcoQ9/1yE2IQGF4eGD
         ewBYkwm7v6ZTlPRIe1XClbOm30sWIv9M30zh4vlWbwesb1WoBpNZpMY8s1/N6QUcNdTk
         DjCLcMRoxup+EoYDt9wX1UaEvOAzP5XnfSyxtxte58grnb8xIWtqWt+pxAY79v47/qV8
         3YRHbLionQ1f1J8rLEtqk4ncOzX57+ielZ/hf5CujsVVLCoGR7UuKldG4a+xPwiscCIE
         WZX9JLH6zZlafWL4HBeqQGZvuOa3Fqzh8LVX9aVY+wxbD67FFT8DjF5qp72CDKdr/wIH
         ZlAQ==
X-Gm-Message-State: AOJu0YxIdhim4nC2CAA6wyNZnAtZc8TdEkKylnw/E2ZVaufTs3KTh3k4
	th5h+61mhVGzIgZ/xH4MUCxHclRCNbq/kBGD6Ftd/kGo8fJFPrIsg6pMfQSljSY=
X-Google-Smtp-Source: AGHT+IFZqLqVYvl1ZfgS6ONAcwHcEDq7gvbYUOiX0DAIy1kuRAOjpk7kRIizSDPFkV055Z9Kb9+Rhg==
X-Received: by 2002:a05:6358:98a5:b0:194:81b4:e86 with SMTP id e5c5f4694b2df-19481b41132mr596792555d.20.1715813346188;
        Wed, 15 May 2024 15:49:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f80e4sm12090938a12.75.2024.05.15.15.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 15:49:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] python3-pyruvate: Adjust for WORKDIR -> UNPACKDIR changes
Date: Wed, 15 May 2024 15:49:00 -0700
Message-ID: <20240515224900.232825-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240515224900.232825-1-raj.khem@gmail.com>
References: <20240515224900.232825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 22:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110407

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyruvate_1.2.1.bb               | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index 2807c054d9..297eecad0e 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -9,16 +9,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI += "\
     git://gitlab.com/tschorr/pyruvate.git;protocol=https;branch=main \
-    file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=../cargo_home/bitbake/nix-0.23.2/ \
-    file://0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
-    file://0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
-    file://0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
-    file://0001-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
-    file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/nix-0.23.2/ \
+    file://0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.138/ \
 "
 SRCREV = "57db64c9f65ced05c71b8d786c1cedfaa2991597"
 
-SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.5.0/"
+SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libsystemd-0.5.0/"
 
 S = "${WORKDIR}/git"
 
-- 
2.45.1


