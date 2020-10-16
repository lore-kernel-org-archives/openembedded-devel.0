Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.87])
 by mx.groups.io with SMTP id smtpd.web10.9976.1602833516397530277
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 00:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gjtpLU/w;
 spf=pass (domain: windriver.com, ip: 40.107.69.87, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grtdzoAMNVyu1X9VoNjKzagSDbgbdGWii5vwolQQxbQWVGP10MLHf7+UcFaFikkU2YWiIN5xkFdsaX2D8KU+z+/NWIWQ5GeichN6qcbcyGFxJT30ORPIgLFIDQybSPCm0oktWFDLwBFYxuRRuN24iqu8g1fegdue40w8pjeLBisJO/p5Rgw1FTO35KJ+ptJ0QB6qXpTpck/tBk9zH1/C7YhpB070yqxlrURiz9ifMpDdYNzz+mENDAFwjLwbMkrQJoXzuzzvrjETmXRuSqpGp4gAO2U1zImRzC3nipeJh4oHJngc7zmKEhTvh4xZ14rAept/w+qKrMHmssYX4QlhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgtcguClCI4CcXVo4f9SyGwTcEvwkIzGJcc+RHFHm/4=;
 b=HQRggODA9kcHKbKNngkUGeWPd9R74REB35NxP3Dlbjs4yupxnhEVf7kxsESc+RFZ/f9PWz3LTHuk3L9UXwlw96MAL1ne/oDKywSuA+SUSV1s7cyAVuxXhRXpQBMJwM20Y1sbbwWGd/38Qy5bnlUwu0YjFqCPNjwCPNiYxzKA7VkvvzA0i8KU0yUJ0uFtrSJCmFSjuCozyXsYwop3g9WuIK/p5TQdV4fqcj02VcaZqt6ccCHBzcctIP4ZmBIpZV4APsj2UfsZzLgMcT09nFd0qphxS+MR/KBTGV9A2TqJ1smelSy2ZAvpfCe+MY6cUJnLZpkPCurdvQcFhFPYwpsXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgtcguClCI4CcXVo4f9SyGwTcEvwkIzGJcc+RHFHm/4=;
 b=gjtpLU/wdLlOKGzWMRFsJLrZjF8ZCs+Y5Pgsn8pjB+GN0qtUBytCqlXyf74dEv4kN7t7uUv2QNlAoTlo25Od3BJnCW3AbJWiY0d2CSFx6xw9Lk3mALF+r/Zhf5RFY3J09/JuPBsVfZPMHiRJDSosvS/DPJxy1Fckkj8K6cws760=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 07:31:53 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 07:31:53 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] lmsensors: use /run instead of /var/run for systemd service
