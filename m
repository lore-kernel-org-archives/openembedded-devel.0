Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC393C35295
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13949.1650769807276227272
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G2qb5oN/;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id s14so19543509plk.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3gWdXp2SUN5tUeF7cWHLjk1cSL+/tArXTLbGXK0XtE=;
        b=G2qb5oN/W4UVWYRYDvn8WmrKji7q38bHtfOyjrxkb26xh7rJnH3pe7oxevx4O+e3Ta
         z3IwWWwPdMfY5u12k9Y5e9E59obw2YyEGQZanQxZb+YqfToQB+rtJ7on18RL0XTq7VY4
         mIu1hHoIhjXxxgSFaTpVlGqmycWIIeyMqIVETtdT0QQmLW5767l+1SEzzhTz9MEQLu9e
         TlfOB6fJKjzju7NNiz/g7kXTPHIUU0hkReawqnKmEE861vdZrnOMm4Atb/C7zCq//Azp
         MMn7RoZpimGJBxF9bjdApFeWspBIgBL4Pnygo8eKJrfVScLDb47wZZeCjcLjOFqRfBZo
         /dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3gWdXp2SUN5tUeF7cWHLjk1cSL+/tArXTLbGXK0XtE=;
        b=DWvyuqbMeh0wsdBALcmGx47pYg20uu5xh47bRxBo08zz57eJoo7PCo42rrCZYFlkSY
         k9Ax/iMhahVZ5XNo3c7LAqg7N2OGGZXBO2oa5b5u2CImJITo55JXHbhSrt8BlEC2Oj73
         sO6ufYDeh+XUB2o0ShEM1Lr7bFtAlW3idaS2tH+wgp/3Emh7XYY4liwHeagXVIesRhbJ
         TptBINmDQUALv4ev2lUb4/Csm30TUuHsC9LXnitewfQ7HBf1HeipIQWZD3FGsO4xzOGF
         pV/VfeKHNZW2p/dQ3QGAru09vmFRHXhvX9QjfjqYhd51M34kG8w6cjefftvThXiGjIB6
         e9/g==
X-Gm-Message-State: AOAM531WeU/fB3NoaMczMnGVd2lnx7t5hT7Wjj3z4sK4zNlvNg6sg9l2
	O2FXG6MUQbL2VS9GMlFDzfNDGoa5p2NwLQ==
X-Google-Smtp-Source: 
 ABdhPJymD7I683P7uXctSMBdXAx8IrAhYYoIEwTNPbfG/q00b3AZWbw4j9MWf7iqxaG/wgVkXP2m3w==
X-Received: by 2002:a17:902:bf07:b0:158:d334:852f with SMTP id
 bi7-20020a170902bf0700b00158d334852fmr11821262plb.136.1650769806609;
        Sat, 23 Apr 2022 20:10:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/12] tcsh: Do not install symlinks into /bin with
 usrmerge
Date: Sat, 23 Apr 2022 20:09:53 -0700
Message-Id: <20220424031004.3209576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96738

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
index c4da5cd835..f7282bf1fd 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -27,8 +27,10 @@ do_install:append () {
     oe_runmake install.man DESTDIR=${D}
 
     install -d ${D}${base_bindir}
-    ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
-    ln -s /usr/bin/tcsh ${D}${base_bindir}/csh
+    if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
+        ln -s /usr/bin/tcsh ${D}${base_bindir}/csh
+    fi
     install -d ${D}${sysconfdir}/csh/login.d
     install -m 0644 ${S}/csh.cshrc ${S}/csh.login ${S}/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
     install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
-- 
2.36.0


