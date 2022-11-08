Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA258C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:37:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5673.1667896616666299287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Nov 2022 00:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZfQZyMjR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8311ba939c=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A87QJbC002830
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Nov 2022 00:36:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tI+Owv+VkmSw3VbfVJjP2MYRLTrhKBLZ9JIvGKJ7edM=;
 b=ZfQZyMjRYOys1UoRJ1J3xT8y0yPHIgrBFsmYAKRy9VjnnJTAuaFTWKK0dQttOJAqj68Q
 ZZvsS9v7L/NF1l3eTRGozl0aLdjcg693j3lR1/I0NIkULoaO4LgM7aWrvlY9MLlty6+z
 OVr8zaK2YwQKzLpbdMtFnHJVxDZ5meDRnJjVli1VSYjjvoOM+9b3PA2DvePmxOwCtDZA
 SwsYPmaUX2DQObZTT1fdHOHqecodznq+bjXz9jkvHjV0A4/quvgLdjgj8IhCVmxcjDjB
 mX0HrCz53OhsvHhlavr6H0L62HsJTbf4I3nd93UZt1aNFVL5ZWrm97lLzePzLn8q9Oz/ 7g== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knqbkj6g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 00:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQFgo+4Ora5mcSpR4ktIK9rni4WujV7o3hvisWHavxleDIAboIXRhwxwdcnERs8uHpPRJSTz/YSsdrSTHf0DxETY7buGgMq4tS+uzKnQz3aVgrpBmxdLWOA3/uN2xzPHWGPECdEbg5NJD6eT303/N3hCJbBtZUNnnrbnlL6n8TRT1LfUFEdqm092t1QSvJqBmI/24pit6NhHST4s6VdO8ep0vSaEmCoGw1Oo0Q6XkLHyMuH2Xvz1O+PDoBogPG3LOwKLxkH6cx9UDInWl2bQP19rcud4UmmKvzuTirEGtwRdzl6gQGe71hx5yTUHZwdjHrZjpI2FirxoMNtrNDPlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI+Owv+VkmSw3VbfVJjP2MYRLTrhKBLZ9JIvGKJ7edM=;
 b=ddhZY0vowgBTZxIzm2A3B/wWq+CdQ5vyfv7iJ+fl3+9VeM/sF9H1UCIoeNUIgmfTtYB8JA+ImSVoDpAkUIwDnfq8aX2G0Fq5aELDCM/4F0hAsEdEJ2fSD3eriH7hRyvU0/pishO5NhocNfqaM3zo31Jr1svuWp+T++aaprZokquX3knSXm1B+A/yORdWpeDdZ6Q6u+w7NSnDc14Oanyzd0QOsPCJkdqR09uaLuANZDYxsyrdB2VZy/ZOZr2ZAMMn+vtJlgjzwYErCyJ1PI0e+TFaNRyK2YHA/chXvbFlBZXNIjy4dx088rpdo/qnWgni+WACbV2H2TyuAqJ7g/zHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 08:36:54 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3941:23f3:dc69:b89c]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3941:23f3:dc69:b89c%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 08:36:54 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][kirkstone][PATCH] psplash: delay the psplash service