Date: Fri, 16 Oct 2020 15:31:32 +0800
Message-Id: <20201016073132.25745-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:202:2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 07:31:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 057f9362-b786-4e91-091d-08d871a58d5d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2903:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2903608CD0B090CB38863DEEED030@BYAPR11MB2903.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CF02DJJT1pHHCM6257pL6bYldGfam4hCamhhawiU02U/ea6JTQ235S13zye+Qs/z6vGiGKVgo27ICdy7Yq99YoTxs0KlaMUQLBKJzMxcmEV/Oabk8K89ndDG6NvY2G4jlf0U6+crXnLwjL8BKaW5qBAhn0PiEaHovcePz1vOQKGWOdMSs7dGxtBVvc+oCcmTpokW/irA4AG03boab7RLRHSki4wPFoYRCkRmR+9u5XrKlJYgFP46s0nhZWZOdRLXIAZiFR8tmjxN9fcOW5hjTAQmFrAm1apP2V4fF8NL0f4+yPh/bWpy9AE3wsg0Jd6+i9gemKDIcVs+Wgvs1hYKgt6KIGUUZaWF5DEbZEvYTHVTgzrhWrUkG2WlHS8PqxBF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(66946007)(66476007)(66556008)(52116002)(6512007)(6506007)(26005)(36756003)(2616005)(956004)(316002)(5660300002)(478600001)(8676002)(186003)(1076003)(86362001)(6916009)(6666004)(8936002)(83380400001)(34490700002)(6486002)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sMypbY5vk1NAzUg/XdVhsarx1vDqKAlDRoe8XZNgutnVgx1iKLNHdO9q1HgeHvp51VoyoufLiN64qFfsYxbQzB8B/E008vkpInxWspsq4Vm+Y4MIrzQFbj5+cYuRaWcMLlHmxHjjG77VIIoWd/+5q6DFp7GuHLb79E4JScVOkWRVDZHXhvcDXH7XycH9aKH9n3DBxCxETOi9XnXmtiTwEe87y3ycKC0gFBwuHTctNhME13UVpWi/remKUWPHVjZTfUhofp3a5Ii7O3VwtBMWlJfDExwezspqwp1ozYQjWA4izLhDY01kugWD92FZRlEn9gEB1ba3SwQfuQG2A0rHctNZilflg2DQ+K3bFDjH0CSDslXmJJKo1KuIkJ9vKAS8v0HM7tdlvd3K/V4dXQlFjg5qKDLyYLE134N12dwiblamlU8+Q+vK0/gSsPxp+2WKZGjIAZCQXTbv1SPSJotNclTCCLYYG+OKk3lUsW0KiWZ3COHp/8Fe+AsJKr1X4SQjKtFIV+UMUWN932B+1H3prgJ0zXJjtc579BoLBphPd7VAvs+vVMViutqjMWRNwlCbNUN3onasXU6i13/8e2k6T+PlIwOGHZ0evswQeOr9NJMUg/E1ZokyLUrUaMy4/d55BpltqG5xajae9uoUXFUfPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057f9362-b786-4e91-091d-08d871a58d5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 07:31:53.0720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wSHrMikICdFa4xoi+y2D33Oo/4Nkbq/BVRSYarlDOjWPgRx+NH1a4g3Lyo1kZrb13Fh6s11QI5ls6X4mcK5HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
Content-Type: text/plain

Backport patch to use /run instead of /var/run for systemd service
files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...nge-PIDFile-path-from-var-run-to-run.patch | 44 +++++++++++++++++++
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch
new file mode 100644
index 000000000..c34db695f
--- /dev/null
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch
@@ -0,0 +1,44 @@
+From 25f4f8793730ef3d170f1f2bd729a82fd61a4784 Mon Sep 17 00:00:00 2001
+From: puneetse <22071208+puneetse@users.noreply.github.com>
+Date: Wed, 11 Mar 2020 09:36:51 -0700
+Subject: [PATCH] Change PIDFile path from /var/run to /run
+
+/var/run is considered a legacy directory by systemd 239+ and having it in unit files causes a warning to be emitted to the journal.
+
+Upstream-Status: Backport [25f4f8793730ef3d170f1f2bd729a82fd61a4784]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ prog/init/fancontrol.service | 2 +-
+ prog/init/sensord.service    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/prog/init/fancontrol.service b/prog/init/fancontrol.service
+index 3ac1ed02..43293141 100644
+--- a/prog/init/fancontrol.service
++++ b/prog/init/fancontrol.service
+@@ -5,7 +5,7 @@ After=lm_sensors.service
+ 
+ [Service]
+ Type=simple
+-PIDFile=/var/run/fancontrol.pid
++PIDFile=/run/fancontrol.pid
+ ExecStart=/usr/sbin/fancontrol
+ 
+ [Install]
+diff --git a/prog/init/sensord.service b/prog/init/sensord.service
+index 2448beeb..af2f0ae9 100644
+--- a/prog/init/sensord.service
++++ b/prog/init/sensord.service
+@@ -5,7 +5,7 @@ After=lm_sensors.service
+ [Service]
+ EnvironmentFile=/etc/sysconfig/sensord
+ Type=forking
+-PIDFile=/var/run/sensord.pid
++PIDFile=/run/sensord.pid
+ ExecStart=/usr/sbin/sensord -i $INTERVAL -l $LOG_INTERVAL -f daemon
+ 
+ [Install]
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 9c561e9f4..4ee96df98 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
 SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https \
            file://fancontrol.init \
            file://sensord.init \
+           file://0001-Change-PIDFile-path-from-var-run-to-run.patch \
 "
 SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
 
-- 
2.17.1

