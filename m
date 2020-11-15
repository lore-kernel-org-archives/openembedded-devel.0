Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.24075.1605468288743754565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 11:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bKFPO6QT;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id q5so11332938pfk.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 11:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=prpoiO6LYvZpAJ1W/ftfSZ7fLaWoRu7Z8MYJTypkNfk=;
        b=bKFPO6QTgphPDVVzgrEamCQCMGEZyFPt+mZbORh9HnBDHuAZz7SKUe8NSiIlbmNQdh
         9BEITjDWJClo6LhzQjybrAk7UQ1pdUujBD1EqhiZd9/vDnMGdP3OqNh4n/dRTBzqatsS
         vXbYvMDXtCUXcllQoW/8zDjLtB7fYdA3WOaZzBDAxF0GJcifUihok+nG2LVyYaHz9LTW
         zXN2M8RaRS5Je+c0Vy0D/bDqTtheCRIcQ0rajUbcEbEd7+XXWAQPj2Wsac57fEACp9Lw
         6ItbEdZCRCW1neFF/5RQszJr4A9eNokAuJ0phFPIgp/M1JE9WrnfggMdmY7tzIp/V9jz
         2YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=prpoiO6LYvZpAJ1W/ftfSZ7fLaWoRu7Z8MYJTypkNfk=;
        b=FfYQVZow4Q5QY8zy5bKM5rCkvS4GRW/3LAOht9lAc9z54uiPFapbZYc4pRHmGHOkIy
         cQ7pqbP7L98xjosFa5/2x7Kmu1d7sh2Ey0FHHGCGvUmcd1yVeZf3uU//+cMWy0a1rhYc
         I/794qtdhEL01mCSKNfNlqIvtsnTNLsB5+usGnGmBZ+GR60H01hbgSe1L+HhjQLu7K7y
         Og88v6K91a1SaoZCW5qJmA5BGZTmMUM2PNr1NGklPCtaDtz2mEKjib5XQEWF9EtdhVRG
         3YSv/48q7MzpnoxeuLmpJOELTNkJ0IvoQAb2O6Ic0O+d58qFQHDlmFA4FuRAc8buWgJU
         bbSg==
X-Gm-Message-State: AOAM5321z+BoV4CvH5Koifob9xMPpYj4K3mg+/qThe+3PFZXYYq+Viic
	ZpNq/XKbw1K2+GV2BHEfjijeYgGL7WYBNg==
X-Google-Smtp-Source: ABdhPJxNhm43t2EhoA+GGQpCqyalOh7K5eWDjE1Ilit83Q1a+dcDhlw1YD0uMlwWBPak0sUWMBR2RA==
X-Received: by 2002:a17:90a:d184:: with SMTP id fu4mr11204614pjb.173.1605468287966;
        Sun, 15 Nov 2020 11:24:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s5sm15610987pfh.164.2020.11.15.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 11:24:47 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ntopng: Link with libatomic on rv32
Date: Sun, 15 Nov 2020 11:24:44 -0800
Message-Id: <20201115192444.2736184-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build errors e.g.
include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntopng/ntopng_4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
index bd2b99fab2..5961866515 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
@@ -28,6 +28,7 @@ export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
 
 LDFLAGS_append_mipsarch = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 inherit autotools-brokensep gettext systemd
 
 do_install_append() {
-- 
2.29.2

