Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B07BC5AD49
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 01:25:46 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.6115.1749000344359982637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 18:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWx50pxP;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e3c6b88dbso43382907b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749000343; x=1749605143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAMQUCBjJ+B+brSHaopNPAvwxBk2/6fTouEU6i4ml8k=;
        b=ZWx50pxPRpyONz5wH9m591X4EtAXvkVqaeYm0mnnRVDTO39hYib3H4UFALxYQd4qm5
         9S51iza7LJ6+mHpuIjHWwfL7nYZm2ULnsslzBBTbUH0rn1XVa20CBo+iQSsHh5wiLILg
         6rqZK5Ok3I8Ud9I1aOWVWw3YeHogSMF2ScQ4lg6ti3xyIdUS18xc98CFuYK+Pm/nt08/
         PDhuZLLv8z6j0uglECwSbjvf8bDT5QRw+XuYHceCNaUzXeJ+tUSlLQmtUi7dGLxQ5v+F
         3bC/ddoLta65ymTfsYrW8H20ELyOrfdWoToXlxKGZ4oKZurwDJKZpb9Mj7ESEvD9awsw
         GjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749000343; x=1749605143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAMQUCBjJ+B+brSHaopNPAvwxBk2/6fTouEU6i4ml8k=;
        b=kXFx4HQ0DrHpqsIPsii83Vhe78OpqDpKIO0XBipzLucziAqgK1BXkg+SrGWsLeWf4o
         m7EhvbeEYmWsdeMuSvjymq6Zu+VADvYv/Uxi72/lNREcrFlW91i4tRKycbZy+8f3rr5g
         L0a/HklcVoosa6AFmZ/ewTYNWpd3bpnb8r/v1AYdc+QDU6rdVDXtLmHy5xRJsZjx2rr6
         MP93CiodqCSz7TcyKKWQ2RNs5Pwi2g+tMbjtOhxUOgGUu9jiYGIqWz0kaBokljRof4eE
         cECtLEuvL68AfoGj3Lc11qgJDDIvJHeRKphcthTFkrCQZwSk6iTB5PawFEZJtESnPtkr
         WK0A==
X-Gm-Message-State: AOJu0Yzb5pRUFM3g0mHVsmJoH79fw3gFaT+eqn9skQXgRfbAVANnrosl
	jNhHdr76MZB/MeA52oA8GsAstsaizAuL47+OT7uaasZIFrgaTmsUupbYanSYSzg4
X-Gm-Gg: ASbGncuKiZYMK/h4dnkqu9gIvrlc7h6t/h5fCDH4Dk9sZdVLR0f4CLs3tpBrSSum7qk
	yXpRCHNCE2jD72sM1s+rvrKaEzDH+seR0upYZwxsKBT51EuSj0DAu0Q0wYKgtadhqkP/HYDV+HT
	Im/R/CpJaX0CY9/aJ0pSW0sam2op0UdKP4/IiKI4bn7ZcR4cTIvuFA/AwLjj0f+0Gfuu/ghuQvD
	91Ot1bJBhu0RVJtRzZz57MqFLisyMJrUq9EtQ1IUvOP25WWdewepSljKvBIXKTVUOaDNON0W7KA
	uoFpp1CKT3acyPPLsa79GUfZpZPHQbotgmO57pJ2xLMWFmvI7jeFdAaCeQir/8hVRQPI4uFkSxE
	EGRXbVNZJHA==
X-Google-Smtp-Source: AGHT+IEOG9jQD9vch6Q3bRMdWM3zSh/VSoS4S92/9ZmjCex/obCot1qJJm7fvUs4PAeKUESGmfstzA==
X-Received: by 2002:a05:690c:490e:b0:6fd:318b:9acf with SMTP id 00721157ae682-710da009b7bmr12156107b3.38.1749000343083;
        Tue, 03 Jun 2025 18:25:43 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad00dafsm28101317b3.113.2025.06.03.18.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:25:42 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar-archive-plugin: upgrade 0.5.2 -> 0.5.3
Date: Tue,  3 Jun 2025 21:25:34 -0400
Message-ID: <20250604012534.875720-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 01:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117724

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-archive-plugin/-/tags/thunar-archive-plugin-0.5.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...r-archive-plugin_0.5.2.bb => thunar-archive-plugin_0.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0.5.2.bb => thunar-archive-plugin_0.5.3.bb} (81%)

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb
similarity index 81%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb
index 0ba997b544..e4d5d731c6 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 
 inherit thunar-plugin
 
-SRC_URI[sha256sum] = "6379f877bcfc0ea85db9f43723b6fb317893050c712bd03c2ae3232fb9d5ade3"
+SRC_URI[sha256sum] = "cc0ffc86dc48e72edc6f6a61ad4345f99018526d5d854360960759ce1ec2ca22"
 
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
2.43.0


