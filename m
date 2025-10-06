Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D7ECCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:30 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.37408.1759765947264501180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTkjFnAe;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-77fac63ba26so25262167b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765946; x=1760370746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjN6xqpmWeGvMB2Umh9/LObBeAxwgN654eoVZM5+5cY=;
        b=RTkjFnAemGxYwbKdooGfA5hvhXmuiln+tIcC64hrkeK+JGvqjT9jo0I5fQ8XM/XCrE
         3LwP8DL5WtmwFnGyKdkyqdG2XRp8Fg25anXV7AmlgCIqtfxQjXd3SzEpXFB25zABDYph
         mbfMF4IsjqpnZi16fNfl/biIbzOFhaHUkhjSjKnXrQloHA1ALLEKgy31XPI6ZaS6LyVs
         dmyNcXzCi9DWE4UvJRmlZAsVOwx8jz5MdGf73VGpITrGZZe9mOCoBJAkE+6OLw1Gjbhb
         Lnt/gxGFVr4MpV3Q4yklYeQ7xaOXI9pZCfj6AOPCx1lpScaacVrHyKLj/c72HNpB4GRg
         qUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765946; x=1760370746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjN6xqpmWeGvMB2Umh9/LObBeAxwgN654eoVZM5+5cY=;
        b=UbsO0xZtcFwB1lcBeO+p2Qceq3kRWQoIbX1tqU1IMX//Cr7faeAM6ffL2YsBKO96vE
         +2vMxZgwClDMm/XgzqvkFsRHXIJYQAtrHcUrNu6NeDb0AQzrYTVOsvYCF0HmatxKXNBK
         2bmci45OIsYWBLQ5uGXIZtvRPrVIDiHl/eds9p2YyQCAJ6D4oCHshb8gb/F1PklcK98f
         wwkBqxQfj+fhk2rx2hYRuPKgh+qBjmU7zQrLJSzKw+Tn+zeCUdS6KlQaAhKVb0E0Htig
         XhrOZYJuv9Gx8kGE0xLgDHLFgnKzyMNkicvHz5PkHwupMGeIWC1FblpnPRYACWEbXvjN
         enIw==
X-Gm-Message-State: AOJu0YyHkOt7LW3jU9hCQ6d0oKDQhY2G2ySdU1Ft4e43CfyH5gV0qbYm
	dNTkt8U8VmDULi5UXjC162Jfd5hTigUH5/3G18+cdGVy11sKyO+Q3uaMPETedO5m
X-Gm-Gg: ASbGncsbzKz1iy8usYp1GEjCZrN0IeCBNtIVSnUi3Y2Z2NsxWIH+spI+9Zgqn7MUGiI
	wV4Q8UvKMcHW1y1p5XdRYmbQtYe/e8CGQVIk8CGuo8wTknJjR/gZ8rjufKPmeEr0lc9aOQQHwd3
	Gxj3Nm+RXo1EwApQJmMKHi+KGtzwu63SEh61P6hKy3OvdYjb4okVkuMOjCEo3rSHkA+0EFNFSrt
	5PC2jQgq7vJmAXo5atNJViZGDtLWepyXI9uNYqyBQgbd/iJeUHFZw+xmB2WI8jX4vDKS09HmnQH
	iAflS12/e25tqjC3jhGrj/pn/BcczxBW+7JpNol1b/4VH6j75OTKQEElreF7ii8WO/pqRULh1Qy
	Nj1F1blSCk+zX0hTA+dvhryA9bdanrudZg8VgQy3AzTkFgKDWMnaNkmN9FyPgUTE=
X-Google-Smtp-Source: AGHT+IFHSp2xtExXv2K+n1u/Q85FNPzqlj0QuTDjPIQkVbRD5rJ80Dmg4/e1vJZhzwMZWkWLI90pHg==
X-Received: by 2002:a05:690c:9a13:b0:772:72d1:15bd with SMTP id 00721157ae682-77f946f4ca9mr167046207b3.44.1759765945897;
        Mon, 06 Oct 2025 08:52:25 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:25 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 10/10] xfce4-xkb-plugin: upgrade 0.8.2 -> 0.9.0
Date: Mon,  6 Oct 2025 11:51:46 -0400
Message-ID: <20251006155146.416335-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120301

License-Change: Previously copyright by Alexander Iliev.  Now distributed under GPL 2

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin/-/tags/xfce4-xkb-plugin-0.9.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin/-/tags/xfce4-xkb-plugin-0.8.5
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin/-/tags/xfce4-xkb-plugin-0.8.4
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-xkb-plugin/-/tags/xfce4-xkb-plugin-0.8.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...{xfce4-xkb-plugin_0.8.2.bb => xfce4-xkb-plugin_0.9.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.2.bb => xfce4-xkb-plugin_0.9.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.9.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.9.0.bb
index 0e482af353..e33a596ee0 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.9.0.bb
@@ -2,11 +2,13 @@ SUMMARY = "XKB layout switching panel plug-in for the Xfce desktop environment"
 HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-xkb-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "bb4be13f6f73cd86a6d939e1a6b125841cf266415bc4fd134a511e4f0cf97967"
+SRC_URI[sha256sum] = "7cd7f3626ef39dc4ce142b2f96ab7583cbea84b4c0352fbc9c9667faac0bdd12"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.43.0


