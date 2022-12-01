Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5330C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:46:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.53029.1669920357893820167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UjrWht6w;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y17so2490697plp.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7EoRMcYpwJjKC66fKVkemAMn0mwjX+C5clCoUPaPNQ=;
        b=UjrWht6wdKCCNoyNRNWySAFOo61KtzR1tARCT5D5X5qXO5wWjuEy/9D850HHwd7CAj
         TCJ/Ja36B/YZPPPZtje6oRpotsCx2t0FXOw4MIRGfPZOEC9pLL7b/jPoXzt/5cfGLSw5
         oo4Gcmh1+Nq1+lAJ9gCQqsM06SjR/Iqpl6reYMuR7uJQjaiJ77Opa/nmrVCmuPLsIjfD
         dm+bC/1OVbwUiSmyvoqoUWBD4EhzXT4hIzLgf7V12YJbzL20kR46A/8TtRfPiakTChS+
         oxpXDivDR5aIIZUibNENSy+aNGZLvDrd18z/C2A0r+MfuU1cwSkHZeGr3TSpcivc/GjJ
         d+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7EoRMcYpwJjKC66fKVkemAMn0mwjX+C5clCoUPaPNQ=;
        b=TJo+APLmVz8MK9HIwo9ov3QvK6eGDYFN3lG9AKpR8oqOF68fw57Nk9ZwbZ3NUScjdh
         hpAaFAZc71H15YyRgfHuBHJJjSBzOV1Z+yjFA72qwoUm2bipcUyi1Vk13+oe16L1g6Yd
         G0KrLZWDr9XVpOH0VZyd/U+bF887UwFeoJN+e6fBBmwJZrKvAwF3e5/yDBr7AfcgGfQy
         Rpdyiwi3Rh4w5iKKRLGZs0llfplwA0QMv1q1bjkNMSFsVRI9mxHyrhrV7YQ1n7Q5Fwfl
         0I0qhSuJwA2gpbVUo+xbKiVKrpKGAC3/mD45P2ZDTlTOM2LDx9bGktOHG8DLL38skUTp
         /A4g==
X-Gm-Message-State: ANoB5pmYt8o76mbEco1EjPRLLvI1oUzrNY4mRNdu0q3fKw4W8W5HRkW4
	OsLeoqvF/OjgsdKoOQ5jiQF0PVVcDmQ=
X-Google-Smtp-Source: AA0mqf6NYbkx3pemGYk/LiAukfuRCEU4yKxgvZcvLTA1rHSsnVjBJfaJjQbzNZ6+qlddZp9bk8ux0g==
X-Received: by 2002:a17:902:a50d:b0:188:547d:b15e with SMTP id s13-20020a170902a50d00b00188547db15emr50082985plq.50.1669920356991;
        Thu, 01 Dec 2022 10:45:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b00188a1ae94bbsm4018120plf.23.2022.12.01.10.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:45:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/5] tepl: Add missing dep on python3-pygments-native
Date: Thu,  1 Dec 2022 10:45:50 -0800
Message-Id: <20221201184551.35272-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201184551.35272-1-raj.khem@gmail.com>
References: <20221201184551.35272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99900

Fixes
  File "TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/tepl/6.2.0-r0/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/highlight.py", line 27, in <module>
    from pygments import highlight
ModuleNotFoundError: No module named 'pygments'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
index 8173b6d314..0eeb345cd4 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gtk-doc-native \
     libxslt-native \
     docbook-xsl-stylesheets-native \
+    python3-pygments-native \
 "
 
 inherit meson gobject-introspection gettext features_check pkgconfig
-- 
2.38.1


