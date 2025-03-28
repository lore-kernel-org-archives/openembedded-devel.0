Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E3CC36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:51:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7547.1743155478570268119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51826d0eb3=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S7TnSK011392
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 02:51:18 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45n7v7h2jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 02:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhVcYOOJkLto1j1eQ9GhtGkRzu8YZc4q5mljERls8w8Lr0TzOMCsA3/wPf/5XBCFhTonfiFuo0C/MbCS3+X1MC71E6L/fygZ46u+S+93G3hdkneA2PmJIikKtiuQrHgTvxpt6RrON6LhrBmA2RZ0/I6kWzORG2Zuz+DgxSC4e8B6+tz68MsdsYVytdXqCbptNnk7x549muWMgO2Xzb44bR+QigwBVUIIAu+uTf3WxbhOW3BxDeCE+0F12J1IIMa1I8VqP5zuU7t2f9tMZpj9d63O4ngePPhTab2aWpyMdCfWq0Hfxt09fCtglDqNo20FU0Dpy9wa911v5o4jQtOU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8n79Gl164riaHM/aqWbM5Uu2grfYLCzq7s8yt4vdrE=;
 b=SiarLB6jurn/IKsF1RG8SVLUW58tHp4sfrv3uOXrUi7vMVAti4+5h2jB1DHpAV8aEeNN31a5U3yO8WQ8uyLs99IbjLMlwjBS0obiGE1X4y5R92AiOD1Bh5Kc945wjQHMWqNnPDKzZTzL8wM8C5u1EfED4b0K4In0i5Q+lAhr0EE7cAzK7tKRJLkKWFGE1By1gSRMedTTB5A3+WgyeDX0JwbXZe1azgSs7K7TaWoKLnWbtD66HKhaLOtK4b9m2+xKP+JJ4K8ej1LcYY6NpfLTyyLBkhOLu2oDep9j20B7OQiGSRGEOW6q3YDQsasyeMQcCHXQV3OreNWU53/ojheDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:51:04 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:51:04 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH v2] openvpn: renew the sample keys
