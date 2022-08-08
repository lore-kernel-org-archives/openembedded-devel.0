Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0841FC48BEA
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.25876.1659968709873341622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCnKjbaQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d20so8238631pfq.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t1dD6QJR+z2NswpNIM2DNa+2t1H+eixBapFca/TudEs=;
        b=aCnKjbaQFXBgBE2dT1aOQtRKeGJs0G+JNdkTwh2Uikx03XxX8Mz29KXvW70lvwU1mr
         CCuRV9lDv/JKz/G3qUEPGZfWcwxC8D9JJOFkb6FHVvgwQWJIqUXcFJxNu1GL0dfpMS3z
         rJ4+8aYA2zkjbO6tm9BX5wwwYqtx4HUixeAEOInbfoCuCzndmds5DU53qgFQV6V2OlE+
         6qC7oGCXoRvDEY91yIjYaa1UoeG3qPk484uJ2jj+J7WJ6CqaqB4sCxjJZ0jrNH9yNbPF
         sCBYZAfrhteMADu/bbx0kuaOn7qw2ZxLzIa8Zx8cSA+I+2puoHZy8MJxc7j0i42U9/sL
         nsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1dD6QJR+z2NswpNIM2DNa+2t1H+eixBapFca/TudEs=;
        b=yapq53VzzQ4c8MdRtKxExYXGNVtNEoS+rit/9xAhJjZsX5UW14DaqNm49/7us9eDwd
         /XbMHqETDR0WlGMpgoR6Y6B4t/wPoAhwLrqTynv2A6MRG3LEwXu/8+84dnhl4F7G4lHG
         iDO4Hz/k4pR3KMPYLv9HEwGXSlOORqanvqjFeUfKAdeslTkfCz0j1C2sQrcZx8MmqVf/
         RSFFw24bOXCy2tYG59tAzhYp7QdGS6BSvfeet77KYFf3FwvkcDLIfNHCsTw3dIuzi/fU
         6cp27rcilF1ry382jK3qeec0H30IJIj6VOkxXYXGXq8IcchVw5PRzfgcjr9HWWhvj2Oi
         4WJw==
X-Gm-Message-State: ACgBeo3PxfU3ax04XGV3qnGsk9uz0BRTKXaGdR/zJEmgqKunJ21PMLea
	s5n+gD/YNQjRqqGedd0ZNyAeYVIATys=
X-Google-Smtp-Source: 
 AA6agR7eJdYZaKNXSqXkhD840yNCI2LUdmrETXYCEma4x99QKDFwrRqjdF7wq+pBFNVq8QKCGIDM9Q==
X-Received: by 2002:a63:170d:0:b0:415:f76d:45e1 with SMTP id
 x13-20020a63170d000000b00415f76d45e1mr15718255pgl.171.1659968708866;
        Mon, 08 Aug 2022 07:25:08 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/13] net-snmp: set ac_cv_path_PSPROG
Date: Mon,  8 Aug 2022 07:22:46 -0700
Message-Id: 
 <2594e977785f3ba5116125927de17e51f3b6a07d.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98167

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/include/net-snmp/net-snmp-config-64.h in package net-snmp-dev contains reference to TMPDIR
  File /usr/bin/net-snmp-create-v3-user in package net-snmp-dev contains reference to TMPDIR [buildpaths]
  WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/lib/net-snmp/ptest/include/net-snmp/net-snmp-config.h in package net-snmp-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1bf83255aee9850bf5ce5138c4bdefbe9eeb120c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 5f887b8868..30c0ce74cb 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -72,6 +72,7 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_ETC_MNTTAB=/etc/mtab \
     lt_cv_shlibpath_overrides_runpath=yes \
     ac_cv_path_UNAMEPROG=${base_bindir}/uname \
+    ac_cv_path_PSPROG=${base_bindir}/ps \
     ac_cv_file__etc_printcap=no \
     NETSNMP_CONFIGURE_OPTIONS= \
 "
-- 
2.25.1


