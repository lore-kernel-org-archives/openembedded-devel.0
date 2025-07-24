Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73605C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 11:44:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7171.1753343537139279617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 00:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=dFC3pbE8;
 spf=pass (domain: munisense.com, ip: 209.85.218.44, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0df6f5758so102017366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1753343535; x=1753948335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLTYOqFjqzhtanrn7gZl9yU4UyRrzUN9VLTWi/I66aE=;
        b=dFC3pbE8EVueAVtDZn9PuU725CNLHBeMTZVOZCpL2Q+q4BmsvY6B65BZ4YLldkSAB+
         X31DMgrQRryWlFzgHRcAABf89i2VjYD04/I7XoIhYMiqnxkoG3flPKPSXYYhGChyd0SG
         oAPE4HB8s290pmmWQrVvFxqIcrCCHridUlATtBVEn8iOLvDN/AmZK6fOHYMIMFqebjP6
         /kMOyF9lZ2vF7uuR0oqANwIQjbLy/WfCyS02+1c05PKuR7u7x72m1tItlM0EWo0/o8CI
         t5/J8dsz1rvv3JMYh3z2RULOERLLWX1aeuX+u7OknHhJFN8+G43CDlgMdynxi1f3haa0
         qu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343535; x=1753948335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLTYOqFjqzhtanrn7gZl9yU4UyRrzUN9VLTWi/I66aE=;
        b=d4Vwz/x61LfDNRe8FrckPFIGPXB9CcoeE6dmQMnUb28pRigVy/tde3WLDgZ0C9kBll
         jIx9i7uugZsdudi/bkzOgKoSCh8x3O8wL6Rq/XaRTpvOzXWUQVJ/qYKZIo7jMMzNs5iU
         xH5Axya3SV5v4Rb9cpcS5t2L3HZfi0ePF0gp7defHdAub65oS0lV6zepM/gNjN2JRATJ
         J+N1hSG6lWRQEv9D7LZa9N31R5REY8CCl58b+NbR2MeXN/ChI5zDHwjUtniZb1yTgQbc
         I2+TB1vH3Pn9v4RL/kQiw084R7lz2Y0V/N7V+nuLIvN4gMzsxQ3HvPnk1d5xDWxpqvjX
         n/lA==
X-Gm-Message-State: AOJu0Yw9sWSFZMhSNbXCn68U2FW6W3tUKjG45h+sEt4pv+IezrG+fC/4
	QKgPhywseMmFJugzESTYGaDTdQCRBOo7b1218iZe6bv5KvRxrdqCIo3SkGG4Wc8CKFPIzt7OwwF
	9vnMd
X-Gm-Gg: ASbGncslhKRt5acesze2j/lq9KqxQWbwIMX0bYh+yHAaCgVCvuEcCOT7Ye8XWe2PB9h
	FzTQyOH2ebTAbTstG8d/48m14xJysAn5u31UkyWJ5STgPhsVciNrGyh8/ZF3fULHZUTnXJgCbmm
	7qw1JCVd1d+BDZynuw1NlTH5Uira8G9f3frVCP69glVmo1uWmPqoz86tIuug0fjiPMyJaT85rI6
	BEfLkMK9NXa+Oc+mQH+0C062YdSHH12TT82EE5/QPz/FpUo/tlEze+hPEYDTZCh0jGFpLclHeuT
	hdXPbdSyV69ubvMjJ62w3PJhS+6+viZDPDymOfRdl95nHbKCCo6c6yMplmJGyJuO6++yM85Nu7a
	XN1tt/NqQCz9AWs3z4WRJalPiak+VrYz5+D5Foil8kZyuWfWz59+FyCT067DRINrcyKJSxGJ8C4
	2fgJkzrdj6jGY=
X-Google-Smtp-Source: AGHT+IHfKDrNqyJrgvNmXJ0wKrkDZy0Kg64vgN1ZQTZDqq0rxuvv6AilCTxthl5QOoX/QG0mFLOJHQ==
X-Received: by 2002:a17:906:ef06:b0:ae0:686a:870f with SMTP id a640c23a62f3a-af2f6d1c7b0mr752323966b.15.1753343535022;
        Thu, 24 Jul 2025 00:52:15 -0700 (PDT)
Received: from gijs-peskens-ThinkPad-E16-Gen-2.office.munisense.net ([2a00:1708:3ba6:500:d8ad:daf3:2b96:abd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd0d1b03sm528375a12.5.2025.07.24.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:52:14 -0700 (PDT)
From: Gijs Peskens <gijs.peskens@munisense.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gijs Peskens <gijs@peskens.net>,
	Gijs Peskens <gijs.peskens@munisense.com>
Subject: [meta-oe][PATCH V2] php: fix removal of --with-zlib-dir configure option
Date: Thu, 24 Jul 2025 09:51:33 +0200
Message-ID: <20250724075132.86366-2-gijs.peskens@munisense.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 11:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118724

From: Gijs Peskens <gijs@peskens.net>

PHP has removed the --with-zlib-dir configure option since that is now
taken over by pkg-config, this breaks building PHP on Walnascar when zip
is enabled via PACKAGECONFIG.
So remove it.

Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
---
v2: Fix commit message

 meta-oe/recipes-devtools/php/php_8.4.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
index 4d598949a..4ed5d1e4f 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -110,7 +110,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
+PACKAGECONFIG[zip] = "--with-zip,,libzip"
 
 export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
2.43.0


