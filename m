Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A22C3ABA1
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:43 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.117816.1726417842458489374
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E67aGlLA;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d6e2b2fbc4so29310077b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726417841; x=1727022641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAsKMbR0+bKSOiGQIhWgRLg785moC7Wh58gxB7L4t98=;
        b=E67aGlLASax3/FhUJnFAz0mT7JdM027V0cPbqwPDkeijYTgpPVWBAshtp4EE/scmGh
         GhhZPjIEX17T6vYuafgFdjXS/ZWY9QzWIaI7mGGt2ivbIJNnrEKHXriq+JHArYDsbShQ
         1ZowjH5VqOVkl4l2JbvlX9rhIc7pIxBaBSQTP+8Nobr4f8n5QA92I0n59xooHzOVmY31
         hN+o4s0kHHbRlhHLqHTw99NfpGZV9YF490oW+lJ1hriyknS1HsiWnZ1iHhitzfm1LnWj
         PvFHyrYw+7TZs19XJD90+ytoIkxYBIIQrRPsitEnfFupaOlmC4kB6IA9d7x+H3r+eWmH
         5zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417841; x=1727022641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAsKMbR0+bKSOiGQIhWgRLg785moC7Wh58gxB7L4t98=;
        b=DqslpwheJ4hH0ph0q3qR4mbIhigXl6y/YNpTR5tD1jos8103UfffCY8JvAVuOjBg2K
         htpXQQMMDA4MJKHIszehFvHxNMdZfeUZojQvxJL9LietETMDV0fxUhbID6sfKIZnkshU
         4CRhXa19LYvNWC1OgR6v7XGju9m1pZrb4YUaTHTinzAaOs46xVbxvq6tCg4AY6Gpn9dg
         gQDfjbXhaccikYZqIM7iVs38+2JGMnp5/3zKj+mb1r6750+VzjgkoKVpqVM6/o0inEg7
         RY0BRc0sTgbmSuiP/oKKpGsYGOSHoLVHIDAi+uNBKbJsJmY8Yq3oQfenhr8e0VzJ0/bK
         Qo/Q==
X-Gm-Message-State: AOJu0YyftiYZEpKpOyVUAGe4hO8jmb0ybLkX7FSsx5tTdcMFRPQ0SRRF
	a65nUErIOi60Ksdu6rc3NwAtlLfYiGilug6hGHdu4bA/aplp5QKaImSwOg==
X-Google-Smtp-Source: AGHT+IH1vcigjl2iaLovAUVGmhaL4MKnYtU+lkZaofRRasPL4uTeJwFHJqvKmb0akyOt69oMYeyiiQ==
X-Received: by 2002:a05:690c:650c:b0:6dd:b920:6e61 with SMTP id 00721157ae682-6ddb9207183mr27899307b3.40.1726417841467;
        Sun, 15 Sep 2024 09:30:41 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28e55sm5777867b3.70.2024.09.15.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:30:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/5] gpm: fix buildpaths QA issue
Date: Sun, 15 Sep 2024 12:30:36 -0400
Message-ID: <20240915163040.189190-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112304

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e8a786c291659083d746a4fe066fbc68c2abf34)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 31503e9c62..1a96bea099 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -24,6 +24,10 @@ inherit autotools-brokensep update-rc.d systemd texinfo
 INITSCRIPT_NAME = "gpm"
 INITSCRIPT_PARAMS = "defaults"
 
+# Avoid line statements with bison/yacc
+# ERROR: lib32-gpm-1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530-r0 do_package_qa: QA Issue: File /usr/src/debug/lib32-gpm/1.99.7+gite82d1a653ca94aa4ed12441424da6ce780b1e530/src/prog/gpm-root.c in package lib32-gpm-src contains reference to TMPDIR [buildpaths]
+EXTRA_OEMAKE = "YFLAGS='-l'"
+
 do_configure:prepend() {
     (cd ${S};./autogen.sh;cd -)
 }
-- 
2.43.0


