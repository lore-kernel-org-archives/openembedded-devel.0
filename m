Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68D3C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 21:27:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.38235.1742160421630075611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 14:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WySK2Qy+;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225e3002dffso29896855ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742160421; x=1742765221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ztUSnYymc/mGwgFh/FknGw01giwo0Mn8cB6qLfsJN4=;
        b=WySK2Qy+Uc/We/IwXSXF/CY/m7QEO9rURH20NZJl/IJ7e0nexm60kM6mEqmM5ck/+0
         gVNQ779L1riase5X6XkZXFExpAN7BY4DwPKG93+L9Jeb/ZEe9hCO4fqJlcKnk8IXEZ7m
         IaomZCnWCKaBChfB19KzO6qW/v5w89HKqP50UXTSU2lrbVIgPMukmOGXwotuHYpO/7wb
         GnvGzoClGksVqQlnYwHeTSkTKXNWopgAUipUhzCnS719CE1fd1e4rFRwKFlDiTxUNlRT
         btSrPOk+zTHX5v1limuxYoXnFJjRQQc5ZcRvLeV1fLUXhfH98De5iHqNnfINYJAuJgJH
         B0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742160421; x=1742765221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ztUSnYymc/mGwgFh/FknGw01giwo0Mn8cB6qLfsJN4=;
        b=Re5tTzp7oiAzIhy7awT8dlumnEdChHzr+6bULMoRhT3i6jAGGcJZjBXrOx5XvlOz7r
         mf1p35kHV3FUzC0zxCZLSQqojtWwfdcAkCFLXpf/JetjtsPnBXSi8gU2pOffNqeZyIzR
         xb/vy6ON488OVzXYpECgggaypLRvF1MqZDMOyxhXHTwU7E/3SfbV30saRqquKdLU6+v0
         C7UBheRIOFMZCG7mAqUuRzjSwWrkUibOeDiVRlCv0WIZYLSeE1XIukL8zFVFv1z8MDEa
         xVwqG68KGdbKBA3kqJ5ZrjA9BXbS3tMm6TTm5eyPQ0gipAWViwBSQQEadc99JIzfLaAa
         iRtA==
X-Gm-Message-State: AOJu0YwlAjIp5S/Cu8kQdJ0vSTif4ikrC4eRvRDOuLfOWvXMuK1yLe1X
	ZV5r8YOMmB81CsIMsxCgliwxSmZMbB0pMLUfjcaC7sEYk+PkKSwfw+YGcmda
X-Gm-Gg: ASbGncsedGch9olIVaG46NTggGjs5v23sZmrkmpX68TCQxxNMQwa8HtiV1sABZgNHD0
	+DeyO0WRxCo5U3NEwTePLavQ1YBp7rd0liOZ3s+q2h7QsD502Y3Mt5t1kFCJWr2ivyRWilntahD
	QHOr83cl0RM/+yuVvqJKl5AV1xDXz+Ii7xaEMBP3ZimneOtTM2wFev5ZdkZCdlPNjOFyGK9tMPq
	jY3+csp2MNdZy/6p7xCAwFQ9uSthQ2kPi9610CFByxNiFdwRksazik2XUOq+abg/3uPkrZbgesA
	vbXw7XKRabsYgOdUA3x9LcP9G42wP9gqDM2VtIfwF2zkBWk=
X-Google-Smtp-Source: AGHT+IFMvc9WBJyDVJM4pfTdRlIZTGxW2o56vxrdX/tA3mnBv72az0LVbh3hFOYD6diak8T1wjwBtg==
X-Received: by 2002:a17:902:e844:b0:220:c813:dfd1 with SMTP id d9443c01a7336-225e0aeea45mr109916655ad.36.1742160420754;
        Sun, 16 Mar 2025 14:27:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a4063sm62071105ad.65.2025.03.16.14.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 14:27:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] uim: Upgrade to 1.9.0
Date: Sun, 16 Mar 2025 14:26:55 -0700
Message-ID: <20250316212656.3179516-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250316212656.3179516-1-raj.khem@gmail.com>
References: <20250316212656.3179516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 21:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116004

Changelog - https://github.com/uim/uim/releases/tag/1.9.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/uim/{uim_1.8.9.bb => uim_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uim/{uim_1.8.9.bb => uim_1.9.0.bb} (98%)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.9.bb b/meta-oe/recipes-support/uim/uim_1.9.0.bb
similarity index 98%
rename from meta-oe/recipes-support/uim/uim_1.8.9.bb
rename to meta-oe/recipes-support/uim/uim_1.9.0.bb
index 9d2068c6d6..5ed61fd098 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.9.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
 SRC_URI:append:class-target = "\
     file://uim-module-manager.patch \
 "
-SRC_URI[sha256sum] = "dbbd983768bf748449551644f330dbebe859bfeb6f024fea6697ac75131c7aa4"
+SRC_URI[sha256sum] = "271f0ed5f455e5bffa859f01b2d0f7fb966554ebd4822657afb67a0431dd85a8"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

