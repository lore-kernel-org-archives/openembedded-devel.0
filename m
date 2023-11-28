Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6EFC46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:55:25 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.29269.1701165321781929621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 01:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kp0l5F9H;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a02c48a0420so722866766b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 01:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701165320; x=1701770120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTOmT8KwH0tYPmAuH8DTkSPKm/KAJubVN8+EyIYpIQc=;
        b=kp0l5F9Hzu90wtzPTBkBYJLaEy+SRUZgh8cNGpXFi2PUigUqyK9ljkb9tFNx98Pufk
         383ac+0xQ4wDgczgfGkEJ/DxtwaFSPIqxmn3YKcJk/zIBW9+U7OL+viCoC7Ja5E/MvU6
         jvkcTplxjAv/1xhVrSwEqmkcQaGxd112B+3ViSkczXpekScZWs3siH+TRVv8RUQ5JJE9
         6sJc05IxrUzCJwktmVL/5FV/YskwqNwnFJVdWrNfR24v+XlfyQBd2zO9LslnqXAJa5Vq
         jJ9jJomvhN/o6VXD/7hEgRS1VT1pfViSRerAu32i+pzrycN7W9mSj8pOAPGccFrrlRRA
         OAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165320; x=1701770120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTOmT8KwH0tYPmAuH8DTkSPKm/KAJubVN8+EyIYpIQc=;
        b=jxADIaCQxzeAxgtc69mB+Itni+xgO9am9t2UG1CZKgMSb50c4Xg/XfObjI7w+f0oGm
         7mASJrRSMqiLBHHO5s+a1QbcvlGUu5j8hTtmczydgCtcUYZuRn83cAjo+xYcrYtNEwe+
         LBK8hBsNlZv0Rzvbu+Amdi0EOkm/JLRDyP3qg7XCRGmVNtdRRYGg1YhejpGG6VV9+een
         QWops0DI9uaMt2BVXXjFBeYPMJFqwBJPOrGFjwu7GdGhFK1dIS0Yesxzihp3R/k/2a+9
         ATDT5w5CYo6UHitNx3SYRgoXgori/fSAKgZrxulGMLwfRKS6iloDYYAHL7LRIagnCbOe
         L+uA==
X-Gm-Message-State: AOJu0YwnqKGNKPz7U4om1+1qy5giZbIz54Avcg+Zl5h4hay4tfsVwPSk
	wb6MglF6zrAD8Wl/wLEu5DorVVU+TnTAmw==
X-Google-Smtp-Source: AGHT+IFDng+INKChL0Kl354I8QDs7HqPrj9x7BCEfdaOE85N5Y01Ql9Zv/T0sb3aZaAncJA1kgWadw==
X-Received: by 2002:a17:906:29e:b0:9fe:3d74:2b62 with SMTP id 30-20020a170906029e00b009fe3d742b62mr10347104ejf.12.1701165319587;
        Tue, 28 Nov 2023 01:55:19 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906048a00b009c921a8aae2sm6577914eja.7.2023.11.28.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 01:55:19 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] tmate: Fix finding msgpack 6+
Date: Tue, 28 Nov 2023 12:55:02 +0300
Message-Id: <20231128095502.33820-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 09:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107095

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../files/0001-fix-finding-msgpack.patch      | 43 +++++++++++++++++++
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tmate/files/0001-fix-finding-msgpack.patch

diff --git a/meta-oe/recipes-extended/tmate/files/0001-fix-finding-msgpack.patch b/meta-oe/recipes-extended/tmate/files/0001-fix-finding-msgpack.patch
new file mode 100644
index 000000000..46463abbc
--- /dev/null
+++ b/meta-oe/recipes-extended/tmate/files/0001-fix-finding-msgpack.patch
@@ -0,0 +1,43 @@
+From 26a5aa6f70a0b98962884559668b3879dfe6fd02 Mon Sep 17 00:00:00 2001
+From: Carlo Cabrera <30379873+carlocab@users.noreply.github.com>
+Date: Tue, 28 Nov 2023 12:32:51 +0300
+Subject: [PATCH] Fix finding msgpack 6+
+
+msgpack.pc was renamed to msgpack-c.pc upstream in msgpack/msgpack-c#1053.
+
+Upstream-Status: Submitted [https://github.com/tmate-io/tmate/pull/281]
+
+Co-authored-by: Sam James <sam@gentoo.org>
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ configure.ac | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 028d5559..3badf9e2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -207,7 +207,19 @@ PKG_CHECK_MODULES(
+     LIBS="$MSGPACK_LIBS $LIBS"
+     found_msgpack=yes
+   ],
+-  found_msgpack=no
++  [
++    # msgpack.pc was renamed to msgpack-c.pc in 6.0.0.
++    PKG_CHECK_MODULES(
++      MSGPACKC,
++      msgpack-c >= 1.1.0,
++      [
++        CPPFLAGS="$MSGPACKC_CFLAGS $CPPFLAGS"
++        LIBS="$MSGPACKC_LIBS $LIBS"
++        found_msgpack=yes
++      ],
++      found_msgpack=no
++    )
++  ]
+ )
+ if test "x$found_msgpack" = xno; then
+   AC_MSG_ERROR("msgpack >= 1.1.0 not found")
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
index 53030f277..4e66d8d05 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f7d9aab84ec6567139a4755c48d147fb"
 DEPENDS:append = " libevent libssh msgpack-c ncurses"
 SRC_URI = "\
     git://github.com/tmate-io/tmate.git;protocol=https;branch=master \
+    file://0001-fix-finding-msgpack.patch \
 "
 
 SRCREV = "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
-- 
2.25.1


