Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E4FCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 19:01:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.64])
 by mx.groups.io with SMTP id smtpd.web11.1752.1760122884250751947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 12:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Z+XDt79/;
 spf=pass (domain: axis.com, ip: 52.101.84.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C24xaZNRlkmO+0G+qY/LCI6FRuKbkR+hUFGjPcLXQusxf8XqNObKid0Thv9AUbwPf4AodJ9XS6XTWBi/to05bnBDA1YwDPEpJEitQKbm1mBZ9GmP/TeRp8BpQ5PFATRc7gChbL16EdsRWSNclEWmqmEdCInl68v09kmrelaJ2OBOjoCc0S1IjM3kVza+LCWAi5oymfoD99VJHdErYe76WEVJH2tTFIf2QM09oMQpqhQ+IMdKp8dXeXA+s2fT9q1AjsjzdxcHJujvuaQidXEiSTQHe561AwfQigWk74mh67WbXLXH4VrhsTdH9eHy5vOLPxOn5k4aTTQWQyUnoUv/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kubWyNTrsj18eup6SY7TpsGnhuAn+4gcTxfzkOx/oHY=;
 b=H8CCd71+ZmZfJRqWSA4Xt7Wyw+Qu0FV6P6vtAZOvLkGkqx/omFDo5Kr5pngV6J8zm9echG6+pLfPyNn4AQUZpg5mDFWKMJysPO/aiO6Ocr7lj7jZxjLlN92P9lrobDG6Q7iwDjzP6ISoNhK6yJW+Jr1ng3fEcmIcsyyyAwjWuT4Ax9JkBP+cHTKVNbBwNtwq9MsBkD328/qzSs1kVtM+i7dJv8Pe9VrpBoFrDo3quDI82pYVp9GMvDgO4f4kZWDRTrMpLEVQV+q4rde9GuiaXzCzZuExJVZS8FDPNEYQHSs4IblsGsV8GW8VopoWcCgv4JEyZ7EZrajVnPO+KkmKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kubWyNTrsj18eup6SY7TpsGnhuAn+4gcTxfzkOx/oHY=;
 b=Z+XDt79/TeX8zcbUE0REUdTKoq021PzrfCVsWCDjTkYvI9VXf9tY6EXqqAoqLW6/VjPp2QU0rliYIye4mPCf2V5xoszUD8VRsLs9W+WUhLwsINIyFVEW42NAl+HJC0Oig1djHNbTzjf8WjwFGxSBv+Ni9v61fWanAyzai2Qmf9w=
Received: from AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9)
 by VI1PR02MB5757.eurprd02.prod.outlook.com (2603:10a6:803:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:01:16 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::11) by AM0PR02CA0112.outlook.office365.com
 (2603:10a6:20b:28c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Fri,
 10 Oct 2025 19:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9228.7 via Frontend Transport; Fri, 10 Oct 2025 19:01:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 10 Oct
 2025 21:01:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 10 Oct 2025 21:01:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F22391C68
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 21:01:14 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E1DCD1207DD; Fri, 10 Oct 2025 21:01:13 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: Backport a patch to make sure $(LDFLAGS) is before any libs
Date: Fri, 10 Oct 2025 21:01:11 +0200
Message-ID: <20251010190111.107126-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|VI1PR02MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f10464-130f-4c56-1e14-08de082f633b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lYOkP2mKJ22A9vwsQbszWm9JUX8zFZU34RFjjvA22fkRXUAhXopiApTaQQhW?=
 =?us-ascii?Q?3l6LehI3XK88H238hRrZoYPHPyKKq5mrvlrbo+ldXbL3/Ix3YSeV4i3hgPVT?=
 =?us-ascii?Q?VnbHFbHibam9qdCQlpKCL/mq67ivHbL8W10jxiMb0kikcwIKJXRmVxV7elqE?=
 =?us-ascii?Q?E107eJoR7T6CbahyELTzQdyB5tiV0Gj0jtN99o3wJmUhvcAMvnNJ8qUlF6nu?=
 =?us-ascii?Q?tKl8qRHMTanF/FjK0MjBCj51N1KoWC4l0eHRHdVZ8WbX/lK4+f8YQim+dI7T?=
 =?us-ascii?Q?n90VJyvQpuDlo1mmbwT3jrCPLaeG2qKXH/v5InikhkO3jQd4+D98cmsnlFYp?=
 =?us-ascii?Q?pL+orHLnXNOaAmqUL/S66kH3gP8xTaCMaHIzzNJqIE5ydRz/8V3Fni3XL3NV?=
 =?us-ascii?Q?wbfxk+/PZi1t3RniAZ0LijXblFQDWZJoLCSiEE39vDfTfWZM4vmChFdENSjQ?=
 =?us-ascii?Q?XmW9359m94+Kv9t8m4yAgLD6E4zjjbOyKY5WeyNwGwmIpExuhD1bVoRKtK1M?=
 =?us-ascii?Q?VvNLnl/tZcvaN2/+r/g7b5ZlyaQRdq38l0Zt703vKWkyOra+OfUqdAfLQkqc?=
 =?us-ascii?Q?Esb+evZKce59YaB8NWsRGOGyCuTiYhN4xolyFRu73TTVZial6a3gTGmxuzTk?=
 =?us-ascii?Q?hvcS1Vox8qJsHGSIZN1qSdVr36pcJbRf5PbupnYPo3aM9eysxFphGuFCz7Oi?=
 =?us-ascii?Q?QFLPVDwEroSNSFgnL+xuf9sZtRycUneWnWtqJ76JGV7N/2hHBaZgt6OAb2Qb?=
 =?us-ascii?Q?UUqpqi3oAkc0ieH+smcI2ohTxVsLp0MRo/28BQ5cYwr9DrAFhvAg/RleIwhG?=
 =?us-ascii?Q?KJy+sLkeHpriqWJspVjINZsfQ1jj7ZglM4fsbUGh5f5GWzl4Gsg2gY6S/4V0?=
 =?us-ascii?Q?Xfks5ylIgIPmoUV82ml/Siw2ep/K4BUxRZMaiNwT5pepjq/Gx4CVo6Nw83lv?=
 =?us-ascii?Q?WOqyNNiQnOgEZiwORKzbHEMviq8s1u4dvZx05hAhK3y/sK024tXQEVZJE3/m?=
 =?us-ascii?Q?/gDQrAgiZuV/gqRFaYmPHWb7wiBzu3RtdOD9rGf9Xv+iGXDA/2oJ2ctLUvxI?=
 =?us-ascii?Q?XIx7+65UNBBcfYhtH2HPmKquVVcTp64EaVrIMjTfk6dtBoyKKouQuNpv3QZW?=
 =?us-ascii?Q?3XR711mo6PYVpOYETzUuMfXeen14VL1+E5jjenh5EccI2+FsUSrZIvG9MRiF?=
 =?us-ascii?Q?fK6FCeQ0jAD0hTOZDXSHkogOwROcRVbNeneP2yJc0NaGOEBWPRrsu7nbo/tx?=
 =?us-ascii?Q?vX2sqZzTYsl3+BNLrWkWvMq6e1tQrKxz6vtliCQGjwBfDTdCuGtV+x8J6BFt?=
 =?us-ascii?Q?n8MJmYwAhxYvMaui7ZmZ4KbP7QFDoQPd+j3VBGjAVOSaIdySnxzmQ4sXIeXb?=
 =?us-ascii?Q?sDtdeRc0sJ/gBqC+1f9no/u5bLwxEB09i3NXfsFhEGqSdX6PO3acfwZ/7aYO?=
 =?us-ascii?Q?iy/ci2VutHB8ZfkR0xFLCZUMto/Y2ghhEQYRka4/D1B2yfwogFJdI84knxPe?=
 =?us-ascii?Q?YzrYroZqSO0j93p/DQTk0ecJVfzgMAzXvqjY+QxvXwPTQrPpDXa3uPoa3A23?=
 =?us-ascii?Q?kujhb/zghz6OIfQZylk=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:01:15.4078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f10464-130f-4c56-1e14-08de082f633b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5757
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 19:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120486

After commit 1997d3d6c43348c663f3295dac3a906ad38549a4 (net-snmp: Do not
pass LDFLAGS to compiler), some linker flags, like "-Wl,--as-needed",
appear too late on the linker command line. Backport a patch that
corrects the order of the arguments given to the linker.

Unfortunately, the patch is not enough. libtool reorders the arguments
given to libtool --mode=3Dlink so that any lib dependencies appear before
other linker arguments. Therefore it is needed to inject -Wl,--as-needed
on the linker command line that libtool produces.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0001-Fix-LDFLAGS-vs-LIBS-ordering.patch   | 252 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |   7 +-
 2 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/000=
1-Fix-LDFLAGS-vs-LIBS-ordering.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-L=
DFLAGS-vs-LIBS-ordering.patch b/meta-networking/recipes-protocols/net-snmp/=
net-snmp/0001-Fix-LDFLAGS-vs-LIBS-ordering.patch
new file mode 100644
index 0000000000..51a63538e4
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-LDFLAGS-=
vs-LIBS-ordering.patch
@@ -0,0 +1,252 @@
+From 10883d754750865e42327826ee90d7eda3741dda Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Fri, 2 Dec 2022 02:26:29 +0000
+Subject: [PATCH] Fix LDFLAGS vs LIBS ordering
+
+LDFLAGS must come before both LIBS & any listed objects in order
+for certain valid LDFLAGS, like '-Wl,--as-needed' to work correctly
+(otherwise it'll either take no effect or discard libraries when
+they're needed).
+
+Gentoo has been carrying this patch for a while.
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/72b=
47b9b41d2640ed4810297f2e26f5eb9d2fa31]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.top                 |  4 ++--
+ agent/Makefile.in            | 16 ++++++-------
+ agent/helpers/Makefile.in    |  2 +-
+ apps/Makefile.in             | 46 ++++++++++++++++++------------------
+ apps/snmpnetstat/Makefile.in |  2 +-
+ snmplib/Makefile.in          |  4 ++--
+ testing/Makefile.in          |  8 +++----
+ 7 files changed, 41 insertions(+), 41 deletions(-)
+
+diff --git a/Makefile.top b/Makefile.top
+index 53e0392..5de5648 100644
+--- a/Makefile.top
++++ b/Makefile.top
+@@ -86,11 +86,11 @@ LIBCURRENT  =3D 42
+ LIBAGE      =3D 2
+ LIBREVISION =3D 1
+=20
+-LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) -rpath $=
(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDEFI=
NED@ -o
++LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) $(LDFLAG=
S) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @L=
D_NO_UNDEFINED@ -o
+ LIB_EXTENSION   =3D la
+ LIB_VERSION     =3D
+ LIB_LDCONFIG_CMD =3D echo "do not ldconfig\n"
+-LINK		=3D $(LIBTOOL) --mode=3Dlink $(LINKCC)
++LINK		=3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(LDFLAGS)
+ # RANLIB 	=3D @RANLIB@
+ RANLIB		=3D :
+=20
+diff --git a/agent/Makefile.in b/agent/Makefile.in
+index 44f8818..6008eb8 100644
+--- a/agent/Makefile.in
++++ b/agent/Makefile.in
+@@ -288,26 +288,26 @@ all: agentlib subdirs miblib $(INSTALLBINPROGS) $(IN=
STALLSBINPROGS)
+ # build stuff targets
+ #
+ getkstat: getkstat.o
+-	$(CC) $(CFLAGS) -o $@ $? $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $? $(LIBS)
+=20
+ getkstat.o: mibgroup/kernel_sunos5.c
+-	$(CC) $(CFLAGS) -o $@ -D_GETKSTAT_TEST -DDODEBUG -c $?=20
++	$(CC) $(CFLAGS) -o $@ -D_GETKSTAT_TEST -DDODEBUG -c $?
+=20
+ getmibstat: getmibstat.o
+-	$(CC) $(CFLAGS) -o $@ $? $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $? $(LIBS)
+=20
+ getmibstat.o: mibgroup/kernel_sunos5.c
+-	$(CC) $(CFLAGS) -o $@ -D_GETMIBSTAT_TEST -DDODEBUG -c $?=20
++	$(CC) $(CFLAGS) -o $@ -D_GETMIBSTAT_TEST -DDODEBUG -c $?
+=20
+-snmpd$(EXEEXT):	${LAGENTOBJS} $(USELIBS) $(AGENTLIB) $(HELPERLIB) $(MIBLI=
B) $(LIBTARG)=20
+-	$(LINK) $(CFLAGS) -o $@ ${LAGENTOBJS} ${LDFLAGS} ${OUR_AGENT_LIBS}
++snmpd$(EXEEXT):	${LAGENTOBJS} $(USELIBS) $(AGENTLIB) $(HELPERLIB) $(MIBLI=
B) $(LIBTARG)
++	$(LINK) $(CFLAGS) $(LDFLAGS) -o $@ ${LAGENTOBJS} ${OUR_AGENT_LIBS}
+=20
+ libnetsnmpagent.$(LIB_EXTENSION)$(LIB_VERSION):    ${LLIBAGENTOBJS} $(USE=
LIBS)
+-	$(LIB_LD_CMD) $(AGENTLIB) ${LLIBAGENTOBJS} $(USELIBS) ${LAGENTLIBS} $(LD=
FLAGS) $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
++	$(LIB_LD_CMD) $(AGENTLIB) $(LDFLAGS) ${LLIBAGENTOBJS} $(USELIBS) ${LAGEN=
TLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
+ 	$(RANLIB) $(AGENTLIB)
+=20
+ libnetsnmpmibs.$(LIB_EXTENSION)$(LIB_VERSION): ${LMIBOBJS} $(AGENTLIB) $(=
USELIBS) subdirs
+-	$(LIB_LD_CMD) $(MIBLIB) ${LMIBOBJS} $(AGENTLIB) $(USELIBS) $(LDFLAGS) ${=
LMIBLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
++	$(LIB_LD_CMD) $(MIBLIB) $(LDFLAGS) ${LMIBOBJS} $(AGENTLIB) $(USELIBS) ${=
LMIBLIBS} $(PERLLDOPTS_FOR_LIBS) @AGENTLIBS@
+ 	$(RANLIB) $(MIBLIB)
+=20
+ agentlib: $(AGENTLIB)
+diff --git a/agent/helpers/Makefile.in b/agent/helpers/Makefile.in
+index 51f409d..05a9adc 100644
+--- a/agent/helpers/Makefile.in
++++ b/agent/helpers/Makefile.in
+@@ -32,5 +32,5 @@ LOBJS =3D dummy.lo
+ all: standardall
+=20
+ libnetsnmphelpers.$(LIB_EXTENSION)$(LIB_VERSION):    $(LOBJS)
+-	$(LIB_LD_CMD) $@ $(LOBJS) $(LDFLAGS)
++	$(LIB_LD_CMD) $@ $(LDFLAGS) $(LOBJS)
+ 	$(RANLIB) $@
+diff --git a/apps/Makefile.in b/apps/Makefile.in
+index 57b8524..b5b26f9 100644
+--- a/apps/Makefile.in
++++ b/apps/Makefile.in
+@@ -161,37 +161,37 @@ OTHERUNINSTALL=3Dsnmpinformuninstall snmptrapdperlun=
install	\
+ # build rules
+ #
+ snmpwalk$(EXEEXT):    snmpwalk.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpwalk.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpwalk.$(OSUFFIX) ${LIBS}
+=20
+ snmpbulkwalk$(EXEEXT):    snmpbulkwalk.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpbulkwalk.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpbulkwalk.$(OSUFFIX) ${LIBS}
+=20
+ snmpbulkget$(EXEEXT):    snmpbulkget.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpbulkget.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpbulkget.$(OSUFFIX) ${LIBS}
+=20
+ snmptranslate$(EXEEXT):    snmptranslate.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmptranslate.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptranslate.$(OSUFFIX) ${LIBS}
+=20
+ snmpstatus$(EXEEXT):    snmpstatus.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpstatus.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpstatus.$(OSUFFIX) ${LIBS}
+=20
+ snmpget$(EXEEXT):    snmpget.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpget.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpget.$(OSUFFIX) ${LIBS}
+=20
+ snmpdelta$(EXEEXT):    snmpdelta.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpdelta.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpdelta.$(OSUFFIX) ${LIBS}
+=20
+ snmptable$(EXEEXT):    snmptable.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmptable.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptable.$(OSUFFIX) ${LIBS}
+=20
+ snmptest$(EXEEXT):    snmptest.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmptest.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptest.$(OSUFFIX) ${LIBS}
+=20
+ snmptrapd$(EXEEXT):    $(TRAPD_OBJECTS) $(USETRAPLIBS) $(INSTALLLIBS)
+-	$(LINK) ${CFLAGS} -o $@ $(TRAPD_OBJECTS) $(INSTALLLIBS) ${LDFLAGS} ${TRA=
PLIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ $(TRAPD_OBJECTS) $(INSTALLLIBS) ${TRA=
PLIBS}
+=20
+ snmptrap$(EXEEXT):    snmptrap.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmptrap.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptrap.$(OSUFFIX) ${LIBS}
+=20
+ snmpinform$(EXEEXT): snmptrap$(EXEEXT)
+ 	rm -f snmpinform
+@@ -202,40 +202,40 @@ snmptop$(EXEEXT): snmpps$(EXEEXT)
+ 	$(LN_S) snmpps$(EXEEXT) snmptop$(EXEEXT)
+=20
+ snmpset$(EXEEXT):    snmpset.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpset.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpset.$(OSUFFIX) ${LIBS}
+=20
+ snmpusm$(EXEEXT):    snmpusm.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpusm.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpusm.$(OSUFFIX) ${LIBS}
+=20
+ snmpvacm$(EXEEXT):    snmpvacm.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpvacm.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpvacm.$(OSUFFIX) ${LIBS}
+=20
+ snmptls$(EXEEXT):    snmptls.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmptls.$(OSUFFIX) ${LDFLAGS} ${LIBS}=20
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmptls.$(OSUFFIX) ${LIBS}
+=20
+ agentxtrap$(EXEEXT):    agentxtrap.$(OSUFFIX) $(USEAGENTLIBS)
+-	$(LINK) ${CFLAGS} -o $@ agentxtrap.$(OSUFFIX) ${LDFLAGS} $(USEAGENTLIBS)=
 $(PERLLDOPTS_FOR_APPS) ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ agentxtrap.$(OSUFFIX) $(USEAGENTLIBS)=
 $(PERLLDOPTS_FOR_APPS) ${LIBS}
+=20
+ snmpgetnext$(EXEEXT):    snmpgetnext.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpgetnext.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpgetnext.$(OSUFFIX) ${LIBS}
+=20
+ encode_keychange$(EXEEXT):    encode_keychange.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ encode_keychange.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ encode_keychange.$(OSUFFIX) ${LIBS}
+=20
+ snmpdf$(EXEEXT):    snmpdf.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpdf.$(OSUFFIX) ${LDFLAGS} ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpdf.$(OSUFFIX) ${LIBS}
+=20
+ snmpps$(EXEEXT):    snmpps.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpps.$(OSUFFIX) ${LDFLAGS} @LIBCURSES@ ${LIBS}
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpps.$(OSUFFIX) @LIBCURSES@ ${LIBS}
+=20
+ snmpping$(EXEEXT):    snmpping.$(OSUFFIX) $(USELIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmpping.$(OSUFFIX) ${LDFLAGS} ${LIBS} -lm
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmpping.$(OSUFFIX) ${LIBS} -lm
+=20
+ snmppcap$(EXEEXT):    snmppcap.$(OSUFFIX) $(USEAGENTLIBS)
+-	$(LINK) ${CFLAGS} -o $@ snmppcap.$(OSUFFIX) ${LDFLAGS} ${USEAGENTLIBS} $=
{LIBS} -lpcap
++	$(LINK) ${CFLAGS} ${LDFLAGS} -o $@ snmppcap.$(OSUFFIX) ${USEAGENTLIBS} $=
{LIBS} -lpcap
+=20
+ libnetsnmptrapd.$(LIB_EXTENSION)$(LIB_VERSION): $(LLIBTRAPD_OBJS)
+-	$(LIB_LD_CMD) $@ ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(USELIBS) $(=
PERLLDOPTS_FOR_LIBS) $(LDFLAGS)
++	$(LIB_LD_CMD) $@ $(LDFLAGS) ${LLIBTRAPD_OBJS} $(MIBLIB) $(MYSQL_LIBS) $(=
USELIBS) $(PERLLDOPTS_FOR_LIBS)
+ 	$(RANLIB) $@
+=20
+ snmpinforminstall:
+diff --git a/apps/snmpnetstat/Makefile.in b/apps/snmpnetstat/Makefile.in
+index dfb566d..8a8cb21 100644
+--- a/apps/snmpnetstat/Makefile.in
++++ b/apps/snmpnetstat/Makefile.in
+@@ -34,4 +34,4 @@ LIBS=3D	 ../../snmplib/libnetsnmp.$(LIB_EXTENSION)$(LIB_=
VERSION) $(VAL_LIBS) @LIBS
+ all: standardall
+=20
+ snmpnetstat$(EXEEXT): ${LOBJS} ${USELIBS}
+-	${LINK} ${CFLAGS} -o $@ ${LOBJS} ${LOCAL_LIBS} ${LDFLAGS} ${LIBS}
++	${LINK} ${CFLAGS} ${LDFLAGS} -o $@ ${LOBJS} ${LOCAL_LIBS} ${LIBS}
+diff --git a/snmplib/Makefile.in b/snmplib/Makefile.in
+index ecbfc4d..1501636 100644
+--- a/snmplib/Makefile.in
++++ b/snmplib/Makefile.in
+@@ -230,11 +230,11 @@ all: standardall
+=20
+ # how to build the libraries.
+ libnetsnmp.$(LIB_EXTENSION)$(LIB_VERSION):    $(TOBJS)
+-	$(LIB_LD_CMD) $@ $(TOBJS) $(LDFLAGS) @LNETSNMPLIBS@
++	$(LIB_LD_CMD) $@ $(LDFLAGS) $(TOBJS) @LNETSNMPLIBS@
+ 	$(RANLIB) $@
+=20
+ libsnmp.$(LIB_EXTENSION)$(LIB_VERSION):    $(TOBJS)
+-	$(LIB_LD_CMD) $@ $(TOBJS) $(LDFLAGS) @LNETSNMPLIBS@
++	$(LIB_LD_CMD) $@ $(LDFLAGS) $(TOBJS) @LNETSNMPLIBS@
+ 	$(RANLIB) $@
+=20
+ #
+diff --git a/testing/Makefile.in b/testing/Makefile.in
+index 79d069d..a6d920e 100644
+--- a/testing/Makefile.in
++++ b/testing/Makefile.in
+@@ -61,16 +61,16 @@ test-mibs:
+ 	cd $(srcdir)/rfc1213 ; ./run
+=20
+ etest:    etimetest.o $(PARSEOBJS) $(USELIBS)
+-	${CC} -o $@ etimetest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS}=20
++	${CC} ${LDFLAGS} -o $@ etimetest.o $(PARSEOBJS) ${LIBS}
+=20
+ ktest:    keymanagetest.o $(PARSEOBJS) $(USELIBS)
+-	${CC} -o $@ keymanagetest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS}=20
++	${CC} ${LDFLAGS} -o $@ keymanagetest.o $(PARSEOBJS) ${LIBS}
+=20
+ misctest:    misctest.o $(PARSEOBJS) $(USELIBS)
+-	${CC} -o $@ misctest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS}=20
++	${CC} ${LDFLAGS} -o $@ misctest.o $(PARSEOBJS) ${LIBS}
+=20
+ stest:    scapitest.o $(PARSEOBJS) $(USELIBS)
+-	${CC} -o $@ scapitest.o $(PARSEOBJS) ${LDFLAGS} ${LIBS}=20
++	${CC} ${LDFLAGS} -o $@ scapitest.o $(PARSEOBJS) ${LIBS}
+=20
+ clean: testclean
+ 	rm -f *.o core *.core $(TARG)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 7c849cf5e7..f37bda921a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -30,7 +30,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV=
}.tar.gz \
            file://0001-Android-Fix-the-build.patch \
            file://netsnmp-swinst-crash.patch \
            file://net-snmp-5.9.4-kernel-6.7.patch \
-          "
+           file://0001-Fix-LDFLAGS-vs-LIBS-ordering.patch \
+           "
 SRC_URI[sha256sum] =3D "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b958=
5f4930745b0544"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/net-snmp/files/ne=
t-snmp/"
@@ -117,6 +118,10 @@ do_configure:append() {
         -e "s@^NSC_LIBDIR=3D-L.*@NSC_LIBDIR=3D-L${STAGING_DIR_TARGET}\$\{l=
ibdir\}@g" \
         -e "s@^NSC_LDFLAGS=3D\"-L.* @NSC_LDFLAGS=3D\"-L${STAGING_DIR_TARGE=
T}\$\{libdir\} @g" \
         -i ${B}/net-snmp-config
+
+    # Make libtool inject -Wl,--as-needed so that it is specified before a=
ny lib
+    # dependencies. This is needed due to libtools' reordering of the argu=
ments.
+    [ -z "${ASNEEDED}" ] || sed -e "s@CC -shared@\0 ${ASNEEDED}@" -i ${B}/=
libtool
 }
=20
 do_install:append() {

