Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4124ED6C295
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 20:32:02 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.31777.1732048314499977892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 12:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjPFtrZ+;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83ab21c26e5so50384739f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 12:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732048313; x=1732653113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAQDbUjV1BZfjUCqBM9zjH8NumVJ+5yWyDiUmuAS6C8=;
        b=RjPFtrZ+gHKCUrKjW6fVpmdrmk5oUTIqKGrdhvBO31of/go0D4UQDiWxv6VUB2mavV
         W3zcPIywC5kr37x1Z0lC1CmN0SB++okWyXq/L9XRBcwSbF+4QqQ1rL7wHyFLx0AXdI7O
         flzXQIwOuByZUXFEOVIvmqLsBnVJbxN8q/HHjlAAbB4dMwuybv16+zpPUwrOnRhhSGZH
         fiGPByTLDFPnE1hZQymiL/a4sYcGsBAXrNEmkfVdZAN/gY8ZUATNVVcAsNBjdwjpDufh
         GoD1GCnB2cY6ZN4ReAVRvgCKRj4+F3MdyaknLUtc18PV/VqgcwXpMxQGu6uGRnCCn0Wf
         XiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048313; x=1732653113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAQDbUjV1BZfjUCqBM9zjH8NumVJ+5yWyDiUmuAS6C8=;
        b=Jm3kH3Rcn/kZ5cvC4AsXpE/x7Wsj4t00epIbdLYOIg12EaG/gFfTyGcDeWTc+2SQ0R
         TjL3C4tjpRDUgxtzACnzXHPE8uSml6644TEqKKjY8QfI/1G9rqcdWUf9ZcZAxtW4XM0o
         Zi9XM5gJHYSHV3fs/sZV31Y/J3oQqoRDuTZOFhenpWRorAvTQmb/m3v1xj1idF45rlgP
         r5SjiRNrJrqic9OVR9piAqe15ZSEXB+/wwD2kc5BL2gWMD49HtQ6Oe1CJlHWme9vJJgP
         SSdevk6j513s/wg294A/PD+dSccED+CVgvb/v6f8hQaIt3H+iwFg0cD84FG6jBvjIKTj
         4scw==
X-Gm-Message-State: AOJu0YwpDo9PjW6kOwbGs6gSC6kgzHWJpjvsBZgPLRQW1iRM6UZ9QYmM
	HqYBVtYxrnF9lKvU3GJ185AlIO/1rjuq9zl1gJTSwtaQuOCtsMt2BBHaPg==
X-Google-Smtp-Source: AGHT+IFHV2LVw7+5XUdYJxCHpaejplLLGA98KkwbqM+GSkCFpYGkmjINWB2bfWgrSkxIHzfHWIZRrw==
X-Received: by 2002:a05:6602:3fc1:b0:83a:cc2b:c9ce with SMTP id ca18e2360f4ac-83eb601ce51mr56313539f.5.1732048313409;
        Tue, 19 Nov 2024 12:31:53 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e06d707af5sm2859377173.48.2024.11.19.12.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:31:53 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-gnome][PATCH] gdm: optionally enable plymouth
Date: Tue, 19 Nov 2024 14:31:51 -0600
Message-ID: <20241119203151.1061658-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 20:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113915

From: Dan McGregor <dan.mcgregor@usask.ca>

Instead of disabling plymouth, allow a distribution to enable it
with a PACKAGECONFIG.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
index 94836cdbc99..e43b75880e6 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -23,8 +23,10 @@ inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd user
 
 SRC_URI[archive.sha256sum] = "c5858326bfbcc8ace581352e2be44622dc0e9e5c2801c8690fd2eed502607f84"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"
+
 EXTRA_OEMESON = " \
-    -Dplymouth=disabled \
     -Ddefault-pam-config=openembedded \
     -Dpam-mod-dir=${base_libdir}/security \
 "
-- 
2.47.0


