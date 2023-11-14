Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF9AC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5390.1699931297540152946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m59rAfRx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc9b626a96so37831485ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931297; x=1700536097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Lmnyh/uCu85UefCKk5WfJ+0djZrltMqO856a0CL4Jg=;
        b=m59rAfRxDC1zoQr+Pif0plmduDw+GRL6TDM9xVq+ecbub9cX/lDznrVoGzIdRy9CLS
         JqqkT9Ojut1WEJwoJ1SWDZs+JNYe8Qu5gXGC4wTb56lhfidjWO9sfOr55+E7Bchz98QP
         UGCcmBFbYQF3xwpFGx3jfNYmliI3jAf71Ssi6ZmYnLDAPlbYs8bPPeXG4rEBM4D/4BXc
         1vsZBPSpK3qG+XUeRzVpi6/wOLT6nt01t2kOFvOIJv0n887zWrGXQjoKMd/JZ4danSHw
         MyN1tpm6kkpjiq6QgL0VQdryOakBotDPxwcBHeMWGyaOE9PByH5Cxh3BcOkYQciDwJnP
         p3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931297; x=1700536097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Lmnyh/uCu85UefCKk5WfJ+0djZrltMqO856a0CL4Jg=;
        b=TQgU2EhJ/6tYn6+u3MGUmlLmvM7gmnkGos/QQzyTN3AXM9amcRLEDa9VJqDbr/hR1Y
         ntGzZQ05b3htx2zBDvRLaI4XfRj+XWOCP9MjqH+ekZMG00TgxGCI2cb9vuXZ9DRruAka
         cMQBkni1GuDbhSxwoR31UurgJZ8hdOnLwF/G3lq3Mn85rKWX6GH4GatntwOsBvGnTk+M
         hKX+E9SDsBNy3gkCMWcLMzdmNL/8F7adsb7wbeexwti+0BUQt60dGEj05QHt3O5c8kvM
         ks+GAM+x0f8WRn0QVlpH4oKoKbsc1B6RQNrBxwh6tV2xelor0KghTGIdAmGoWlG9Va41
         R3wg==
X-Gm-Message-State: AOJu0Ywyjv8myasdGUwbjzrRMjtjRo71yZT52748dofi299RpgZDYNeX
	zZkYXg3HpcUh+gYLOy4cqc59+vO5YqsN5g==
X-Google-Smtp-Source: AGHT+IGPdcu11g66Y1YuycQf8+hpUZ1cBJ9F5a8D9KUlc4Q+PCIu4uap8LF4Iwt3pWtSdfTVXvP0Ag==
X-Received: by 2002:a17:903:244d:b0:1cc:4625:74ed with SMTP id l13-20020a170903244d00b001cc462574edmr1273966pls.53.1699931294358;
        Mon, 13 Nov 2023 19:08:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 01/10] cannelloni: Fix build with clang and libc++ runtime
Date: Mon, 13 Nov 2023 19:08:02 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-1-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106688

Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 ...lude-bits-stdc-.h-only-when-using-libstdc.patch | 37 ++++++++++++++++++=
++++=0D
 .../cannelloni/cannelloni_1.1.0.bb                 |  4 ++-=0D
 2 files changed, 40 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/000=
1-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/reci=
pes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-=
using-libstdc.patch=0D
new file mode 100644=0D
index 0000000000..71f447c94b=0D
--- /dev/null=0D
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-inclu=
de-bits-stdc-.h-only-when-using-libstdc.patch=0D
@@ -0,0 +1,37 @@=0D
+From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001=0D
+From: Khem Raj <raj.khem@gmail.com>=0D
+Date: Mon, 13 Nov 2023 00:07:23 -0800=0D
+Subject: [PATCH] include bits/stdc++.h only when using libstdc++=0D
+=0D
+We have other c++ runtime implementations e.g. llvm's libc++ which does=0D
+not provide this header bits/stdc++.h, therefore make sure that this=0D
+header is only included when using libstdc++=0D
+=0D
+Fixes=0D
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0/git=
/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found=0D
+|    27 | #include <bits/stdc++.h>=0D
+|       |          ^~~~~~~~~~~~~~~=0D
+=0D
+Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/5=
6]=0D
+Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
+---=0D
+ tcpthread.cpp | 2 ++=0D
+ 1 file changed, 2 insertions(+)=0D
+=0D
+diff --git a/tcpthread.cpp b/tcpthread.cpp=0D
+index a1b3047..bb5a7b2 100644=0D
+--- a/tcpthread.cpp=0D
++++ b/tcpthread.cpp=0D
+@@ -24,7 +24,9 @@=0D
+ #include <cstdint>=0D
+ #include <cstdio>=0D
+ =0D
++#ifdef __GLIBCXX__=0D
+ #include <bits/stdc++.h>=0D
++#endif=0D
+ =0D
+ #include <linux/can.h>=0D
+ #include <string.h>=0D
+-- =0D
+2.42.1=0D
+=0D
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1=
.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb=
=0D
index fb457dc03b..dfa7437ba8 100644=0D
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb=0D
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb=0D
@@ -2,7 +2,9 @@ SUMMARY =3D "a SocketCAN over Ethernet tunnel"=0D
 HOMEPAGE =3D "https://github.com/mguentner/cannelloni"=0D
 LICENSE =3D "GPL-2.0-only"=0D
 =0D
-SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttps;br=
anch=3Dmaster"=0D
+SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttps;br=
anch=3Dmaster \=0D
+           file://0001-include-bits-stdc-.h-only-when-using-libstdc.patch =
\=0D
+          "=0D
 SRCREV =3D "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"=0D
 =0D
 LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"=0D
=0D
-- =0D
2.42.1=0D
=0D

