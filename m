Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A1CAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:49 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.9703.1758801826662768805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Phnjq+3T;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b256c8ca246so171765366b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801825; x=1759406625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7PQi7/rNyDeaXufPFlmR5Kw3lIrlzL+ZqqwvD9R8CM=;
        b=Phnjq+3TWlxcPwS8jErMBmbkGD7GlNB4OdP4R2jJ3GmF6ABN/08yvtywT5cuHF/UBf
         41zPAqFvjXyfdUFGZxbzEhmmpu3Pgq0KhzE/zpsAIAqd2/Uum2QtIXf9yJIXyBDBjkz3
         6DNjK/GDczHx/xqRov/r4Q9mvy+ig8m61mE2J6Yh6PfKRCe6VaNkVH2bdRYmSCMapZ/f
         WabU8U8vKsykNTAvyVZBSVtforIg9EfpRYGYhtBveHAvlZQKGxeX6XjUDfEUrxDZhiYi
         3sXc47G/DD0k4PtaNYw5dzoVRRAwNYBl3uXB3Zq55VX+ZelfuEVZNChhiQUWGTNxXFeh
         lfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801825; x=1759406625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7PQi7/rNyDeaXufPFlmR5Kw3lIrlzL+ZqqwvD9R8CM=;
        b=jHHFwNqMmf7xOVDg2ZzomRfhxRnHGEhI+QWDBxMBHTm+zozpCsqgAyxbWf43/1uQ7x
         3qUXrgqUBjMAAqY7gKP+8O5+zEedW4OqL3Sy9mA++bqjGkGboY50kRQOrB31n4+rhyJ0
         PEa8Orw4TuA1j57SjEz8ienpCLmBm3MmPKE+xG8oIpb5K5Qq/v7yBP+PhcCfASMMyrmT
         5nilrFfjBp/bFkQ/E2H02b0rPJZYpEIvBx8xsmWLWxDPcjl48GCvVyM4mL+XQ2hZ0fBS
         YMn/VhfJ7IVlDnAycTFTPQ+CjPQzBpBGd3GY8dOjmHJAHCMLNYtdj1ggZQemX8LEHGLD
         GSJg==
X-Gm-Message-State: AOJu0Yzpe4ZzGq5dO31bnU7qf/yeSiejlj/XBE2bUuXXdYEfycUgfi+t
	ki5Or9/WDeSSBXAOJOuXTjuABaEFH0FFGmsU4crtESu/wCjgJLjbLEfa7Db7PVqW
X-Gm-Gg: ASbGncvsAovTjhjCOnzrXnbu3sNyCcdNd7N/ZyrlCsaZK8ZbHcH7UEirnymrrPl+vU5
	xz3636zE/DCtG1Nsa3Xzorv1D6eJMua6ofQL6M8tUXbxQdYDTq05nbSJvwaqhbaxEQpmKzQ1UGn
	T+Q3Q9FNvM4I4goCTTTXaU+D4bJBTtPL1NcvCcrUoB/rJ6XEtSWfdQYSl+1Z/hcOdq/qgPpbxyX
	qbOdsA1dOxqCDP+CWZRByODeaHqUBIeGeunprtT120TCi5Q9a+vgr5P8ONuKj1Cq47se14t9gNd
	bUnYEB7uBcsNPPj4MoFfk/VUdna5c9DSGuzizGLsxOnUi/Fwb4/3F/TP1AtfRngBQ4MQ/ecYE71
	JxRnZRRb9LL5C9ez2JIzmWtl3bkos3RU=
X-Google-Smtp-Source: AGHT+IFesXU+IZE4mfMrKUXcFh+INjMZyJQLyUD/Ps8Cvw5tUCugYgIa3udmwZY2beHu9IbLJyhiow==
X-Received: by 2002:a17:906:c108:b0:b17:ec4a:4f2f with SMTP id a640c23a62f3a-b34bb700989mr379116966b.27.1758801824845;
        Thu, 25 Sep 2025 05:03:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 04/21] ibus: missing installed file w/ gtk2 PACKAGECONFIG
Date: Thu, 25 Sep 2025 14:03:16 +0200
Message-ID: <20250925120334.1670367-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119864

In case gtk2 PACKAGECONFIG is enabled, do_package task fails
with the following error:

ERROR: ibus-1.5.26-r0 do_package: QA Issue: ibus: Files/directories were installed but not shipped in any package:
  /usr/lib/gtk-2.0/2.10.0/immodules/im-ibus.so

This patch adds the missing folder to the FILES variable.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c87c5d5614bf5d5255e031abe32ea681968a6d75)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index 141341e341..479498d82f 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -30,6 +30,7 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/GConf \
     ${datadir}/glib-2.0 \
+    ${libdir}/gtk-2.0 \
     ${libdir}/gtk-3.0 \
     ${libdir}/gtk-4.0 \
     ${systemd_user_unitdir} \

