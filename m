Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA54C61D9D
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.68634.1674717468558050405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S8i5wf6G;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso4485619pjj.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJbe9ByXpKbuM8y8ExD6XOr5W5ilxZthCVj3em2n+X0=;
        b=S8i5wf6GkdkQ23r9qwaOWnIohvrFM2/2HSEQRiqQP6a+3O2hvzx5bRQoATRRzWUBst
         I2jLncGPn7kf9CSV9vEE4ZkV6CzMwvgTjfae7HQO00czhUTEvb0nY4tY4z60GfFybbBd
         aHoiueX7tFfds6tNA07vo3fi/9+rsokzBIqubn1lO4RVURfdicQLcnImACJeC+52GjlR
         iTTtPbXnpaC9m6SvxZDa2xhX1zXo79saWH6DCZw41V2tWqwDMSe/ceWk5gYHOGfJrmA6
         xKvgh8UDa/JgF2gXt6au7BkfcJNDyVEIK5l3xTSuU7P1Eq8NO0mX7xrNhmeULbU+FyZ3
         IZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJbe9ByXpKbuM8y8ExD6XOr5W5ilxZthCVj3em2n+X0=;
        b=txRSLpur22Iaa9GayEhVgLMG8H/FZZzJ5nYm6eVRePRDu00usgxt/X0sQ/RGEVYuOH
         AMh9cC5wVfug2ox8LISncBuSWmmk7Ja3fHZ59WoxxC7zlcXwo3dAY025icj8sZcea6jQ
         meLwvwOeEkwrLirswYdX/3/dkmmmLs9M4edboCaXMtogLjfTb0DralqgW7ia8thZuqF/
         aIDc+WHi+QcqfGuO2eERvHWv5EgtgsxUw4iLYvfdCVDQruUJyTzxEMHX+QzvV1iOGy0O
         9svQK6RURBdLKdeqJyALzbhMRM5ismTpK3dhT6D18U+dFhIjFQUOZvttXUAkuvYkQxmw
         Z6yQ==
X-Gm-Message-State: AO0yUKVLplcKd+QTG/1ks/LpolsqdPF8JWuMBGhO9pTGSqu/xPUOryFr
	T9+1h7wRBjsHruZ2JOggyK4gDfNX8TnRvw==
X-Google-Smtp-Source: AK7set+HeexmAxfCtNDxe6rBjHoUyQelp5diiT38WYGNCtq5TnSk1khCx2X7Ah7ToNuyaDnvq9RBUA==
X-Received: by 2002:a17:902:dccc:b0:192:8cd1:5e79 with SMTP id t12-20020a170902dccc00b001928cd15e79mr638055pll.41.1674717467788;
        Wed, 25 Jan 2023 23:17:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/13] dbus-cxx: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:33 -0800
Message-Id: <20230126071735.2444745-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100793

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb   |  1 +
 .../files/0001-Include-missing-cstdint.patch  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index 44804545de..bf1220788e 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
            file://0001-Include-typeinfo-for-typeid.patch \
            file://0001-include-utility-header.patch \
+           file://0001-Include-missing-cstdint.patch \
 "
 SRC_URI:append:libc-musl = " file://fix_build_musl.patch"
 SRCREV = "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch
new file mode 100644
index 0000000000..4ad69eab42
--- /dev/null
+++ b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-missing-cstdint.patch
@@ -0,0 +1,30 @@
+From 56e2cce87445d514c9992ecc19d03bb2115c82d6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 22:17:31 -0800
+Subject: [PATCH] Include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/dbus-cxx/dbus-cxx/pull/111]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dbus-cxx/enums.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dbus-cxx/enums.h b/dbus-cxx/enums.h
+index 8253a4b..c793fad 100644
+--- a/dbus-cxx/enums.h
++++ b/dbus-cxx/enums.h
+@@ -5,6 +5,7 @@
+  *                                                                         *
+  *   This file is part of the dbus-cxx library.                            *
+  ***************************************************************************/
++#include <cstdint>
+ #include <ostream>
+ 
+ #ifndef DBUSCXX_ENUMS_H
+-- 
+2.39.1
+
-- 
2.39.1


