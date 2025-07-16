Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB09C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:00:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17831.1752656445156293784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SYQ0BQ6g;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e1d710d8so79891305ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752656444; x=1753261244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IzhoZd+SQJ+LQDYB3gBZtBmgfa8AuamFlU0efDKAltM=;
        b=SYQ0BQ6gD+BOnbqTem1rnE/I1dm7p/etAt3cz+b2obNRQG5T1SRZcuzF6PJKj8M0VU
         /w2hgtHXSE+xyOn2jkO1T8w6lTgfdbd+DmxoqP9HolUSpGg+mYt8augrWv19zE3rB5oV
         5ZcqTUXohQsDc3LhHrYxO3QzZolCbEcAyKIzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656444; x=1753261244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzhoZd+SQJ+LQDYB3gBZtBmgfa8AuamFlU0efDKAltM=;
        b=DIPG9gOrMwjdAtuSK9j2md96INWpQZVpjXKo47Ezkz/ws3ZdTU0EvmzORYPCTL5l/X
         9FZXBQtDwN8hwaXy/2bYtvhzqUh+dhDlSijEwaDPIVRoAYdq3f3RrNPZSccrXmYs0orH
         +biOI+nbRkWZhYg4w0k0X2q9RXKs+e7JOyPoPsgL8O6BnaSRenWqMW+3Zwzux+/WxvIM
         2sIwisKwnNa8ZtyNGqhimGzSyK/+TgP0Q7wb9vfS6OfMQSxMtXgD3LtOOzkX7R+AJoQi
         DRVg3R+3QkNSDPpv1J5GuvZeFO0lLwFqnWX05eAd5hSJmlB/kmQXX/QFYYe0yHbOKuGN
         FGKA==
X-Gm-Message-State: AOJu0Yw5gh5M0LwKMmR/ttOLrYvMAXaP8yk8JTlu6Wbq/rD36EENnfeF
	/DmqHIPwjS2aas73dFSp6Z1oH13OATI6yKiIaVBGqgrvJVpqEuFdk68eMPc1okXsHdkEzmLUhu9
	CpzURCkk=
X-Gm-Gg: ASbGncsn7JO06tze1mPhdHVxCPy9Z0iYtUBokvMjzO1QwGT0X1wXvW5FYe0TCElXhAM
	5gtlvDv+ZV46FsN/mRhuA9OjyWYHBGg1maXWAIsTCilPdTK5q2tY9K81ew+uRCml9xGZ0RwtSVm
	aWs61+nNNxDrTsZ8YK6hy+Vmv+YyGrIzEQY5Qj49Jm1abvUIpOMwKDcxLrZw6wydCsmEtbLls9w
	psWqHzu9OS4ZVOrmD29tA5faRJS9K19Jhn9YHxo5Sd8qNMgUxwMEncX1avZHlLNg3aA2Vt0+H2t
	8gZiokrshVHslAALTsHFmxn59ylOhs9fnuCaRFp+dtGXUrENLsSoFRFC3c2ciXywt0y5MbQdf6o
	+y0OwE+mdQYQXh+KSokYIY1mDtTGf65rsbg==
X-Google-Smtp-Source: AGHT+IG0sDY/OkJMRZfor0D5lozWMjQbLGN15kGw7LVL5JdJHSB43fFTSxEjk4Y7FyQXjBWLk5xAEg==
X-Received: by 2002:a17:902:d588:b0:23d:da20:1685 with SMTP id d9443c01a7336-23e24ec0c3emr29477585ad.4.1752656443949;
        Wed, 16 Jul 2025 02:00:43 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.212.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d13sm125463725ad.182.2025.07.16.02.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:00:43 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-webserver][kirkstone][PATCH] apache2: Upgrade 2.4.62 -> 2.4.64
Date: Wed, 16 Jul 2025 14:30:21 +0530
Message-Id: <20250716090021.1994899-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 09:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118591

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade incorporates the fixes for CVE-2025-53020, CVE-2025-49812,
CVE-2025-49630, CVE-2025-23048, CVE-2024-47252, CVE-2024-43394,
CVE-2024-43204, CVE-2024-42516 and other bugfixes.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.64

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../apache2/{apache2_2.4.62.bb => apache2_2.4.64.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.64.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 0e036e7e12..92df51ffb3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
+SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


