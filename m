Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C71C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:09:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2417.1657174154138469030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WQ30LmaQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4187d97074=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2675ttvK006603
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 6 Jul 2022 23:09:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=KSi8eWqhwbEzZAF2jyt7C6D20h4y9JkAe0lwMEi4tLQ=;
 b=WQ30LmaQ05ziy+cevNk4WsC1mPjO/G8LZzegdWUKdaVp5lVwzL519s3hMWBrfW0suZdk
 nYm4krqJyn4tuxuW82V0LwHJjtPXUNpLA00xROnQv7g9lwl6aRMMmowsBjm6c/vxXukM
 509ps/QlwPwbSEwo5bAqA+P/MjfiaQTQzLIjCxhuYB8AdyggKRXsZaVoxAyW3U7q1VU3
 F4nEs5mLXv9rJ3uGDekmV93gRNQRjpArsFLWVPIni9s40Ab9B1nKsoti+GsOPzOsqs16
 3sk3C6AihLKkPwUFwilh3spPjeZwC72FF2C08kfCSxqN9g0fKTlJkLDunMjLNOYtlZhQ IQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uy0s5s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILECvEnS3Eh6n/7+V+fdEDRq5QVDHSkcRUuVrzW7KupjVGvPhm1PYB4YEcmYn9yFKML/1J01q9ZcXShdKS6TjaJQNYkRn3Bfo1d95HRD4tV2fuzxZWT5Ed54y1HY4OLT2Rq94G5pkrrx/lg3Uo/x27QJufhFN13tzWXcndUZZ4IJCmSKU6mUGTnOv5VvRpOM1cVJAu2+c1HtoP0GU8n+V+VZT6kYCIK3wmhjN5CPbmlLVIt43YlTAnidjRiYFQQfy0IDrt3Qw920SMT5uJiz7PSZU9b0i98xfzZGIV04/N6whEwJxmMDXaQadGOGkaVqIOwxl+r+wWPhgjXy8jDaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSi8eWqhwbEzZAF2jyt7C6D20h4y9JkAe0lwMEi4tLQ=;
 b=lYs9A3o4Nz+Pl0QMNVq8XAyOntoG5rJFGqa+wg62y0Ta6D/gFcglxLh/lQpfsLK0BXG0uv5j2mqYOefobhoI6Per6keZ5CBTFQFsvUg/fONtuDlCwPT2eW+lYv/UddXk9GIJ24GB0sFAT4Lxb/XZecp+tzmg1McAGab4Wl6FRFcpsgVmsr9aIEcPhpDOAFOQ1ooOhQpwq/I7fUnIhGddCcDb4MHkpugTpZrJpUKyqb89ThXDcgYKiSFAB2GpGIkBH9vTXLGeyTVsvfpfaFr//yKDPwEKZA/efzVA6JzqWnlXJ9WBNgSmcwXyKYvLjiOCS0AUK8rb/2h2gPCFayM1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM6PR11MB3132.namprd11.prod.outlook.com (2603:10b6:5:69::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Thu, 7 Jul
 2022 06:09:12 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 06:09:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] openvpn: add PACKAGECONFIG for selinux
