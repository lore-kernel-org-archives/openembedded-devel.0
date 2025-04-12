Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E92C369B9
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.12852.1744471831822401373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8nAkudv;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af908bb32fdso2630045a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471831; x=1745076631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhdAVfkuWqd/5sJt6Y1byRU6fVcioN22SOdFOBj/srA=;
        b=L8nAkudvIEUUJDLFa2EHk6VSkpEMhWvD6l8Jd53os+l/bXb0iE3tUJ38zsviA4rMSq
         ixhTRV2YjULHX1MBCMB2Qo0Mzall2kCwqvK3oRz7WhK2ONhdI7C7cIvF2y1zr8QrfEpU
         xXTH8eD0xqeiU794FDNH6pLybYWPK3OpY9TmLn32hfaq/dTUXaWuphYBldA/+dbbZRrT
         Mf1g1uHxYY3UH3WcmyKBJDhyrUCMY5b8HwUGHYLJNKI7TCZTgn7B+GpSAvuv1RPb8RAG
         V/n5S+aSHXbgIvW11bqxXwy9Ty78J8l/StTlz7Qv9QL8t5t/SSDZa+16rz66ZrA+9WHy
         nLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471831; x=1745076631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhdAVfkuWqd/5sJt6Y1byRU6fVcioN22SOdFOBj/srA=;
        b=lfJPzQzSp4XD6QK89oT83DDSJOOS+eqld/VvScY7AHI7mfuc+DvjQh4cbt8U3hPBWP
         6K85OM5HC8UuTPoVv9uDsy8ien1G9Rrf5gvQ2DpEeOTZSYnD3hbPEqQg/ZVjMsriWjMH
         b1WemwyRDbz+Ha/VK7b34NnCAz4Ra8b/4/u+qQRtr3K5ultEBxF7AGXOg8uXK8EgDgmQ
         D0h3jEPQuklvaYMD6ASSKY98vT1LXn3oxyCzdPcnlOD5f4fFvRx0tWteqXi/4HQ24UcT
         Eire+9q27Miap7+7fCWs47wLFmedC3IDwx1YnFB2ubRZrbNY3cqUYUmHtTBr6h30mIc1
         JQBw==
X-Gm-Message-State: AOJu0YydV/RI9DP84MsYCpuNd51CiJpeTaTsM+/4IF6jhtGm/7PCjVOS
	hfeJOf5L7jHNK1w7PHa1qRa0iD6Tz2Mf+tUrKCEnrzUK9crq1ra5aJm9BOgq
X-Gm-Gg: ASbGncseurDmFgkq+p/Mn9VGCpUYdC8+JE01RKWT8Gb182RaYidF0O4kNZtYV6wewar
	M1GA0P9Qn9KH2meLWz2IAXHE95aGcT/2qN7QOBTmkOSa3uOmB0m7IDb1O6wvpxlcn0fFcqmYWv8
	6kfA1CRz52WPAmdyhedtwIqQ3h4J5Ees8Etr340Q1NcjEGxnfnHNEpP+0dkQybvbOgViFAOQkVw
	fro4NSq1m+/XmHfr05fjcZRD6EQilTOO6+fMiTGcRXQ4CMQDHgvQDWkOyWSO4/ETuph8U32snk4
	Qq5Lm2BiWO8DrDb1/8rWbrsZ7nJTEY+N
X-Google-Smtp-Source: AGHT+IE0XWH4qoxbl4j8xYadJErBSZWdBkv6MNya6ZF5ru1lHqgZX3tliaG3UzFa8F7a2oQThoCmUw==
X-Received: by 2002:a17:90b:254a:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-30823680fa0mr10533915a91.17.1744471830809;
        Sat, 12 Apr 2025 08:30:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/8] ptest-packagelists-meta-networking: Adjust ptests as per pass status
Date: Sat, 12 Apr 2025 08:30:19 -0700
Message-ID: <20250412153022.2343322-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116817

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-networking.inc    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 1137258825..16d5102a03 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -9,31 +9,43 @@
 PTESTS_FAST_META_NETWORKING = "\
     freediameter \
     geoip \
+    geoip-perl \
     libcoap \
     libldb \
     libnftnl \
     libtalloc \
     libtdb \
+    libtevent \
     lldpd \
     mbedtls \
     openhpi \
+    openl2tp \
     squid \
     tcpdump \
     wolfssl \
 "
+PTESTS_FAST_META_NETWORKING:remove:libc-musl = "
+    libtalloc \
+    libtevent \
+    libtdb \
+    openhpi \
+    "
 
 # firewalld currently hangs forever so disable it for now
 #    firewalld
 PTESTS_SLOW_META_NETWORKING = "\
-    net-snmp \
     openvpn \
 "
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
-    geoip-perl \
-    libtevent \
     lksctp-tools \
+    net-snmp \
     nftables \
-    openl2tp \
     python3-scapy \
 "
+PTESTS_PROBLEMS_META_NETWORKING:append:libc-musl = "\
+    libtalloc \
+    libtevent \
+    libtdb \
+    openhpi \
+    "

