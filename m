Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BFFD40D1F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.30967.1730840445871985209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRTCTo7/;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2e3e4f65dso13089217b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840445; x=1731445245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LELbLxx1/cS6KE1bvIgqpfoeSBpFhjPuo8+YCPoEr+E=;
        b=NRTCTo7/0/ZO4iD4w9Gg3vRm4kVU/x7aPJsm1bybzVWxPVVR/o5OsYYies/PQ18J1N
         JOj/QTEIeoKmGtpINl86pOJrzv57ATPM96CuWlKx3a4Dj5qz4LtBlmnhdMde8btBbz+y
         YTHkW3lNOOoxfIYwMrNACv7xRHC8ZPk+o+E6YrRTE3S+u8L6mhns8GSW6AT5guNcOrEp
         AM6RwARAoPfb/BksX3eGLryD2S/dPcQiRFGpvUJ1ZZzDr200DPX3gsbQIqk0qwpyjRkC
         GKiU3LCKpJheZ0UP/vCRxqam/r/fSibovBnJP6eoA7byQWegI2ck+u/6tzRpc3cPFuDO
         eMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840445; x=1731445245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LELbLxx1/cS6KE1bvIgqpfoeSBpFhjPuo8+YCPoEr+E=;
        b=naZpV//jzx4UABd6sHvqhojEgCeLYsKVWlubrb89nCKKbbK6uEKWbtjApe2Jwoq4PW
         /W2vH1DQozPNCfrFLww15K+7K5lUmT6FOefFqgQXZFLfdZkI0u9rKMbH4e7bs0TBaHbI
         G2U0ACUDT9dn6v20nInbY7KcUQ5yBBX2liSeu61tN0YsCZjgE3F1PP5oBIwXN8yVBUr2
         u2XiVlBgFZ6IytOqXf5J0CfkERUEJVsfltrcGaSWWvxTuNDqID9klRdPm4YtEK+EuPb0
         EV559uosxMtiYf/Zn+AelPzV92bhYaF2gti4BiiASu3EAWsx/LKTtyxoQu6nJAdwAkoC
         ZFAA==
X-Gm-Message-State: AOJu0YwLjo3frQPsUG9euU86glxDeZmje3Wuw5FNAsP0vZvl+ntCJt5y
	3L8ELUEvG6eFrVjA2EN/hYDvD2oewHkD6ulW/04iBqVDGh0vNDULynfbi5f2
X-Google-Smtp-Source: AGHT+IFDbqVwG0qJUKIXIc2uc5TnfBqpRdaUkpXTbYcwaxTY0I/AqxtoPkhapBD/a2hVrE20IMBoBQ==
X-Received: by 2002:a05:690c:3584:b0:6ea:84e9:15fb with SMTP id 00721157ae682-6ea84e91ae7mr104718867b3.24.1730840444369;
        Tue, 05 Nov 2024 13:00:44 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:00:44 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 154/161] system-config-keyboard: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:00 -0500
Message-ID: <20241105204707.4155-154-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113670

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../system-config-keyboard/system-config-keyboard_1.4.0.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
index db4c395c5..71578e71d 100644
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -3,7 +3,6 @@ change the default keyboard of the system"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
 SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
 
 inherit python3-dir gettext
-- 
2.43.0


