Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC47C001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 10:59:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.29834.1690541952602657593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 03:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TYd0zAoU;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so2567637a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690541951; x=1691146751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4C0fU+wrqoEdk7GtRS/XecQWhItdA7EGYLiCFOaZ0Y=;
        b=TYd0zAoUdExM6BiEv6HKtNPBHZWu+KQC9atfnZoipXz1gNJj8mdFYamzUFIWZoI9zl
         nGFbrx+H4iMoC4BD23nM0s17t5h9qYGsHTEoXjRe2ckpbOAoEHiqypD/JLjiNMVmCGdM
         O0NTu+r+tCrZGX7ENoZg9g+ZQ6jFX/i0qcSu1/Y0weB1FHZ05nw9w3MsznFVnEOs+J8j
         bGryZZmC/r2I2bzaJ4EDrgpulcMlMl7LczhZXgYVr9Py5EYo7SnLIUu6ExwE1ZaMKRLx
         s7GgXpvmgBL1RhqKKG5iIvYsMiOwZ0xWevuw/VvBhBbCB8SnUJrN+JHaHhOmwffUKvaN
         MhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690541951; x=1691146751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4C0fU+wrqoEdk7GtRS/XecQWhItdA7EGYLiCFOaZ0Y=;
        b=hqRGi9blDaFz/dPZgKxwgfdDF79BWv5qeCLcJEr3JD9M8rxk//6zc8lywLrPBaLXh3
         P+zBrRGudRa7J+v2YT9k82OinKs5CkVlVfNfj1CVO38cyTvmq17BUzebETmmUN9gWGKi
         Gksa8hxdl9snf1pN35F0vF9GVyMKYF0OfZVfzE6n/C7jY4djT0qHbZytXm6eQV7eGolF
         EHyh6+/EwgA7mxbPNDVghqJnZIqGExQsE4anJHy3DAv9rFewKw5q2XgRtJseqDhfQRz7
         lBdVAWs7BmVpVUFmbouFa5bGWnhkBgW+BK4PIhT7Pd2niYIhqt7b8kMzg8UsuY3Xf5QK
         uEMA==
X-Gm-Message-State: ABy/qLZfJkGqA/KIkMVcNq9jhCNvEpx8Od5JxyTOGcU6Y2VeFvZPne8t
	akksJh04mWbqLefltgoKg6H18IAKDYY=
X-Google-Smtp-Source: APBJJlE9Shx0mrJ5vTa9VT6gdAmVyWnEUCHf+DVr/EqtkvHNDCWw4QjJXjXGKPyiyx41Z8YlUHD5Ig==
X-Received: by 2002:a05:6402:883:b0:522:2061:bc84 with SMTP id e3-20020a056402088300b005222061bc84mr1655463edy.24.1690541950688;
        Fri, 28 Jul 2023 03:59:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id g13-20020a50ee0d000000b0052279f773e3sm1647582eds.32.2023.07.28.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 03:59:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libadwaita: move recipe to oe-core
Date: Fri, 28 Jul 2023 12:59:06 +0200
Message-Id: <20230728105906.1234434-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 10:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104069

As required by latest epiphany.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libadwaita/libadwaita_1.3.3.bb            | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
deleted file mode 100644
index c0eff35e4..000000000
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Building blocks for modern GNOME applications"
-LICENSE="LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-GNOMEBASEBUILDCLASS = "meson"
-
-DEPENDS = " \
-    gtk4 \
-"
-
-inherit gnomebase gobject-introspection gtk-doc vala features_check
-
-SRC_URI[archive.sha256sum] = "3fb9f6f8f570e543ab2dafb8b4b94d8b376c59ad565efadfede44557e3f3a9e1"
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-GTKDOC_MESON_OPTION = 'gtk_doc'
-
-PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
-
-FILES:${PN} += "${datadir}/metainfo"
-- 
2.30.2


