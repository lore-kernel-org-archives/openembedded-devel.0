Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341EDD40CFD
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.31041.1730840045930786859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/pAFLhx;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea7c26e195so42019987b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840045; x=1731444845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV4gh3DVCqiYveN7D2LT2A0AknV1KQ6po33h2HUN3dY=;
        b=g/pAFLhxDWUs2xvpwtOzfkfF4s4WpH9HgSDUQ9xLJa5W6DUjbNAEMv6Saif+oI4IG3
         t4tWLSH3d1Svc4dPs171vAK0PVAi9dmGFGN2EX9IvDYN854e+yznRl2/dh3bhdlYEKU6
         Q70wIygSMEyP5K6uUctizqwSZLnmlOdtLuCHfJl/aTATaDcd09yAyw+NU8yKdSqCEyct
         ypSHLPJl5jBLk0J9SQgVXm/DvV7YfnZuLPpuwB+k57JKvw0gs/vMePsZsErehIJmFR9n
         wWjK7W2nOZa7EquOeJbJ0RjWzRO9OEbwNZcRQZ5pV9/Dmsr9x99ojf0QXIQBFGXDg3iX
         4ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840045; x=1731444845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV4gh3DVCqiYveN7D2LT2A0AknV1KQ6po33h2HUN3dY=;
        b=pUdmjnp+Jug9CO3YbQwuooUlA1gxE50pB6xPm5UXXpIugylYd+UIPXclGzV75/NYW6
         lC1isK+zJK5vBH3jsf1SasNiI4To/5fTN+ZicfUfIdq0W9+wsiEeh6zwihvUXacuLQN5
         Oql5+1+cnyE0HINd3YBxsAXFvEVPsezMClp39HtCBTnfsdC0jsWlxVmSjuuaY9VYeA2+
         lpJEX0sIinf9HKipYZ0dgbZ4x0QJfpP/3+5i7p2+RKi5VWy4tW8m2L5+jYEt5qAtJWuc
         rwz97i8XP3wciq/d7Wf+NayP7GeF0PRtKcUwTSygLZ58OYtmH6+zC68yoIKwYKGK4sB0
         llgA==
X-Gm-Message-State: AOJu0YwQy1lIba7f2PKkFX8cowPXJpYCh/c4vyUxzza4eZow84U0thJw
	8gFG0oZgTAMMhlUPRtGwluyCTa1XgnaaQiZLCWULSN8KP0srHjAhGStVNeC8
X-Google-Smtp-Source: AGHT+IFwv7YXLyALoboVEUzj1HyP9HSrSXf00WbGzB8fL4P8+a1ZwT+QHtUpUAytTNc15OAtOiASIg==
X-Received: by 2002:a05:690c:380c:b0:6e5:e714:3be0 with SMTP id 00721157ae682-6ea5232909amr224374087b3.1.1730840044523;
        Tue, 05 Nov 2024 12:54:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:54:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 145/161] pidgin-otr: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:51 -0500
Message-ID: <20241105204707.4155-145-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113661

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
index 326c5bfc5..f4c9020de 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
@@ -7,7 +7,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://otr.cypherpunks.ca/${BP}.tar.gz \
 "
-SRC_URI[md5sum] = "7ef14e1334a4bc80e5d530f9a3cfc626"
 SRC_URI[sha256sum] = "f4b59eef4a94b1d29dbe0c106dd00cdc630e47f18619fc754e5afbf5724ebac4"
 
 FILES:${PN} = "${libdir}/pidgin/*"
-- 
2.43.0


