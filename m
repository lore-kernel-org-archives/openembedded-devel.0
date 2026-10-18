Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0042CCCF2D4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:20 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9882.1792302971038867321
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VNF6qmvj;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2302891eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qgg6/ACGPzBIY72WLOfz1JnMVHjVXKIxV6R7cZXxfQ=;
        b=VNF6qmvjF8VXgq4h4bAQM/dTFj/rLd0L1woRwA+oHxPeuddrzSqfx5EiBcfaFXDl60
         JT9jeFJW1/N9iVaLOz1fzTUNd5jQj321hIYLV1eOPOLbOkyVIXZkvRZoshVjg1IpaU6i
         btvxV0T6xd7tE4qR2C+jbsX2ZtBv3e8eCDxyc61ZvoK9tQwXSdL4xtRlBc2BY/FOxYoz
         P2pFM/68r9qpjQ3eawYFgyZ0lkEHey/ynVsCCsH+GJQPFkoJA6oNdm+ffCHZHEJwbpZr
         n81AzU6gbqrZYQbxxpNhZAJu3rbHCXM7KefjIaEpzR5reagb9kaj/2jtqDvLSTGMu82n
         MVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Qgg6/ACGPzBIY72WLOfz1JnMVHjVXKIxV6R7cZXxfQ=;
        b=EhN7Yh2tAOmd4KxGXGezTVj49K6xNmAPy9Z3noTplVcHsQbvLRJEYFonOiVib+h5Z9
         Vc3tYfnB4j1OMuEoFY1dD2pIvad0A5ltfxWlmcyel2vcV79IopOlRUepOziD4I968VKa
         Lh5L7MvAF7VTK82wdQJFDvC00DYGE15zfY/eXfY4I7vb1pRtpZIb+PfOskUtZD56CGDE
         u1FgjiXVFe+FTp4BocAfTlJ07VPaOq2kRzIe4jbnqqJ+vU3Io9Vr613enlUhY5TNgh2n
         QIetbCCIKhSj0azsiZmqn/k/QRs7Ap0cu+cpXxgfeQPRUUlw1xVBuHAx6lnKWg0tYai9
         8t4g==
X-Gm-Message-State: AFq9FYLPqmiCEDhtNTPHeEdVgarA1ZA9LZ5wIP+PI9KaHRsLP0pfMl+z
	4wavd92C0xgN5LEpoB28pEmIkMbnXAoe1ht8UVCu2W26U85X9pxaclUBxSg0KULIM3o=
X-Gm-Gg: AYBFou1/gatYPvzhHxTi8RexRaDTMe6jx4ecazOA5Jzn8v3kLsE6uPhZtJ/kWbxdqT6
	ujtG9895dxPjFHyneJxaMmHZlQDlWz6A7DqD48ZearWiNFOcywIRtf30irh+OM5WlycQ5Pd2Na5
	korRZkyzaoLgY+lh8aeGBjtk0N9OkvJqWmcwEGVxXoELMg0E5xa8jOueVz1NYPVqT9n298z1lMm
	MELyAtD/ZSFB17r8pX5BP07Gt4x3FfEwJdvRV0vydGs7NNghb/AH6w9r/dg8Zqm+59zy4+Dr7IM
	zDh6uxN3CdFzM80TGim0jtwk/wLgTm7Zmsy70nwQ3AqEOKRsP2N2sw1VdN36uGSZXVscF+z85o/
	Mvz6Gm/TffP3hDi27phew7wjpQ1XsLwbaqXPU5gQogir0oc7OzJb+Auixcgz5i1g44DuCYinJ9a
	mwRM9lfF4grY5GxGEVy35EJfMVfIC1IS6gZYcW4Yt+x7CqKEmTLLcYKo2cHfQGT/ekTNj88IsT2
	/6rXvhl8zwXBDNUvsn4dQgO7Kr7iDuYcDYfSIGxH2uWuG4kHUFdYWRGGs9HVK3zrQdOni/DDRDq
	4nnecP1X57gkbNEhvLtxTeXnHLTFnDEHSxW+mhQ9eIMwUYC2UngA+IhPfsNxucIrqpKLyQ/gTc8
	jIv52URj3J5vwj5bSANlwnrfM/SoYH9NzLr9Oq+L8Cl3zUcY37G4B+XcmrJVoGbU8mcs1lOZ8go
	ea9pf0iFS+g3mkZn0ij8/IldPs676PIKb7fYSpr/bb0uA4Uw==
X-Received: by 2002:a05:7301:4242:b0:353:599e:4f8f with SMTP id 5a478bee46e88-361a2644656mr6367862eec.29.1792302970121;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 02/11] tcmu-runner: Make tcmalloc support a PACKAGECONFIG
Date: Sat, 17 Oct 2026 22:55:29 -0700
Message-ID: <20261018055605.179605-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131084

gperftools is incompatible with mips, riscv32 and riscv64, which made
tcmu-runner unbuildable there. Make tcmalloc an optional PACKAGECONFIG,
enabled by default, and disable it on those architectures.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
index 3643f87cd3..3a61b92630 100644
--- a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.2.bb
@@ -15,16 +15,20 @@ SRC_URI = "git://github.com/open-iscsi/tcmu-runner.git;protocol=https;branch=mai
 
 inherit cmake pkgconfig systemd
 
-DEPENDS = "gtk4 libnl gperftools glib-2.0-native"
+DEPENDS = "gtk4 libnl glib-2.0-native"
 
 EXTRA_OECMAKE = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
 		 -Dwith-rbd=false \
 		 -Dwith-glfs=false \
                 "
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} tcmalloc"
+PACKAGECONFIG:remove:mipsarch = "tcmalloc"
+PACKAGECONFIG:remove:riscv32 = "tcmalloc"
+PACKAGECONFIG:remove:riscv64 = "tcmalloc"
 
 PACKAGECONFIG[systemd] = "-DSUPPORT_SYSTEMD=ON,,"
+PACKAGECONFIG[tcmalloc] = "-Dwith-tcmalloc=ON,-Dwith-tcmalloc=OFF,gperftools"
 
 SYSTEMD_SERVICE:${PN} = "tcmu-runner.service"
 SYSTEMD_AUTO_ENABLE = "enable"

