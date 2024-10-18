Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AA3D3F2AA
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.29974.1729278815806228275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lASlpIQB;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e330b7752cso25688367b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278815; x=1729883615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDNXcPtQN3s6DAXJW4omDhnXcK6ig7Jh0eVHcO7mEMI=;
        b=lASlpIQBFGozSKxh01iM3cRKux6x2skMyqwKELEB4Tcc9CTzgqc3fAj5Jmy1ehiSQx
         VfLQZZ2bqUnkRNZXSaFpohwWJ+7riQTo7T1O1unVkaAldH3R7BXSmZ9vDONunrz71esk
         epj16M4+jlJmjaAfcJ+IjZu0PiOE0bY8tEO3IDKs0SPGHJVp0+zEBt4U/Xb8dKKWPOLF
         7KwLXBbNT2ce+N0SW0DDrx9Y8L0TeOPb2E5C4baB37IXcGVjnNZU2gytRDfImzXEpSz3
         BpW+oSUx8TIL9CbFvXS88s9CPlwGOBJokitWJ40LrCoSfrcyHbART2ued3ctLR2Wsest
         DSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278815; x=1729883615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDNXcPtQN3s6DAXJW4omDhnXcK6ig7Jh0eVHcO7mEMI=;
        b=qS+i7IX40FWdb+IzHBRGOmPbPiz0S5J3UE4siCZxehLjp+tVVl5isM7QHwxVcXHuu1
         zzI6Dm7jIOoleRnyujcUBA3hBvSwndv9nfEKO6Y+8GV07V6LSBzDiw5r8FPhPRbZn8n5
         D6yjycx4j4nh8gvFY/BYIf3qBoE8g+nXY1I1lfsWSYdNk1sTNLe9YwzMLPVd6P3mPxlD
         zfsFD0aqlpKwe8oeCKWWlbt+FWWDp9FNHb8VGiheDhAbHJXDtmw0ZhISAJSAw8PlFOm7
         kDjeWiJq2+btMhXIT3iOztSGyc1oJkYwWEbnn8ayZLvg/9k3KnQQdYjJQ1Z4QOYtH9l6
         nenA==
X-Gm-Message-State: AOJu0YzelAMbPDPZvPmYtQSXMRwqcjaCJtvXUQFnGKQtwk6YDA2Bbu6a
	F0csch610Qz5QEtDPcY1O8LdmdBrzBgRmO39m+e4P8RnQbdYazJ3vlMnuQ==
X-Google-Smtp-Source: AGHT+IEaoqmcCOzBWDt289C8J0gV7gUpXUV+FsxaF6xT+fowsW5r2fZdB7Mi/BI/0nLXi4aFtvcRuw==
X-Received: by 2002:a05:690c:690a:b0:6dd:dd40:54e2 with SMTP id 00721157ae682-6e5a3d80288mr69234657b3.12.1729278814555;
        Fri, 18 Oct 2024 12:13:34 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:34 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 37/68] python3-lockfile: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:24 -0400
Message-ID: <20241018191101.25184-38-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113024

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
index af738e08e..37025cb4d 100644
--- a/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lockfile_0.12.2.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "https://pypi.org/project/lockfile/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
 
-SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
 SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
 
 inherit pypi setuptools3
-- 
2.43.0


