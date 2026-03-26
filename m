Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E2810A1E72
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:51 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45499.1774523028461948883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lE4gRFI9;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c742b9b7727so282915a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523028; x=1775127828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiCk8p7FHBZUwYlklMC8s4PTbwzhJR5hHN4hG5XtXs4=;
        b=lE4gRFI9VPGESpEb7bpqACPWVk/eGpNPXvU1Mea7TuLl3Mv+DKqgUjQjGg9HjmVUjg
         SLnpp6FIPH08cRA+rSK47JRerusJ6w8fze5+3wak0V6bBw8Kj+w6bp5/R1nNdEpu05WQ
         V2hyGo3OmgIM0DsvVtbH/LssDgR3iB5tMqH/sVXv28wdE4V2gMDz8e4Eq4Aja7o7jn6F
         8EsQ5rXaKFCLnLh/jNpYxJS4AfbIinqDOpjOGpWMjS6T3KfR3yFr5jto6qljKM0sIiSX
         w6xAMb/xHkpNDGg+xgGpQKwfAGXqXwBLdsIAc6UGf8ALfmChDycNzs++2d7bgUYPodSP
         cvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523028; x=1775127828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fiCk8p7FHBZUwYlklMC8s4PTbwzhJR5hHN4hG5XtXs4=;
        b=Y3szosdiZDOBz8NrfPVLGHbVC+w+zO+LfMm18yXYuPAq2MI6Nc7qMbmxW0LdzPYP0B
         CKl+6DEhCeYoxLR62mSWz2f4qQzYS8g2KdQzMTZDzt0b+lTfq2h5QFjPbu1KeeQkKym1
         ei+33w667bPthhqr8KHOvmdoYgxtdZTeMuPLkBQJtPKpRpEr5wLvf2HAH9sQP616MWCt
         hCKTnR0Nha2OnVWm+fqdzjlWVFdlUHExnSSZoZktzRVz6NtecZK2vRHxcyblWkDbhzT3
         buVCmvOvJneyjJfQ7Z1GE+D57fm7CtKxUv9rMtbLyXvcmqb7nr6y1cLU1QGvrbnKjPma
         zcng==
X-Gm-Message-State: AOJu0Yw7LzeogVsPT+eWL4M2Hg37+STucMJu99vjbR1r9dsXGHCtEkCH
	nerski9KbPC6fpmct1GpDy3xFs2JVmNlfObZmPuMSozl56jOLpXGaBX0HL968nDe
X-Gm-Gg: ATEYQzz8nUE8gE0PcLTQmyfEAuDSGo70ss9lnTwMXRMX/9+A4eopnxMUpuSaOrwgnFQ
	GmdbxUOKMa2YZnxTrB8Q1IrnIs376bmRwCxF/gVo32p47Uz5Kcws5DubCTbRVppRq/BZvU8mjBb
	2nZiA9kVQ8eVfnlp7YxGaHNNVWSa8k8mRZO1pa1tRUlCqO3ic3GZayMvMtSl7pw5h1KEtw11rB1
	SSq5cv5HVNnGuIjY7THIThX9oLWUX7/UnhJr2usuLOxsy3I2mpGHVq5YphGnkLE496p4ah/kuLf
	cIZCWb7mHmj9Qb2nFbC9CStM1MXZRSdMvFN2/nA1T5MK2ejinz+BbeAsMlJvNpvGvwxdInimEpH
	eFEgNZe47Ip2GF7t1GOJ0FN+m1zSUoTBGhxIZwEwWR0LHxoeVblP6SBabSVJhXshjU7xPkEkQWU
	djL7cUGZoX59T7wH+CX0KrfPJwr8TXZlgraU4=
X-Received: by 2002:a05:6a00:428d:b0:82c:6b16:c894 with SMTP id d2e1a72fcca58-82c869c156bmr1006067b3a.20.1774523027649;
        Thu, 26 Mar 2026 04:03:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 10/13] libwacom: upgrade 2.8.0 -> 2.18.0
Date: Fri, 27 Mar 2026 00:03:07 +1300
Message-ID: <20260326110310.1809866-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125651

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also include tag in SRC_URI and add libevdev in dependency list.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libwacom/{libwacom_2.8.0.bb => libwacom_2.18.0.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.8.0.bb => libwacom_2.18.0.bb} (87%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb
similarity index 87%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb
index f816cdf239..7bbeb5583a 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.18.0.bb
@@ -7,12 +7,13 @@ BUGTRACKER = "https://github.com/linuxwacom/libwacom/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
-SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "f5b92814320d0a5745b50b7b36103843ad23e299"
+SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https;tag=${BP}"
+SRCREV = "44df53b14b008a8252427aa6b41128efada43b3a"
 
 DEPENDS = " \
     libxml2-native \
     libgudev \
+    libevdev \
 "
 
 

