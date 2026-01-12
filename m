Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5045EC9EC89
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32343.1768222838603687766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 05:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BH0MN6jS;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso37200945e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222837; x=1768827637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFzENzq96GD96ZUL2QCbo83Y/kOd0Y39yg1PPta+Cag=;
        b=BH0MN6jS5nk+7yT4qy5T8sN3nizYGu9FkTQi0JIfrKw6k6vJsLv1PEdpfe7+cpvB19
         YsVHHwtnnFk0Q4nZQxxZuZoi65ADJFCiszTDEJQQ0kGeuQvo+L+wio6jsNFIj7IYgYWW
         UQKZQDrDYZw12OmDJ/FgBu/ohl2ANoJMaAtqusBmA+A/TABpwnLRcVG/VXfqjp1MTSe9
         uXgfKOxO9rFJNUaB4DIHZgZVfLQRu+t3YvnGU75/lB3RmBQpPqyj/8UbiuWu1hphm+f0
         /i2OkO8H/q57vfL9fMOQCuny0IGOcMc7uaTTerLcl/Wj+p2sRkhhXL0G4FuuI5dfamNW
         3Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222837; x=1768827637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFzENzq96GD96ZUL2QCbo83Y/kOd0Y39yg1PPta+Cag=;
        b=QzuC+Lo0OSg9rD85xB1t/J/Yoj8iQpoKJ33Et0W3NsDwFDxbxJdO7unw/sy5gDA779
         2Owuli94LRqYTwWTxHLSBRDM++SD1OMWMHhK1W26uz2A0vJ7sOlgmE1sXx1eBo4WovOb
         ELHymyqlBfXmLey32IjEbGXV0EJ8RxcXJw5l6wiB4FyZZ1/GEIiR+Yd7VmQdUVi5H09H
         7x36RcnIXfnMykLeOWDoAu35Y6Ou0/rKgcYiB8iOPEAlrLM5QkVkcdEgPsZ2d/07AmaY
         4IfeX1ra1BEythDguIw57j6ZE9vK0XCSeU+rcLKun85S1uZwob5uedSora+sZ5kuBK68
         6itA==
X-Gm-Message-State: AOJu0YzfiG+iBlOVxFHfPNaCBkyaDw0BdOtDgCizVBPzs9er6yIGUwIn
	pumpjrF6BE+3MszNVCQFnZL1CaBqaPiRNDpcsSSJG53sv6arnmIvOatmpeyBjQ==
X-Gm-Gg: AY/fxX6W8JarB7uxYnQV+9SP/PM/5+5Jpo4ZcPstvN3fewEGYs3gCI3vncIevn1Vut8
	BFYmS0u2gAREVt5g1kR3Dvu+dsBmDVgqkljpMOQegxjltb8eq6zPa05+EBmgYWxayad72ZbP9DI
	K9Zb5m3fWytFNRLBk8aZW92c+K7kOh9bDClP63pgIiAohpZVazEZoBlDa3HCd2/vUTgUYsWbqIj
	2/hB+vSIfMAtr0XMgYacAt76ljWexS4n91J1lugDLzvGM+CwyNgGCpN+WwcIZOGMC6EqvBujQ81
	F79bqdCqtL8cuAwdQ6RFXRQeiZTyuOyUFL4s0MyNnTYJg1qGfRFH20nZHZrv9KL7EN8atAmnruT
	UuC2LqkY4A+Ehj9irsaicrmGEC/0cERZi0/v17LYqTTnJAWHR8otsYhcRpQiIqRChFYOKc3Yx4a
	mk9IysKg55
X-Google-Smtp-Source: AGHT+IHVThVY+rpo+pDwagbfEzAG6guizcBjK9i3kLc4o3UWu3E+Da2oykQT4YPMpeA5JZSsm85wyg==
X-Received: by 2002:a05:600c:3114:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47d84b32f3fmr199750645e9.21.1768222836834;
        Mon, 12 Jan 2026 05:00:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695956sm363477295e9.6.2026.01.12.05.00.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:00:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-keyring: set CVE_PRODUCT
Date: Mon, 12 Jan 2026 14:00:02 +0100
Message-ID: <20260112130002.525598-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112130002.525598-1-skandigraun@gmail.com>
References: <20260112130002.525598-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 13:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123384

The underscores and hyphens in the product name are used randomly in the CVE
database:

sqlite> select * from PRODUCTs where vendor = 'gnome' and product like '%keyr%';
CVE-2012-3466|gnome|gnome-keyring|3.4.0|=||
CVE-2012-3466|gnome|gnome-keyring|3.4.1|=||
CVE-2012-6111|gnome|gnome_keyring|3.2|=||
CVE-2012-6111|gnome|gnome_keyring|3.4|=||
CVE-2018-19358|gnome|gnome-keyring|||3.28.2|<=
CVE-2018-20781|gnome|gnome_keyring|||3.27.2|<

Set CVE_PRODUCT so that both versions are matched.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
index e173199088..b723a0dd71 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
+CVE_PRODUCT = "gnome-keyring gnome_keyring"
+
 DEPENDS = " \
     glib-2.0-native \
     gtk+3 \

