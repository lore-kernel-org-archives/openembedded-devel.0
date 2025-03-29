Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78624C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 23:18:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.20768.1743290309105399988
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Mar 2025 16:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVcGxFJG;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22423adf751so63235865ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 16:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743290308; x=1743895108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd4+uTeZulwzg3hCF3bNkoX+bCKr2pOBB1cOBHOgayw=;
        b=IVcGxFJGVJ7GtIByNX1d/fJPYA+Ibk3r3b0lFNgWTN9CXWzY+Of8pnDCm7IDCs/3NI
         LQcsGJNaCnC42C4kgO9qIZvxdFOB4UxnCqoiOY+Ur4BiKlv5jEPRuolB6kBJdDUDBXYT
         wPTJokuqxhBxPxpqFGIH7jwGKWPRIBFGyUYmH7PhkxdutVmH8/RtUlOF3wOGU/VoLzU6
         sWn0A6eYjMOIpH8im7Rl1/1HpEBiaFTKmfqBSymTrBmd3GV3whRx7oMZrMzfOw4rxKub
         z8tQaUUWjME8UT3MLb+aKFi0KGysKkcrDddZXAaLS4yMHqqOqyEuQmx6HHSUz4Bfgq3N
         6lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743290308; x=1743895108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd4+uTeZulwzg3hCF3bNkoX+bCKr2pOBB1cOBHOgayw=;
        b=v2eFdYakwew2DFN3U7UdIX/uGSaaLqUDGQClAHppDb+GyR7RBGAYVC2xfHCleFyVXS
         usfhGaN9Ov5fDJ2L0xSbA5u2gMrxaKSQmjqIjIBbHBuOslZuPZfhczPn81dHgE2KXlRL
         KcXoDT0SY2KZ3/dx65Hbi3u8AP6UzARBs2FotSQAvHUP1YXo8UxVUXCRvOjPQJpPsfel
         oUuBBGmGB2JDntnSHZ0s3OAQMA9wA6pE39lI+Tspj1Rp+eFUwsSU1snqA9GSKlboZYHr
         GzY64NF2E+SBOD1B1AYCkmZYu++A+YUVnLLur2C4OvS4t9Y+kZBn9uwxwBV6dZ6yzQxR
         K8Kg==
X-Gm-Message-State: AOJu0YyK7biVrOvn9dUnsnFtgwH60xYtygjDO7bb3VpFSdMXjjenLzRy
	C+5AttJ0HmcJakYrAQteSMjfV0lrlH7WrDZPWvUMR/c9gD4QLMfh8ORg5eaS
X-Gm-Gg: ASbGncuyt6fTmiCSRiL+s9X9zw3dHZhyC4xDI0IpiRp3TBoRx1M0wreWZAxVqQ0XnWP
	OUD7g9/Yl83Dz6vUOc1EAvpFXL4WmYKp7VjZg4hsNyMlmAYBK+X2DRGC6p6i9tW0bO72sFk7rba
	SKKAPFHUlbojmQRnSalwzsqmTYXO6TfcGl6zUUEPIfO46EUp7KBnhbhVtJMLGoA6LM/N+Zvlkiz
	lxyRudmIZhX0YqVofu3rncn6boY5iVDp0GF3EwdAN2MmUlwDiWCTiv8PQlfNw/Uto5y5WvDOu4U
	7NhoVj71o3bSz5W+sDD6nC9A48RH8P06/QNw
X-Google-Smtp-Source: AGHT+IFLV204SyV0oyZxDwm55Gy6PXwPf5Ai+lOx8NikDSYP5qy6lkYUtyxFOKPGZ7vj1VJ2ShkfoQ==
X-Received: by 2002:a05:6a00:4606:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-7398037e906mr5818084b3a.11.1743290307999;
        Sat, 29 Mar 2025 16:18:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710cce59sm4148046b3a.159.2025.03.29.16.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 16:18:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] net-snmp: Fix a crash and support for 6.7+ kernel
Date: Sat, 29 Mar 2025 16:18:25 -0700
Message-ID: <20250329231825.2392082-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 23:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116374

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../net-snmp/net-snmp-5.9.4-kernel-6.7.patch  | 123 ++++++++++++++++++
 .../net-snmp/netsnmp-swinst-crash.patch       |  17 +++
 .../net-snmp/net-snmp_5.9.4.bb                |   2 +
 3 files changed, 142 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/netsnmp-swinst-crash.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
