Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F85C88E6F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:09:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15427.1769414981771224281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=czSXXuEi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5486e61ece=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5QLLv1378374
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2swk418+w1dDPs+gcOXY
	EhpHFur75XdIwpa9gKdYseI=; b=czSXXuEitc6iM9T3Lr9wc1zzpDZK4ufzv98x
	1s3Kowszj3NgF4P+lqZyDrNeNx2Ontq/5feVJSVMiUwkClG8LQU6b4NNm/guUmid
	jzmR/3zQnW8J6VdYk/XGODP0hjlOmn18YNSRUUq13ObWnRBZ3Cq5i/ihDrsDrOkv
	KhyIXwrWD/ORFpOhPzmaM0XyIy9w2noc1mFdcave2NGgDq3xK1ewVlH+5e6XkVr5
	ZSzj2ujVdP6r2AUUY0HKOj412cOsFNTadpq5pCQTTA96xMycucFiItkWtIIzujnP
	N9o6ZBFzW+i8kdHCp4u7dlUrrd47UoUkXmnSRwCuyCikWih1+A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka01mfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:09:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jg87QcPznFn8joUq+l+cBF2ET2qDCfAmM7pkVKoFovAqkbDJrZBAKZ1KL015wo+sJB1GUyLzpTZ17FKg2mKvM+B+yvxX6nzYyyUxTiatoeYT66xClDXx8LfCu6zHFDolcVfHaiqoA3H8piB772dVVDFwCL9cvkUd95KEApKg+IRqWnGgwJlPyqkTeWDORfP6+aNmeon5/nVK/dJZRdc7cu2lAQrm3XApXPi3emRKcBWFqlR1I9nE6pWTM439RRI9sKa6D3V7HFY0LCwpVyJTXxHLWH9MFLzvOQdOIfikrsGqcWt6y83khgrcMnhgiAd2mgV+rbhSi+yZSiyuPNeG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2swk418+w1dDPs+gcOXYEhpHFur75XdIwpa9gKdYseI=;
 b=bnJzx9Wdzm0HgFHnlWEHHxO06ws/3EqMI7CdGnmw1s2soSyhUmZOnmYzmScqUcOQbf/IXmoE/QRV4dlFRE03Glp58dc9zigtPNvldI7JrqpvrNFBzG8iCzwKB9Kk6wer5BXFvL5S8Y3zXzoEqejheqhDVi1fN4xX4sdBxoeZA39cgT2FzjAeMygFShcDXjnTKnF2HGCc97wqWZSfBsRv0hy/g2ylhtrhLhW4EuYLaoMbOyRtxysuHmTsvX/tm2aVG3M3/T2DF9epElXpqltXrJzJ41HJVjLChtZft4yIi/nEksih3QZ6WklMsw2zqM5VkTnLNaBp70N7JX35Jo8TGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB7178.namprd11.prod.outlook.com (2603:10b6:610:143::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Mon, 26 Jan 2026 08:09:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:09:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openhpi: remove snmp-bc from default packageconfig
Date: Mon, 26 Jan 2026 16:09:24 +0800
Message-Id: <20260126080924.2215018-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: dda7d4d4-a8e3-4899-4fda-08de5cb23f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rC8ebDJaMrBa3vdhC19EcYffdtJrk6G2Uux1Lo3C0JqZdINXgXfbljqz9QLS?=
 =?us-ascii?Q?C0y8G1hFBSq99etoUfBx5vfWtvKT1Rn6RNtJ2aM/h+6BnKPIxSYfpySebnpB?=
 =?us-ascii?Q?2Pm9wMTADY4wG+ATJHtl9nin/YPlqXkvjx0oa1Dc3ew+rb5A5y3J0fQqPCyL?=
 =?us-ascii?Q?w9uhNiXTdpjebel0za1mDTfyeiwWgcVIEytN//6VJS0Iq4/DwT3YuZN4B1m7?=
 =?us-ascii?Q?kPR4l+kTdy7ujbgMhXtV6enMpDIXwFVce5P81plldV8DNkp8d3JTyrHEMurI?=
 =?us-ascii?Q?0snBrIOVFDhU0ZO4q1ecjcN3x+8gIRkca3YF29v5IpG3rsH8chamWN5CKc+3?=
 =?us-ascii?Q?zlCN+aOuwF/fmt3Pp6Iqwl91wWGUO5P8UEAXX10l55DIWE32QUzu3mSM49sY?=
 =?us-ascii?Q?iDhYv2aAQN/hVM82KtFMqoBGDdYPRR4ZfvDaRMiq9rwQP2iOu3XBA+YLAebb?=
 =?us-ascii?Q?/ngu9LpuNIW4A0CHhL6dnGgMKXklMcHJQAXFDGh1qs7doPYVkfiRFrkgvisi?=
 =?us-ascii?Q?AMIsXh31966EeZMv3IB1dyeS3NUQz+HjfrAeOwnITk0C4NKYEj+qtypwWBQK?=
 =?us-ascii?Q?udrq5FBrSNSg2oREUsQg38LTEhYmozYXDMubpE3A3vE+SI20rjASRYI7WrCc?=
 =?us-ascii?Q?QjGQhp28jgPwnAs73ZMrUncg9jcRjuzxJbNHCAQ2PTPt9wUxHg8i3ILaTq6n?=
 =?us-ascii?Q?APE0xeyTc6vo/8WDyfdn/ElAIU+1Z2xd39XGIV4TTR7sM2TiQ7yXVnfHc8V3?=
 =?us-ascii?Q?Pe9lWGsF+F/M5UCacysopKe45pUHKp5qqulYwYNnlAQNjzfiekhbnMXKgZfF?=
 =?us-ascii?Q?7zPswfyie3zALK5P4IN3UxMoZXCUqv8SSYbn+GsgLvv47D//8GJs5GjQjv+d?=
 =?us-ascii?Q?7Irb88KhqbFgII5lpdeL7MbVHRgVKweFhnzsoDER2pGRMj65KlmxetPAOHUq?=
 =?us-ascii?Q?cDHgYkTUzRAymw5YPtxC5C2zGryjoK/0dSFlpK4GiaqAWhfDogf+4YN2Sqcx?=
 =?us-ascii?Q?FLzsCS0siiOdsyxhdHNAh1GWe0rxqVKXknBYat7tX8j6vkeyGOFHVsS3dT1S?=
 =?us-ascii?Q?fxHVnY2Bie4bgxbcf3S0an904zEInP63ISJaOWkOMIpo3sIwrhLPrMc7wUM3?=
 =?us-ascii?Q?uzAr3is4v5gd3L4Pd4dYhostPESKdQschUJgMMnEeHC1k/5sau53Po/NYleu?=
 =?us-ascii?Q?Cb1jtGm8R9slZi4T0Azm/l7QLApFyw/d9ZmxoSNaIBsmE9c3duDR47TSgkmB?=
 =?us-ascii?Q?aNUW/VLEBfVARcUl6Y1f/LlUfxEQ6GvwbyvEu/cHWshpFlkJuPhdssr5mQhQ?=
 =?us-ascii?Q?bTWFK0wqEqTYv3XWiVlJ9+gaEIO4a61AlBjNhl76wxElYI/fGcglhcl2Be5V?=
 =?us-ascii?Q?9QKbYRLXJ7Wy+jC8AwfsGpKAdJYBXg/Ipd+oPOdzt4v7SmN7h6SE656D4vlB?=
 =?us-ascii?Q?8vC27Kf2G95vHUk++Ln3CQ6GVFM2wi6OCa4BOijhsBoVecQooG+ETfTYT2vV?=
 =?us-ascii?Q?PgzsRYrSXyO0QnnRYRDviRiYUpry6rFaXvCeuKhIzPd7IRc/17CRr8nFfU07?=
 =?us-ascii?Q?vDvBpevHRZoZ9E40NTaHEM9/CqCTxllk49XJmIwdNGCEhLeYzJ2F77IFqWpC?=
 =?us-ascii?Q?WDiwuldbxc8MKN+dYkZ/T6k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O9AtLp67u6MLBls8Vdta9pgG/dmWOy2IhpMarI5HyiWz+5G5aWUKhfkVn2l5?=
 =?us-ascii?Q?/GbD8lpi0yJpKJrRIVC5D5odNla2kh4C0leH9qUYRdyA0YES868KhJwKOoJa?=
 =?us-ascii?Q?RQ93a87rSk96vRmr0jby0emzVZyMB2Of9IM1T8RZo/PjMwmQ6ujhcBNmRwaT?=
 =?us-ascii?Q?uvY//Fp5Ng8UaqgX2HSlneQz4540ix7Zcq2vN06xQn7xZHvrjuuWBU1M32Mc?=
 =?us-ascii?Q?n2HcxwtJcporrflohgKR9hm7J02fnWu8NeTv76ngxS0c+R4QzidRORvdS0zm?=
 =?us-ascii?Q?sLRiGcG9wZioF/Vke86Kqe6Hiceao1h4qIBwPLapYZkJ4C69ZxLgUT+LTC4x?=
 =?us-ascii?Q?+FqPr3EKMb+EG2aQ2uAA62MHppUAGRzLkh25erAV6O2N8YDfyShp5Svw2dYj?=
 =?us-ascii?Q?dg5p2V9U4WBkVp1oNewhc686d6+/jsKWW20WC7S1ktwSqM7IW0n8U67NjSSU?=
 =?us-ascii?Q?riWOk6Y4c5f4j48/jzwTzyyPHApacQNFdVaQ/8cm6wUlak+y1fhXIpVUXkPX?=
 =?us-ascii?Q?eZ/5tXbB+W/D3hTeDzOdT3noLeFrm0U1o448EIUihaoF5qCQDYniJ9f/4IAP?=
 =?us-ascii?Q?CmplmPidD/Ju+RKGOeF3c5jke4TYpfPQSkXn8hWSkGke241iNrP93PhGo8Xd?=
 =?us-ascii?Q?7klho0Iq4Q7Udwrsvi4H6464+m9VbI6hOW6rqZ57hm7e13yFpHzK+tyzcB0t?=
 =?us-ascii?Q?b3kXKv0PH73TWk3AAKnE0yDljXMYIURybutOQGX4dGGz6JK8pdHqx9FGpzBt?=
 =?us-ascii?Q?cQ713tCh9AHcz5r0WMOVBjFB4mt7tcsyUxk+TiesmhG+bsnSGPaziPBwNYOr?=
 =?us-ascii?Q?0C0+FdwmP2gImE6NLgSwjEOV9FQ7r4/b9Lyovq7kF/D0+jol1t/kVLGJ/anc?=
 =?us-ascii?Q?Rc6iis5wx7+oXZdLgUQ27viyiY9hhHD7rAtJY6wvTTe8SzrNp/5on/cET3yM?=
 =?us-ascii?Q?VNVcjO+MrWtDP1HV4oj2ZAqE6zYyVmtXNat6WOzpNNwkmtpCa5kqVwU3OEWT?=
 =?us-ascii?Q?bru8e1M1360EqJoBXKHISTS2/iCx2iSlCwgp4YC60l7mgABKxvDKRxZBRBgB?=
 =?us-ascii?Q?0LiJR+7palBCeW9vGmdwyb2Wn8GCFoxNH79PovCRX763hWvQsfjbGkBgghfZ?=
 =?us-ascii?Q?R8rR1fMEmUsmQQfySmLterJnaOXpep1rRVo69skyhjAFa/ysuP8VJBDFYgX4?=
 =?us-ascii?Q?RqK9gLg1cKZxNKTt4SqY2f54ddO4Xk5jir2EKiy5yS2rCxX5ajtyFHvTEaLu?=
 =?us-ascii?Q?GFlHOj3GsmDklGNU9TetWH4Vq+A/lwm37cB+aP7yDfbmVVV76u5+163yCHp+?=
 =?us-ascii?Q?ZEdGZw8izu6H8pzpjDHMp1aLUVb1XOluAWB4qhm2uG4lod6K2rnNaPsPvcz+?=
 =?us-ascii?Q?YT5dre405GKkM9wwZEZHANYafh/cOuahETEBSdcZ9dvFvkUHuCImh4BphrWH?=
 =?us-ascii?Q?u+/QqVOAACt/5vtZ3oanzyq0OIDuTLQM+ToPEX/zJZleeCEJXjBo47Ii+NPi?=
 =?us-ascii?Q?qckOcFDkdw5YuvDsLWsUQ5Qp1Fk7nHi2J5+xTxVrVxBGgZNa7EUA4ZmcStB6?=
 =?us-ascii?Q?0+m8g7wpBOOF1Oca1LIlKAjC3zacLU+37to3r4InTYjSiwY1YZKweTBBFP02?=
 =?us-ascii?Q?j1URni78LvbA586n0Z1xJm683OGOk56OmvBnBFdT+yqPbUDBGcgDUuYNJdO8?=
 =?us-ascii?Q?B+VnYAChNuqB1wgixudT/Gx0xOYu4q0/3e97e7PazM2Dq/K4q5CLaAhLZGYr?=
 =?us-ascii?Q?o0NECgd2FQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda7d4d4-a8e3-4899-4fda-08de5cb23f70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:09:37.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uPq7LYKaPLN6j22ueD21ZmFt1vKLdMrNQXHopmWi0vRSWB8SAJeH2RI6ezSlwaYUXpecctIutopwPRoXRYiPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7178
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=69772144 cx=c_pps
 a=qx7sgmNqCaiUqJuMW1Xodg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rsm_5mNs9IBDHRxaO44A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2OSBTYWx0ZWRfXxNuJ2NZczO5J
 C2CgfHYP27+fPnaMKWkI/vLiIzf7SMBQ3kSVXRYYtQQPAPb4RR9Za8rnrLopH7lRMe7d4m9dG+s
 ATsCj8niEZQe/2Ktd3E5sWFQurOhN+KH4Q++czr9lThGAYKhAe8rryGfs1cwKWL42ABT2nglK5s
 nG42D9zB1d3/pcjbSOZ5XaB/x6zjUL2VPoqMq0yyKd7t6IHFY69vIQjEMfYWDWDhk9n7Ef+nJqn
 h08aXdqgmVq6OmTK0JD/QNIU7TxKmLk+DXoM/fKkRZxssyfDsGm4mkGLfPLe2SI9tAlWC4IIAY9
 Tl+y/CUj2sOMlYUIRuIeB71ZyBiD+FDQO2twAfzOEkQOUW1LhnYXgQ+o1E/m7qZiftwKYWD0NFx
 ufj58Xtkqq4NAadMOVQqPAGqvcmjgP/8F/FW1NL89vU/WhiOSi8axZvwwQTgPwKTL92BbOoXeTK
 wyBXszc4h87MzFEMcdg==
X-Proofpoint-GUID: cBSx5nY9bmiSgK0XdEBAFpBuynR8eCML
X-Proofpoint-ORIG-GUID: cBSx5nY9bmiSgK0XdEBAFpBuynR8eCML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123864

Disable snmp_bc plugin build by default as net-snmp no longer supports
DES by default.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index d1e08cd073..95994c0467 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -61,7 +61,7 @@ INSANE_SKIP:${PN}-libs = "dev-so"
 RDEPENDS:${PN} += "${PN}-libs"
 RDEPENDS:${PN}-ptest += "packagegroup-core-buildessential"
 
-PACKAGECONFIG ??= "libgcrypt non32bit snmp-bc"
+PACKAGECONFIG ??= "libgcrypt non32bit"
 PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
 PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
-- 
2.34.1


