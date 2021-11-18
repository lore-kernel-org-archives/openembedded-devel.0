Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADBEC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 02:41:32 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web08.94.1637203291571391385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W40BiruN;
 spf=pass (domain: gmail.com, ip: 209.85.161.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id
 x1-20020a4aea01000000b002c296d82604so1841048ood.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WPJEtW2lfpiIwEH3TVFGQ3X8c1AUQMy9QdofpcwzNCw=;
        b=W40BiruNVX1lD5onXAK+rws9VQsXhum4RG7+hA/lCJ/G9Mb7Md8bdBNjhTdRaUaL3x
         KYI8y3k3oQ71Vcd17MHnc7JacjetyBzhArSssrNC5sQInr6868JV0oGaIousgnwJhlex
         YUYv5RNpXOxZPjZZk25DPa+JKMUNLDxQdlch6W9fDDDPtOiowoA/gdR04dIyfLXGTtgm
         K3XKHnP4dIeW9TRagRHY9kOaYLdJrSdEr2Dcr93DS3878Bc8i28SmNjqm9/e5LiYQAom
         hY0upWuOSmk9iuZConex8NFoaC01y22DyZ+A+hiAWDZu9Fs4ykwtlRlDfSY+sVaqdhox
         vI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WPJEtW2lfpiIwEH3TVFGQ3X8c1AUQMy9QdofpcwzNCw=;
        b=joNkgutOWg6C9x7wBvyEPtK7yPBn3Z2M+yEM7bGlprnkPPDqJnheXXKdjFkuw6ImtN
         lIhPdtNqNR6aPMQPuLS/urmviZmxzxR9ObHOMpzveedpmeWfjNUDsfsAsim8oCI+NnyU
         BO/nqnV5Fw7lXhFq0GihIRrwPLq3iOUjKpxDe/qrcoFz+J9fIhd+RtdO0d2kgWyT4elx
         lulhlH6C7aeOZvX6Ikqx3yb8fxWVf1kDi3KZJSrIOP7mgSSG4PnVnY/yGkAoNbne+jaz
         kpRp6JpDXTCKjliJJNSZuBYMSBh4hve3E2WoCrIKes8XiUEinF6gljJyZKEXIRVbYeOf
         ZWIg==
X-Gm-Message-State: AOAM533oJdDFSPTBH+V+Kr9yJ4k0g/czwyFN90t3KxpOX2qffg8/m3Nx
	dOLEcim/bqMNmjTSddpq2pO8ylREoaU=
X-Google-Smtp-Source: 
 ABdhPJx/bpVJ6K98kK5Gcv/k0lHoOJAFgUzKjLa5zl1DWYwRYg51d2pb+xthYj3+4KImiwiowt4s4w==
X-Received: by 2002:a4a:3511:: with SMTP id l17mr11241240ooa.74.1637203290651;
        Wed, 17 Nov 2021 18:41:30 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 r11sm377331oth.48.2021.11.17.18.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 18:41:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] gdm: introspection is not valid meson option
Date: Wed, 17 Nov 2021 20:41:28 -0600
Message-Id: <20211118024128.477249-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 02:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94013

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_41.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
index a485c0c9c..ac57b5bf2 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
@@ -11,6 +11,7 @@ DEPENDS = " \
 "
 
 REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit gobject-introspection-data"
+GIR_MESON_OPTION = ""
 
 GNOMEBASEBUILDCLASS = "meson"
 
-- 
2.33.0