new file mode 100644
index 0000000000..3f978d5f80
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
@@ -0,0 +1,123 @@
+From f5ae6baf0018abda9dedc368fe6d52c0d7a8ab8f Mon Sep 17 00:00:00 2001
+From: Philippe Troin <phil+github-commits@fifi.org>
+Date: Sat, 3 Feb 2024 10:30:30 -0800
+Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
+
+Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
+This breaks the hard-coded assumptions about the Ip line length.
+Add compatibility to parse Linux 6.7 Ip header while keep support
+for previous versions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
+ 1 file changed, 37 insertions(+), 9 deletions(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+index 49e0a34d5c..f04e828a94 100644
+--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
+ }
+ 
+ /*
+-  /proc/net/snmp
++  /proc/net/snmp - Linux 6.6 and lower
+ 
+   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates
+   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 259920 0 0
+@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
+   
+   Udp: InDatagrams NoPorts InErrors OutDatagrams
+   Udp: 1491094 122 0 1466178
++*
++  /proc/net/snmp - Linux 6.7 and higher
++
++  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates OutTransmits
++  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264 3632 0 3548 0 7096 44961424
++
++  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutAddrMaskReps
++  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572 16610 484 0 0 0 59957 66905 0 0 0 0
++
++  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
++  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
++
++  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts InCsumErrors
++  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8 7442 0
++
++  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
++  Udp: 2257832 1422 0 2252835 0 0 0 84 0
++
++  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
++  UdpLite: 0 0 0 0 0 0 0 0 0
+ */
+ 
+ 
+@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+     FILE           *devin;
+     char            line[1024];
+     netsnmp_systemstats_entry *entry = NULL;
+-    int             scan_count;
++    int             scan_count, expected_scan_count;
+     char           *stats, *start = line;
+     int             len;
+-    unsigned long long scan_vals[19];
++    unsigned long long scan_vals[20];
+ 
+     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags %x)\n",
+                 load_flags));
+@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+      */
+     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
+     len = strlen(line);
+-    if (224 != len) {
++    switch (len) {
++    case 224:
++	expected_scan_count = 19;
++	break;
++    case 237:
++	expected_scan_count = 20;
++	break;
++    default:
+         fclose(devin);
+         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length in /proc/net/snmp."
+-                 " %d != 224\n", len);
++                 " %d not in { 224, 237 } \n", len);
+         return -4;
+     }
+ 
+@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+         memset(scan_vals, 0x0, sizeof(scan_vals));
+         scan_count = sscanf(stats,
+                             "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
+-                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu",
++                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
+                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
+                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
+                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
+                             &scan_vals[9],&scan_vals[10],&scan_vals[11],
+                             &scan_vals[12],&scan_vals[13],&scan_vals[14],
+                             &scan_vals[15],&scan_vals[16],&scan_vals[17],
+-                            &scan_vals[18]);
++                            &scan_vals[18],&scan_vals[19]);
+         DEBUGMSGTL(("access:systemstats", "  read %d values\n", scan_count));
+ 
+-        if(scan_count != 19) {
++        if(scan_count != expected_scan_count) {
+             snmp_log(LOG_ERR,
+                      "error scanning systemstats data (expected %d, got %d)\n",
+-                     19, scan_count);
++                     expected_scan_count, scan_count);
+             netsnmp_access_systemstats_entry_free(entry);
+             return -4;
+         }
+@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+         entry->stats.HCOutFragFails.high = scan_vals[17] >> 32;
+         entry->stats.HCOutFragCreates.low = scan_vals[18] & 0xffffffff;
+         entry->stats.HCOutFragCreates.high = scan_vals[18] >> 32;
++        /* entry->stats. = scan_vals[19]; / * OutTransmits */
+ 
+         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] = 1;
+         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] = 1;
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/netsnmp-swinst-crash.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/netsnmp-swinst-crash.patch
new file mode 100644
index 0000000000..109a0600a6
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/netsnmp-swinst-crash.patch
@@ -0,0 +1,17 @@
+Fix crash in swinst
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/agent/mibgroup/host/data_access/swinst_pkginfo.c
++++ b/agent/mibgroup/host/data_access/swinst_pkginfo.c
+@@ -210,7 +210,9 @@ netsnmp_swinst_arch_load( netsnmp_contai
+ 	    memcpy( entry->swDate, cp, date_len );
+ 	    entry->swDate_len = date_len;
+ 	}
+-	closedir( d );
++	if (d != NULL)
++		closedir( d );
++
+ #ifdef HAVE_LIBPKG
+     }
+ #endif
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 0840e4955b..6a62304a1c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -28,6 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
            file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
            file://0001-Android-Fix-the-build.patch \
+           file://netsnmp-swinst-crash.patch \
+           file://net-snmp-5.9.4-kernel-6.7.patch \
           "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 

