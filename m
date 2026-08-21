Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8462EC5DF9A
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.701.1787335338419098571
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GmzR2ZzB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce98cb8165so13177025ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335338; x=1787940138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iffgd7pZFCJOxuulaVL9jzt4cBygjcrEUE5mE9vSV3w=;
        b=GmzR2ZzBFghHlL2X5XfZPxojHTkBz6ndXYDj7xGPM+VIoRasd5llYlLV8Eopur9KFQ
         IBeL7nDF/Huot07HlHMelizXA+HNP0QnC5J9809giq6Pi3DbT4KBP2ga35E26wtND88V
         IfuQzFtM0h2d2zO5k4NfG1Ag/oANvN0AKLwyWo/gfyylfk6VKNPvbHiG3PUAHp1YiULE
         8rffjDSSgLDlQykZ+A+qSFp5QidIMB7DDjK9NRJmTXJyfWCX9Pz7BRqpnjwm1+W+4Kj5
         KnSEma5Ul+QlFXqgFtk+/mG5P2f7CIKuxYtURAqap6FLSGOiD2lTJU0AFmBu3OhGUeZ8
         73JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335338; x=1787940138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iffgd7pZFCJOxuulaVL9jzt4cBygjcrEUE5mE9vSV3w=;
        b=Riz3Ih5djVJ/6SBMmt6PqJ0ylWA7FOotzyvFSF9fQNfXhp1fFrGQctXm/A++uB0PJG
         vKtYC2fhV8vnceqmRzS/QwkBw8rv1J+RhYhr9JEdme/f7CbA19yTFRVxPvVsA/m5s3Vt
         nsh8r1A6wDfmuXHQ2Q+kZlGv/KP+MNcr+DHUUJlues87y6tRts0Aov0iL+7eT20gh3dJ
         LSdEJFFP+Bht+zWynHR1ii0M6V54uEHzAubftKJ55kJIiyqKbHOsUG7+jThz0ggm1PTM
         s2PRvTNd/XogvlAI0RdahhWQVJqKtzesJoPa+7ZgMo9vg6n53a8ccXRDKBMPwN4CjzH3
         u2iQ==
X-Gm-Message-State: AFuF++mRx/XYFimIXylPui/HTs/40IQUftc96waqlPHjr8S1wtijiknA
	sq0Nrgts+xjM7eFXqWHOVibKC+3nn7fecJR69x+7oPYezzlupr8cHJFv2t8d3iOo
X-Gm-Gg: AR+sD10iDLfgUIG1DsVcJ7J/QurPKqo8DplDCuUmKpi1xrOpBgY3YHKgZCL3s2C9BL6
	4OpSMf/kx2Xe8yB+w8ChgRQLdmYka+aK/zSWnzrqygkoOEucxfZTf/vvoyKdY3P7sbdbfGPaJ8O
	OcEKz8bIoyOsUoqUZ8fuxGrdYM0QmiXj4HeNybfQ7m8CX7JiWqK+ufHYn5/JHD5ZuwOFnf3UJz6
	tB5MGqe+iiLNwDWbYaKKZfCemt0j49GaLTWsnIUjjWgyha6hAlZDTncXIEB2iXqq/HCC5327/Qh
	VDVjLBBG/eZaMGz2ynCXt5sl8t6MTocjE2vSYxVAwPjJIORY+shPnorJkhL8A3Di9XuB+HkjYOC
	Ji+c9D703ZX+WjyvScPLE8tw3uNQPKpk0EfYGAC85t98Gf4xrDmhzNwVX++QXma03dCQ8QnpOuG
	gDvQHCEyuCMiLUONsy++4/Fn5u4fLwgouwMpS/5qO/WnB6NapFcPnUoHef5fbhQ3sn8UyEDmZR6
	2dkI9pS0r6coXU54O8DvvWlB2tLddqiQ14GvOSGMpBcRqLOYGZtCZAkD/oXc306UBC6/CK/kGOJ
	Ll6Hq5YiIaiDleWWVDd2t3KYzFEL8nbPQB95p9rjFCBf5JCwoZLqSOQku0UNr1Ak2zkeiuT2jcS
	pUOlUn9wtbV7HoG0SVl4+8vj9LTM5XJL0jnJy0M/pJ5pLzg==
X-Received: by 2002:a17:902:ce0d:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2d619d47dfamr197114105ad.0.1787335337780;
        Fri, 21 Aug 2026 11:02:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/9] fwupd: use VIRTUAL-RUNTIME_dbus for ptest RDEPENDS
Date: Fri, 21 Aug 2026 11:02:04 -0700
Message-ID: <20260821180211.423633-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129426

From: Khem Raj <raj.khem@gmail.com>

Same problem as xdg-dbus-proxy: the hardcoded "dbus" RDEPENDS makes
meta-oe-image-ptest-fwupd fail do_rootfs on a distro whose
VIRTUAL-RUNTIME_dbus is dbus-broker, since dbus-broker RCONFLICTS with
the dbus provided by dbus-1 while systemd requires dbus-broker.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
index c144a52156..bab444be7e 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
@@ -81,7 +81,7 @@ FILES:${PN} += "\

 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
-RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3 dbus"
+RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3 ${VIRTUAL-RUNTIME_dbus}"

 # ESP mounting, not strictly necessary
 RRECOMMENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'udisks2', '', d)}"

