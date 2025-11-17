Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C59ACEBF92
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:24 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11105.1763391141488949171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJXuVgdB;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787ff3f462bso51077997b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391140; x=1763995940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft+s/Dyt/YrxhxT9BYEGizNPjVyyaWlGXSew4jIpz24=;
        b=eJXuVgdB8KHR49ixU16GAy/7rLn/OFpWcn09ZFVxxlEljLB2bM9c1CpLUhAMXuXCiG
         qP2X7qiAy91LOGUh8n7EBQGxQNcEOEn1aICIlRZG7qTvHJEcF2cPGHjhQY2GK9zE4Ops
         iq05vngAmBe7Tu51LhRzgfVyOz2wGzmF249dzjgoJveofxC3DIcisTUOiD2G9T5+K4jy
         xUpYYYLVE+Vh7v5GDJjZLYl43DaPQ3WUT2rTyt4ndmEfGxlwmmnZu/aOagH1d//A9CBi
         7KBZqunE+X4LhF+DZY0kT89NXJOZVZZMMM/wxN5Ms3qHA5JVgp1sQ0wHK93eBdy6qExX
         RLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391140; x=1763995940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ft+s/Dyt/YrxhxT9BYEGizNPjVyyaWlGXSew4jIpz24=;
        b=Z7oyqZCyi8BI46726NwCXKvF2u2Kyy/8rZktOQ4LV6PSCRIKslQwbLRXafiWxQfnWc
         VLJOSGh5nV0JD2bMAKg8IgES+njYJbwUV9jqotRQ1P7zA/ui2+Ewj7BhBFlLARaj6oM3
         MjcT6FN69a4lPOBSiBvUrgH2XcLCg+/L5jwxum6fOi+Bs7uJhsT6aCGneRqTuMhuAe0Y
         XIgtIfupH40tSUGr25MGPMt/zdMNzBwTXrOmh3FHHVX/fpRmt6DXQYA+F89QhNJ3IBGC
         /ZtWH455QzA9fo1PVZW8gKT/OpF8HQg/O85CFZ6McwIl6S8yJJZlbb5MHkTyUDa4KuG5
         82Zw==
X-Gm-Message-State: AOJu0YzS+TOxw3W/0i6+WXm6TkCB1oUgg13R0qp5JUMs0hDsyM3K5N8h
	Ia9taOhCoT7I+2IFVFBZiWFF0qv5VMJnhl1E6RhcDxDqPnsIzFyWzn2LypZyNg1/
X-Gm-Gg: ASbGncuH3FguWJ82EIZhtbVCbO/K5l8IRUHJMH9ALbsWO0dAWlXGeS5mhmbPe4+ShU3
	0UUr6F4w2rFO2UjIF6gk/tHjJckTPReaqJvktZcfHTMFrh6PbjDLg90F0DtdJ38CmFdrXAkd3Iw
	Hgqdp5rrfkhdAb7HC++eFnOo7N+cadsrXynfbs3rORZGfV+bH169KLau6k3rOSUYvyR3Pca1iDc
	+ug9qHiV39XoLpZz/5pSG5Y1b4evEIEz2s7bRbNsTlHt6pQpKADz+OhQuEA62XYWa6x3gawRxfe
	Pxg8EcbklSm1dYJymEQ8ruchoJWR2OsODHWRw8S1oMDxX44yD3q8iOOgVRClcqLW0yHoznbx1Mu
	mDGI6S1xFwuP1LUf9POPf+f/GjMZ7ih+n1Cm3O4tfoE7ro/m7bAT09JnsnRNpWYs7OHSwDar2Pw
	9PVGw7w92wXBQE8gJMBSrF2l50TlWA+i1fXySyrYEQvWIn
X-Google-Smtp-Source: AGHT+IGTXCo16waD/P+SUd/ZZeEjhyb27uLadDAV596X9E8WZg2Ps3ysCpSLiZN4ML2jxrxAoyLxkw==
X-Received: by 2002:a05:690e:12c2:b0:641:f5bc:692c with SMTP id 956f58d0204a3-641f5bc6e69mr6763673d50.37.1763391140082;
        Mon, 17 Nov 2025 06:52:20 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de2bcesm42904227b3.6.2025.11.17.06.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:52:19 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/5] xfce4-panel-profiles: upgrade 1.0.14 -> 1.0.15
Date: Mon, 17 Nov 2025 09:51:33 -0500
Message-ID: <20251117145136.132886-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117145136.132886-1-schonm@gmail.com>
References: <20251117145136.132886-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 14:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121781

Add a HOMEPAGE while we are here.

Changelog: https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/tags/xfce4-panel-profiles-1.0.15

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...panel-profiles_1.0.14.bb => xfce4-panel-profiles_1.0.15.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.14.bb => xfce4-panel-profiles_1.0.15.bb} (82%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb
similarity index 82%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb
index 38f6eb6ebc..7eeaf80a67 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Backup, restore, import, and export panel layouts"
+HOMEPAGE = "https://docs.xfce.org/apps/xfce4-panel-profiles/start"
 SECTION = "x11/application"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
@@ -10,7 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "6d08354e8c44d4b0370150809c1ed601d09c8b488b68986477260609a78be3f9"
+SRC_URI[sha256sum] = "56cce1a27e88a18a282d568cbc601547a5dd704f0449a75bc284f0171aebaf3b"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.43.0


