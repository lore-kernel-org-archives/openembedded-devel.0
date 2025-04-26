Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE08C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 17:04:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12583.1745687047536183699
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 10:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbTgzVzb;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso3696154f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745687046; x=1746291846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13vBSGO1LTcSWVn9Y8l880496sZdHZwpi44EGeVl/58=;
        b=lbTgzVzbw8HNcyFUkB0gCJq9TdgfTNdxOpkH/Tv4iZkSlJvnJKYa+xgAD0M5SC4Fyz
         g1FRmck8VkDWgjQeD7Cz3v/CqRHV40u/CPQ+FTI/ToiMGcECr6r60EOzbmOfgfVEq37n
         4C7KrKu2b22f1hwoqK/GLUIBWKaEDyVxabrRIz0UpKXYaOdhSxNigRuzaXdg3KE05Hfo
         yrx3GHgasWdA/NMgyh2i0N46dqb4FWcPgw01oPcxkikN3ZGcr3s2iqZ9tR1FywB8nwK7
         ZXh6ZHK5EYFTcNKQK/oeUn0F4IpHeRFVZMUPDn77g2+MN9QgUyWBdxRGfPJM6FjKL5oo
         nssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745687046; x=1746291846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13vBSGO1LTcSWVn9Y8l880496sZdHZwpi44EGeVl/58=;
        b=j5O8M1K0h6U4P8DXXU81QSyql2hWxfWQ2o3+KLGL+yrQppdJdHds+LpJ6TCwhDO/lP
         S/W4euAxvjBVL7q16aRjtZHhewRf0EpZRGm43hPeXw5q6avoRc9c/D44OlLi3VzKwuYN
         6PdnouIGkHUmnPg4G0uZ7lEl1idfouGAizQdjtImjgG8Lg4ZHUAMeDLxjoVcqwYO1gQd
         qolaVFNT0CUR1H2jHBQwiDr4qsBmypP4EewlsnbIfP/reQJxWC8K/FSHn+HiMRgPH5Sp
         k44tjOaBLfUpIeEyq8cHfgH9+ricQIY3Yf80SJoDnXBydDK7zwlCWMCJyyg2T2N/Mc8Y
         xYxw==
X-Gm-Message-State: AOJu0YwrtA4guDpJd3WupNGyQMBdfkup15/VkTFEldcJQHwey7c6NRme
	0N8C7BqsoD1x+j0TRJUFo5IKbvY/Nzfa3y9GPrbEqI17mWcKzbk5eAINPhcF
X-Gm-Gg: ASbGncuz4n6l0CNwpQXUQqkeibXnn+U08ITmherdlSHTO7GVxBn5vo1ZfykvOykC18D
	7WdsMeUkQW8lpNrPD7BWpghoxoBsdmsmXDQxXoF7kvTRI5elgawW25TH1AgHsfzx6CtriYHX5dh
	xo1MLsYxwDrrZE5blnly41DwOm7h4eGTe9PF4uUbUtv4c/wlJOVg1ESN+VEMHTSb9KZfJBm6r6X
	bLuUla1E2BGTFyG0M7ga5nxR0tZlu1lpBdf7OI1kcVbumWpEb9BOjbCfAUiS2eF7phRaBAne+qM
	E7wY2aHsuBAXSwUr2WDEMR+ybsLF/HbSsprYI7IHPiH+heAwXOEOX8AtGIPpuSaOrO7kE8iBnQ=
	=
X-Google-Smtp-Source: AGHT+IGpTrCOhLVls/KLBENUKdeI8DtPBVTIlINmmcJOYYsic/9Fkhp8TjYimTmwWYAeXjVzWqnsPw==
X-Received: by 2002:a05:6000:248a:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-3a074f2f48amr5118754f8f.45.1745687045667;
        Sat, 26 Apr 2025 10:04:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5e1c6sm6219552f8f.98.2025.04.26.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 10:04:05 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] pgpool2: use gnu17 to avoid build failure with gcc-15
Date: Sat, 26 Apr 2025 19:03:58 +0200
Message-ID: <20250426170358.2557974-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 17:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117150

From: Martin Jansa <martin.jansa@gmail.com>

* like e.g. gentoo does:
  https://bugs.gentoo.org/940128

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
index ddcad46beb..a2f7665df1 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
@@ -48,3 +48,7 @@ do_install:append() {
     install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${sysconfdir}/pgpool-II/pool_hba.conf
     install -Dm 0644 ${UNPACKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
 }
+
+# Avoid build failure with gcc-15:
+# http://errors.yoctoproject.org/Errors/Details/853019/
+CFLAGS += "-std=gnu17"

