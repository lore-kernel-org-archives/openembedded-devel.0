Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B35F3D330
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:28:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48286.1772728089514983992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 08:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fD6v8sgx;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48069a48629so86604475e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 08:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772728088; x=1773332888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/QxsuJl2UJoU2AbCnAL/Frv3xZLU/m9MaJhPn5HCg8=;
        b=fD6v8sgxPYaMymhUgdEIw/6UfLxhJG1BcEm28BKNYVVW4NCSr/Ncbh/t3RfOO87P5c
         Kduc5S3bZFvLqFm3tZQ0JYZoaSd1F/w+mo32u7Ojv3d2n+2bIgNpqtwu/doLCnFcsoyS
         Pc57/f7bftY3tf81BJpTxsgvpXOG3XIvev6VrvylQ5jioQOrVl+Y1z+FAtXA55GodN9/
         9+Pg31lK/ni41Gd8qKUNQ/1Y1u04b2c9hFnzjq4ccx2Lps2U7FdBTmTUvBpVqXu23zxn
         qKfhITqQqbrd+txROZZos25nSs3aWdAy6hwvZA3KwtBIayGmZDyxLCiTqzweoOG2yyit
         9qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728088; x=1773332888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/QxsuJl2UJoU2AbCnAL/Frv3xZLU/m9MaJhPn5HCg8=;
        b=fc7mPtK/26TjaAHuT2eaYyeEDLq74SKjajgBW7VfDG2TLGm4BgDLHGj+/KVW9lLJSD
         IMFTTNHW/WSPkNo9arZ7osm37LCyxEK9tZ58vBNwJEt53rczD1FxT8JvcCeIzhnBoBe+
         iC5HsGVhEXHpAJjAn+mMswkKd0vdiiRAv1mto59W7e1CZ39pQvYAdVWqgcau5J2ZzB7l
         +iUyfRhHP0ukFAyy2Jl2C1UEDtKr/JR96JBipdzr9QWWRvENasbwkMgZjWfKa4OsDW4b
         bR9PSYaDDXvMpgee8h8YoH3ZlOBUu6xvp5FuHTZQ1BknpNCHqjXmIKWM5QvkboQk8TRR
         dxdg==
X-Gm-Message-State: AOJu0YwrFYo9AAFVycfkjwHvdP7G+Vsz0xz3rJD84vhM7K0eQ8Iovdw6
	Sj8WCRyVdPxeXWpYAK+G452zd8UtnlXVE9LoY68Ru8hMCgb112yRXILEdol71w==
X-Gm-Gg: ATEYQzwUdM5Lr6j4L2ovLfoXzdmJLOvs16vGFvOUmz7i7i0lHopEPkcizAVp2YX2pOc
	aDCMNNYsgySG2/6Eu21u97QqE5m7AOItT9e6JQckt2rrxdHx5TVj01Apf9vyX0xWLgIylUSLtqk
	0cD8fnDLIVGnBZmJQsSCYeu1kcAC2lVlsqZqm22r2vrjjY/9LvLtUimTti7N73O2ncQ15iZlKvC
	JJ6w2Sh4H6rfoOif2L0XtIHRRo2hVJk6GhBpNyfy+LffQhwfhWpM2rZ0IPg1klsRpDOmp0jqTiw
	DP3v7nPEf+76SB7T1el9MPlG3v74JnmCbMSHvcfVu0rRWSClvEfNKkNLU4OSoTnRKK0bJtsQfHx
	YYb64PXpVOhY+8jnfY64wNDaxbij6YJkVdtk/yfKJz1SSzfNQ55jRu+683a3ZSiIjPfnBSCZWF1
	wVns943K8ER5xC0Jw25mWw
X-Received: by 2002:a05:600c:8b86:b0:483:3380:ca0c with SMTP id 5b1f17b1804b1-485198bf9f7mr131500045e9.35.1772728087692;
        Thu, 05 Mar 2026 08:28:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad02cfsm63860025e9.1.2026.03.05.08.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 2/3] spice: set CVE-2016-2150 status to fixed
Date: Thu,  5 Mar 2026 17:28:04 +0100
Message-ID: <20260305162805.3077054-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305162805.3077054-1-skandigraun@gmail.com>
References: <20260305162805.3077054-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 16:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124886

From: Peter Marko <peter.marko@siemens.com>

Debian has fixed this CVE with [1].
That patch is taken from [2].

.../tmp/work/core2-64-poky-linux/spice/0.15.2/git$ git describe 69628ea13
v0.13.1-190-g69628ea1
.../tmp/work/core2-64-poky-linux/spice/0.15.2/git$ git tag --contains 69628ea13
v0.13.2

[1] https://sources.debian.org/patches/spice/0.12.5-1%2Bdeb8u5/CVE-2016-2150/0002-improve-primary-surface-parameter-checks.patch/
[2] https://gitlab.freedesktop.org/spice/spice/-/commit/69628ea1375282cb7ca5b4dc4410e7aa67e0fc02

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e44f3251b552773fe9346fdf7aab244377cf6007)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 5e6d8584e3..7900a7dea5 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=htt
 S = "${WORKDIR}/git"
 
 CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
+CVE_STATUS[CVE-2016-2150] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
 
 inherit meson gettext python3native python3-dir pkgconfig

