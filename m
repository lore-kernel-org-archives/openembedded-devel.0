Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607D3C7EE2D
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.13899.1684816026439099452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kMYHkWS8;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64d15660784so3922842b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816026; x=1687408026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO4yxpuPjxjs9loT74DMebm9A8UPh3dtwaWyrZMhs1U=;
        b=kMYHkWS8H0JhjWPt9lmmz5qBXesayDQchqZhTbsP+rzqNrOqaV9BcXq4rEOaQ9K/OY
         eoYMUQSZV/WEcr55XJDZaqfkQQPXlsLLLkHrnnSpDtgJVFTOrUsOCN5+y84bmOKFRANy
         aKnMxaKaxQkiZMCLyyrl/H8g7ZYmnQ+lnix/OaphZGZAuq3x/e/LJ90e/agknJ/p5aJq
         iU4u9ePUBCYoGaaQJxGRxoOuL3S3FzdqXK6au/PYLmTZn6w6FIfD7y6bs2zkPkSFEw18
         Qs7+yjwovWCUZMQi2ql7sLOQz3maSpYQ2T/UHI55SXbtO03GJAkvJrwd89rrDnbrRLOR
         pRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816026; x=1687408026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO4yxpuPjxjs9loT74DMebm9A8UPh3dtwaWyrZMhs1U=;
        b=Afct8VQoREmcvdxyoF3876HMAufHLVSJcUPdO7maf5cpuct6QMECHIP6hHzr7Aay9V
         DWMA/JIv4RQOQ4nz9dD21L5LTvpufTkrYsCND0F40SNGA3keZFLzXEcgfnF7CgTlUs5/
         ejZrSxRoanf5ydc9JXfqv6UNXXilmauxBM+SEsFfB0MtQI6T3yKHPSbTAcY2iTNgImeQ
         EXLJunPUcq7eXVx/KYyoUIO+2R/UcOEDpFLucAXAkVDv6p/wfSWg5N8zwUYUgqh0kxso
         f5LnC8tWRqNlR0ku37VpaDb6uu1g4dGlB1Kyu5lBB2sATWA0CN+auPxKSjEpCrsCRXNd
         R55g==
X-Gm-Message-State: AC+VfDxBxAbZDPCi+8JmWeiOJZTwJlMLEOjo1Hbldf4Ncq2ruKC6p2UX
	jekKiAyAX3Iw6QJalR3UxRTZHB1uDWU=
X-Google-Smtp-Source: ACHHUZ5KNIDTYo3vzpoTL0rIyykNV9XMGTiMsqVxiWuEWBZ5dmg2fgudU9rCELbimXzwnRVhBMWVEQ==
X-Received: by 2002:a05:6a00:b45:b0:64f:3fc8:5d0f with SMTP id p5-20020a056a000b4500b0064f3fc85d0fmr1346856pfo.8.1684816025518;
        Mon, 22 May 2023 21:27:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/11] libnice: Remove buildpaths from binaries
Date: Mon, 22 May 2023 21:26:56 -0700
Message-Id: <20230523042658.4159559-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102724

Fixes
WARNING: libnice-0.1.21-r0 do_package_qa: QA Issue: File /usr/src/debug/libnice/0.1.21-r0/agent/agent-enum-types.h in package libnice-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...meson-Replace-filename-with-basename.patch | 40 +++++++++++++++++++
 .../farsight/libnice_0.1.21.bb                |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filename-with-basename.patch

diff --git a/meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filename-with-basename.patch b/meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filename-with-basename.patch
new file mode 100644
index 0000000000..897de4a6ce
--- /dev/null
+++ b/meta-oe/recipes-support/farsight/libnice/0001-agent-meson-Replace-filename-with-basename.patch
@@ -0,0 +1,40 @@
+From 7c510cd20bb443064ab4a0d2c6d917e807b2671b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 19:45:28 -0700
+Subject: [PATCH] agent/meson: Replace filename with basename
+
+This avoids emitting absolute paths into generated sourcecode, it
+improves reproducibility. See [1]
+
+[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/libnice/libnice/-/merge_requests/258]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ agent/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/agent/meson.build b/agent/meson.build
+index 2e5b272..44fcd6b 100644
+--- a/agent/meson.build
++++ b/agent/meson.build
+@@ -29,14 +29,14 @@ gnome = import('gnome')
+ 
+ agent_enum_types_c =  gnome.mkenums('agent-enum-types.c', sources : agent_headers,
+ 				    fhead: '#include <config.h>\n#include <glib-object.h>\n#include "agent.h"\n#include "pseudotcp.h"\n#include "agent-enum-types.h"',
+-				    fprod: '\n/* enumerations from "@filename@" */',
++				    fprod: '\n/* enumerations from "@basename@" */',
+ 				    vhead: 'GType\n@enum_name@_get_type (void)\n{\n  static GType type = 0;\n  if (!type) {\n    static const G@Type@Value values[] = {',
+ 				    vprod: '      { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+ 				    vtail: '      { 0, NULL, NULL }\n    };\n    type = g_@type@_register_static ("@EnumName@", values);\n  }\n  return type;\n}\n\n')
+ 
+ agent_enum_types_h = gnome.mkenums('agent-enum-types.h', sources : agent_headers,
+ 				   fhead: '#ifndef __AGENT_ENUM_TYPES_H__\n#define __AGENT_ENUM_TYPES_H__ 1\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n',
+-				   fprod: '/* enumerations from "@filename@" */\n',
++				   fprod: '/* enumerations from "@basename@" */\n',
+ 				   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define NICE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+ 					  ftail: 'G_END_DECLS\n\n#endif /* !AGENT_ENUM_TYPES_H */')
+ 
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb b/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
index 210d4d8228..f319b994bd 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
+SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz \
+           file://0001-agent-meson-Replace-filename-with-basename.patch"
 SRC_URI[sha256sum] = "72e73a2acf20f59093e21d5601606e405873503eb35f346fa621de23e99b3b39"
 
 DEPENDS = "glib-2.0 gnutls"
-- 
2.40.1


