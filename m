Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.14527.1619911846228661078
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=stURgASR;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v20so878741plo.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=stURgASRv36JRelQXj3UeYwvnPORT3Q8mlG4Pc+58r7cEWKowqIeb76GmTu3hWdt5f
         XTPJ6UL/ps6r8zDXQm9bOA6I8+xBtnMv5l5+dfq+YrIBRXr5tDmIJ8wTJ40kTnYwWjZN
         TJLsGJDQxPNxdqBIkmgjvR2Kuc01q2TlJD+JUOgoMZcYm10kwUa/gj91QaiAPPqBPV8C
         LXmTtUTTDexDgdmRftemafbq0xuKjLg4kpZe4Lk9e6UFS4fdUEjpuoMZohhenw2O9JGk
         zRxirXel5HLXMuqI7zbknm7pGoc3CeWvuuc0y8sTxJy7ZmbwxYd1l5AR+eW/H0uA8Zgm
         jrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=peHO8OiijDlggtgtwMOdbYyn2zz6gB4Whu9ubp+bnSh7F0tQsVNpFjfXKpuoiy2NUm
         v+88u5GK+FoG+jdZSAtD8sX0kn7CNNgZJmQodkTPebGAigs110TkA8FhNF83C0qhJZyM
         cdCA/U3hP/q5a/F4kL1+7YA2F4LKrrcBcWo8l0fg61BSfGyX37eQstRi/shcC6B8wuZ9
         MMJWyieaJ5nf3Qt1yT2ROSmKqX10G8S/N3n5bOUNJL8nTxpdtq7cUYtZsaedN5nU7QFn
         5KEbec0H3ZEZDNAX+to9hL7u03SBgtldvabkbGO7uYQMa6R4p6LYY8kRCSuInoqPXBic
         GY9Q==
X-Gm-Message-State: AOAM532ApJO9uPjF2xHbPoCq4fHwNc3nqZZJiY/ju9Qtvb2zKhtT3q/D
	InouBeAE0NAuCWKFB+MedkwB7bAI1iZECw==
X-Google-Smtp-Source: ABdhPJwxy5wJZ/IiWEvZiTuRI9c6JCZiGiyTEVl02pDlNI6XMnxJyQZBtJ931fHmpcJZ1an/qGF0rw==
X-Received: by 2002:a17:902:7e88:b029:ed:6707:a2c4 with SMTP id z8-20020a1709027e88b02900ed6707a2c4mr12569557pla.22.1619911845598;
        Sat, 01 May 2021 16:30:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id in16sm5665574pjb.14.2021.05.01.16.30.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:30:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] nostromo: Blacklist and exclude from world builds
Date: Sat,  1 May 2021 16:30:33 -0700
Message-Id: <20210501233036.11611-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Host site is dead.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
index e726c9ac66..f1cf59355d 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
@@ -62,3 +62,6 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+PNBLACKLIST[nostromo] ?= "Host site for URI is dead"
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

