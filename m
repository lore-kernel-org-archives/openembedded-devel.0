Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BFFC433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.25723.1651346336131202295
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7I4SIdJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so9868458pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vpExiuAAezFIXyEkao3C9M5uosVzHRKXOqeW/vVidmw=;
        b=A7I4SIdJXNzgotctR+sRX9WZ4bw/EZcMIfX/bNUgLxCW/J3Uk88HVshBwbvsPRju+a
         oWyeouomTpNRjW8auh9B82yLFV/Vt14tZx+LqODegoflJvNMA9XEddR3hyGp3cqNRYf1
         688QahsUHoJ9A6ZHbBHBq19V3cb/3hrjfSttkvE6hC2nUrHl2PxCZAxDGFqty8rlPAeb
         xwSIFHrTycoKbKcvvUKJFIIS2DxmcnEBoN/HyUIZZLtkhl72FFpCrQN4Qb0v+BK9JS/m
         WtTlilTrgrlVCnPmEhkl/2nLYjOf6e3zxAUWgq+9PTkzjCbv9Kod1+RJdXd6He7Mo4UC
         HqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpExiuAAezFIXyEkao3C9M5uosVzHRKXOqeW/vVidmw=;
        b=SItu9hIDLti7/TsfFyZVHH9DkMmt9S/7gk8t+N/Mg674uhv3h5lP0npMCSys8Crg9H
         l5nhPUA9cUZfeom+jghYpWQMZEtdkOfUugd+KTkmS4IDo+mOIPXo7Wn0Y7/qOW+HKjTB
         VRIefcKJAf/VGisaXejDS6SGC2e76y7tl19ojShZ0qmT87b7VFnnJbUpIuvfSZx0wKyY
         lBIe67yoUF8F1JtbQBoR80xPBDGXCFHZtD8enqt2AKtXAbr/sGV0nPnqIb+97kB8I6CP
         8QXYLeLUSZDwGvRFDdBF3eRO+0993qOakWf44bRfBJvcaH8nxX11gZgieTLVh4gkFj9g
         7xXQ==
X-Gm-Message-State: AOAM531LA+fblZBdX136ezXd3+UI3Fp4Ft6Px3M2cA//h0b1i5Dlwk2V
	oneJdgXKwitanyPfb9l8VLDGqcwIDHgUHA==
X-Google-Smtp-Source: 
 ABdhPJystSWVZuuXY2CCYAus+Oc6/+F3OjMcdbKA0saTc/kgpW7jY0iZFkPQ7xDajNLoxA3Mzr7F0g==
X-Received: by 2002:a17:902:c404:b0:15e:9607:667b with SMTP id
 k4-20020a170902c40400b0015e9607667bmr1598173plk.135.1651346335321;
        Sat, 30 Apr 2022 12:18:55 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 19/39] gtksourceview5: upgrade 5.4.0 -> 5.4.1
Date: Sat, 30 Apr 2022 12:17:59 -0700
Message-Id: 
 <639af811230bcbd26fbaf3a592ada4abf8e7ed97.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96886

From: wangmy <wangmy@fujitsu.com>

News in 5.4.1, 2022-04-21
-------------------------

 * Improved styling for style scheme preview widgets
 * Improved styling and positioning of completion windows
 * Improved styling for various style schemes
 * Unit test fixes
 * Hover assistants will no longer be showed if no providers
   completed successfully to add widgets
 * GtkSourceVimIMContext tries to handle various corner cases
   better with regards to reuse and being removed from an
   event controller or widget
 * GtkSourceCompletionCell has improved fast-paths for resetting
   cells to empty state when already empty
 * Improved sizing and placement of assistants including hover
   popovers, interactive tooltips, and completion windows
 * The overview map has improved it's fallback styling
 * The overview map will now properly update when the sourceview's
   right-margin-position changes
 * Fixes to vala.lang for regex detection
 * Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 98840e726d251e39e14f30c8107c238f12251213)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
index 51ff4c898a..3be392da81 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
@@ -25,7 +25,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobj
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "003bc217e670a8ec8aa3aece994b70e70b7d6b8074938adda21718555d84e637"
+SRC_URI[sha256sum] = "eb3584099cfa0adc9a0b1ede08def6320bd099e79e74a2d0aefb4057cd93d68e"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.25.1


