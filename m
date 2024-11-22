Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3585E6918E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 19:01:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.32541.1732302097224899087
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 11:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfsVQZ/p;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7f8b01bd40dso1768193a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732302096; x=1732906896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5DZkQMkuXZEvZjYDh+bMWwIbts83ZHMXc8H8WbZ2yE=;
        b=DfsVQZ/ppzz4d4bgYEfKcamdfBpFO/Wy5z0m+CAcFJDM5pLrRpfzoqRF9b/zkNb/SO
         sSoTukV46qqQkjLQkCRSGd/zjYyR6/wCv2nI6e/IBfjL/p/jTcho9wSEDtPiDiwDxiWO
         CeTsaIj5Wlkil3/4+0TnH7VM5sd4zi/ADQPR9/AkBfSZPzkZiHECA4cMuMq2hwh6OnJJ
         9iX6ook+81JNgUHd1Jsr1iGpCtVqca/oqIx2kMYyxZlvEw2ijoLy/4nOPJmOhkOXBbi1
         WDudibDOlljWubB978+wPzAjcn1OqDjdh9XYyqj03JRJK7DOwK1elpFqjrCdNMkso6RW
         gTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732302096; x=1732906896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5DZkQMkuXZEvZjYDh+bMWwIbts83ZHMXc8H8WbZ2yE=;
        b=BI/BuW49PrF0hLYvoWkOLI5oiXX+dL/gVpIxOLcRiIIdDqjBhrPLd5GItj7j9HaREt
         QEHemFI5Bpud08eZpw6ZlC9GzfW6faGMd8i6ryS8FS/RQ5Zst+kSdfZ8Mqf1IaMared9
         L068pwEO7iqzwzphtiReubRfVgFoFYkFKwZ9UxpUm8D0dqac7K+IEbf4anJlC53l2u7d
         XZjVfZU1aeBqKULARU/TmB3Z/d9qFqwqzM4tzOaWSeGcCRqZl64DsRDIQDOmxBYL290q
         2T3g6wRLTrxA4Ctv1gs91/mPetNtoMQtUVdsHoJJ6ZzBwJL3IGvVsBaRtxlefCmSopQV
         SmNg==
X-Gm-Message-State: AOJu0Yxc4AmBsbzAjKUrweJ2SV7RLRo6kOZ1KSMD4NIAYLxMUqWWFSlH
	DzoaxJTkevFszxD8mYG090SeJRjbhLNEV7eLTydMilDznC8lCHdTMPoLzQ==
X-Gm-Gg: ASbGncsixVWygqeOS5PuD8DzRCsRipC6u12qXd0rhTxWZzWjxFpaHErko760GMympyA
	kIVT9LxgyENmDmWlB9eU9kLik4PQIqwjQaP5Mc6h3/z1JOk7N0xka2n62vByRqT6C6NgJKK6tuc
	k/HdJsXHR8yjXiSUETXbQwVKTMLoVqARWFJf4zRfa5XETBeiqD53qSPJ4jVR/0iV+h2vNBaQPhZ
	R+sfD2lHFMDsiKw/sD/D1vfM7UW7dmnZSV40PkwpBTNntH42BM=
X-Google-Smtp-Source: AGHT+IEIzGcvmWoqKddvK/Vr7RO7Fy0BK8oPU69gFCLwhu0t8o77x2VpDwaBuVZ+oLYmoNZmqMUqcA==
X-Received: by 2002:a17:90b:390f:b0:2ea:4c4d:95a1 with SMTP id 98e67ed59e1d1-2eaebf27a1fmr12949927a91.17.1732302096462;
        Fri, 22 Nov 2024 11:01:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04d2cf6sm5500166a91.37.2024.11.22.11.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:01:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] canopenterm: Fix build with musl
Date: Fri, 22 Nov 2024 11:01:30 -0800
Message-ID: <20241122190131.2810521-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122190131.2810521-1-raj.khem@gmail.com>
References: <20241122190131.2810521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 19:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114008

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-initialize-msghdr-in-a-portable-way.patch | 42 +++++++++++++++++++
 .../canopenterm/canopenterm_1.0.8.bb          |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-way.patch

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-way.patch b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-way.patch
new file mode 100644
index 0000000000..09bbd40215
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-way.patch
@@ -0,0 +1,42 @@
+From 464ed82087b0514694ab69e2808e859cb6f13833 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Nov 2024 10:35:12 -0800
+Subject: [PATCH] can_linux: initialize msghdr in a portable way
+
+musl has padding bytes inside the msghdr struct which means initializing
+full structure will cause wrong assignments, doing partial assignment is
+more portable and assign the elements after that
+
+Fixes
+src/core/can_linux.c:362:71: error: incompatible pointer to integer conversion initializing 'int' with an expression of type 'void *' [-Wint-conversion]
+  |     struct msghdr      msg              = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
+  |                                                                       ^~~~
+
+Upstream-Status: Submitted [https://github.com/CANopenTerm/CANopenTerm/pull/70]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/can_linux.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/core/can_linux.c b/src/core/can_linux.c
+index d8824be..b4e7907 100644
+--- a/src/core/can_linux.c
++++ b/src/core/can_linux.c
+@@ -359,11 +359,16 @@ static char** get_can_interfaces(int* count)
+     int                fd;
+     char               buf[BUFFER_SIZE] = { 0 };
+     struct iovec       iov              = { buf, sizeof(buf) };
+-    struct msghdr      msg              = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
++    struct msghdr      msg              = { 0 };
+     int                len;
+     int                max_interfaces   = 10;
+     int                can_count        = 0;
+     char**             can_interfaces   = (char**)os_calloc(max_interfaces * sizeof(char*), sizeof(char));
++    
++    msg.msg_name = &sa;
++    msg.msg_namelen = sizeof(sa);
++    msg.msg_iov = &iov;
++    msg.msg_iovlen = 1;
+ 
+     struct
+     {
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
index 191225bb15..c9bf0af560 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
@@ -15,7 +15,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=10e84ea70e8c3a1fbc462f5424806474"
 
 DEPENDS = "libinih libsdl2 lua libsocketcan pocketpy"
 
-SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=main \
+           file://0001-can_linux-initialize-msghdr-in-a-portable-way.patch \
+           "
 SRCREV = "5bc04e09351f68e889381e1912b0445c4f18ee32"
 
 S = "${WORKDIR}/git"

