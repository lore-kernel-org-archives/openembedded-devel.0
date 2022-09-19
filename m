Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FD7ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.19184.1663590827455554512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X81m3m1t;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id ml1so21702729qvb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=j/FXDWoRhOSxeYtfLRPtRaqEUj8TQyeDdypyrtjL9ac=;
        b=X81m3m1t8eYMgMrq3/gCn3tHUVFdp7XFAajXjj/RHeQ3MQpr35Rw78tKYGUsuzIFsV
         Vnozrp+vcGWgxd1+DY22o0+GjzM1eEBXgcsLYntq/iMCQvM7CgUzyAJzpVnMrFNLszCC
         SfnXX7Xd1oPUfU5erF5QYVsTeVGY/w6RTaxr7JqmQ+M7tkEm+C3+SdyVqZLoJoX9AgC+
         cpXO+Z1nsoyK0S6YD0x/lFsqsFoBtSiQCOe0+1vv2pW09OtcSYFjggUI+1WC/tSaZzy2
         1mR8uWQ7/nKbuStHqTkSNXMK7w+YuglXEhv0AxyPFJm/AlLA5I1Ahbf1zwF5OlnLCAQl
         QmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j/FXDWoRhOSxeYtfLRPtRaqEUj8TQyeDdypyrtjL9ac=;
        b=iHJEsyK3zCl7CDDXv7wlGYfJi5ll2OrUaeRJip2suzWUdN3PGC/RnFPDx4uc6d5tek
         PylD8j97ctF2vf1+r1Eiyg1q5UhIQIf+KV/mYQzFAI7GpE+jbpcKPqpr/iFAnGdU02bt
         byF5IC+foBwHxYQ4viEOF+iTTnDQhG8bwBb2jJre3Hi8Z/7YyRo3amtrz2NnUSlaBGh0
         LENg64jw0uptYUHJeXxuR90zthbfSzSCLQz/ZHSv3yp0yegXg8n+E1+FGZ1lHQisgZDH
         p7rK9Fi3vX/BsptrGRnFRsIs/hyra3VyxWqgs76baDbVkb9m+lR6ww+PYS7za2h7K53V
         3y6g==
X-Gm-Message-State: ACrzQf3RNAv2op5vTNENnkwHbTvAHeMEOYOPm+N1r2YE8l7tewsigMGJ
	loKJrc+pdQ+Jsgg7c8isoelJboJI48o=
X-Google-Smtp-Source: 
 AMsMyM4caM5t77102PCQkDWlI3gZvO0EwRTiYpHAfHoTu8/4qexSGkgm3pcuNV/vmFOknWay0M9WdA==
X-Received: by 2002:a05:6214:1c4b:b0:4aa:b3a6:976b with SMTP id
 if11-20020a0562141c4b00b004aab3a6976bmr14075933qvb.81.1663590826203;
        Mon, 19 Sep 2022 05:33:46 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 03/11] wireguard-tools: Add a new package for wg-quick
Date: Mon, 19 Sep 2022 08:33:30 -0400
Message-Id: 
 <d230d1178f22fab3529c7eac3c438513c04b954e.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98854

From: Jose Quaresma <quaresma.jose@gmail.com>

- This will move the dependencie of bash to wg-quick

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f36a158aa0b6dc5d595c08f33733f889a7202b36)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireguard/wireguard-tools_1.0.20210914.bb      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 0c686aae2a..20435338c3 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -16,11 +16,19 @@ do_install () {
         install
 }
 
+PACKAGES += "${PN}-wg-quick"
+
 FILES:${PN} = " \
+    ${bindir}/wg \
     ${sysconfdir} \
+"
+FILES:${PN}-wg-quick = " \
+    ${bindir}/wg-quick \
     ${systemd_system_unitdir} \
-    ${bindir} \
 "
 
-RDEPENDS:${PN} = "bash"
-RRECOMMENDS:${PN} = "kernel-module-wireguard"
+RDEPENDS:${PN}-wg-quick = "${PN} bash"
+RRECOMMENDS:${PN} = " \
+    kernel-module-wireguard \
+    ${PN}-wg-quick \
+    "
-- 
2.25.1


