Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99718CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:04:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.9714.1758801841352299151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhbajlbV;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2ee3c13aa4so137988266b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801840; x=1759406640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSMwkG5YqV9HESi6IiNENH9GCLDy10ERW01tcFj/XZ0=;
        b=MhbajlbVNtFYo1qrz7rcZpoZtV7lYk+pnuiufKx039spZCj17Qa5fMm/SKrDblcCkv
         ax9w8B6TuyR7g2mRh+WpvCnc4QiGWstcA/E6j02ZU/36K+r2drrcBRILoPnqKy/vYgUg
         V2unkYiJx7qYCpW0bDI4sV/6Q4mKZEyaxI/fEn1MG7+Ycl0pI+709IDuh8c+AKS7VIno
         9tobqvq+rKnLqsDdtWWrkxFxT31BAiaMlH5S9kiFY/NdhD6m59eC/FvMkolBxyYyDpXv
         xDry+XsNzeonwiMxBJMwvgSH3SJA/+7aZIr/hJGoL96Vbj4/CCoJOvFOxII1kq2Ngous
         PJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801840; x=1759406640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSMwkG5YqV9HESi6IiNENH9GCLDy10ERW01tcFj/XZ0=;
        b=fs0QnlFDK1Wsr2LpvAkLua8FDJNLk2b9w5R8ZP3v3/62nsysmVE0G6lEakKi+Q86SQ
         RCf5s7Je52jUk9/YtYgTX9Kz0SYkLiLwW4QUzt9knuNHmZ+XhFZqqUX/Het6FJ7NFr/n
         dtFj3BR4l6GRxzhPx9+2AGNQgciqVVAwITg9Fm9EyK4IGhnhvxMX+oT55vX1MJqf6ck3
         bkjTt0VMO7jLTEpztP2Urg4hEdbuCsg/Tps5XLvbVBbu8reJdb3dsd4yCuN/Y85dN3Ed
         PGdlNziO3z/k5ijMOYdNX6umj5NseFfduOmdCJFY9T0dbjxRt1ad0QKe5Kaco6zRVxca
         IP2g==
X-Gm-Message-State: AOJu0YyOCcGBW4TabyeapZkoXL7uaG+7qP8cVJJplAkeaDDGW8JGh7ei
	jslxC6cCS7Jz64fWff+JOY8w/qvEAHJuH4BTe4PNDssZd2Z4ZtL/QSBELZx40UNa
X-Gm-Gg: ASbGncsM5tdSIqXHcGZPjKq1CLuuGWelqAPQcwXbPSIpP4siEzT5QmzlMi0ZcIVPVE+
	NoSaDXkpKMx5mb8zNijXUTd42L/YMeq16NUedRpoMyQLh0eLpcdJ4N8bprWLVwtjdXJUIEZT2ye
	cY0/hj0SgcLxBLKX29bZXU7ZRcYdYZQcz3howhXIC7xIUfdlj8D4ZeG/RGb76rCi3ponqWEBeNM
	aBkY4sb/5iYbXrG3A32ktErt/T45QGj/QKe+6pPZnNPKOBAp9QWSXgIr9bvtMAyARRjTU07wupK
	vZW8DTDdyFQv4tEdeaFuDyJ2diNg6G5+pQ80LyFSZSqYhdUy4G0F4TZEvSu/V/KALi9lNwshrcC
	zugsdPyTVIGbeLcXMGh36
X-Google-Smtp-Source: AGHT+IGaydmkwbCEQ6nqO/YrT7uaK934VeLKV2YMj6GSwjU5Sm7X+PCWdusVWTrIS3nb3UIS+aCsug==
X-Received: by 2002:a17:907:7248:b0:b33:a465:4d69 with SMTP id a640c23a62f3a-b34bde13596mr371900466b.36.1758801839535;
        Thu, 25 Sep 2025 05:03:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 20/21] dhcp-relay: dev subpackage conflicts with bind-dev
Date: Thu, 25 Sep 2025 14:03:32 +0200
Message-ID: <20250925120334.1670367-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119880

From: Zhang Xiao <xiao.zhang@windriver.com>

dhcp-relay contains a bundled bind thus their development packages
conflict each other.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93892e8413da230e14c70d20f0d46b513fdd8787)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 2fd86bc28a..d36646c0d7 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -60,3 +60,6 @@ do_install:append () {
 }
 
 PARALLEL_MAKE = ""
+
+# dhcp-relay contains a bundled "bind", thus their dev packages conflict each other
+RCONFLICTS:${PN}-dev = "bind-dev"