Date: Thu,  7 Jul 2022 14:08:58 +0800
Message-Id: <20220707060858.2334059-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707060858.2334059-1-yi.zhao@windriver.com>
References: <20220707060858.2334059-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:100:55::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e437cc37-fdf1-4cbd-6a17-08da5fdf3647
X-MS-TrafficTypeDiagnostic: DM6PR11MB3132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qD7DtWB+5g7jWtpTyZVcAOL2Nr+/VvMTyEPyptq30x9HNVtVBLCLuJ27ql14EMXFMBgECJvYt0Z60wTzH/mVJBVz9nfvJQ0dewIOr/IZoWCCpz4zCZCjEO79jsAQaGfsaIBAXVbPkCklYOD2YBnobGK7mH8FGEn5sR8Vg+GG4H5Kmqi+i2OCPVc5dF9ofwGrjvdYdjrtRGuSbKkeQ1QkSO8LCbFRH5ua8gCwOzA501ZYFMxUI4OKspH3fzAyjC9vbnK+eNQktaB+ZG1anQ07UP9JpWrw6Cewvm7vBIDYFTDwK8H7O2+6o1UF/nc6u4wD6UOdzz+783i9REAnvCcfSA0c2V3zRcy6YODojd7whDHj8a3WxuZ2zfpUxc6pN5TA98kGJjTE5U2wmHnj663PCRzpBZzAIeRQeXq5oTisNzp1aaoYsHgA6FMH4pUyEk8Ss60nnHm0tEYMe/DvZ5y8HvWQwpNydrNXMIS/k3moQV34V2JxvBtQGKm1p9RiOmUkTg+kshWFgmwKgxEQbAyD9vkk6IE8s58Z+kmLN0TTYejhPHpDwQOKyqHPVIwoc28JmScmWA1ToZjSRNmZCl7BdEv1rzt2ZtYr8Ti7fIFfyOZDfUN3YWGtV7Dm+Zzg1dSt1pLDrcWcawCa3DS+QmHs5tzYl3J5JBhabtYozt8RLplWI9Oac9MdlSJVczFBmjvzM62zdJebl9KoHfKKUShUmQbarmtRAUaeB/0tOWoA6b1esPKcbYByfz/hWMWCLrP5i4OlfzKSav4EiUxH5s8tx4dLQGk5wu/7qwW6VLB8r3PmN66Z6wzzCo+/lV8sKS33
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(4744005)(44832011)(8936002)(478600001)(52116002)(5660300002)(86362001)(6486002)(6506007)(6666004)(2906002)(41300700001)(6512007)(26005)(38350700002)(2616005)(186003)(66556008)(36756003)(316002)(66476007)(6916009)(66946007)(8676002)(1076003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hKNwMjDfqJoj6FDpsaX5hi+p+xVcQTGRdlo2k+MXWa7LtYSokm83g67XUQzh?=
 =?us-ascii?Q?BDFL1TcMRAmmzaAfQLcXvOSTcHEPP1PuQbPAntkxcSy87VcSdFf5cnsJoDh4?=
 =?us-ascii?Q?yATuNOUos0Qeef6GLVB0FMcKZzl5K7pbauEfcX5tZXW9vK9t9NXBA0LZ4rqn?=
 =?us-ascii?Q?rPZ2lwKtzbft5ND30n7Zo5E07IWXbdVOiXOwmCSt3KBY9LIGenZcYa8V9N3x?=
 =?us-ascii?Q?Pj0PyB6cOuuzVfBW4ELcjW3+zGmdgB/DH6cYgHeOQX5cRTVE6RScFRMrfPNa?=
 =?us-ascii?Q?3kW64B8M/L8FN5Cym+KaKEcjrMEWEK21AYQQLjajBfuizuUEbcBKmVjVmHeJ?=
 =?us-ascii?Q?pDDRfdK5Ea2xS2Nduo769Tkp9T14g3AzbmnLqrF8GztzXo6dEDFYLdrcq+zW?=
 =?us-ascii?Q?UCT1Um4dUTEjcSFIVMqrm7MO3lHb4xfDAwS+6d/L9RP5Oph3OXKOhOpyRmLD?=
 =?us-ascii?Q?HVluB7Jw8lGdTUaAA0Rv+3sNpnw2d6gdpWu1Zdz1Hl34t+1kXIphwqrHbkJT?=
 =?us-ascii?Q?rcKdVWUoa4gzc7cfSFMelu6Xhgq0rmsjR0pc/ZgGNbLowH2kM/ISzsLyH1o0?=
 =?us-ascii?Q?LSK3AXHs1jiCEVA0o8RM68xvjL9bpb1Zt62PKQsOiajkk/2x78bInJJ4V72Z?=
 =?us-ascii?Q?TwEsYTpvDTQd+KSuQknTq8wED5tFdYflr3GN9S9gFOKtN+RjLTJUIFpgctiB?=
 =?us-ascii?Q?kboxneoNEEC7reUz1tD88jlfzHF7Sjfe8IAfCZeUOvES7YMCA+xzkMIaCZ5K?=
 =?us-ascii?Q?vofiGOCpHUoVSF0fw9f+BGXT6eNlpgkfc43h8Sm3aqHdL3eHf0w3HmzaJLFL?=
 =?us-ascii?Q?WA7/vuRJwgMyWAOcNmtJmY+P35qJoyDwEXKx6tDoZmHLkroYpw2Zwa/EWYy0?=
 =?us-ascii?Q?tRpGGI9N2vBmbAubhd3n8BX+X7RJ23gOmMpUr8XCwaKorlMSIEqOKr8daIZo?=
 =?us-ascii?Q?PrTNMUrfvbqQQuvzgPPViqG1DkfPsJWob/yuYWXPjiDsAauiNJkSQl9JqL12?=
 =?us-ascii?Q?6IXo5M//uLHEq4nG3grCxNwRGmeh/N4F6gVUx2OkZhCVjrQNaR002zJAZ7Hv?=
 =?us-ascii?Q?OKYbR4m1WI6YZRgjpDEhtw9GBpI6lJ+doYUZyp0BWp6BKwuCGBqVXxNIuInu?=
 =?us-ascii?Q?IGgxdGkm0/7yf/xT92xgqoANrJy+ZSbV82rlpnCDN5hQQdHlJbxMBxouoPbt?=
 =?us-ascii?Q?sCL0klrQP7b7d5PFR0nBOxZP42xjP+yLTTBGQ+K+HUmtmW2g4HckKPIzO4vg?=
 =?us-ascii?Q?cdlUP/xYBJKXdnlTbP6yRXwotDMF21FEujhB2sj20bRo3i4wKXd06uVmDXuf?=
 =?us-ascii?Q?zPhIVXRiUx8EltPZfwWSHIYhgdKrovreMJm2PZI7OBzthTQRBqn2fu1LrkDe?=
 =?us-ascii?Q?Dwryzj9XpEyVPiMsvXZYFqQpp6RN9u7XPQs2J0KVYkysVmnHx3OqidTOVOtq?=
 =?us-ascii?Q?EatavZIrOGr0/V/RAvA+E5RY74rjEi9PEId+qWFNrvgIo4aGw7IVi6oVkAzj?=
 =?us-ascii?Q?MRPK8KgrNr1pUknQ/HOulm9eSi/JR5mRAcILx2VcX9Md9Db1AWVsOcerHm+a?=
 =?us-ascii?Q?DogMf0ivNFZ0K7Fzdaqq5fAi4v9zmVDJU0TU+xbG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e437cc37-fdf1-4cbd-6a17-08da5fdf3647
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 06:09:12.1529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FMx6ZZVR5U18uv0zUs2EZ9XnBuoCFaolcblG8iR4Wf5XgBK2lA42zjjHDFJ5NdvzwzAE/+M+WGzgA5za6dzjAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3132
X-Proofpoint-GUID: y4RtzYeZd9NXevusBcrbcqCGwE3Almsa
X-Proofpoint-ORIG-GUID: y4RtzYeZd9NXevusBcrbcqCGwE3Almsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=692
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:09:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97736

This is useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
index 7404e6e58..1395a35f5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
@@ -37,9 +37,11 @@ EXTRA_OECONF += "SYSTEMD_UNIT_DIR=${systemd_system_unitdir} \
                 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
                   "
 
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
-- 
2.25.1


