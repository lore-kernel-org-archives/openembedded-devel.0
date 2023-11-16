Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBDC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 10:54:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.4264.1700132054130274178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 02:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLqBtjFM;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so930536a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 02:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700132052; x=1700736852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HV5054mOjXPysgzLzAHBZv684t7YWG4P8qLQ4tHTVvo=;
        b=dLqBtjFMBQSDGZQj1nf0DOSrLg2eQXa6HsvgXr727V6CmIeI5A/RfGQn14CliuOQrn
         QKftlVNevMWyLEa3w5fBR50OFYhHGlMfC4PTiKE5tRUF1l7S53WCfsMlYYQTTE6h2gLG
         ML2CidJrgymbgvs6Vo4B82xhbNfsuGyPVO4cc56zVAG0G7m+DAXuF0z+N5AcIlg6kpQz
         j7/Bh8v6Tg/8lwgFwmqKHTIh2kikiHiCyrFwV45eHuipqaka6G/tLAewMdq4qR4VEST5
         ecvMuCp3nHtM4BpHCnFNPaDS5pKAjmVg8nOM6y6DuA1Ojqt9nGtEhXQsPwWl2+M01QO0
         daWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700132052; x=1700736852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HV5054mOjXPysgzLzAHBZv684t7YWG4P8qLQ4tHTVvo=;
        b=vl8VjBhbvRekAr5SPrrwxleVFayaznoKQfnA0ET/ugmOuiWLOKtU7A3VeWZowzS21k
         in/5wTl46/V15zNJiROBgyk3aoKGCb7rWFeW+jYmBB95JD9vBt2B1lbh8wUE44AMUyM3
         gpBSvniot/0UKEKv4MeoxuhKUk0RJt4bEgra/ih2gea3TZiRJVLEul+82UcVPlZG8CVU
         uGI0jx2w1aoNqnRebdiWKPv44ftGBb33m039msJSNjsOwO2tDPEikDcV3VDezYudcZWN
         s5JLi8rRjh8J1XXm102/TPIn/TqABfwAO7ouiegAlBhAgDgG1SVHo++vSFGO/I1nEOJj
         hdzw==
X-Gm-Message-State: AOJu0Ywnq6QgS0/qK+jCwJnT1QA7E6JEwPbRM9Hk6ug7BtRNvxhjuvrL
	GkTdCl0MVGa7qAqxkvQf1cqfZfFj+wUFVg==
X-Google-Smtp-Source: AGHT+IH2jD/NOLBd2FGQRjGKBw657ePpcs+HjIFf3EM7HFJxa2Vl08F/I6fgqsT1xJJR/2xZDCllSw==
X-Received: by 2002:aa7:d49a:0:b0:533:97c:8414 with SMTP id b26-20020aa7d49a000000b00533097c8414mr12665617edr.7.1700132051796;
        Thu, 16 Nov 2023 02:54:11 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id n16-20020a5099d0000000b005454b6d4e22sm7653301edb.64.2023.11.16.02.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:54:11 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libsigc++-2.0: upgrade 2.10.7 -> 2.12.1
Date: Thu, 16 Nov 2023 13:54:02 +0300
Message-Id: <20231116105402.650329-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 10:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106811

Changelog:

https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/2.10/libsigc++-2.10.8.changes
https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/2.12/libsigc++-2.12.0.changes
https://ftp.fau.de/gnome/sources/libsigc++/2.12/libsigc++-2.12.1.changes

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{libsigc++-2.0_2.10.7.bb => libsigc++-2.0_2.12.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.7.bb => libsigc++-2.0_2.12.1.bb} (73%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
similarity index 73%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
index 84494b8ac..b2eb5dd09 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d082a2ce72c750f66b1a415abe3e852df2eae1e8af53010f4ac2ea261a478832"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.12/libsigc++-${PV}.tar.xz"
+SRC_URI[sha256sum] = "a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.25.1