Date: Fri, 28 Mar 2025 17:50:48 +0800
Message-Id: <20250328095048.764844-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a46c85-a88f-41e9-1870-08dd6dde0db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wEKp1r/TPKu2FSTsZrEu+Xu8A5Tm+BCrDzKo5zkMWTNdO0YHdG1HFxKuCLTF?=
 =?us-ascii?Q?COTtTF4YWY/8EvugCXRMEdtl7IEYGduNVA67+BG6sFysa+SyB0SHzhKmPPka?=
 =?us-ascii?Q?UbQAhusDSQ/QUoKbNN3PRPcmdVq0CCXOm8TqgpcDC/DyUvD+HM9KgFjErrUP?=
 =?us-ascii?Q?UqtBn33AtIxqKkKpHN7vqUu74FYVKSB/Qz3so2P13YGjA8iF2/7V3Eb1IYdu?=
 =?us-ascii?Q?4qBI/+aEtfwNR658R/m4cBa4hvwk/K0D/KGYYA1VtosNA80mdn6wUSex4S6U?=
 =?us-ascii?Q?JQP4pKrWU1olVMjEFFeJ9ays7G+Qu0T9ZpmDdJetH2vPmxXxhgKGjKfkPRiS?=
 =?us-ascii?Q?4KNvjJtXgiHm+TcbLLKOcD9UX10EwKKaf0pXdaR1RcB3ttlAhSMTypqHrkPh?=
 =?us-ascii?Q?MSDDjZO78fvtUmIwI94/CNQcWNEtwuA8sqIyy+SF8JmAF2v/T/Ob7GszMDqm?=
 =?us-ascii?Q?defaR9oNz6++vdp62nLoRi5T/C4dkZmYQh+CpizzV9dF0FhiTHLj9HRJ0pCk?=
 =?us-ascii?Q?19Hkye4bD1gtS8eeLEzHX4Ugme6wUKfEj7yXRRlh75WzV8BwS7RNUJYDNCAP?=
 =?us-ascii?Q?sNiwslXyFm3lcLOnr/ftt7Nzm1NPMQs5MIoAb9SyhNttK6NxKF2lEyfWcG5v?=
 =?us-ascii?Q?df/tRGZ5xzpWbnyrzMxSVcV8XwSWkcfjBsZQ0kByaZeBj0iZ8M61oezGyQok?=
 =?us-ascii?Q?vkJXNEJz/tqrF7lPVOqgJjEVi5XGCucKkw5s3dK6nZ5KRXNOXTCzOpfnTeD4?=
 =?us-ascii?Q?sdztvuxh2PQK4ju/rCwt+KJB/XsxZQ/Iola5rBhlp0OXh667JeJpiTEKEvUG?=
 =?us-ascii?Q?eI4u3zUv+4TF1TJQVm7btAqRiB9dHBjwvp1YSUv+A3qUOejI4M2RBdtZEFmh?=
 =?us-ascii?Q?AUBL+C8f0hqQqa01uMOgZiO/MTgUWLHgmKRRplg3HDYBfE5+qTyiF/O6wtqM?=
 =?us-ascii?Q?z+X4wXt7lieT5N28K1gfatTIsTA08/faInI5xNscuduivejzg+HwCES+vbFM?=
 =?us-ascii?Q?CdRYuYAdIEDflqvmD1M2yteAZJ24+lbkTGHGZi593B0Bi32NJy0wgU+IRL9P?=
 =?us-ascii?Q?wDLILoNpv1fuOlYiP7unf3BYItwyGhp2yDR4nA+0dzB+KVRfDchwUSbEfHvt?=
 =?us-ascii?Q?6MCgqAFJbl1A45Ajyro03odSwTeYbPlQTX3MxdFX42YgrF05Tc3OPbcCcwai?=
 =?us-ascii?Q?JUfo+uEcUp/ehPThQO6VwOK42F1W9DjcPB9CMKZ+HmXNdx7HyFROLoAaK9M4?=
 =?us-ascii?Q?1oMhIGZEEjAR9hJTKXr4au8dF+00Vj3Lu+a1wcjQt6yt5ZN4NRwZQwrRH6fK?=
 =?us-ascii?Q?BNX7Poqdm1UAfTbTdtdb9LpEOKq4cMJ4PCSnt+Qbl/xbntZN9qzE9/l+HJOR?=
 =?us-ascii?Q?HSNzi5GWrr9z4hW3Dezxa1XqQYlVtjUvMiWbLiGppfJrqEvMv15DB7IRt18A?=
 =?us-ascii?Q?Qgs9ei9Pf3o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EH+naw6Yo5JbpVD5kAJ1yEWsVlQ07Vkw7+ohTQ3a51sZQcZEwvbc0Z/+653/?=
 =?us-ascii?Q?5eFpn3knuj3LtVLm1XoeB3fXRpl3yKfVwDMFFDk+yzHyrOwePyW8xeWDDSS+?=
 =?us-ascii?Q?RG1oNz6N2WFG1knfIXwEfqvsrGsUK/fwDxW2aQji78e0QMO0B4qo7sK/2Ui9?=
 =?us-ascii?Q?MdBTKAGKdXigeaQ/3fdovR3+9tZvb01upWdlsFkzyAZet0Gd35zNHLqav383?=
 =?us-ascii?Q?nBJkOLUTPBkpF/0dgXJBFw7AAPldCDhV5TFbFgU+B6nBfzGh+LE2xj6rV93r?=
 =?us-ascii?Q?/hNs+AszEk+PNZVPKAQc24Zl6XUTc/+q5Eco5y4saMXMWjsOaSpfbxOlMJ0T?=
 =?us-ascii?Q?U3Aneuh+fGW8Tp7dlzSx3tzCXFwI3xZX2xn11oew1bcz+Ye/Fm2UeWtK5Etc?=
 =?us-ascii?Q?h24Fe4XuqIgFkqkGBryQjMOhvG9TcJiX2mLSgA/X5Dvk3tebL0UjFbKxim3Y?=
 =?us-ascii?Q?CE9EbzasnqRlMJhFpWskk7MHZ8CNKWj7WP4lsTeS4FueqDSt1SmbPFR6ICrd?=
 =?us-ascii?Q?5tXph8LRcHtd8UsQ19ciyFE39pWWntA9Uc+aoGZu64IEB30Mol3IGyPOY1LD?=
 =?us-ascii?Q?G2F7Q4XY0/+oiYlLahKG5vVb5w/uG/sWsYD8Vd9YN5eKeJ2vnXgnYpCZTknI?=
 =?us-ascii?Q?jm2zBUC91TjgWAEQyfU9F6FYz/TsE4215IEqznpT1+gPJNzjGZjrbQIWgD6W?=
 =?us-ascii?Q?tiJvFirA3vTsjnTzFUXm/1PF4x3zpQ4T0+OCyDm6glif5lz/RQb7hwWCBAc5?=
 =?us-ascii?Q?bBTJ4yVvMMjrXmZSXdcZxceIcAY0/7IB1DXFHvYhZUJaD025YhZRGvSU/HXe?=
 =?us-ascii?Q?fBTX0xQBQNu1J+2WHDLjYplbZKBpu5MY7mEd2qyavFAJ61fBDR/YIaIeYMxq?=
 =?us-ascii?Q?gNfj22vPIqOZxpCJJrqRqYT+pTfo7pfd2EEwDhCvfZUIW/9qrfw4TfkiowVE?=
 =?us-ascii?Q?AqZWo/rKySylkcEV3UnglXTTB9xp8rVPQpNlSXFTBmDAkh6KBhSrfFJWvgM0?=
 =?us-ascii?Q?Vn22WWlZHhxmNoyURs8YXXV4yb8DKHgfAafbmlWBQZvrVfCKNZGbhbL0zd05?=
 =?us-ascii?Q?kWaDmmdzlynUohfizYvtXkHQznFaOKCp6PoVTtlkNVkxn2s4NZZRcUf1K9G/?=
 =?us-ascii?Q?KgBzm9koo4pTFkGq7He7qYAlQcQ4P5/S4pyZnhIfudGHSydtOKlYDg4FNSQL?=
 =?us-ascii?Q?qIUQzCMxw3lpVR7g2+mdNh/KTyGXNOgdc+I5RjxwBclYzWe2kHLB9Dx/gDpC?=
 =?us-ascii?Q?K493SA4765XJH09BV6Za8FUD+kr9M7PJ5AkxWpA23VS0L/1r13HHd+gVzJo8?=
 =?us-ascii?Q?yMOGYRkMrP+VAMKrOhTRRh0nmA9P15hPEnbPIEbIeup1zZoMq3aA1H5QP+2e?=
 =?us-ascii?Q?z+17uKn1u3IDrUmgGHEvu4u6aan77Qr3QKxOL9DtyLZlJbWuMN9wpQsMJygp?=
 =?us-ascii?Q?avtOcEH5AKLbntEmSerF6rWEMU3eXK8DQC/JSaq/U2XinFFizr/v0d5lZO5n?=
 =?us-ascii?Q?NxElen5RDW4iTSi6iuTXDcGJ+oBobxi+Lg5UK7d9dhfxkxzZo2e8b4Fv8odj?=
 =?us-ascii?Q?nOHQ09VdFAXej0TGULaSxo8iCJ5AF9fNrff+cK/wGNxC9OfOkZTVCe8G8MwG?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a46c85-a88f-41e9-1870-08dd6dde0db4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:51:04.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2ZqHpIDE/L9XGt7GMIxR3S/l0CQiaZXnZaIESo59sI2GPTtE7EoAckqYm7QxXpiOpZbZm+U/Ysk1WA9edj8058nA8I2oXZK2rC3umMFD9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
