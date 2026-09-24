Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071DDC98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 00:38:56 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1321.1790210328379522518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 17:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P1Aq/9q0;
 spf=pass (domain: gmail.com, ip: 74.125.229.12, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664e050bso1968997eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 17:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790210328; x=1790815128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjQykB4YEuPZKw+YxpSeJr5MiI2VOBwzOAdIF/cHyVs=;
        b=P1Aq/9q0lZwSDSwLoJJyOlIWgf8iKoyVlJwEJemn0M/MRwLwR/N9E155Dl8V1zrftW
         BzsyDAS3h3qZgctH6YN2Tb7HwW/MC/f6ol27lZoXUbxofiGGj/KLQtznvHNqJSMjMO9R
         I4XJRJ1vbCogitUP8G592QbglcomlOfSVx9Mb3R8D2ywhkaRmutCeo3cPAxc/l1cTKpj
         YVu+tKIJwU1xGf07BpI754OQKIFpLGhBSMPhvzBwBu4F6uvmRVnz5GdWeKIXzl0O9sp7
         +Lo6OgfiDgxjrU8AoNMwqLVdvmMEQsV13lzRll5o/YjmGE/GJySgFx00YpRTF4rK5n8b
         Cj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790210328; x=1790815128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjQykB4YEuPZKw+YxpSeJr5MiI2VOBwzOAdIF/cHyVs=;
        b=o89AJVQOL4CQzlWtisSaAvuq8pNLx6aXm5v6eqTyoUv8xDxLblPptl9HWDhok1YcKg
         prb8qXTkM4h3qhlTl+rvjyc3DysHBHRq/tgxSWyRh+B6wFrpEN/vMQZ/C1eYA334ZbuI
         efAUeHfsmqbiEYTmT4o7XyCzWvEtJQAx0R2b53FNRzVZUG5FTZ8SRF28kH0lgN6oncur
         8cmiK4oPenKQI8UpeggvNY/Qco1aN27h2f63m7zRvRtvQ6tMTEnjMsHS1400zj6srrsl
         f/gxG4gijD64KqE7piJpTCVz03pJU4Xkh/WyFb01tWz+eskvibL9AHnIUrVriCyIMVFL
         /vcg==
X-Gm-Message-State: AFuF++k9ppgfDhMC5abqqK6UOgVNl8sk+SpHyG0rleSR583yabvimtuP
	Wpn+TbJDquxNFLZ/2sYA+dSLQlSsBdIi4P0Kk/zjEAodOkkT/y/hH+H6KROjG9SW
X-Gm-Gg: AYBFou3uRq10UU15VXeC/gTKHyb7eGWRhHNYQPb4QAIUttawdiJjsVzjc7xuD2I2d8x
	OwABUWFBnU5KH9SGddrujDoAtUfGniT8XePIyx0iXsxkhYYCY9D1I3pK7+YfSEqKNg5TPDqzfTl
	tmkRgCYAsIhbwlLKxlwfBj/vNhuzj6LXWCPmrd6Jx+zDuyzlovkmfi29g0aaWmC/d9TAZR0T4FW
	UPl/HsDpMPw5s8uCI6NCyJlGkImiTjcPu2SVjDpwL4e2oGSC8/KeXFG28giQtmnNRue50c7uAlf
	aYa25w5X6cRy4l77LWVflculKWvA0qOQTRSzy9Ne/i6sd1RvvUFDs0Lr9k8tvufJ73d+qWsuCaU
	x9XxG6Ywu/FzW0aSARgonZznH5nZe/8NP/8DsyODwIC+jez2hS19Bi3MX0s7FyhdM+/KCQL4F1P
	vZ7q/MlbXSkuA+qTf46BiE1XOcseOzgp2hd47jrF8HlTPuYTMq6yE+IsRnTMg4zTyQ1Zuu1aRnZ
	pP0CkFFIzaZP/q8irv4cTxh8MDwpJVJrsNhPjFVQhZTaVN7WesI0DTni8q+JJWj7VvJKNhTgcSE
	U1pEfj/QGxMf3kyY5bFIBhUgj23DrbtsGblPhijdGndqXoTgehc1czmI1JTXXp3S/2ZhHYqmQHC
	bh6sHuZpoOgWD+BVtY7vdYFalemUATfh84jInZod4yLqszgWSAdTL53nfleM3vQrycn3bUr2eff
	LJIhGuyodVHQNYcemu9Fjbm0IxpZBPCww18ouHCw==
X-Received: by 2002:a05:693c:8213:b0:33b:e842:d272 with SMTP id 5a478bee46e88-3400151f7e8mr608454eec.5.1790210327631;
        Wed, 23 Sep 2026 17:38:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm8106622eec.30.2026.09.23.17.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:38:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 2/2] libxfce4util: remove bundled vapigen.m4
Date: Wed, 23 Sep 2026 17:38:41 -0700
Message-ID: <20260924003841.1113450-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924003841.1113450-1-khem.raj@oss.qualcomm.com>
References: <20260924003841.1113450-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 00:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130246

Commit c175507f1c ("classes/vala: remove obsolete logic") in oe-core
dropped the removal of vapigen.m4 bundled with sources.

The copy shipped in the libxfce4util tarball does not prefix the paths
it reads from vapigen.pc with PKG_CONFIG_SYSROOT_DIR, and since it is
found first via AC_CONFIG_MACRO_DIRS([m4]) it takes precedence over the
one from vala. VAPIGEN and VAPIGEN_MAKEFILE then point to the build
host, libxfce4util-1.0.vapi is never generated and do_install fails in
install-vapiDATA.

Remove it so that the one shipped by vala is used instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
index 22f1ec28c3..44a4308899 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.1.bb
@@ -7,4 +7,9 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"

 inherit xfce gtk-doc gobject-introspection vala

+do_configure:prepend() {
+    # Remove vapigen.m4 bundled with sources so that the one shipped by vala is used instead.
+    rm -f ${S}/m4/vapigen.m4
+}
+
 SRC_URI[sha256sum] = "84bfc4daab9e466193540c3665eee42b2cf4d24e3f38fc3e8d1e0a2bebe3b8f1"

