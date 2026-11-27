Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11796.1795762947997257911
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XNzxUd6q;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so11426037c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762947; x=1796367747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg18JnDwnggmmVFot7Ume5S5QXDhqiproZxeBNO0VKw=;
        b=XNzxUd6qWpuuTMH25QrhgyCgSxZvDyBC7iOawryY1FuzSz2SslatHU3IBgIVNBe1sq
         8qPuxWK+QoPVGkms5q7xQ03a5r9XNyf+Ved/4OimWlmiTFnY656avLdsaata+d3pwRz2
         609XUhuLmVm7bYsEEeyF9rtpekfbX58RWbzdumoY1bIMk1+ZfDwQQwv1/SVLKBV6VUis
         EmzwLd9Mre3pvcKvS/AQffsnCkTDqAz5aVm9AmlntGHE9XIIyRhgZCNYGILh/AhWk+5C
         RTsw96L3PuuBcRmrBhLJm0T4jEoht5huNfOENW3VMd0WBxgrYXIzyAhe924xlDirVH1w
         JGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762947; x=1796367747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg18JnDwnggmmVFot7Ume5S5QXDhqiproZxeBNO0VKw=;
        b=BVANd/cKP63b6UtgJ6VF3fx7BnfXO2/T+Mlr/06E/w5xi2WM/VLlG1TomhwFWIwW7F
         0d7woKBRA/JY/FFADDOfj2YV/JYUe1NH9NwMl0TSMtJCh6HcAIXbJgghDXC0T13Lc7mS
         ax/jEQ8HktUfMC6qX0iCO84ZeZrXuHAU/2ktAsbzMicGISAGO01t0xL4zDikSSyj2e5w
         YUnnu/qBFkyAddZn/CGUKHgnNeCx/RseSFEIQKsOlHC0+72ioRY/8i9ykCS1jedXPxi+
         n1PV3d8XT7E/o6BsDENCtmsI4b/xBiLR43xOzJ2wNP34lpEYTl6iV00wJOL1VFgo+Ny6
         6klQ==
X-Gm-Message-State: APuU4Z/U/pYCUpmVaMtNCGZSHGvbX3oql2CweDp6tRLuDpPVDPQ4pWkT
	BxY+y8nOEaloOmxvvbnuHr36elPtbxfX+4JhrfgNUGeOnuTSr3E2zXiQooD/THSY
X-Gm-Gg: AZFdTZcSuRQMYm0WXUxLYcIAKVuFpT2tcult4bFwI1K9ocDkpRkLQjKd9QxLyoyezTW
	bBBqaUl/4VHF7MnFCJEawLHKPa5JGhKAEpoa0s7bvculGBUe65y7YbvvsSgtyajs+upbTWXM14P
	HkT8kLNOUQu4LwLussWy0Ygw3yebbiCHZ7hGtmoyPxMh+KNspRaHY5y8rPSBpNJycOVevVb/Ca4
	Ww3Tg9im4RZvNQUxqENrm0eMGipQ0S0+Q9pJm0pBWV+qEMJgweGfrCBgFM3cfCfPJbUYRy6KAZA
	uMv+2sZRJfOjm18qUUICm5ql6vnqisxZU3iQO17jCgLP7EOViY1LDINWwhuN77nPIfLBhHvyneT
	gv5pIkb1ELDQDrIMXpL/ltYhakoeTGYkK6pL3/e0EXmIpOyw0OYBcBI0rxc3ABGhECLPf460yV7
	ZDfGhXuNFtJeV5MAZtomo3U2olb0SMU9pTupN2RhpMaWIQcDM4Ae2ceAVkDS6X9nUbok29Twb5E
	OBt/eQhYbN9VS6Shyt60dM/wVsC3naOhorWcM9CAfhm8sPisGPrp8dLNsx+XRcUYC+NybcVZgHQ
	DYVoUh3+giyc4Di/+hF7nNmWVND8YOMQhaMNuqdQL/Ebvv96R79KynELENEZdHaqxU5YV7IApdm
	A6MCSCxHTPOGAIEAx0yFxpsD65vtG1qtgMLTkQEPuJe5McNfFM8zIW/ymtTiPXt9tv83lf+WV4S
	eGqQwotICZG+Yyu/I5khxddpSSS6Q8AKZpHMmhnZAs8zWJTiBLHbMAyU7kHoeGMV1m4EBEBMpGG
	O47TDsduUQterVSK/B79WD9SogJge53eVaWuD89DCxxZUdwTIJLxDk99soRu82GVcLgE0+mNW5z
	ZH2d
X-Received: by 2002:a05:7022:4099:b0:1b2:3e9b:3dcd with SMTP id a92af1059eb24-1b5568b2e59mr22210857c88.10.1795762947052;
        Thu, 26 Nov 2026 23:02:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 11/21] file-roller: upgrade 44.7 -> 44.8
Date: Thu, 26 Nov 2026 23:01:59 -0800
Message-ID: <20261127070211.2329979-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133338
Content-Type: text/plain; charset="utf-8"

Bug fixes: set a minimum size for windows, and fix an error when
extracting TAR archives with 7zip. Plus translation updates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../file-roller/{file-roller_44.7.bb => file-roller_44.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.7.bb => file-roller_44.8.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.8.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.8.bb
index c1ffe242cd..c51db427a1 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.8.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gobject-introspection gnome-help gettext upstream-version-is-even mime-xdg gtk-icon-cache features_check
 
-SRC_URI[archive.sha256sum] = "67cada96a2409c859f378e82fbe868b0e9c00a69e6b7b885d542c64ea2a1297d"
+SRC_URI[archive.sha256sum] = "40a560efe9fff957376fd92358580839acc79e2065addbf8491f7a14438c5755"
 
 UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/file-roller/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
