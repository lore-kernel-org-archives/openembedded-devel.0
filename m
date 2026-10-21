Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8396.1792578849723615718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TgSZ4sXf;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=WreIEDMA;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LA5bQa4154031
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 05:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AqOy1JnnzzefV
	3GXkDPqIwY7YPN/cdNkdh0DZF8diA4=; b=TgSZ4sXf3/eLSHcWUQzFNBaLtJ/p0
	LT6s7d8941Zcn3kHZ7F2kbwk68cArwYgoDT1zCJNOsowbV7ydil5n4IIe3ITGXhS
	zXLFe1hY9TcyWREOjHI/0YY5j/21zfLeN9TDNC8ANbbdOd23I1HK3gRqMaPMCb1w
	w3VmbsoGxzZ1zvhO3GrC9OR6QVAcsPgdtDyKNlmTuQsiViX6YsU2mOc+ZqhXrFKA
	i8qyaTE5Otq2JbaicXfxXZbOadzyoKLPVNcZhL3J7eXzJfRDtfDTHDhXou1ap9Eo
	zE87ClW+r4UqlkC+8aW/+KkonS+un37D19Vsxu6aVOINe02621t+HWNnQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hek20apxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 05:34:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOLfy3cKciiofm4pR3uBafnDF2PATJHgiSeeMYi5oN84GXB3yNB0Zme4BQrxysXtBOE1/iNbIAMdeDX4QwWonGsGNj8dqAt/wguJE8lt5JJp2vAIP1rmUv7Eh/v0iiJLj5WCkhgkbJARNlW4vH2dYsN2ubVvEF3RK4WJXOWcnltLQb0cLm6vCE+sqAYqxTjJckJoyGlje/nfaua+xI0jAdkxQrCnNa0J2SrrGbC+9FOWwnki2k5YJ4PGZfiZe+1HvVAN99sMsnyvHT1cofTpxBKBbqCQJIuermqv5tlrdjqn4cknODpCxVtrp1A6XAuF+6SQKQF7oR98WMwFOx+emA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqOy1JnnzzefV3GXkDPqIwY7YPN/cdNkdh0DZF8diA4=;
 b=CViVh+gL85+nWbdqZKMXPp8acaYH0fWgYFoaNDrCpO8mwggKY9qQDRjciNpdXP9HP+YdomoYSeswB3vvvOsERqfiyinqSLrSY1zT4p0xK4S4oFt4WEm+O49EU4UnVxvy+9j/ffdgoA9amcfgLawlbOttZ6zaxMzjSnKEetB8EoibumVTP3rSSqCVTOCW9mkWkupZzL18INc72+O/wv0YYJAx9MN5TayatLqk7/I/pW7nqewlc2UkAgD9u4/QQ0q3NeHLuICVqzhSUmew/vP8e+mZSzyihodtgLuS2A70mblXqbt44oLn92DgH2ur1ZxB7mDyg0wtpWvF03ultQDWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqOy1JnnzzefV3GXkDPqIwY7YPN/cdNkdh0DZF8diA4=;
 b=WreIEDMAIS3Zur8dfQeP/VlrXdDPBwF1xliHO9DLgFg4zr1OUAWfmYy4AJmtOAsmZIiHdK2jQIJp2lFn6HjMUUWw9WlKyT7m7UdM6nbfs5X7hJ+fWRZISYUWEpWG+WNvJUagxtgiIAjqvvakNBzhT8Wki/4cqI1c75WtmQOAcKc=
