Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.6570.1588252576158272269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 06:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WqBpONFL;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 188so1167157lfa.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mmRKY6UrM6dgOxll+9vm+7af3GdB+du0rexG7qE4rM=;
        b=WqBpONFLusWGASPQ91WQlYMi3YsEk4I6lUsRuUtFBMC8BJDICIaWaOXN298FTLYt52
         Rd5TKG9csgmzh6vTfk496tSGW3WNyj7P+xMYwWGzjV+3EWofghQ3hQh7FKixdPaXLEoU
         VZxvP3N3mWCymmiMQ7CZc5DDUVZLDaS1yv67lJ3XU7DDkcafPAh3eZpDOg0pC8T65xH7
         frOWVBSnKE40wMSvsSZRts7Mig95C9BRcehjN0MHlie3k08+gIYZHVylVU2ETE4OzYGS
         4+3BgTWN3M4PLtHOs3G6hroqMJUQmschP2gv6RSTjd8ezkul+jbkUorboZ1j+JGKag8+
         Cjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mmRKY6UrM6dgOxll+9vm+7af3GdB+du0rexG7qE4rM=;
        b=kXLRfuvAloFWTzDq1Dk8kwawVNrL10mP6EZurKoHuYO+h8siYYnF0wX0p245C0iu0u
         sWEimnFSG3oNLvH6L+HEXwiZ5KDT8a9EX7894eP2zWXoDmRjva3xSslcIoNEOlB0PtWd
         z0xhZSbcOgcCVh4iTpbQTlfUK7ZkVkxpnBjVmZZ6As3nU0SbQDSng6SxzmZRZfXPhtoF
         tUMviKDjpg66MgfBllmRgVW8rO+aKx37x8BWxWWlVbNnSn9trz9tqq1j5NtGzgPiyqOX
         KbspBwQMuuPfLwkCq1lvS27CuxhV3DrRmngGInfzOdh6VqBDxii/3dkYVwAG5a7/4iww
         kYyA==
X-Gm-Message-State: AGi0PuZoEnz4CgT8TMHVs/OiEvqcHBZgF6OpvQG1NHuTJVp7Z2pxAGye
	Oblvkdt4XKAH96hUIVKuRMFNwhq9Q2c=
X-Google-Smtp-Source: APiQypLrvudSMAcIdk5BI2Irddka0m5XXfxC4UjUN6NAVUr+mRg6itxUa692MA6gG82bd0UFjVeang==
X-Received: by 2002:ac2:4836:: with SMTP id 22mr2124083lft.52.1588252573926;
        Thu, 30 Apr 2020 06:16:13 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id q6sm4824506lfp.28.2020.04.30.06.16.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:16:13 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-java 1/3] openjdk-build-helper: Fix decoding GCC major version
Date: Thu, 30 Apr 2020 15:15:54 +0200
Message-Id: <20200430131556.2150334-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC in Fedora 32 is up to version 10, so return the whole word
instead of the first letter.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 classes/openjdk-build-helper.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 8d83e02..4e334c2 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -31,7 +31,7 @@ def openjdk_build_helper_get_build_cflags(d):
         from subprocess import Popen, PIPE
         cmd = d.expand('%s -dumpversion' % build_cc).split()
         cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
-        return cc.communicate()[0].decode('utf-8')[0]
+        return cc.communicate()[0].decode('utf-8').split()[0]
 
     build_cc = d.getVar('BUILD_CC')
     version = get_build_cc_version(build_cc)
-- 
2.26.2

