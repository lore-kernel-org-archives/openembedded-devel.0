Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1161C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 16:14:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.108.1746720858451156772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 09:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FXD1BjGM;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so12273295e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746720855; x=1747325655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQWaRCk4nv56pFPLbbPlmmZNIO5elOi2w+Hjfzx8rdc=;
        b=FXD1BjGMwD7o1EcOwAXXKsKqE5XHKBk9LADN7/hVEw5CPwAnrQ7NbDPuXdyw0rbWni
         MwJAUs5If7F3osXeW4dBC+76Ib6thAlQmkET4T4SM23wH5QhBzJmH4Pn27y1eALoMQrT
         /dhioJD45YtD8SuNfWN24hcY6BwRSI7L8Ei4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720855; x=1747325655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQWaRCk4nv56pFPLbbPlmmZNIO5elOi2w+Hjfzx8rdc=;
        b=BZKnzQo4y6WR41bhwaVNlgCmIProDBZG3TyAm1EdM3yHlKadYdeNaMBf1lypqpH53e
         EHpM38dc8kE8mSvt2m5oMsZglFkr7ZAbwVuaDRiMoCxFMD6WzPrzra1VI2jUa9jMT0kQ
         MBpugnif8eYFLVsUbwTSnLsbOJHsNrRyIxv8JnJqXZSD3uvMnN123HQX2s8PRw18QTkZ
         VDshSJCGRgGB4idnAhpPMSz2vEU0PL4xIs0On1yLc/kt8KE07m1Qj2gnU2lMw8EFayZI
         dcoPVOMnxG9vN0MqBLlKnTB7J8N4cXbJJKPSgC4cPm4sE0IIVHnmRDSsN+aYAbtDFvzl
         +eaw==
X-Gm-Message-State: AOJu0YwFWuo4rWXvQxsvSZiDxrP+eJZT1PJ8gxF14Xy14xo4PHwZV/u4
	N4qybvI1ZP1u6UNKEt8cTCLv0fLalP6IUtFcmsTLXZ7YEL0d5kyvh9FAoi3pXU5MxS25sfdV8FT
	o
X-Gm-Gg: ASbGncs2RYXtuIi6C6wzkV9ZvTq+fjmDUQcnMBfl7lly3Oo6oPeGO/5UV0xshWyvpXg
	Sl22CuKP2z3c4iIkbGysS5QNFyMDvKx7gYGj+cfmhgTfkq7PHxXPG9OsWOYY9FAsEohBLcdNjgL
	Ms7eaELmpKXOShVGbc1M//wTpuLa77Lqk+MPws3or0Ig1wWhJQ8OfZhnU9X7tDSAzzyTpxr3ydu
	KIu/7WX17S+WLTnnWGoRo4noEzvAArDLFjcS6qssKQKNcm3LUOm9xZXzibI/oF3VKw4TFxV9g/T
	t/piTlxc7E+2/eYeum7U264QLyVzwE2tWrK7qNz7TlscnebvWq7GkRYSTRAA0CPeTtBjfXgVJww
	BJGmeLXWI6sc6E89YjIlNvFZL1E1330/6dx1nwZ2ywje2/Qxe
X-Google-Smtp-Source: AGHT+IG/nEXmLJWQZ5RsREa2Ynm9r4dCnElSHTdAYWXXiaWnhfXBP2YuPgQJvsFM9pbkMe8NJ07H9g==
X-Received: by 2002:a05:6000:1acb:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3a1f64978f0mr89744f8f.47.1746720855600;
        Thu, 08 May 2025 09:14:15 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0087b736f9b546e683.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:87b7:36f9:b546:e683])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddff6sm405371f8f.12.2025.05.08.09.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:14:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] mozjs-128: inherit cargo to fix build on rustup systems
Date: Thu,  8 May 2025 18:13:53 +0200
Message-Id: <20250508161353.903041-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117366

From: Yoann Congal <yoann.congal@smile.fr>

mozjs build uses cargo deep in the build tree. The configure step tries
to find the cargo home and forcibly start with the home rustup directory
(~/.cargo) when not found. This leads to the build partially using
rustup cargo and to a build error when this cargo version is not
compatible with the OE-Core one.

To fix this, inherit cargo to inherit a working cargo environment (e.g.
CARGO_HOME). But, override do_compile to keep the previous
(base/Makefile) task.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index 6bcbb13501..c3804ec64d 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/firefox-${PV}"
 
-inherit pkgconfig perlnative python3native rust
+inherit pkgconfig perlnative python3native rust cargo
 
 DEPENDS += "zlib cbindgen-native python3 icu"
 DEPENDS:remove:mipsarch = "icu"
@@ -83,6 +83,13 @@ do_configure() {
 }
 do_configure[cleandirs] += "${B}"
 
+# The main build system is a Makefile that call cargo downstream.
+# We inherit cargo to get the environnement but need to switch back to
+# base_do_compile to do the Makefile base compilation.
+do_compile() {
+    base_do_compile
+}
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }

