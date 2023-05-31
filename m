Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38578C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.11450.1685531611695465588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SCovrG4q;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-568900c331aso39407947b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531610; x=1688123610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4IU0ooxE5f4ohm5YvfK+fqVOuNbiX5APjcUtQKlgio=;
        b=SCovrG4qDCNtsEHkfEvILje9MuQM4MsWfdwEn7+t7XgjQ+D8yYlNQYZs5FEIgqri/0
         Q5Jum9eRKGD/GZeDBuCpTI9ls3xH4e84Zted/HfKJNmhxWN/hwMhP12kd1lz4x/VFHVU
         E9lKCUFHCo+kPmkuaUF6oRRnql83ocTpYYuSXnHB4rh3jrosgi805jfljK3GsmHLwrKk
         U5/Edg1Qsvx26ZlVvWknDxrjQEKZbJOp1pn3M9vbFGWsDg5cCjZe4lLJJKDzxC0X2l+t
         pHmSLJR+Pls/W/THu12jV3s3arpNPN7zzCbKlwa5KvZ3m7X7L2628XerPDunnZCJEL+w
         oghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531610; x=1688123610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4IU0ooxE5f4ohm5YvfK+fqVOuNbiX5APjcUtQKlgio=;
        b=hn5WXKHy1FS2uN9zqWpNyMgcBj2Ku2UL94MaTCJ+8wsDQoxhgxFE1Dk+monZB+cn2b
         1OwdKcn8MwWvZgLnx8glqRqINnjYh243tiZjpoR3yU/TVY3aXLrExYlMN1OM/wRspovD
         M30PRfNXVLjgWjCx5bcg1r5X+U57QB7vYyaBzubftSmfBbXzK4ATflKs69nnIeCPKR+l
         XkxkJSSQ2wDdbKbbddD1tqeZb/iyd6J/iH0vu6jkcdEbpgUqS3/lza1hhkDEQdHv7z2d
         2Nv3iCIWp9E4ppmp5uRrYaRG4ke472FWVUzlpb5Ktlu264AYcXAckHXu7Chqr1KFP4Qk
         VcGg==
X-Gm-Message-State: AC+VfDxrUQrWOVoTkyS/jr6H5/Q+cWsTt4uEtjbWrN23UvyOpQA90svs
	YoafuEjyx6bYyhHhR4tZF9p+IFs45eI=
X-Google-Smtp-Source: ACHHUZ46sUWkQL7rSOxgsighXccW3f9k+QhhzLDfwZ2JFmeUuleBKVrJya2j6J8TxKmomsYYmH4KXg==
X-Received: by 2002:a81:4803:0:b0:55a:7c7:6ff7 with SMTP id v3-20020a814803000000b0055a07c76ff7mr5100580ywa.11.1685531610598;
        Wed, 31 May 2023 04:13:30 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 21/36] libnice: Remove buildpaths from binaries
Date: Wed, 31 May 2023 07:12:54 -0400
Message-Id: <20230531111309.2454603-21-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103050

From: Khem Raj <raj.khem@gmail.com>

Fixes
WARNING: libnice-0.1.21-r0 do_package_qa: QA Issue: File /usr/src/debug/libnice/0.1.21-r0/agent/agent-enum-types.h in package libnice-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e34fa43eece60c60b0732ec7a2726ec6489794b9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


