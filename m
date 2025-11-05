Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41BECCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 04:58:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2207.1762318717509990585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 20:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XlX9z+Dg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404044f81=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54o3Wj2097893
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 04:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=m5+pXDyr2cR81BR3g09n
	DRepYUKm9eKOOaP+GZo0wHk=; b=XlX9z+DgT9l63RP/OEkUKIbiMIy8Ns6a5e3Z
	HN/5rsMZuRMLt/OMZOCnPprvjprSQN1whfcKF1ugTbTmicGMSpDG0UIutwywwoMG
	+9YlIFIPEzLV1X+BZAga8Y2b4FY5VRq8hk0ft6SW86J+1RalMgr0oVEE6HLNmnYe
	ROha1jw/BhLRqah0GjK6bYJtgkR55KHeyH+3dCboW6uQmKdJ8ZwqYHWUyW10v/Du
	AVGCOSaFFCCtk09s/W446Ut16uFNuMT3Ts8UoLN7X/6ayJZ3hLC6UMh09eOnE0i3
	sPIjnx5SM/mNQgSGdmfWwKjrkyY3S/rqvJlPqkzuOXidttd3Vg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war83ts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 04:58:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKCppMd0eXLvO39z3Iu//v/a9Teq/ajnprKK9szmoxUnE1VMVrZ/GntI7MY0h0OcKc2168GqpdBBIz9FlqIAT199gdxctjK4TS7HRJIVJWDW69qu0lUjryyTY3NJ3pVf3Rbxlkib5mQwA9F7slUs5b046h4RjN0xqU3sTRzLSCDmA97eIrhI/BC4CgtS2MQHJYFzc+cX86mz3uAnyTpKBWP4Aw0pwT+eQ+Lw4Av23PYyhiIGWGZCWsQmg1HXqbTUKtzsl6rRs2jr0KsEUX2znUmDQmZbxUOJTBZ4dj4ishpMUjrQnb41etlsoJBSRlK6EhBpamcylyuPFKROtenkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5+pXDyr2cR81BR3g09nDRepYUKm9eKOOaP+GZo0wHk=;
 b=J8ijWVb6ukUepxtKJqAOvtt8YUbpTAht9nDlDv0aWnU8q1YTRKBO9A2UiDE+J6y3sX+1Q2CPNbl7pM2hXNpPIwDVX6kib0y0ZWc2Upd+g/+A7F7fdgJ9fkmERO5a2m2+F1kJ2sksThx2vQLuYQe1vCw6Ib+YIuxRcUYGNb04yWbrjH0W+Wr3lm9MxE/QA9apGWqWYQrMoET5w3q9U0trNM0YYhB4OKlzE3KCZEpE4ZszrPXrTiruNoN/CiuP7VFj21TkxCQkXwjRzhstod1PsOA+/CZWNGI+O8UVOPgXr67E+WDxR2f0IxVT0tGCYHRAH8/MmNdnN8D7qOU6ZofyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF1BAF94C4A.namprd11.prod.outlook.com (2603:10b6:518:1::d0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 04:58:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 04:58:33 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-systemd: fix build failure caused by race condition
Date: Wed,  5 Nov 2025 12:58:18 +0800
Message-Id: <20251105045818.2593363-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF1BAF94C4A:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f83fbe1-34bf-4948-1e4d-08de1c27f8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W923EtBJyOuot0e7jKY0bg9OfbLLTEPWR5oscWYxYkuPE+y00zfL9wOOwD0/?=
 =?us-ascii?Q?xstItdkuIlD0WCjLEtfKcOfTMADHxVK9mqkS5cUroxuuIJqO507B167cwgM/?=
 =?us-ascii?Q?MS/zG4CbJTiyr6V9GwkvPd23yqHuOOFpdltJgziCD/NDiyC4cPKGkQoRoMG8?=
 =?us-ascii?Q?E/tttL4Ozm7lHiFx7OL36rztoOD7sMtF29KhddctXPV+wQEW1W0DApQU/OoX?=
 =?us-ascii?Q?nUEtQBV6wx6hVIM3sxMk10sTKs4Tuh0ABd3IOMiXfAD9ivm/JrD/9vR17oQO?=
 =?us-ascii?Q?ICyM1PJj9xhj9Gtf4lPEYmQxvrjdCakMv5tb/i1jG3Qcx7demj8xzjI0341Q?=
 =?us-ascii?Q?U20/DpAnce1ce0qbQZ3HxPGfiRLvTYKhPF9K6f3UL2sHuPPEHXndYKr9O9EM?=
 =?us-ascii?Q?5m8ZTphwTXMTH/ccp3rC7kVTJNkqJsDL6yaM8mdlTiNPx9+9gH9IisVZl2VM?=
 =?us-ascii?Q?gMzwokLkEEFSTxINYZxu/WHBnknlsicusyJS4WLEDAV/uJ4G+dbHRsjdoOEt?=
 =?us-ascii?Q?uchPM4JBDMYMSmtcFJ49y7DMMqNF2PnIT1LkulXCsH8OfdQ8hc/GBVyURzSu?=
 =?us-ascii?Q?AesxvTrRbeBJr4Xs2zuRrEYiMJxz1leqQNO41BRIUp7hT74dPE5lpFZs/SRS?=
 =?us-ascii?Q?kGb5lfg468j+WD+6jr0rYdAn9KeTahV1IGhMDIaCI/E5mAYE28554ppJrd6D?=
 =?us-ascii?Q?62QHvdeHC/jAyZ1l1YREZ52g3m57RV5rgt4aO68O9TVpHYqYYF16kY9mzNdX?=
 =?us-ascii?Q?if9mIDYXOBDrtyjAP56CBVzYJomrFDCi+ZELSxO5OKF217Kd2yEcNgfXrSS5?=
 =?us-ascii?Q?uWvKjODkf5zlFIdo3CM/AnwNuiZFXtDa3403HBQZ4BcUt7AAk1vqGcWGRAGE?=
 =?us-ascii?Q?JgGu8S5dB5EivEI2dVQyNtv7ardnKhnQG5WE50Zn4u4Eui2kaJHhSkk13Cvg?=
 =?us-ascii?Q?I4twF2dgkupwsslMPQJB7mBgClvCMOR2NKLntO6LIpLGdfGMMe92z3BBUYbc?=
 =?us-ascii?Q?O3yuNe9Qe91PqRknPYfvtEElGFfpz+i7r6cD3k034Q3DW9BlpTN1r16c/SC3?=
 =?us-ascii?Q?LEEKOyAEJLHKBrmEJf7IDou2CrvJqVvuNL4ZG0deeJ/SuDWz6qvR0mlJO05D?=
 =?us-ascii?Q?Uda6nMPw/7zIMATL/8Lv38qOyr+RRjpvH/DjEY7/ATY/T+P5R1giOcft2kBs?=
 =?us-ascii?Q?9qeuXJecmH4k4fpdeB4QR85Qffw6vG3Nr0cN4J2lMv+um5dRhNM2/t4iTh8d?=
 =?us-ascii?Q?4km6l3RIxuL4qMRYDnhiW7trWCmHwmOw3ky009vfkqtyybtgZnXdNBH4JAKV?=
 =?us-ascii?Q?2OFRIOvZbPlzjgYNQib/ScR6Jy0Y/hXsUPk4MSfi7HKuIwfMvXI1VHmF8VeF?=
 =?us-ascii?Q?EIFRDUhZ5cOxex9WU+Cf5bK4XQaVA5U3jT6owJ/qWTiE5h+9BRXDSBKQC+i/?=
 =?us-ascii?Q?1jeaJEj4q9gCOTJ5S1/CVWSX5k4X2UGst6XNuh4jakvZeRYDsJo508lz5Sn2?=
 =?us-ascii?Q?YuCPQRVr36H3FsY3AguHv71UYVesWMsnb+0t?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6SAb192DQARKIbK4ki3AldE7cQ9TJV+p1ybGeomFxC6MFESHIad0pXd3sQ+b?=
 =?us-ascii?Q?v9TetRLo45XjFM1oql7bwEPmtoJvvZjYwmqonJiRHOEkdkQkzANBhdyEbYlg?=
 =?us-ascii?Q?8itGbCAahVHok7MAPreCfrCtSpcGs6a3yY/yx3RvV/s8Feu4VrB7ZfoC0PXu?=
 =?us-ascii?Q?v1nuVUkZHm6DSVuZYIVQBmNlCdmj/xEsfXcY1En0hsKuz717tn02CrNbURW5?=
 =?us-ascii?Q?r2hQTgN8IdVcb4V+VXe2boZ0Ou6OodHq/Wz+JdzXwPfPJwFnG6Vz5AIN+qPv?=
 =?us-ascii?Q?fW6366AofTExnvCEB1fb12174mbu6qx7M4PVXHca0fENtBFkA2CfRJomH49a?=
 =?us-ascii?Q?GYHMEsz+0ctbH9Go9VppPX2vV2dR9NJ87qshdjPtqVhtgzgyJ3jrYUUlzF9h?=
 =?us-ascii?Q?L6bIag003LFlimGowrJh/gaezmAZVSzfwxvmAar3zTLS8fPfvgkPqHVFiKOg?=
 =?us-ascii?Q?lGM8Tl6/pVPuEN7t43an/D8vgx4DT3U4qzDK0WnKCCzhiQuAiGYHe/WWQ6vh?=
 =?us-ascii?Q?kXb2gfMhNWObqtZIBUvcjsfTWKnhNlQv6Pq7C8OelgFxGdp0Xh/v3dNxv1HV?=
 =?us-ascii?Q?ETFmZe4F9UM4hBsJcYQzh7O1WlnsoUVeOkjZFW376JzhQjOHuv3tGQC2DBQz?=
 =?us-ascii?Q?/R5dLpZgxMRSAtM2G/fIuw8pwwsbYtyxbvMW1MlRCxecZsxd867KbQYZt13o?=
 =?us-ascii?Q?ImwLOcNrBlxKalY5XAyZije9YV+hFM1Gg5nXSzVLPyEn0aU2jJvhnzbuWXp5?=
 =?us-ascii?Q?veKhG+D65QssoEdZjNjbdEwmwXzlhw7oanWFLODbqHtL/5lR8ykCAaOIDMUS?=
 =?us-ascii?Q?eqZdcEVp6kfhk9nS0wehGsx99FZrTT4kQiU7k0Bz2tj9PiOITtqwzEk5QaCr?=
 =?us-ascii?Q?zabdK2YFMZZI83IXfoeLUsggxvhgC+0FbirqEkTJzIVmeZ90dUsNnCtyuAuG?=
 =?us-ascii?Q?1SUvLdXcXpM08mbb/Zf6/zri2nwfV2hIxTRVJmIvqJIYD497gO1Y9K4k3kXQ?=
 =?us-ascii?Q?4a/vC1H2JOmfwPuYSXQSyYvsz5pmEaUdp8cqEIlwRmcoPh4kSZDiI+hdywRX?=
 =?us-ascii?Q?i+FWYJ78uCJtTv0wLlzvoGSzO5p6jvUrhlYyjz+rmC2KdbSG2Fi7YjMTlHOO?=
 =?us-ascii?Q?DpHrlTUJ5b0noM5G1rFzDt8UreAuxuZwV6GoM4NJxMm20TOqaDE0f9HcU00C?=
 =?us-ascii?Q?mcwXqxUymuWzUNXXv+raLcsiToB5Wx9BDz9mov2pltz/+JKMF7M49H1CxITU?=
 =?us-ascii?Q?RDWchpfoEGMRbhTjK+nuvzx1ScA3FFgfnNUzVyo2Ncps7Qw1Nq3iUdHkU60D?=
 =?us-ascii?Q?9dhIedPDB/itdOUK8XbGdHZLHP3Q+J6uaDkkxS/BVhIH2qK54oC34SWUiQBL?=
 =?us-ascii?Q?7X4f4WFnLGL42pxVz+zwR/ljll/9RIdwHR7FoDV+SsFAVZg1Sx8r5zcNdghA?=
 =?us-ascii?Q?83rkTL6Lg5v8i47l6WIXwiSG7OC9cxHdpc4iSZXobvFAHGu1MRjFNUnvr3OL?=
 =?us-ascii?Q?KFusx0oguPXbP6iBi32zgMZIUmKw1SZcMhyLg0pdqckJjUGyyLpxwI6gA+Gd?=
 =?us-ascii?Q?7J6Mm3f5EYYTwILBcoKDB23uKrwaNhBCeyxs8jtU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f83fbe1-34bf-4948-1e4d-08de1c27f8da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 04:58:33.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G0KpDKVn1khG6TwDPqrtKYRl/m2tqdMADMlA8eVBB88pXxudIkIzFGHSatmYPgQCJ2ymICEHGfdy0fUTpUwlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1BAF94C4A
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690ad97c cx=c_pps
 a=u8Zh/y5cvmLMdp3U04oolg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=XlCiLC4QaC34ana_LRIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAzMiBTYWx0ZWRfX7y7AKc4jBTmw
 NclRb5DVU3aTZKgwX1hFLDdFoDIXFR1zn3M6QaC2xtcvzzwYA0F9Tuyd4Y6wcb5rseeb3Sq4b8X
 5sygKF+2qM0NWD3AqqK1N8vZ9amnHFtOwDKTw1pWwEHIimeCZ8TM9MevfocqQAtHW71FT0ey6ro
 VFR5ECX62efJuAxy6AF8abk2+MYdsyL5P4WJ67zJQO494BXg+I4E9IQ8+Nm+CKZ6B9fX53ddNq4
 VZPKbzXbIUSkpEv15w8HhYkKHtXz0GbFJ4i8Ub3vnxPR+BaQKUtvPFdajJKNU5tOvE8zsNk+jgv
 yN5SYFpRqGb0thTw2crT5gNeO7HLk/UQ2fvvWuRngLWu0KpHPAlDFEc+D5uR4qg6nyyM74NhPH4
 4Z4UldKnvbAhIj0T60oeCuRMS00NHg==
X-Proofpoint-GUID: VcXSTRi1_uEV0aIyr6sfKkv3Znc5KmVb
X-Proofpoint-ORIG-GUID: VcXSTRi1_uEV0aIyr6sfKkv3Znc5KmVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 04:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121317

From: Chen Qi <Qi.Chen@windriver.com>

For now, building python3-systemd sometimes reports error:

  pyutil.o not found

This is because its setup.py is not written in a way to handle
race condition. Multiple modules are using the same .c file,
resulting in the corresponding .o file generated multiple times.

The latest release of python3-systemd is 235, and the latest codes
have switched away from setup.py. So we'd better not patch setup.py.
Instead, we handle this issue by making its modules compile one by
one. It only has 5 modules, so there should be little impact on
building time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python3-systemd_235.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 6b44751df7..0229b2a820 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -15,3 +15,16 @@ inherit pypi features_check pkgconfig setuptools3
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 RDEPENDS:${PN} += "systemd python3-syslog python3-logging python3-syslog"
+
+do_compile() {
+        cd ${SETUPTOOLS_SETUP_PATH}
+
+        export STAGING_INCDIR=${STAGING_INCDIR}
+        export STAGING_LIBDIR=${STAGING_LIBDIR}
+
+        nativepython3 setup.py --verbose \
+            build -j 1 \
+            bdist_wheel --dist-dir ${PEP517_WHEEL_PATH} \
+            ${SETUPTOOLS_BUILD_ARGS}
+}
+do_compile[vardepsexclude] = "MACHINE"
-- 
2.34.1