Date: Tue,  8 Nov 2022 16:36:41 +0800
Message-Id: <20221108083641.2886250-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|SA2PR11MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: da07e281-fae4-4a5b-cdf3-08dac1646392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R0Pv4wb3wgnYqqPe3QelL2SXX6qAKeHyCvLLZLhOG+vbBZV4fMBVz58cif9jw9cbKCDEOhbJE6izsH5HYcAGP2/lRisB2jDsQe+uaDBNwaQ4gBlqohd42cT4iGyD8hc9gfSRfceUUDbZfg5doJPPLYISwT80Y9RZX/8HMugRaE7dCfl22QstTexp/sUnrJGvAu3KiRIqF8PdwEItkn7PKBUR/7GZiVGarIZY4npUVwT8t5dkXzzEvASEyy02vfU5fTKRrtsUNVD6HB1KsR5lvYNWhV8RsBbp1Q2x7DlPMr5E2HN5ziXmN0sBl9N4/ovfo864Gtq7sHTJmJH708Z0QJ31m/pwsColVuXRvfsoHMGDpkLyS0m7nKBC1qy5jkQxTmjQ+FvWAVeuMoFc0GecOaTQhtATABR57QDhzjRT253eK8F+5m9axC0LXaO6o11j6bTqeAexR5ZJZaq3NEYMW9kiwnYAQ5LreAOX4WLzEhaJ6/ap2bG3bTgTiDYbVSrZlLrldCFqTyJxuFgMccztCxG/CJzkTrq+ekasofiM1yyk7wd37RHkABeH3Tq+0nfWTSqidettX9+APisZjyBOBenLCI/kxmrs8swvS8G7GubHpaGORtwHWj1Ghf+2qQCbGtlGVfkCroaME4Sd12Z8c+hEoWigGATr3gpEu2dWfUTvWvd31Q2Jc8flPbbCWMkJ9cBTtrt5/l6HnY+VRmeKr2ICfZEAzclqOE+z13kv1YGYJDuyQuMbnivbVXGsNoF17iANGUkEozPUBEu94ik81w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(451199015)(38350700002)(36756003)(6486002)(478600001)(86362001)(186003)(6666004)(1076003)(44832011)(2906002)(6512007)(4744005)(6506007)(52116002)(38100700002)(8936002)(5660300002)(6916009)(41300700001)(2616005)(8676002)(26005)(66476007)(66946007)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L67+OQ0z9rbRQ6KF0b3Ou5VxC9XSbyRwIhfFwCM8WDBmzXBHac6PiOjP7jXr?=
 =?us-ascii?Q?G/vVNQVCqZCeYH4vBQXg7BJ8OidFABDD8LK6g+Jhus+1xFWfCms/KyLsDqCH?=
 =?us-ascii?Q?bg78P5dtGVHDlm/mm87rtl5P8Eh4g/h7q7W6MrhAjVgoMMHumDzAq8U1oA6q?=
 =?us-ascii?Q?SeNk1oGnNk7mlkmiTDkI3Q2GEGrTbDJhENBNMwwsnrys5YaQxFUR2TVGgzw1?=
 =?us-ascii?Q?pqvUiam7xkKUP0rcvrIIJGJ1n6YGTNTHTvtxUP6JFQQ6O8CsGlvR3mw0Amte?=
 =?us-ascii?Q?R5ZnN2tdJYkeQMsvo3LhVetKBFjkk6zjVtJK+/MPcQL1GKlog5r5jTr0n7D8?=
 =?us-ascii?Q?b30Bq7FCva68vmSoXMo/coBEUh+AOXb0F4U1ud8alyePsF8OCBazymtxB0M+?=
 =?us-ascii?Q?Z4ZzumfwDm+Jo8r3a4wlFA46fmfw8eFytMSn/TkcgD9imJT+/3sbFfCY4NLy?=
 =?us-ascii?Q?NBEEezZSMWjJVliDfddhwN6eyhMgN6+gnEInhzeXPKBO/u9Qnw5rvqXOF9f9?=
 =?us-ascii?Q?Kepg2LDE0IGrTJo+NId29jnDhrd11cBERDUNbkUGd//oC0KutZgKt/6hXYJ4?=
 =?us-ascii?Q?dCyNvaYEsuzlWzldsrRLPK6R2A3LIM1O/soXf9SCzx5D3i2G0G89wbAveQMI?=
 =?us-ascii?Q?s2xviqTnsu3TTLH+Du928C/UNNeAhnifeGpiyRISJ9e50VA/F8Nr0cgVVCFN?=
 =?us-ascii?Q?zafoYocTpngP/QBdU10dNcQjtC7/zYVhZKvKaHrJ7TNfZjzaUS47A/vVv0WD?=
 =?us-ascii?Q?fBSAVFfm8WLcO95wzhh67ZAjfqyA0WvbnHSxBQax4WNVaFK2HSolFXkefLms?=
 =?us-ascii?Q?gon4jz2wx479QLFKwo7ieroJkRzDEVRdscmaQgyLM2yRx4lKKmj7D88CUfFF?=
 =?us-ascii?Q?8/3+oSkmX0QkPx9ZBWN2zpjLV+YGOTgQJt3BXdH4TXlD7gKSEcagVJz4Vx7w?=
 =?us-ascii?Q?aicOFHN+0YfGddltSwe+ObZQbIr5QU379eJIRWIsPPYUBXzxzsTaMlGrNkP1?=
 =?us-ascii?Q?3uFByrecNlPa8siIeqv2QwbLr1qtraLBvw/CkuW6+3NehXW2PCx545LFV8J9?=
 =?us-ascii?Q?WTjEAHwTmZcAEG+H33HwYpbPuY61jO/XXPyoi1biiizxcbnuQGcntogSUhuA?=
 =?us-ascii?Q?7AHxPh0lW6MA2c1tRgeXP5QJ13nXu9ZQ014xhTI9WrHMHViwaiKH6jVBLuUp?=
 =?us-ascii?Q?A7ch6Aa5Cb+3i+zBYHWOy+igIT/FDn6+vV5f96JVtl8pbC4yTb2puXNaKy/y?=
 =?us-ascii?Q?ywe/XgWtvvC2z7ja0OVDvDXZbNCaYKj2um46smQc+AW4WlA5906V/6emdFL1?=
 =?us-ascii?Q?vk1uJBkc3ocRs+szB6vA1Vjd4GkyuKJVxxsBNuhtXfXVBBwZUvYEHMXyjZ2a?=
 =?us-ascii?Q?IoyLeJWn40j4QtneZfRFN06ds6Q0cvxjOspa0oVdg3yK+hSbSQCHSC76NwdG?=
 =?us-ascii?Q?86Dx9rEJPaPWvmdXrCjFrP+Pw0PPnlfvmdXRPYta0rS11GPO0BwtezvpFW2E?=
 =?us-ascii?Q?3RDRcsopXNveTKebIdlHGrO2Lmr+m+BPQNmun6n5dMmcrDkCRWPEwygzsX/y?=
 =?us-ascii?Q?0SCU3QaBp9oV8n4GtkzNZRP95ReutIyMp6JmO1BnGQj/Epi8FI2VY52EDxkx?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da07e281-fae4-4a5b-cdf3-08dac1646392
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 08:36:54.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP5tkPM8F5A8q7cJIgm0iKvt3/n9/KCVUKY+lb0tSDmUDW8Egdo5sCRz4PEKfHbn2H8ZLdP6oQFCqhjTaEtqbmFKGVP1gX5Az4L60XTSKmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
X-Proofpoint-GUID: BN1E0MVWvM8shqAXt27U8l5euy2uBsGg
X-Proofpoint-ORIG-GUID: BN1E0MVWvM8shqAXt27U8l5euy2uBsGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=638
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 08:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99488

psplash starts too early to open /dev/fb0 correctly on
some types of machines.
Starting this service until /dev/fb0 is found.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-start.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..555ad5e387 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -7,6 +7,8 @@ RequiresMountsFor=/run
 Type=notify
 ExecStart=/usr/bin/psplash
 RemainAfterExit=yes
+ExecStartPre=bash -c "while [ ! -e /dev/fb0 ]; do sleep 0.01; done"
+TimeoutStartSec=100
 
 [Install]
 WantedBy=sysinit.target
-- 
2.25.1


