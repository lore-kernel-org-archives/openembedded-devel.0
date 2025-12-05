Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D00D2E00A
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 06:31:39 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.240.1764916291213106861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 22:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IKpPML5Y;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b98983bae80so1671393a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 22:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764916290; x=1765521090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBWpQqdT4N5NsSyUqF17wKupR3uRJ8/mXpkDgzPTmFg=;
        b=IKpPML5Y0g7+EzY6q976aAhxhKmezK1bsjyiuyY534uR0LNN1TnD7Ni9LZUW/mJ0kP
         GAz3xMnBeRrwedLPaZqOhfOilAU2ic616j1DUjOOIYcdQSZutvrPlHDfzptghmkEVpYb
         5O6rOby+tW44DkXWCuwvZAIBwSzR6bUiJGV0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916290; x=1765521090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBWpQqdT4N5NsSyUqF17wKupR3uRJ8/mXpkDgzPTmFg=;
        b=XRJ/7kwTcswWM6ITyEiXn3Rmr57GOSvQNwPgLc/z5s85jU5nx5WFP5dCxioqlh2WO/
         eq8K7F+URUTZXMtBBFxsc3fsNBK4cpwhGZCCxMk6BhpNvsfsaEJmkCFrs/o5joF9ahus
         OItjT95y6N3gJLsspLu74JKu6X9gaHi5f09MZH0tEwgEI5giXfAJ0Fg6ubi8ORx2/Hy0
         EdZB9KvFeJP77319UaipcnSL4h50tSobNBVdAp8/h/982UCbxBcDX420qXYT2eP0/bmB
         H0yBqjqmYJ/HXT88zj9gVCUyXw7pX1aY5dSlw+WsHJmItZSGTuR4HKP/f3oE/jfYc44O
         OVLg==
X-Gm-Message-State: AOJu0Yz5bo4nahs3gIh8VM6t1q7QIIdixbtwyTtF6W4B5Gs/d2NPL84N
	OHDauu+t/TuGc97IC0qvnShrm1RR9332kyZDx8Ct4SGYdgmvP5ItFQtEC84QO8X+I4KNVG5jNyt
	UnbHJ
X-Gm-Gg: ASbGncux7a3DtDnrwkHzJ9Jz/yLIA9dAK9cxIg1QX1YIF/MzR8NMkNInq4uxC3BYJ/g
	kv35rDxusuahM9rXy6843zcjmhJKkxQRt3c000iSb5wBOiogOBI+k1fxRAiRknIZ6gDMdkg51AG
	UImNei7v2AwyNR82IGl0RpwNr7bCDjV5ogVoaEEs+OcAlyRIeR4HW5uPsk8Bx55ZfApiyyvIja1
	wnGImYOFSbVSBy4b23BItmNFEMV7dBh6hr7hXfKcPr9eAB+DqCV9MEjajMousK3NIe6R7l5Jj2Z
	NYNpgP157ph3hiWHl5vrH3ZKL4WxhxqU0KsqedGRAxypocm6jIcAAiXtWaV8/Qr8iah8e3kOpRk
	T337WdtzlppwjivfvMT0DkEHjjpCBeclcfSyFGnwHDHFAVXrnjayKoaJgphimHEI8Rs0ZpwXfri
	bdqElEzLbxxkfunR5LJURrlAQ=
X-Google-Smtp-Source: AGHT+IHLzV4AXGoGvnU8TuP1g92SPyGsvvs1cfhDcEIcApnfxvhtfblVOrsfNxfb19SDkqn6CpECOQ==
X-Received: by 2002:a05:693c:80dc:b0:2a4:5441:5dab with SMTP id 5a478bee46e88-2ab92e888a0mr3961225eec.33.1764916289995;
        Thu, 04 Dec 2025 22:31:29 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:7205:8451:cf5d:1824:de5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8816ae9sm11260428eec.5.2025.12.04.22.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:29 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][patch] net-snmp: Fix systemstats_linux unexpected header length
Date: Fri,  5 Dec 2025 12:01:16 +0530
Message-ID: <20251205063116.2046197-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 06:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122335

currently system journal contains:

snmpd[10442]: systemstats_linux: unexpected header length in /proc/net/snmp. 237 != 224

Backport a patch to fix this issue.

Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]

Reference: https://github.com/net-snmp/net-snmp/issues/786

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...-compatibility-parsing-proc-net-snmp.patch | 122 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
new file mode 100644
index 0000000000..2d9c310e39
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
@@ -0,0 +1,122 @@
+From 49d60ba57f4b462df7dc5fd5b38b4425dab0982c Mon Sep 17 00:00:00 2001
+From: Philippe Troin <phil+github-commits@fifi.org>
+Date: Sat, 3 Feb 2024 10:30:30 -0800
+Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
+
+Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
+This breaks the hard-coded assumptions about the Ip line length.
+Add compatibility to parse Linux 6.7 Ip header while keep support
+for previous versions.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index f9572a1869..4b24520019 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit-.patch \
            file://0012-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch \
            file://0001-Android-Fix-the-build.patch \
+           file://0001-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch \
           "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 
-- 
2.43.0


