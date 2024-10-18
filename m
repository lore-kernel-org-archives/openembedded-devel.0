Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32A6D3F28E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:52 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.29970.1729278813211286190
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JkE46CbL;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7180bd5b79dso849020a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278812; x=1729883612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25X7zwtPIjmCvfAIrS3PaMHgTn/fdbCCxM46wsC4/6o=;
        b=JkE46CbLlG4k4Lv78Ymttz8aRCqqdBFZrnF3pIOwOEoChfSOTVZrVREehvNS+Zo6Zi
         3Yy+z6NMwtCD9huVUWvGvFCu/Q+sefahxSSUrFa1LRaJt4NwEjKzhYC8pQk9NS29IqLL
         cOhhs+m2Z7Qf4ACokDuEyirt6i9pfLI782iGhsMbgiWYTLdZQwRH+yCTnNUtLIw7tCv5
         xJeZ5kdsr9yclEBTqZH2Zpvb5vS/wbep/yy3+y5UyHtOnqGX4ecCYUg18N6Xml13PoPL
         SK4Jd6lOcjUYaNh3M9d0FWf9A85mbr4/88zC4iFLcxixJKyZ5+afkeMxTT69YqSMmkKB
         xhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278812; x=1729883612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25X7zwtPIjmCvfAIrS3PaMHgTn/fdbCCxM46wsC4/6o=;
        b=OXHHi+VLud5MZ766jb+2GiSCL8WYZ7OgQx1BpecYjdQqPz1Ia2PBcCvhns1mGcbunt
         U59yD+DVqwNymVoR7Yu8rSJOH/IyJBvIgQhLgjs31fIhhB0TygVhJac52gPzRaY6uzuj
         lSzSS1nTiVElmD/QM7a3e1Oc8xYIaiW8GNf8HyP3Kl34CpzKgKZIvEM3pwKzYjfi38Iv
         C7g8rVq10MeWf+ZOFI2fQM+/9iXT42nmXRnLDL3BAkEM9KXmEqAvKEUZRA7UckQ5heRb
         qIVrrF3xIrDxYmvY4XBlaEP/dSlgzd3en28RwrWBIqFGOsgFs8YWWfmUSrKCpw6t8O+/
         q8wg==
X-Gm-Message-State: AOJu0YwPjjVjuPR7uW9mSh6lKDLHCSb03q2eCGN/zUODbJnX5ue28aZP
	1ePGcHCgIdhDSbG6D/W4TE9aHmXHmvk9+Tb1hrgD6HXzFgEv1wO6NZPDJw==
X-Google-Smtp-Source: AGHT+IGcI9uGD5VwctRt15BHjflVXZdm73b3SMzf9XpcPw0JhadGx4fUkjfInB3W2TgGf1sSpdHb2Q==
X-Received: by 2002:a05:6830:348a:b0:717:fb12:2c2 with SMTP id 46e09a7af769-7181a5c6046mr3386054a34.3.1729278812117;
        Fri, 18 Oct 2024 12:13:32 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:31 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 33/68] python3-kconfiglib: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:20 -0400
Message-ID: <20241018191101.25184-34-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113020

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
index b9c1c4e38..c3c39ad38 100644
--- a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
 
-SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
 SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
 
 inherit pypi setuptools3
-- 
2.43.0