Received: from BL1PR13CA0073.namprd13.prod.outlook.com (2603:10b6:208:2b8::18)
 by SJ0PR10MB4654.namprd10.prod.outlook.com (2603:10b6:a03:2d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:34:06 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::89) by BL1PR13CA0073.outlook.office365.com
 (2603:10b6:208:2b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 10:34:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 10:34:04 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 05:33:18 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 05:33:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 05:33:18 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LAXHDi3369506;
	Wed, 21 Oct 2026 05:33:17 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <v-singh1@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-sahu@ti.com>,
        <y-hegde@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
Subject: [meta-multimedia][wrynose][PATCH] wireplumber: enable systemd service
Date: Wed, 21 Oct 2026 16:03:10 +0530
Message-ID: <20261021103310.1938113-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SJ0PR10MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e83a867-6376-4ca7-82b1-08df2f5ed451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|56012099006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: QrCWjBTijzmeVMgo9v2PLpW7Cff8UkTk6moKJABeCLLEe0m2V/7rHOkAs8Ve8ktjYcZRugtyKltPkkeFiFP/9VBN6fng29mwJQ6tHV8ewcBoe2ghWLB1WGOjrY3sXOEWNUMWYGPzE4xfpTpxNLoBEYr2cewPr0F0CRZ5RQcjD01eXQBSBU9SaLinZIXUlvMkkJ8OI8i+odVExhkcO7Rg9A/C2Y45mTSD6YYEjfSq+eJMiYwODdbLUrsPdecdlDsryHmJYAx044yQOmaRKWTsj9PyB34y30ivOx72QwWZ/J/XUmauEwNXx/3YZWNX1pyqb/2uhCwxQx70SRKw+VmVWqUrF+0RQSyPUs9foMeZ9TL9QYBNyKuJJH/RAVbqJdQ675EVQlDodeHVgO+TGIfBfkno8vainDNi1c9GpweN4sTdQj57qNXjpi5u5icFCbAtOP+L+GN3EiVrYnrbYCEyl5a/OxvD9L475ntA9Zv4J+Osdb+9s9/4wdLF0sMpUXyAwYhYOiURYicRTPX9TJ8pMYLGrVLfZExtoy2UOb7bX7CJRxD4Lp3fpFjwPdHUFinzAeeAkhIdqLQPSNG93/QE2rr+jkBI34mq9Wndw9xDkQX3FMi0EUP/frnMq/Ad1f/3kxtXrDNeJRQyfASuh//UBRNi7ffO+9gmmdrx8vgdP/sGsX9hK6kGyaKKAX5wldy4yFGgx2Oi2qypQqG6cGXqOQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rZYIKYTCBf6Qny3yV3se4XBFdDrssQKjaZbH6Jpf5a772WhofPh47cAxfqP4HuTS1Ix8UD4Xwn1w83fA48H+bNbjTEEgC780ZLM48rhWNQY0BJon9qlsX2j2Dd746asjyQ+u4HT5/gMejD767+GuGJ2TLJHlckwTUijD7HfEkfb+dC5fN45OpYZnEK0AMFNnw5mAevotNtLl1TzaWih1BqvvVnO6b3BekjrVaNAz/Bh4nJZbqaBrffezpYMlTSVnIIW0XR5ZKzbYkDVikMbKOBWnZjTHtQSekiB086kd0hNN+E7lOIREHp67JhcVQ82Q0xGRxWAkgClyodyL1+3fwbsmRTFfrS3b29vpCKJcp+8ryEv4X/0SPKXildwNgpV4NBOAp8Pprd8JcA/TKaOgUAUFbl7qw6SJip40tKa9ymB7BzkdjMxNlKTd881NQYhZ
X-Exchange-RoutingPolicyChecked: jaI6VdQxLYG26KNLgYOb/4NxcdFL99oU6ystvuZG2yxoysvDJ6NwMEz6IQZTFc6HV2P+onB4OC2ZbgzutnNcwXGgNBKaG5LhoveXlSsXiy0SDn+x0MWtPCJAD2vOQjHF1Pi/Vs9N0VASqNolZomfB+JvD+d4F0fjGNNMI6AbUzxKtbxLtsT+L05hMCgzJxMsjY7hbYB45BIc/ufsWu4rULE2Tg09+S0itM2JvhD4iGRk+Iqj8Tjt7l3h+33gyHeH9iuCWfgrCDq5WRf1ig/0jN48VdMJI8gArySIVFvyRrcfWizOL1BOegX29bmDTOu/vsYcB2yQFrqC7waosRfBTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:34:04.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e83a867-6376-4ca7-82b1-08df2f5ed451
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4654
X-Proofpoint-ORIG-GUID: T7rSqUBkV4V4THRmUVbPrC1-ONMgksgN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXwtZ8vHQ5tVgT
 5S0QSRxnh1zy0wDjf0Pu77JEy/7qOwWjUA4UMYUPzACOkIZff8qOnq5/ZtPoTagzxzjtkhy6o4V
 sGDzeJPhSfNkEyP4u8qszNXBPgtNKLw=
X-Proofpoint-GUID: T7rSqUBkV4V4THRmUVbPrC1-ONMgksgN
X-Authority-Analysis: v=2.4 cv=B98sQ+tM c=1 sm=1 tr=0 ts=6ad89521 cx=c_pps
 a=yyl0I9/pvHNpizRH36fpSA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=4b8AmerOAqCdd1sZSC4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX/JyBN1NqZd6q
 FQOKEK18MwGnV0aYqscCS9MGh32tu10MouUme7Hcr9EhyPftDmfLkRb9USlJYafwjUEtB0Gsz4y
 FFu1kv7Fdl1+U2ZsxnXOsgOQByZ6VZYpWbii3sQ33owEuCDVuUxFwJnR+D9ep/UGuwB+PWXf0KK
 f+x61GcSMMypD/b8wAOKg6Egz+VjDEgt5HlEhZiXBvCBW9BT9BswZyTMBbJuMFoMr7I7rEAyd9a
 jjpPeCld7RQQPWKUk9h6/70WqM30JYRPQHu8hKxz++ziJShI6WQKsJl/W+v2XybTEZKJUM6FecZ
 b1auWTxdpadXJir/VeIt8lt+yWy5rZKxoP7VU4nwWDX5u2NA2S64rNrGuoKDGdklKG9LBAGG6Gq
 Jurn7YdRcf1+kxyBS7okk2exib96c9+zKYni385fBZ/pzjBg24+6IHA1H+5yFrjKXDwNtUm47p4
 hUWfkXqxuHEMEeIHUKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131258
Content-Type: text/plain; charset="utf-8"

Add SYSTEMD_SERVICE variable to register wireplumber.service with
systemd to enable automatic service startup and management.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-multimedia/wireplumber/wireplumber_0.5.14.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.bb
index ad05a8bc87..aa83080d51 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.bb
@@ -159,6 +159,8 @@ RRECOMMENDS:${PN} += "pipewire ${PN}-scripts ${PN}-modules-meta"
 
 FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir}/zsh"
 
+SYSTEMD_SERVICE:${PN} = "wireplumber.service"
+
 FILES:libwireplumber = " \
     ${libdir}/libwireplumber-*.so.* \
 "
-- 
2.34.1

