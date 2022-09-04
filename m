Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C68EECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11280.1662276881332047114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ccQcmgdd;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id fs14so929481pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zoZJndsHSOT4Bmh5LIWmXdPOGyGvepi1OQzEMogWE38=;
        b=ccQcmgddQlvImOPlFIWxIEMYU+V2mhevVClnpuRqVGJKyQSxKmtNBapKFz/5NMH6U4
         X8nndjZdQEdePFAcq6UGRG/TJ+4DkiAPu2e/+2AhqdeCEEhM36M8vuOI3Yk6OGftTVxe
         YZoOlAbNjtLHLKb/4LxUhP4c9u9zPho7WLkna/pxA7H3UfdxuyD0S02RLM1+tTNWol3D
         Crui/xhipzUVwUF66CqgS5VWWWoZOWd8Je9Vzs26cxQXDjIfHyunMilrMpwxm51X+zMn
         +IFmGDZysTFW+vSY4o/HXfIfxRl3x2yI1zPZEEricpDqnutTWJJ2tffYBtByhbrlcM/M
         n+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zoZJndsHSOT4Bmh5LIWmXdPOGyGvepi1OQzEMogWE38=;
        b=uW3a0dLvYRslmWNt51suRrKx6OMmobohARC7N8xpAhXPKIioYVEfridxiG24yWKfaB
         LSK2P1PmFBleMBCvfyQPegfVhPb6y2tmNFZ3vEfB267DAn4gUCLhZARvpRrY1XvjV+sJ
         l//bRtqbWwGNOl0uOH1u9xsHnJpn4L/C9MpHBDHrYmq4VeIruKMuKodtOxuhZJw/WU82
         h4Jqqta/YcfsIaOHYw/8Jp6bM6dCvGZC9pPGnnbSqE6dggPTN/StnMlI5+b/KNj5R1vp
         DyBj8NUiDg9ksKrHHO0ADT0iH6nEoJ8/r8Cnb/HKS/8iWem0jMCHI6nxANDU1/tKuUdM
         xhpA==
X-Gm-Message-State: ACgBeo2PAZjEuANJHRHzw02q77un2ks/53snlhaQWEw0SXtrGmB3qDGp
	GQps85aiQ4wrm8wW/Exc5QiOVieoT7y98w==
X-Google-Smtp-Source: 
 AA6agR4g+2BUV5b4VzbUT3FauGNxlTxU21I4biyZer8pPvzYzTCiPjwsAEigg02CFfIQ4n6GyQc1tQ==
X-Received: by 2002:a17:90b:3c4e:b0:1fd:ce4e:94bb with SMTP id
 pm14-20020a17090b3c4e00b001fdce4e94bbmr13627635pjb.105.1662276892708;
        Sun, 04 Sep 2022 00:34:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 31/63] pmtools: Update patch to include string.h and
 function prototype for main
Date: Sun,  4 Sep 2022 00:33:45 -0700
Message-Id: <20220904073417.3251865-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98625

Fixes build with clang-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-dynamic-buffer-for-huge-ACPI-table.patch | 38 +++++++++++++------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch b/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
index 7ccdab0f22..3be18986fc 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
+++ b/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
@@ -18,22 +18,41 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  madt/madt.c | 18 +++++++++++++++++-
  1 file changed, 17 insertions(+), 1 deletion(-)
 
-diff --git a/madt/madt.c b/madt/madt.c
-index aed965c..8770cd5 100644
 --- a/madt/madt.c
 +++ b/madt/madt.c
-@@ -51,7 +51,9 @@ get_next_entry(acpi_table_entry_header * entry_header)
+@@ -34,14 +34,16 @@ typedef unsigned long long u64;
+ //#include <sys/mman.h>
+ #include <stdio.h> // fread
+ #include <stdlib.h> // malloc
++#include <string.h> // memset/memcpy
+ 
+ #include "./tables.c"
+ 
+ int verbose = 0;
+ /*
+-/* read standard input
++ * read standard input
+  * write decoded madt to standard output
+  */
++size_t
+ get_next_entry(acpi_table_entry_header * entry_header)
+ {
+ 	size_t retval;
+@@ -51,9 +53,11 @@ get_next_entry(acpi_table_entry_header *
  	return retval;
  }
  
 -u8	buffer[1024];
-+
+ 
+-main()
 +u8	buf[1024];
 +u8	*buffer = buf;
- 
- main()
++int
++main(int argc, char *argv[])
  {
-@@ -75,6 +77,17 @@ main()
+ 	size_t retval;
+ 	struct acpi_table_madt *madt_header;
+@@ -75,6 +79,17 @@ main()
  
  	if (verbose) printf("header.length %d\n", madt_header->header.length);
  
@@ -51,7 +70,7 @@ index aed965c..8770cd5 100644
  	acpi_table_print((void*)&(buffer[bytes_read]), 0);
  
  	bytes_read = sizeof(struct acpi_table_madt);
-@@ -118,6 +131,9 @@ done:
+@@ -118,6 +133,9 @@ done:
  		printf("Checksum 0x%x != 0; 0x%x in header ERROR\n", csum,
  			 madt_header->header.checksum);
  
@@ -61,6 +80,3 @@ index aed965c..8770cd5 100644
  	return 0;
  }
  
--- 
-1.8.1.2
-
-- 
2.37.3


