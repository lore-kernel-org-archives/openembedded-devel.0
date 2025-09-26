Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67541CAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.18553.1758896381971966604
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h89TNq8G;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-634c01ca9dcso789155a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896380; x=1759501180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpef25AX1vpkOA5ZBPsC984B61mZDVt/bZaYFW0qR8s=;
        b=h89TNq8GoCnitlOYGAa3hZqKDBkB9KmsXdrsfR1yQdTM2HGPGkAXYBjaFELXLObDcV
         YNP9TRUZczxA6HOSPeYs4V9ep+dptFfHzMdgov+JepzWxTwZfgjh9EyZhbTwGGzDYPzz
         JtdpfVHBI6OpdzMKzMEaTmSXJiBX/LGw0w7xXbCTzCtq2nwTmNL5v/YwNKHC0VgnyRUd
         im+oOZC7mKYxrMn/buPa3FzgG4H/eGB5BXy7Mxa/M0FbwcIF2H9aGpyZqgm6EVM9zWNi
         WcHQim9UUpi7EwomL2th8+6fjktn59KzDUPfMzp4oP7isd16yZ97LpJ/S7a4qmfCowjp
         dImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896380; x=1759501180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpef25AX1vpkOA5ZBPsC984B61mZDVt/bZaYFW0qR8s=;
        b=FwAeyr9r23EQLi6GXE9uifHb8DCFg+AgggBddm2pzRDYo4q+p82SPrFGLNjP/4M9v0
         TB7qm025W05hiX+5OPAnW/oa2L/k9dansY9NIYYmtnLMqG3wv7K0mWwgqYzuGKk3uSV/
         OyygCk7LvzoNgJ9JQhj+MAFKK+F6zMq2ftIyUqZZDjIPnfxZ2pqgKQGsFF3mtQQoqjgo
         bl9zzh5LPkAE2BYuR1IbvRCKkVs+YO8yqlafpUmVueHeKzAbB/5rVwSJMX1iLDqt8P84
         ll9UYcg78FCTzKOuJ3Di59Zqy0P0rPNLCT7mN2qDI5DZwe0Fq3pQjWuAK6gVcpU4h7Lv
         O37A==
X-Gm-Message-State: AOJu0Yyc0Zjub7zaGoD6fMXGDBoPDFH1CZlVa94ccAkgNX9twq8t604K
	cejYzwvu3EIH+C2YzzpaocXtr8rRfNEoZQ5pKMMBiADT55TAlGMt9bS+8pgySQ==
X-Gm-Gg: ASbGncsQELeLGvTvdDg23tXDQaO5fDRzxGXiqznzdbpYUkUEOwmFS2rQYg8V7moAOlU
	ofUfRPcakyFwMmq3rWddcffIdMtnimpkeWZ/kGZWW+z4N6ZFaPEg6uZub6Zm8isL6pV5CkkBtY2
	D2soNu5mVH5thZd8Lcx3Ofbfgwx06KRiyTwb3P66kBFEalzpIUOBlj93BHCyiG6u4CiUCA/FBXO
	wqzR5nC7vedtBl75H3nRhGC3BiSybIkeCOnfmWRGnzmcWrNyq2vysapL0/4pD4KasTwQh5ekOsU
	zCOAvyz1PEXd3G+BHtOtuQvQLeuPcRfRidj6prP1u3Yy504afscPrTCgVE4vF5SB9yJXfNboMv/
	3yFS+LFS/KGsGM33geaxr
X-Google-Smtp-Source: AGHT+IFx9us9aSDm/hQh7GYTfD6mikRtzKK8pOWfPKEAxUc50yhfHZAWsBIMGHxZk/g4LVylfyYZqA==
X-Received: by 2002:aa7:d319:0:b0:631:f2c5:100b with SMTP id 4fb4d7f45d1cf-6349f9cb7f4mr5005714a12.2.1758896380190;
        Fri, 26 Sep 2025 07:19:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 19/20] devecot: set dovecot.conf file mode with chmod
Date: Fri, 26 Sep 2025 16:19:18 +0200
Message-ID: <20250926141919.2010846-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119928

From: Yi Zhao <yi.zhao@windriver.com>

The touch command doesn't support file mode setting. Set it with chmod.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b306f382f4cf133308c7eb4b056a755f5bc4c96)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index d8c483191f..451edef9a0 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -55,7 +55,8 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install:append () {
     install -d 755 ${D}/etc/dovecot
-    touch 644 ${D}/etc/dovecot/dovecot.conf
+    touch ${D}/etc/dovecot/dovecot.conf
+    chmod 644 ${D}/etc/dovecot/dovecot.conf
     install -m 0644 ${WORKDIR}/dovecot.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service

