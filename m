Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47A7D2E037
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:19:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1268.1764922743672468402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IjcHkkwO;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso2536156a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 00:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764922742; x=1765527542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqsm3qpGx0tfwgh9yU6L0/EJ9XOUW6zIt5L/vppGbfQ=;
        b=IjcHkkwOnN3yvec/5IfLnZn6xFcFEmsrzKV3lIYtawGCMYAYET1dFkiLNeKizhhbEn
         scbsO2m9mFjUZaDDGZ4FRxYYkqmkDD1QKlJBT3y/xUbMD9hpxLp/tLMn5yi6p3scbNEK
         C6LSyGWCIJVA8EphFUp242WEKNd7J9uJgJ8og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764922742; x=1765527542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oqsm3qpGx0tfwgh9yU6L0/EJ9XOUW6zIt5L/vppGbfQ=;
        b=WKDQkkmB2Hus7KP2YLEmW7lcucLkg2WJFJGYsE/Inl2UEjOJwafPIKf3N01E5ARpmc
         zpEf1EdGkDIc2tIHwmPMrjJ1fruUkkboQgt/wPFHmZUHF9gppoDUPei/w1NSC08gLt3v
         PNoPtFkSLERfvm8UtvhhM1VXsuftfkMlhEtoFyBtQqEi441qFxQFN7xXWmA2pLhh6gRx
         E6LYeTNYQdp2q/5k46u++hNLEDh1321h/jm0zIwf7HVVXOuM/RWIqfssBkx/0AJUYXqv
         WENkqkSBS34HAbSNTBH8AUqQfUdb0MCxUykYc/QYr/A747J11owDmpt/2CcSJSzGQehq
         F96w==
X-Gm-Message-State: AOJu0Yzj7WmWf6hqQLEiM3sD0UbxFBal6n3gZolftd6o3yXPzYG8uwSr
	jqIdN+MWKAwtXnEjuowzvrE96IzAtxsQGIC2BCBcEtyECZZe/vqF3NiBfzvy8I4f0d0ZHj5cywY
	NgpjI
X-Gm-Gg: ASbGnctPoIO0OeyJjMypM0m4B34bZUPT/YbqQ/U2HDwo/OopNmkpNc/U19M/ipVg1jr
	V85JYTbu7fwvf2SzEf/NTsgjJV2zGv8DBgTOjY1uEBDax8h/xoOq6ZF+57Dh0/JSc6PO77m/Euj
	1swh4bwz+JYeLQvnAJO7Mtjylk6oVpSgSy2Q1R6qRJ7s9/wZfJoMRPxk5jM4nAyF0oaoTmbIFu3
	pj/qjqFf2ggvOtN/24IwQJNPpEmvJn01d2JMwAT+JBAkHsKIlkoBUHa9TtQ0DDck/F65T8cTow+
	gFZvCL0sOjYGVOyfY5aJa1U9cdpgHDLI3ECHwB8jBgWVXC8pM+1kdGevJpPSK5Qs6dlja3WpY18
	U0AoIjGT1AAnDwmqSuEVHoaj72Nv8ANuG/RP3GQCFkjxa8npBLNwEN6anjwBj7snTfpiG+pKxx3
	raNuLdlZSYj91hscedp6JhP+w=
X-Google-Smtp-Source: AGHT+IHnV0SflSdk4lm0ZJTeyPml75YYnPENkWd20G99QUWmbbbE1f3Wu3lSzuyCO+rk/HcplJ2ukA==
X-Received: by 2002:a17:90b:17cb:b0:340:d578:f299 with SMTP id 98e67ed59e1d1-349125be4c3mr9658889a91.3.1764922742387;
        Fri, 05 Dec 2025 00:19:02 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:7205:8451:cf5d:1824:de5d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6817397d0sm3921514a12.6.2025.12.05.00.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:19:01 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch 1/2] net-snmp: Fix a crash and support for 6.7+ kernel
Date: Fri,  5 Dec 2025 13:48:39 +0530
Message-ID: <20251205081840.2716037-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 08:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122340

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from 8147a884c68d8fdd89939a8443a902b65297520c)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index f9572a1869..95e900b88e 100644
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
 
-- 
2.43.0


