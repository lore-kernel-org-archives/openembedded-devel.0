Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D88D40CFA
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.30634.1730838921562969736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YMMNlvr9;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea7c26e195so41782347b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838920; x=1731443720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1fu4yJIJuw0OZa1WOhlho8dbNk+ALsyPIx+LUhk36E=;
        b=YMMNlvr9HY7DLwW4kZUurZ1ov4Nj0RKw+ACREd2NXvzGC2LRY3uPqdo3CP6CCxxaSC
         AzqwerRxFLCYQ03EpYOos3j6NTIhVHmcoclhJ4Gir5JiEJH0H6M8sdE+yVb9TE95Jnvg
         sJoaFhCCjFm/E3ICA1QlUDS+43dbOv8DKoYlLc8oY0SHJtFZ9pYWTh9aeGWZKAZKUcYh
         CcPyPqOTASvYLRuhL8haMV9U2fJhe2dnKOduIqccMdiIJ3zx9bluqpim9ZdeX8nHaaY6
         BjzRBcMa3litqdbU+GAW7Bzu/2AG1ZuQB7iNcfR++MP1u7DnWtfhN7O/dgqbYab0zjoJ
         fPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838920; x=1731443720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1fu4yJIJuw0OZa1WOhlho8dbNk+ALsyPIx+LUhk36E=;
        b=BFEZydNOf8lUGDhj1R1NK12BXkTTTJuG2AEUXozN1aqF6E/oZgZVap3A8oVukkDxtA
         4NVWlWAidrq760+r3hIib0yfY7r7V8/v2D8nqRElJg/Z7pgk9BQh0/HLCjLgAKDDzDJx
         phLB+vxNTe7MHKgxh9kb01EAbJwbQXMc9v/Nee0siP3OrCnxVLViLLWmiNv3S+6wOuQj
         t+KWVrTPe2dasE1mB3bM3ZiRTXemjn1Qfi7D0+tkGFJEb0FdNH8gVUcD1ZXzWgNa6lyh
         nZoL6IqfIsmpbFuqkOynIIKMee6FN1t45idH2QlQ+WzwFS5VBenVTsgZzg8uT9Qgp2r/
         SJHw==
X-Gm-Message-State: AOJu0Yw8seOAYaDESyGbRSFZF9QhWK74JCfDjQtJMAYQtsHilRACLLyK
	PvA1GNXmtev6AbKIUOk/t7R8/3DhbFbi1klPAchVxrjzYwqY0wUx+bOwZXHK
X-Google-Smtp-Source: AGHT+IEbGCiaYB+ORN96LBvyy1XXc9/OI64LGe+ZggUOHSr1GoDuzFR2MiIwlZVqks4ItjXNXRbA1Q==
X-Received: by 2002:a05:690c:338c:b0:6ea:8bd9:6b2f with SMTP id 00721157ae682-6ea8bd973d0mr100416577b3.4.1730838920204;
        Tue, 05 Nov 2024 12:35:20 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:19 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 126/161] hddtemp: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:51 -0500
Message-ID: <20241105202827.3104-126-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113643

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 75feccb87..5930a8c95 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -15,7 +15,6 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://init \
 "
 
-SRC_URI[md5sum] = "8b829339e1ae9df701684ec239021bb8"
 SRC_URI[sha256sum] = "618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b"
 
 LIC_FILES_CHKSUM = "file://GPL-2;md5=eb723b61539feef013de476e68b5c50a"
-- 
2.43.0


