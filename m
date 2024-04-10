Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE53CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:05:00 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.2208.1712761498438461331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Z3l7S8e6;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.50, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso7321905a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712761497; x=1713366297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82NajU4JhsXu1Txxrm19zZwoEhi196PjITIRwk2NP7g=;
        b=Z3l7S8e6a9eVU0kkkotbNDwztl6kfZPmlVHLR4Ly24yTq1PncAD+HQwG1JSaIzoFIe
         gq4GLNpbcPgGNkhkmqRcyH9WpngB2o3GjYvHOCrGaOgLjurokrl+zbGt1irj7hLVv45u
         O4Bg74kEdbAAjupegCaHLQhjmf4Hmd6VmgBGlFV/Z4xejL8uBjJ63ieO53Ufiw+umEAo
         x9Uv6QYoxZ0+kJiZN096ZKKksdXXbJWJDh9A94I8jRpvyidIAxfwrI5kulaDJlH/u8ym
         8VXaQpDxZH+TO4vPNbh1Q7HUrNAprScNOcDCrtaSKIoihZJqNuPopFhkh2DUoXl5XtLR
         Ql+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761497; x=1713366297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82NajU4JhsXu1Txxrm19zZwoEhi196PjITIRwk2NP7g=;
        b=qpnq+eK9dUO5nNMB6eqI2mP36gdi5kYQRedXbOQZG2qRd31gZ0jXqCP6vpAvU97oIg
         HnfLAiiX/sKkQakCp5qVd/10AVATmLkkNkPe8ESOlwPIIS+gj6vDWtnOGmtDZ5U02Lgp
         mhFJVFwXXLfUh0E8xDmIvekbmBbMhjNmnbKVQs7ET77VjAZiSThedalaQQwgXE5685AC
         QpBv+5zbge4NPIzsdh2AR1uXeIsYwnhRV3Fuu2fmw/hkXLPJb4UvDk3kKx8xqUKx8azR
         JNnJDq7IoXW0f/VMSWruC9NgTdb6//eL9jIoH3KDWixRCE59ER58iKE7Te1Ip0J9xK8e
         Vraw==
X-Gm-Message-State: AOJu0YxaRP2KOjaqR8eFuyGwl4aYCRZDVQb7Sw8y24BFsFlely9kVY2U
	2Pvc3qszwjYs7UaTUuU4YSi2mjBNEDG+USfDCKs3OLxO12amI4isq9+L8BEVlmnL0Mm8z8GC4e+
	p
X-Google-Smtp-Source: AGHT+IFgIUSzbjsFBBTFNgp6rdXrqlJt8EdC+XZ86IOeKCDebtaZiIc8n01kKYwJXtghGEpwtoTZpw==
X-Received: by 2002:a50:9e8e:0:b0:56e:2452:f867 with SMTP id a14-20020a509e8e000000b0056e2452f867mr1947241edf.37.1712761496674;
        Wed, 10 Apr 2024 08:04:56 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id ew13-20020a056402538d00b00562d908daf4sm6505480edb.84.2024.04.10.08.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:04:56 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] exiv2: Update CVE-2007-6353 status
Date: Wed, 10 Apr 2024 17:04:52 +0200
Message-ID: <20240410150453.12726-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109903

Current version 0.28.0 is not affected by the issue.
Affected version: < 0.13-r1

Ninette Adhikari (1):
  exiv2: Update CVE-2007-6353 status

 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


