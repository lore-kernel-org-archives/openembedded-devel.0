Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DC4CAC5BE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.14110.1758625610984283504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mh8kVdrp;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b29e8a3e453so381796166b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625609; x=1759230409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UAdmmhR1C4cxhjqwdbJTZN1L6eZo/ph37/i0W5iP14=;
        b=Mh8kVdrpIU5gUboNWNNl/iV87jKRTj2ZqsUoqEU7YFGe0dVrivt6x2dMvOp6B0NI9c
         +oN66Ur71a1QdeYT3mgldzfJmCajeMQ1qr1wGCuQUv7Lmk9ZpApKw93qviNF2g/RMuZL
         tXeP+ES3l/LDp7gTdbGjE4fJe7sFIBB5GwlGrSZju+WPF6uok636kcCKry5lCQcbs1u+
         Nmhmd3lj88LemxojCHob8eH43st6xyXV2ub0vCk2Ml5BVctdslhO66rX1S/m5pyqbza6
         F2kctnvI3v2ilk7wprqnj+aQxFUOs4Btl6Oo/rAfQKz+a8HODFJ43Zw/ewV22dW4EJqY
         Nz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625609; x=1759230409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UAdmmhR1C4cxhjqwdbJTZN1L6eZo/ph37/i0W5iP14=;
        b=EiB/HkeLOdQ0leJI6olG7LnJGC+oBsfTHAplh2N6Q940O6L4rui4pUFr7ZwkkSOv9I
         eEIvhr0bOkkDqB9zpl+zOj/LCA4mpzdK8FysH4HVGiGoXBaEC0CBcVkf5DVfye8Pu93S
         z2WK27Ejw6m8hzUxxvGn8LUxkt81ZagtNy26vimWKB8C4QRM3WlBULLTsaAdqP1hAPNB
         hd7YpoDmpI5h6eA1YkjLwfHLUIIuc/pgeQmbWb/4Ts2RdIr/ReNVtI/B9qKSFIEsXK1X
         c3LlMTlFSkoB8uARz/DcNhcfs+zfULmBtfM58tjle95Zkucwh6eA9K/dUjgbdZ/DpeHl
         tgkw==
X-Gm-Message-State: AOJu0YwglA0PHJJupPe4SOMFo9AhvMEmBkgARydJmjGPpBgOxhm9UVHc
	Pa0NJu0nzES8/p2OVLsXuW9sTa4CIR8+ccYhg8/NEDsqT9J0HwTb2hpb+k0MdQ==
X-Gm-Gg: ASbGncu5la3ptzQZmdcvdJ/TviWUqH0fw3N/k8OAoE/quI37tTfSVaL6UlHXHD+TVnM
	N9cMxkKQ8JRzMRRPLJbpZupmagreowHJ4ZsRC17WuCmXig+vU10+QCggX4ptoDornjVGwUtWVfW
	xSAyjPUfwDqtwYA650Cw45LIY0O/TOtEbo/zAFmFU1UrkeqgK1uQiTGeJfffCLhj/AQ830pWSAl
	yVWjcm+m//bkGEv+f3DHUu2e2dM9WVuLEHV4gFBOtPyQAdT8p7tZzS2B03tYtNuMPsxuZP4K6Zx
	XL6xePZpfWTksBYAFoQwvgLSjWWWbPmRlMW60etoNatIXqjuy0c/glJ6lJMYLgY7yQdroyURuS9
	+rCshpmL1fW5RdhcNSV7b
X-Google-Smtp-Source: AGHT+IHeKLhttwKYgrYlHN2eB9mw7ZQILLqgzmW3+SWeHRe14a4sx8HOpNzYhSD2Mh64kImyVuPpCQ==
X-Received: by 2002:a17:907:9404:b0:b04:67f3:890f with SMTP id a640c23a62f3a-b302ac28ca6mr213744966b.33.1758625609245;
        Tue, 23 Sep 2025 04:06:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 18/22] libtimezonemap: rename downloaded file name
Date: Tue, 23 Sep 2025 13:06:32 +0200
Message-ID: <20250923110636.3413021-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119682

From: Kai Kang <kai.kang@windriver.com>

Add parameter 'downloadfilename' to SRC_URI to keep the downloaded file
name as same as before.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 556b85216342b10510ac8230471e450086851a84)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index 00d66b418a..bafe7af040 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"

