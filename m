Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C0DCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 12:31:02 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33833.1778848261321957422
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 05:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aO35bQaS;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6530287803cso11556111d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 05:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778848260; x=1779453060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JDcKrNv5cx4rA2e2kKj6I1tgEx/JxLq835suui0ABQ=;
        b=aO35bQaSDEqlEgntsc6+6+coYUTuMbx7UCl55xWnjjGMZyQRxEKGqZYuia2mOjg+Zc
         i+CoT1v3fL4hAzxgCSlOXAA1Js4DZB6k36/3t3gkKcRehwgR3D7P4R1ZI2mCUCaVyOOX
         atUIAhCAnTJVqP6lfgRzzxiPJpec9GmVW6O5sqLdmoAXYA607MoyxHKLnayEZVaUac2S
         QPKRy8yBhJ1r7i1jDYLJSEzWqNhpoeMzpDx4/e3q+qIeoOMxfjJi3WLuPyhs5Ue3yqj7
         CtwvOJUDwXATQZFF9oYcN5rcH/ZGeWMspauKo3Or32nvoxJViYb0KPzWMGRdk+00rWs+
         AVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848260; x=1779453060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JDcKrNv5cx4rA2e2kKj6I1tgEx/JxLq835suui0ABQ=;
        b=rlTyfWAqXjMH77BLME0YsEQDAayIIn4XiUpHdKsN/ID4pCKpJEmgnh0lNfvwg8cr3+
         NjbLqj7N4OMiVQxs6bbnl/SZYNbnW4wAHJ1TF8g7+X8dNg1iKebvQclbBbfnonmoUOVs
         RiP5tZ0yqee5m0+LyZ5XH+jrtX5vLJTYSsHGki9gcjvmD16XTwspZEKv20fE4GwZ6xs4
         TEnalYm0u/8ozGplU5bRg9jqVeC4aP+t4k9/NJ4TzOZah9Pc/ptgePlqKSU1J1sHht+x
         bffnTy3TmCVYctjvMuhgTpjjWEqLAxxU/4LMxbj8doEjbCMrkmrvZIK4ELwhtMt90ck3
         jEyg==
X-Gm-Message-State: AOJu0Yyg8S80cO+RvcUoAm7jj/CK4LFlrUPQKDJdtBzICNMs77y5OAjP
	lhGZVA5OVemmkpNmMd3BOrploqea1tAZQE/G19lyB4AqvMWomWVLKAFTt2gQ+MMl
X-Gm-Gg: Acq92OG3ThMg1W623rCREz/MZrp6tDG4DNnyVGj0f22cD4jz2mlsTVRwYzQpKV9QAR6
	mmES1JWsk0RlrwBvxbYUtBsxkccdL3HofUwEXGVMOGzPDAhj3FeoCJ6ZO6h/KdJ3Sb1FAkA4Zuv
	NVIQIxpwzen4+etSc+oIN4/NEhEfIyiGkRTQxMwiIbjPCXVoAj3PTWAF0rwdi7ggYhkKF4LowuU
	LylKPTtxVkn4XxcLnD/EzeUwRsWVIGsx+arCae3jslLEwiJgOw0xJnfzglfmV1kG9vCewhHxD7l
	b6zE+2aTatRBmxasY2wmeiDk9B/anx7hAxKn1OQTpbn8qYb4r/R/ipC2jaV7DZfNUkNSOv5U9Ch
	PNyX4VnPMfSZqTFPiF5DkE61AEsaBDB37m27rgmu2YkcPQpGjOCuYVPVXPx02tzdxMukggPXy9Q
	Z3iiueMXmd5V968KDg1W9uXkzZf+74DUVPd9Yvr5p4n/GLd9FQL05QoCdyiZdCFzg/919HZbye2
	WWSOiILWAhrjSPZ7s/R3pp9Nebi3IzRY3+3adX0mnEMUaSM7JQ=
X-Received: by 2002:a05:690e:4382:b0:65d:dd79:71a9 with SMTP id 956f58d0204a3-65e22852d74mr2898703d50.55.1778848260028;
        Fri, 15 May 2026 05:31:00 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d878cf2sm2492459d50.2.2026.05.15.05.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:30:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][wrynose][PATCH] Update README.md example with new branch name.
Date: Fri, 15 May 2026 08:30:36 -0400
Message-ID: <20260515123037.9535-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 12:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127006

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-webserver/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 17c7c76d94..35e04853de 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -54,7 +54,7 @@ with '[meta-webserver]' in the subject.
 
 When sending single patches, please use something like:
 ```
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][wrynose][PATCH"
 ```
 
 Layer maintainer: Derek Straka <derek@asterius.io>
-- 
2.43.0