X-Authority-Analysis: v=2.4 cv=bsdMBFai c=1 sm=1 tr=0 ts=67e67115 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8 a=t7CeM3EgAAAA:8 a=zb29L4PdcRnUdcLV7GcA:9 a=UyJwmPUJozw58VCsoXQsA4RukbM=:19 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: 3yZeo7oWA240XFBNpDVArz1cgcVogJmR
X-Proofpoint-GUID: 3yZeo7oWA240XFBNpDVArz1cgcVogJmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116350

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Renew the sample keys to fix the test issue:
WARNING: Your certificate has expired!

The renewed sample keys from [1] contain binary files which can't be patched
by quilt, so archive the files into sample-keys-renew-for-the-next-10-years.tar.gz.

[1] https://github.com/OpenVPN/openvpn/commit/98e70e7

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...mple-keys-renew-for-the-next-10-years.tar.gz | Bin 0 -> 28118 bytes
 .../recipes-support/openvpn/openvpn_2.5.11.bb   |   1 +
 2 files changed, 1 insertion(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz

diff --git a/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..a79e6e4d157663931bafab8e99b38d450e36d5d5
GIT binary patch
literal 28118
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

literal 0
HcmV?d00001

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
index 810a60308b80..6aed4145ec00 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf \
+           file://sample-keys-renew-for-the-next-10-years.tar.gz \
            "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
-- 
2.34.1


