Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11794.1795762950972518358
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DWDyZi1h;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1574443c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762950; x=1796367750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qiJ7uFkfORfCwTMe+cqup3W4yZeUS2tbw+t2T12dUI=;
        b=DWDyZi1hgQfiFsu/pXDtFjyxWeuvYV0TVgkqp8K7a1uHOVlJUzStjBKutcSrDip5Qf
         xn8H0k2tYpGqnkdIaKhtXEnjkvuT6kx6ExDoLv7GeNnCtCaHJK7gMwG+Nm8+Boci/F28
         V5ANx8ntq1Uxjq0XvhmVACg/OCibEsrzJeKb2AoVpa8RzWVwNOdd52DHQIkmuEe5CxPi
         mOOktTd+MmC9Jhd2Q11OytiVb+mW8VFO3MJJcWin2wwPavItR60XcxDC6RdlfS+dw2uh
         FEwcfdMNBwqTIMAz+JUpJhyX+LuRBiDscOIbriN1L/FspijH4Yn5CfKwrohnp6ASQnlc
         TaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762950; x=1796367750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qiJ7uFkfORfCwTMe+cqup3W4yZeUS2tbw+t2T12dUI=;
        b=Szv7AcsXh8nudAzi6QbpkvP4LQlF+zJNjmo0TFbYyTT0v95Qjod+sYieTeMyYcR8dS
         LdKqJNm1xicQnTt7HzJOwCRbJTd+sEMk7QR5lejLlBxadQIjD2XvnuK9gRKYGUWAA1i+
         9yrQZplQbdriAuMydNdKz5+qTVc4/yBOyabveZk0NdlKFuA+FspiBXPJAxUgXDtucSDD
         8YiInazYAaDBSRRP0rXTVxU2dtRaceYr2g3JyBg51WmlEG6O5NcpB7/YX982M7iNOlDv
         TcTz1NRsLjK/AaCjYm+JNvndKY8W+N+y/AJ0U7RfwwhqempxCdEji0aXiwAa/3VSe5ti
         2vMQ==
X-Gm-Message-State: APuU4Z9VGRDrd3P6QRiKlSN9hkwK2qmdgCgm6iETGer7ROTj9qMvxFW5
	N4LfBTYFSXVLyDbebyNY8QarxmAnMS5ndU7GXmvfr4SowE1SFTjaDeVVfoShPbah
X-Gm-Gg: AZFdTZdHSzC7sWKVJ3nFEamPsoolu3hQjJe/jPUbbAYAtNdMs7vL2zVbeSrIGpTW3rC
	Id7JuDDOADJLagSaDQIMb4R3P65MgCgQLw8vwoTaFImSynLDRQk7oVAAbAc223LHtrQG9cAHXS2
	Q6uy0LV3qWp4ULMd4OmYi3GfPE9Bgs5cmi/Z5xweK17UcGsExHF+Pz8h8g5wxH1P2LmMrduKjHv
	emCxd73vq/YfdX8uPBaQjUWL/wqf6EJZXCI0aAB46H54aNgj8kGt8tDWsZabdnV05Fqkl6lRCtH
	1R/TbL9V5jrxlIl7VZAwdmUJNQ51MsDWzu64Spti1Gtckzxfsv+WK6zKdUCoO01tE/3B9QRzlua
	3qhlHMaM62r4XAhR1R0oCTwSiLNtsGqjyCPyoLpE4bA+0xvawxmCf4fn4xub363rxj5VHuAcg4k
	jBtztPoZCcWuLg5ML0CTQTkzbVoBt9AXXlIaFOQ944vehVK7PJViVR0+CEXv00kj5b4AyH6Bsue
	Rs2oKdd/1BhEDqT3xQFYBT/SICT6vUlo8QoY5IDdelPQ3+XW4IfFiyaOfxackSM4XPS4YLKIm4I
	s+cY5HuGYGXR42NKoPg0URHTZxjx2gLqY/qBMUF/kDaJCpSKtWFUVHTs6NxiQvl05d4RaO0v7gz
	r/I3ReBlnidBncOYlbaRXf6QOwDWcY7luGMie5vqCkJSF9WHaSlcmz+wZs6X6+wM04r/pqvG/Le
	nxqRvUiX/zCC9Uz/sD/8+1eR+XGURm1xUT8pSKBEMTUbOe6SvhJhJplINDk4WNCmiT7FoZNh+ht
	WCNvaq/fwQWIprRA5soPhBSabOfjvPCVxtUAlmTuKEa4hl5KzTQChmLTw+WGPIYRqYlotBp4yF9
	Nl2l
X-Received: by 2002:a05:7022:6988:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b55689f5dbmr30467632c88.10.1795762950261;
        Thu, 26 Nov 2026 23:02:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 14/21] gnome-control-center: upgrade 51.1 -> 51.2.1
Date: Thu, 26 Nov 2026 23:02:02 -0800
Message-ID: <20261127070211.2329979-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133341
Content-Type: text/plain; charset="utf-8"

Fixes for the Apps (parental controls), Global Shortcuts, Mobile
Networks, Notifications, Power and Thunderbolt panels, plus translation
updates. 51.2.1 only removes an accidentally added translatable string.

Recipe: the sysroot meson option patch still applies unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...me-control-center_51.1.bb => gnome-control-center_51.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_51.1.bb => gnome-control-center_51.2.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.2.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.2.1.bb
index d9f6423693..116c3b3893 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_51.2.1.bb
@@ -40,7 +40,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd"
 
 SRC_URI = "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1054976c2f1977f770ba134b872f547c89db7005e4422f09a96d521379c083cb"
+SRC_URI[sha256sum] = "6dab67eab50ec842ae55c797b180b853b8a8d3f0292cf4325a081fbb5b75ffc1"
 
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
