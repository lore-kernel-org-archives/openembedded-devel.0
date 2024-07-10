Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00A3C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 07:10:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.8367.1720595421440272813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 00:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIXd6Ls/;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7523f0870cso739165266b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 00:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720595420; x=1721200220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWE7T6kJfsakA6tUiE7vxUE2VfIcDA62WqVzhmrgOGk=;
        b=bIXd6Ls/1BgJLr1O+QKdnV868eSdz72W22ZT0jw168fJn5Ck4huu6+bCp3epPDbOSu
         nipP9UALqfrBep19lUrf1658gc2JKT6eX/40Ft4BPtpFAuQoezOQ7JbFPNiOitGrgGhp
         Dol8c1AgCEPIhuxkQFf/PwlcgjCrit+kZiHZP5Qdbwz+yGfe27lC+WilziqKbwZ48gba
         j4oR7V7ULGyqBC4JnWZALYIQvSEi8CDmiPpo0EDlRJ+rHz/g6+OdbN/C7pSz2/WZDou0
         1wrkRie8tRl/t1cBCSo8JDNrkmtmaHIppsgqyyd+sLiY8dGjkNzc9QitiqAQKRWa8/s7
         Hxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720595420; x=1721200220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWE7T6kJfsakA6tUiE7vxUE2VfIcDA62WqVzhmrgOGk=;
        b=QdmAbUDajEHZea0NzBFo5/DeamKtr0ZehO69+qCkWYjZUVUgUbdtU4Nae4WJBtIBaS
         pm8zYGaDVCM7lbdcDJlUAc2uFfU8hnf8h3sDyBsSv/jUOhDHn5XpD+9rHvBJiEvgpF8r
         qgyjjmzO7SLo8++jjHBZYSgc2s2MDBWfxy7KsV5R+s1dOFrwDioH8LafYWcUe9ssKSrG
         OPlI43yflyQ+eX3nP8TetVc5/5BbJM01h0swIr5O84itTE9D7C/fRcDmyOmf4R61LPYv
         QEOocuf8JdIZ+ZUTNBXBVPQIG1WM5jm/y+fKhZC/Qjupwg9+tUEhI+faByEBIJBJsxPM
         1lKw==
X-Gm-Message-State: AOJu0YxJKFDXLOHDK1HHp4lhpsJukD4T/0yMrb2/7rx7t+DdY47FVhXf
	LqODswiNLTc272iz9ZXdvZolOGkZWzI8gTFVCXdo64I7IrZqjZNbXPBRWw==
X-Google-Smtp-Source: AGHT+IEuWa85/1iNeMpZQ7hN3djmvf+POEAMD0+zqB6QzsZPkOBZKeH7ff9qBZjKH4kJwUD74cUjfQ==
X-Received: by 2002:a17:906:384b:b0:a77:b664:c078 with SMTP id a640c23a62f3a-a780b6b1935mr299818166b.27.1720595419793;
        Wed, 10 Jul 2024 00:10:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a730394sm136412766b.95.2024.07.10.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 00:10:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] bolt: package systemd_system_unitdir correctly
Date: Wed, 10 Jul 2024 09:10:16 +0200
Message-ID: <20240710071016.64569-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710071016.64569-1-martin.jansa@gmail.com>
References: <20240710071016.64569-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111292

* ${libdir}/systemd doesn't work on multilib builds, where libdir might be something
  else than ${nonarch_base_libdir}

  fixes:
  ERROR: QA Issue: lib32-bolt: Files/directories were installed but not shipped in any package:
    /usr/lib/systemd
    /usr/lib/systemd/system
    /usr/lib/systemd/system/bolt.service

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
index 4688ae860b..c278a0982a 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -18,5 +18,5 @@ inherit cmake pkgconfig meson features_check
 
 FILES:${PN} += "${datadir}/dbus-1/* \
                 ${datadir}/polkit-1/* \
-                ${libdir}/systemd/* \
-               "
+                ${systemd_system_unitdir} \
+"
-- 
2.45.2


