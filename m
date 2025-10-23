Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B979CCF9E9
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.72])
 by mx.groups.io with SMTP id smtpd.web10.16329.1761212821093965476
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=IcfnV3GZ;
 spf=pass (domain: phytec.de, ip: 52.101.66.72, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDgxmGf4C/oqgSxhUTrHIRMHzDlIpF6O7Hn9W3VATIPcWPedlv5QnOmegK4FSc0MlJPqvZAkY6OXyj2w3FVkuuZWcJCE9oBDPmRPvik6lO13KTeOf+7PLyBzkCsSVETlCXWXljpfw+FoyKVeYbft/nRmhJJ1QDI3xU07e3EvMp/AvTQJaeEEUFofA2YxU4uxt3sv7+siJpAOwTygnRhmz/ufnS3cDxk22SJL8cwv8QCbaHMMlQ9qw+BtYuePlvHwcVf/97cOEcbRSpAKNzk45M/Jpzp7kU5bP5W8pFK0owVHUGcgRLkWbDJYMlAcNVzlFoN1L2MI6ayjzihbV5PU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U3w8TKvGitKa3ukygCZc0scpogyAYdsy4/iHZXor9U=;
 b=LELv8HLmzKrBTjKe0o27harxNKstVkjWZbIpYqS4XJpzuK+pnUS68jjepZCf8uA/HYu38k0RwS5PkQIUgJES/zwBKnOw6wddj2+l4qrT57cgjSHDS+6Y0GQJisjQ+krnXmds9w2HZRFJnqiPqK347SX3PjAR/puix5NnTowzYFy7SEpgb3xCb1mrZCohGLBgUoUAsb4wkpGbIz6EtSQ4Muj6q458kr/87Aw1gQtQpBYh2xGuBIsb7tDgHeXhBhvBakT2J7gYQJ8YOWwCcx2k9ldc7MCT3lyyKBH8kScEGkC2qRb9XHIzBasXZn/fdYqdsHqJzXxTCc4De0Y8KLNgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U3w8TKvGitKa3ukygCZc0scpogyAYdsy4/iHZXor9U=;
 b=IcfnV3GZdfOs2tEbUmLIsjsAkIY3UIyIxULjc1OXQMZVCNPX3hsdVoAykh2NZt2UZtqD89rMeqZ2ZnPswvwBElFEo1c9Yibc3P9L9eZDX+7tgrH0ztQzS6IjXJ9MAobJAnNSiN5GcBUmwGjSg6U9yG71SK5GXr0j3vYF5i3qRLWo9Exl/2yUsVhBYoVjvK1G4OQbqQqlM3Ho5z/UAfl4/eu+SaQk+C/ekeSHht8AL+XmioBXPhZqrFx3C5rSM8ySIpNf+wXdReHa0DFblVjHNPLKK0A52I5AidjTFgzQkyO9/3EVEO1ce60a3JY18aYXzt7pelfm6Bt/QraBTxIjng==
Received: from DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) by DU0P195MB1651.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3a4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:46:58 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::a0) by DUZPR01CA0048.outlook.office365.com
 (2603:10a6:10:469::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:58 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:36 +0200
Subject: [PATCH 8/8] thingsboard-gateway: Update systemd service
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-8-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|DU0P195MB1651:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a27d81-825d-4d2a-b74a-08de12191c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHhsS1g5L1R2QXQxY2Ztc3VJcWJITmdCMWMyRjE3Y3BtUU5uc3hQOUFSb3RZ?=
 =?utf-8?B?VW11MDN1Q25pYTJvcE5GN3AvWkhEL2s4RExtdGRvRERDY05LQWMvNWJ2SnBk?=
 =?utf-8?B?aFU2aWRTMTYxcmdhWSt6amx6b0xXY3hGNCs1TzFQaVNvNXRqVGNoUUVLb3F6?=
 =?utf-8?B?TEUzdmN1S3NieTErZkFWUFhPU1RtbDN5NXBWRTFON2F1Z3ZGM2dGNWRmK0I1?=
 =?utf-8?B?eThtK2Q2TkNyRzBCQ3FLT2kwZ1Nld0Z2b2Zwck9zWVZBdkRBU2k1QXNTRGNm?=
 =?utf-8?B?NlRKckl6Y2s2dzAxck5KNVN3d1FuZUQrL25rMVZtRVZ1YW1pT1NCRXFpa0Rz?=
 =?utf-8?B?V3ZuVXJQMktBQll0bnZqQnZjZzRqRHo2bVNva3RnNUpEL2pzT1d6WFBMd3k4?=
 =?utf-8?B?dkFuVzloMEFKdUpLeXNMR3Q4TTFXVzhINjFlK2xsZFVBNE4xa0g5ekVTTU9v?=
 =?utf-8?B?RWpkK1Vqanl2VHd5Z1RKdTcvNVhRY0Y0UkNVUW16WWRQTjR6dW5YL2lTRDNn?=
 =?utf-8?B?dXlrTlBSTFdHMG1rOUhpc1ZrS3dUNktpR09YUVY0VzY4Nm1TcjNtdHdJd285?=
 =?utf-8?B?SHNXZDkrc0xsakRNd2ZCWG5oUmhOT1gycFloMEdzRGhDZ2xrWXlJdG9JaXNN?=
 =?utf-8?B?TUhJQ01FWmFpelphbU0wanhkc00yNlFrOXR2Z3VMRkNLbjdFdHpGTUw5Yjgv?=
 =?utf-8?B?NWROb09hRzF3UGRmRjkzalY1M3lHN2UwdU9QaVladFl0aGtFUEIxZFBvcm10?=
 =?utf-8?B?SUw3MGRLWDFJQXp6S3pZSm5MVzhLYzJOVHNtbEQrVnRvS3Zqb21US1J0ZFpX?=
 =?utf-8?B?Z0R0WGFDSDhGdUdNZDQ2N1BtcWduajh1OFpDeVJRamZQVUsvVytPZlVURmJS?=
 =?utf-8?B?aHdVSHFqVUQrbGF4cXE5NmFzaVk0TXY5VFlSbTZKS2FLdGJRRFVlbnZJTTFq?=
 =?utf-8?B?akVBNkxOeWFyTWRpWEFzeUt0bmdEV2xrNkpDMGtrVW1lN096YXVnbzNYZ0pn?=
 =?utf-8?B?VERHeUZwZ2dMN09KbU1vVDF2TWJnTkgwQjAwek13SzE1NWhNanhlKzJ1SVlG?=
 =?utf-8?B?N2Q4OUUxcWszNE03RzJOOGwwNDhFaENXQTFMMUNWdlN3Tjc5THNWN0NXSkxt?=
 =?utf-8?B?c2JDZ0hlajZzOE1ndUNJcjdXQWRUTHovdlBDODI3VWtQVndFRWxFMWlpTjBy?=
 =?utf-8?B?K3B6N3QwdFdxTmtLTytkVlZzSWdTSEZhc3FUSmh1MTJ2SDhmQW43Z2VUcThm?=
 =?utf-8?B?VkFvSkhvWnNuL0ozTE9LeHYveGRYeEhacVJpN3dOWG1nSS8wZWc5ZklBRmFY?=
 =?utf-8?B?dXJPL3krUXRQWll0UW9NVGQxcWVwb0hyRXlNcmxMRzZXY24wS21KdjJPbnA2?=
 =?utf-8?B?U0dCUzA3QXVVZFRCM2RFR3hCcVJnKzRzWWNIeXovbnVtUENzWWhqaTB3NEJF?=
 =?utf-8?B?UzRWZlJzWWY4RStrR1lhRENuTVRyL2JuMjN0ZklFOHpSQjlQN1hoR2NxV1Z2?=
 =?utf-8?B?T0lzdEJwTTJRMXBPTlF0MHpRY21IanUxOHBaN2JXNGpOclFNRmpsbm1WcU9H?=
 =?utf-8?B?TmZWT0FSVXB0K2lydFZ1b1V5eThQVGZnd3ZrdFpxcWRpNVExd0x5VHg0SVJv?=
 =?utf-8?B?amp3bXUrVnNHVFJSbWQwV2FjdDJLRFp3TG1KWnIrbDBETkk5UzZaYmdFZmtW?=
 =?utf-8?B?UW9rOFRlQnpFcjk4SEdXUmxMTGpIV21WcWswelp0MXAxZ3BVYW0ycEJETys3?=
 =?utf-8?B?MWt6ZnV6RVY0S0xDNVdkSzhvTDNkWCtidWRoZFAwSE5uVS8ySGFGSUxNUld5?=
 =?utf-8?B?dXNSKzMyODJZR3B5aXJ3UjFzY0U1cGx6dkVnVzhlNEpKY293S3QycEdSeVNU?=
 =?utf-8?B?dlhyNC81ZzAvVS9TSFdiMHVacU1RKytwVmZEZVBHcGJpeEZLdU1OZmZXMGtZ?=
 =?utf-8?B?alNVemh3U2VwN3V6TTloeCtxdVRqRlpMbjRsM3RSWjVWSHU1dndxeW5oVlFu?=
 =?utf-8?B?QlpGSU1VUE8zcHV0UlNUeTZMc0xBZkJmVENyOTNIMFNWekY5ZU1aemFMQUpn?=
 =?utf-8?B?QWpSb1JzelZLWDNSSUN6UDUzakU3bFZDM1pPcTc4UFY5VHF0SnhTNXBWMnRp?=
 =?utf-8?Q?NQ8A=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:58.6082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a27d81-825d-4d2a-b74a-08de12191c05
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1651
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120922

Update the systemd service file to reflect the changes of the source
repository.

Add a user and group "thingsboard_gateway" which the service runs under,
instead of root.

Store temporary files, like logs, in /var and make use of the newly
created user and group.

Additionally, the service should start after and wants a network
connection to be online, not just be activated.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../thingsboard-gateway.service                    | 18 +++++++++-------
 .../thingsboard-gateway_3.7.4.bb                   | 24 +++++++++++++++++++---
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
index 5dd352a553fc71562f444561e6424bee94814691..0b7601d494b2b10e2e5cd39d25db7be4ba82b437 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thingsboard-gateway.service
@@ -1,13 +1,17 @@
 [Unit]
-Description = Systemd service for Thingsboard Gateway
-After       = network.target
+Description=ThingsBoard Gateway
+After=network-online.target
+Wants=network-online.target
+ConditionPathExists=/etc/thingsboard-gateway/config/tb_gateway.json
 
 [Service]
-ExecStart   = /usr/bin/python3 /usr/bin/thingsboard-gateway
-ExecStop    = /bin/kill -INT $MAINPID
-ExecReload  = /bin/kill -TERM $MAINPID
-Restart     = always
-Type        = simple
+Type=simple
+User=thingsboard_gateway
+Group=thingsboard_gateway
+ExecStart=/usr/bin/python3 /usr/bin/thingsboard-gateway
+ExecStop=/bin/kill -INT $MAINPID
+ExecReload=/bin/kill -TERM $MAINPID
+Restart=on-failure
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
index 8ff06285f9be60a09c1d49c2f07140e8212d22fc..7a82414937da8bdf3094c825ec5dc2ce4b429c1d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
@@ -43,21 +43,39 @@ RDEPENDS:${PN} += " python3-jsonpath-rw \
 
 SRC_URI += "file://thingsboard-gateway.service"
 
-
-inherit systemd
+inherit systemd useradd
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "thingsboard-gateway.service"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = " \
+    --system --no-create-home \
+    --comment 'ThingsBoard-Gateway Service' \
+    --home-dir ${localstatedir}/lib/${BPN} \
+    --shell ${base_sbindir}/nologin \
+    --gid thingsboard_gateway thingsboard_gateway"
+GROUPADD_PARAM:${PN} = "--system thingsboard_gateway"
+
 FILES:${PN} += "/etc \
                 /lib \
                 /usr \
+                ${localstatedir} \
 "
 
 do_install:append(){
     install -d ${D}${sysconfdir}/${BPN}/config
     install -m 0644 ${S}/thingsboard_gateway/config/*.json ${D}${sysconfdir}/${BPN}/config
+    chown -R thingsboard_gateway:thingsboard_gateway ${D}${sysconfdir}/${BPN}
 
-    install -d ${D}${systemd_unitdir}/system/
+    install -d ${D}${systemd_system_unitdir}/
     install -m 0644 ${UNPACKDIR}/thingsboard-gateway.service ${D}${systemd_system_unitdir}/thingsboard-gateway.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} 0755 thingsboard_gateway thingsboard_gateway -" \
+            > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        echo "d ${localstatedir}/lib/${BPN} 0755 thingsboard_gateway thingsboard_gateway -" \
+            >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
 }

-- 
2.25.1


