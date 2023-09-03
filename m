Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7C4C83F3F
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 16:03:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.30288.1693757033510011947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 09:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iJ3MXCBG;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5694ee2d0edso60307a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693757032; x=1694361832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSx6SFQoIrV7AT9N8gius0n44jjitl9NM66vG6BayfM=;
        b=iJ3MXCBGcGhBMDB5yYb/DjAMO3/limrJ5G3Momsf09F6rFrITBs5R2MyLX8drrMiZu
         VmhfhbecWrEyoDMLYyAm/a8n6jt5hl4CEJ6yA2HqC16Jm6qVFiFkdAxGUiXXYV6f5v/f
         Nov9Ezbz1Wa0kQ9mGj+1jMl/FG3UwsycopnmIJka2LS7ohkXFzycFawL2OlBuRi8+gox
         x7tjct9qWsvJFVd3Zn9dm9908TuKaMZyo90P1pZeEH8+yUWZ6A/iIB+Uqt0UY7AzcCwg
         5WInHTLR+onMXxqev/RZAxzpWOKNueeAZiOP5Pvj7ikWSifjU9F92SHznBLRCh3qDOvs
         g09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693757032; x=1694361832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSx6SFQoIrV7AT9N8gius0n44jjitl9NM66vG6BayfM=;
        b=dyLxfesD/9YsiaH3JvIUp4g8zgiVpK83WdxX+3k+FTWop4nV5Vwnw8rMtRv5Z0BElb
         nNeEw3l7qF6osMAkZ9lJa+DBbIGnwDnLQf6015bNk9bxm64+zWQ6qJvhhTm//5hJnAit
         a7m+dES0P5q/ydISbLPpYFjvn8lP/FTd8xVsiVlcLq2aE9ig6fUhjrfM7a7sr3go9u0M
         yA/h/X6kMfJEkHk4AMjGBV7h6nPM0rjbyiwAtDSiX2etdtCzJZPmnk7oIUFt8whnETSZ
         B4A6lRSpUcu66t8mFNFp4l2O9Xq8fAGodcJo+bVgFWq0PNTO/tphzDYtBJ28uRToPmmm
         RCWg==
X-Gm-Message-State: AOJu0YyKcwvzRqpNKBqrbYBqNqe2pVXdetMfX0kgRKUSkCY0+0pSLHWo
	fXUjSL1rNJhpEddwQhDUNNjkHsvHOUHLVw==
X-Google-Smtp-Source: AGHT+IG+mYW2x52w+glnCp6g0hBXVyCFi8xibb90zr+3W0GcKbD5jN/YhAzExMZeAV+QR271G9RR5g==
X-Received: by 2002:a17:90a:d3c5:b0:262:ded7:63d with SMTP id d5-20020a17090ad3c500b00262ded7063dmr5754668pjw.17.1693757032225;
        Sun, 03 Sep 2023 09:03:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id o20-20020a17090ac09400b002682523653asm6008809pjs.49.2023.09.03.09.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 09:03:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] networkmanager-openvpn: Fix build with lld on musl
Date: Sun,  3 Sep 2023 09:03:49 -0700
Message-ID: <20230903160349.2052956-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903160349.2052956-1-raj.khem@gmail.com>
References: <20230903160349.2052956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 16:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104702

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-script-Do-not-export-_IO_stdin_used.patch | 30 +++++++++++++++++++
 .../networkmanager-openvpn_1.10.2.bb          |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
new file mode 100644
index 0000000000..eafd497ae2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
@@ -0,0 +1,30 @@
+From e09ba80e342b3b24bb2a46e11dae1c30cc61c75c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2023 08:48:42 -0700
+Subject: [PATCH] linker-script: Do not export _IO_stdin_used
+
+This is glibc specific toolhain issue, it should have been handled in
+toolchain instead of exposing to applications. This was done to fix
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linker-script-binary.ver | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/linker-script-binary.ver b/linker-script-binary.ver
+index a2780c0..f030d35 100644
+--- a/linker-script-binary.ver
++++ b/linker-script-binary.ver
+@@ -1,6 +1,5 @@
+ {
+ global:
+-	_IO_stdin_used;
+ local:
+ 	*;
+ };
+-- 
+2.42.0
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
index 3114731f2a..024ef39361 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
@@ -10,6 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
+SRC_URI:append:libc-musl = " file://0001-linker-script-Do-not-export-_IO_stdin_used.patch"
+
 SRC_URI[sha256sum] = "62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
-- 
2.42.0


