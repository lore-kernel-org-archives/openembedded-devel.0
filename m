Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1880DC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:06:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.1923.1668024363247627763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dal8uQ3I;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p16so11604844wmc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCUbEymYPTctCXQbth6vPj8oZklDrUMb9pgzMHorcm0=;
        b=dal8uQ3ITN8CKDq+jFpePIkWEoAnX8JPjFiD6jESbfEndRcMlhwo5KsyF5ZMKHvzvs
         Ux7YlEjUR48tvnPk7J3daEt9SURGRROLrhkwthmNG9Lnhn2aJIw1841FajpbMD6yPA0d
         dNwCfR0FS5uKHXGKAMMkzphsIo3aKyemEey+pOZOIshsnnw1UyEJ5V2hqVtHpa1bfAf6
         XvFp0Coe4yJFBWoCMXtcj71PlCBS7JOKumuDjo8r5AAmHT6NAgRKg705buX/h+BhK3rt
         U9Cd1w0q6jh22LXe3p5lAwnRdUJzMn6CCumG0aeAebn3/bKJW9boFm25uOh0975PJuNa
         1d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCUbEymYPTctCXQbth6vPj8oZklDrUMb9pgzMHorcm0=;
        b=nzcVvG5ATZNo3F81Ptdm02GpOY+kza7NTc4db13FWISTDd+tqq1HtcBF9aj5hmYZ9B
         NrQBBjTnhxpgg5w66fNDzaba2eCOfguPBi/Mc9VKJIrjIUrVhJbg+laP9RhwMz0Op6Aj
         zPyKlxm+skV1Enfc12XFerbLlkmQdYzbiMFsNWMkoUbxb9j2EWDlSa1BgLm7/afUn08u
         dqua1HtyPgTmrZiKuRq4dYMDIZKQeh08CwCsI2/Fwutbn4nUT7bM6dem9Sz2rO0kybtt
         TodKtLDqPWuyF/M6QUZMvhoGWYhsBLx4RGRxLgVOSg1vGSwefhSQJo1Z3UDYBS/9odGW
         BCoQ==
X-Gm-Message-State: ANoB5pn4JTMoD6yoRltV+T9vxE9tCInAwL/he+TeVqo0wStssP3OqTtp
	zGQ69seWoQB6f1UCIei+0TohgxQr58Q=
X-Google-Smtp-Source: AA0mqf4R2I0k5YAhKSbJkyVm4flnaxaFbU6BidiORbflmQw6cP69Xi/sqDkYqw03LMa8TS24x3iykw==
X-Received: by 2002:a05:600c:4687:b0:3cf:a491:b0ca with SMTP id p7-20020a05600c468700b003cfa491b0camr14417439wmo.161.1668024361405;
        Wed, 09 Nov 2022 12:06:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d61cc000000b002238ea5750csm16532548wrv.72.2022.11.09.12.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:06:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] frr: add a patch to correctly check presence of python from pkg-config
Date: Wed,  9 Nov 2022 21:05:57 +0100
Message-Id: <20221109200558.2034000-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99508

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...check-for-python-x.y-emded.pc-not-py.patch | 28 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.3.1.bb        |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch b/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch
new file mode 100644
index 000000000..9e5cfd8f5
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch
@@ -0,0 +1,28 @@
+From 6a2984718d7c47612b07be46d663e7b5e5b7c57d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 9 Nov 2022 20:24:45 +0100
+Subject: [PATCH] m4/ax_python.m4: check for python-x.y-emded.pc, not
+ python-x.y.pc
+
+Only the embed version includes necessary linker flags to link
+with libpython.
+
+Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/12298]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ m4/ax_python.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/ax_python.m4 b/m4/ax_python.m4
+index 91d12b99b..f5e603b96 100644
+--- a/m4/ax_python.m4
++++ b/m4/ax_python.m4
+@@ -206,7 +206,7 @@ AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
+     AC_MSG_CHECKING([whether pkg-config python-${tryver} is available])
+     unset PYTHON_CFLAGS
+     unset PYTHON_LIBS
+-    pkg="python-${tryver}"
++    pkg="python-${tryver}-embed"
+     pkg="${pkg%-}"
+     _PKG_CONFIG([PYTHON_CFLAGS], [cflags], [${pkg}])
+     _PKG_CONFIG([PYTHON_LIBS], [libs], [${pkg}])
diff --git a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
index 1abea6345..67d50e3ed 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
@@ -15,7 +15,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.3 \
            file://0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch \
            file://0001-bgpd-Make-sure-hdr-length-is-at-a-minimum-of-what-is.patch \
            file://frr.pam \
-	      "
+           file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
+           "
 
 SRCREV = "a74f7a9ad9623e6f9654fe4a7177e5da0b194828"
 
-- 
2.30.2


