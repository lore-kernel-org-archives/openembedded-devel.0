Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C30C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 05:17:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.567.1790140544601835160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 22:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sLzQG1fT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=372678bdcb=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N4MnGZ1118238
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:00:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/5RiNHNkR8xgJz/jEZ9p8e9LxnR4MsrrJK0N/bVVWas=; b=
	sLzQG1fTTqjSm1sszdjNy3iB1YLIhyWkG99QRoI6K8mZ59d9GfthITOnpK9LZmmt
	vMq9AcRw1BPj9fm2PsCIpopQrXxgvnZNiOJQYVMa8oUW2Vm7BRoI2HnB3wdnAGNh
	Efeits4eBD3seYvDsjFq9cX9TFqIvTMAbmoPsGQqG/rjcZMt+L3KMV7Cq805CEVK
	75EObafLweIVvqmm+yHJjOkoDoHKfAWUMYyGh9dqQkZ1g5UjHh34cRVAhcdEF3Eq
	d9fVGIS7r5u2dXu0Az+MLMqXiAY+oD/jzenFfWmW0VZA0l2K55O4tnDv7lJAVQYn
	VyVmtBXR/v1HpOMLGltWyA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022078.outbound.protection.outlook.com [52.101.48.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsnp1dpqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8jOymzWfxqIGKtFm7QTkD6gGEcvmVFw6LvTcx3Ixect4Mdam6Qs2wbTd0S9f28LO0zsEMmAP6GfFSrWnkqQ1IPS2fJXyh5GjLdfIhWngTt6JDs8IC5Ec438ds9Q9EZH9Hd8gQO1iIAtepNIKqBY1tH3HOSTNxjmo3GmonEXm+/qGh6xiY26QmGxgff3MHWRwMQLaCZT6h3iRZt8zbnU3ziPf94NtP+VR5k+seVG4jEokRPmXpW4G/G2VfBWPu7lRZnUFUCctpqybZdY66KWCWIG8U8rgrV50sLryUeH90F0IkUsR8H8u+JREN36WegHSTReHKARbHoZOr8T9hg8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5RiNHNkR8xgJz/jEZ9p8e9LxnR4MsrrJK0N/bVVWas=;
 b=y+aVLo5zkQ5RqABhk9+qTIyUUMjYwXvvA/K9v665H99nFA7Wp90bL7d8TzlWINUHO2QyymmWKCJ6FJqwDty6lZdLBITc2UrrMiygUk4HxUG7eRmzEgqp1jMA4k4pqU4yZ3L2p3qTThamfI83U+G9JYGZSi/HtcNcRSyXYCu3Xec3HLmTxphwqwVZmlfdTJzIzLpYTXFRr8kOhQRYjIk0s2QwkqckoGcRm1vGsjS9dftFFlSdrZfYvaUZYsCYSssk1WqJvgp2U8CoPAs04c0N0xfXBgHOBBAFJy05U5wQOB+9ez+34SUiPQp3AttaiXCa/5QFs9DZq2OfbgqaK5vJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) by
 PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 05:00:22 +0000
Received: from DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340]) by DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 05:00:22 +0000
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com, Randy.MacLeod@windriver.com,
        Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Subject: [PATCH] systemd.bbclass: fix service enablement for cross-install scenarios
Date: Wed, 23 Sep 2026 10:29:08 +0530
Message-ID: <20260923045909.1561330-2-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923045909.1561330-1-HimaniRamesh.Barde@windriver.com>
References: <20260923045909.1561330-1-HimaniRamesh.Barde@windriver.com>
X-ClientProxiedBy: PN4PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::7) To CH3PR11MB8774.namprd11.prod.outlook.com
 (2603:10b6:610:1cd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8758:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: c7852076-475c-4aa1-fca6-08df192f928d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VSP4yfGZsEaew8PLS+I2htSqR1nuXRlOdrm/lpsVfBOh1Vn8O1luiL7R5+QC23qxDrHR93CbfqV1x+UPayKbbnc7wtA0Q2BcW/M0Zvjyz21t2taITPWglsqUH/JkVQOYBweL0erHXKlqKHYOPgP1MgFbfF7oyswIKKm7VWjVfxeOlj0s5uUnnFxP2xwXY6xmIKgwnshIuNxL2WQUPZGU8eYYgW71jJUecSsg9WR0ZXhsvaPt6dbDKgvSuk9y8tR9See8tO6fdQHtNjc4reGp19eNlGPiV76xtQNOGT6APSvwSGLsO3bs/fvX+wH43WW5IFPlKshKZA5BAj1WQtDsbOwMvGT2VBB3irUsGJtWRlJMbU0CCCyAZjkWHZe5MkBLCXl+k+wTzDd8Mu9gg8H9EugM0Zf2TDh02lHP2YBJeBDI9SvNO7vtbrXgViCwXRzVT7kzwl94ZJccuYJJZrzKhLx5UhSpogm0KX24MFAGbjamT/QHYk3GD23pHRBFkF/brw2ao1YQvgwVutIA5xlE44c2437yt9jg+UNp3KOtETfizcCAzlDgCfd1eeZwornBTsmVcTI9bsoRDrX/k1jA0Hiete5uEKp2ibQvsutlGgsDVplZ5nsyDrdPTNryRN7381QV6tdCZriy31ovR+4o8VLnBeUjFVQdxUxM5JuFsvRIU03DGEr7jVRl1K8OeH/3oNcPbxb1u/cZO228Gh6wA8jbmroi9LXmtkIPDI9/M4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NierM77bFfVkfSTC5+phNA9ZYCj43f2pe2eq2MXeDgP8SdRRYGWEiDQGSmMl?=
 =?us-ascii?Q?oi3Gb07rF08NyA/nI2qqGeQfiAOeFGyE8cNGobjpBWbHJhDmPPThH1IS051O?=
 =?us-ascii?Q?hYQbjNcGzjiDQoggOUUjyYb9Tkqs52vusaeXoGSOWvjvS+lYS2bL3UUDtk+6?=
 =?us-ascii?Q?Ni18YvwJnGACt/MG1cMcM/X8RPuyHAjRnSzDcSqPXevqzUkFm95F0oO9E5dC?=
 =?us-ascii?Q?2pTchI8OB2R2l0civ8VfZ0+D2huEzt5aPKZBnx3cHZidj8rQTybUDoTGPSJ1?=
 =?us-ascii?Q?irpzU0nnBLVj3pRj5gU83WUiNhHBs3Z1vsHAFfiKUUrV/KH0avTvIaQAbadS?=
 =?us-ascii?Q?3oRIJEd5gmXbC5C2lWKFHW3FPXjH9tILVTeAe8owdpgqlT2JX0n98ohLwWc7?=
 =?us-ascii?Q?Twq+qmsnLVdAEkCu4QDnpMD9lAQbyfhL22xuxFuNc7YEGU/05YJ3bEpD1imf?=
 =?us-ascii?Q?7KyJ8OozWcVmTzWZnLJg0Dz6D3ANnLBt4vgrzBZX6q0wRhQ8VBcwmJr+7ef6?=
 =?us-ascii?Q?aoXEBY+gXpxcZQ8DVBZ69FR5QNyvvN+t27+ThJ+CsJ99X/9X9XTXAUk3MjOC?=
 =?us-ascii?Q?TLBvsJCwDb2EX5T6c3dRju96H/VNXI2TYN7Z9hr/7z1TEA3ydkkCdzv5jjxx?=
 =?us-ascii?Q?OZZ8W6v7il9sP5ltYLvp3H0IUn2rro0EMhmOrjn6CnaWDE+3nLES0E4xBGd3?=
 =?us-ascii?Q?kq8o389g7tkITbNsBLgIVqz1l0XfvJLsH8VAlxRhNFmUf9puee+rmHVqxup9?=
 =?us-ascii?Q?N+ep4NTUSmu2AVJLahAKZ7+/LBLEsxpTO5fyFujolvBy3qu28otYw+/hnoJ/?=
 =?us-ascii?Q?+5tpfyAmqSGI7DsKKDmj7uxcrbSuWvrTXbx4AS8GVa5HamGr0xofqNQdhlpd?=
 =?us-ascii?Q?/+wzOqnYgy0MKlTQOtEuzxot/KzqH0zmxy5axnMnHzrLJpqH/wtTJ7sqU+39?=
 =?us-ascii?Q?4hqDUMKNMSuNz1GPegw+GMRUHS0iJsMP3Dr/opEZU0yJGMSESLtT09eF2/sT?=
 =?us-ascii?Q?rshxXwWqHJI92AP5Va4OxP7yxY/rJmYAvuNuJBal5nI0i6yHmK8kliNp9ylX?=
 =?us-ascii?Q?aM7wksRqImWVanbK7UiwgcbKnU4lD5EWn6jJTOi1ZRqRPwAEnKU0DIqLfrul?=
 =?us-ascii?Q?ZcSK4fHwoaUb4U/A7BKZpcuJa65ZqglIkpbh+ohWH9R449BffOKilepeXWrj?=
 =?us-ascii?Q?4/3SisXuSYUAvimZQUlJv3MmQqdh1/fB1/IKPDVKBRNJ1iyVwaQgy2352CpF?=
 =?us-ascii?Q?AG4uCVUvxqfQCytiJf8UbLRH6epdpZJeufyIahFs3WQ8bc8m9sZkQQ1QpAT2?=
 =?us-ascii?Q?E+UUxlUiD3qn/ezOqMLpK/EqNRv80Q36WIB53V3w/crBKN36fmj055ehoj5I?=
 =?us-ascii?Q?x1WNXEJaEiFNocFnseYrfev+O+Acx7Y9+B9veztJ/se1c0UDu6VkMTfSA789?=
 =?us-ascii?Q?KBLUozT4Q6BBOsVvPSaKFEE/UR9pcoc/dVn0dconucAsB9sfuF4rFjBFih8w?=
 =?us-ascii?Q?ClVxroEm2pWLoAuE1WOY5Ki/g6VTIhbxzDjT0Vx3ozX7H3LkeFBiM6cOIoKP?=
 =?us-ascii?Q?hcBHn3qPqpnQlE29jsPbd3Ro2j5NFk6wRxVKFclRmRD38mTvfySzmq4Duyjx?=
 =?us-ascii?Q?c5CMbKzArzlWbVTWsEdCzLq6SGM3RyghNvZqO1KkkadcNXG1MbX8VMy1KjqL?=
 =?us-ascii?Q?mqiUouF9kiiBADwYFzuP+kjab++yZ2w2XFL91q5c4NJM2siXWCVF4y3MISsB?=
 =?us-ascii?Q?7r8VaKDu8z/0vZH0dqPYT+bniZuOYp+vvaDE1D1ZQFWMz5iUv/vH?=
X-Exchange-RoutingPolicyChecked: 
	bB91dn1Em9KLFrTJhxXPkM8Fczr2QJS/wS7Ec3hIBp8wZED9d5I3gc9CHzvsFQ/ufhZZEiR4eLqon8Qbg/62BPy6ixOEMZac99rpdLw1eqviP1oHtmEtXmQzhIZ5CPSJQ8PuMhRaEJafnwZG8EC/kLqfnLCBfeOsfIcA+lRyxxiZTUHbhriwaANWZmxjDvFlYwZ48GFClU7mPrsBp0yCxla29/uUYIswlcu6/8JXJPmHgNVAA1R0TiLfMGQQTIQQg0RgWp7cra/QTJ6jtcS2lEoHqGFuv67zBE/4QA363HrcHEdrdyBVGAC/nGKj6QvdAhz2u7B8X41LhNMASG88zg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7852076-475c-4aa1-fca6-08df192f928d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 05:00:22.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43HMtbDYQ0yR0KRfvM/RuIPJnehFxO2cSJFAMhtiGFRrY66w6XMnRbOmrIrQYaWJKPK+XLi80foXfWM0amSDZyZZTm08IlCYi4GN952N5rMYIxY39uzh3f6blmuKCQwi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX+s3dDgKDsSal
 ip5NmAaT8R5TxwZF/vBF1bDKuy5+i0gCgenXCPMZqB36fkWf2tNTkXyvHouJFVx/H8Y+U1VyImY
 Vp62Sp+S6gWpfnq91Du/C/PzX4LNqMi4/z1ZA9/X8pvd5w8oRYujZjGWpJjuXRnquvxmMco0bTl
 5YH6qAnK4cQRBJ/rkDLXPQic01FZR/ZDuLaKZBNDq0h7t6Isvw67hKLfHxO5r2S0fc0sM6reZMZ
 XnMWeclxRQ8Lk6e9nI/cX4UOE0lhs8RTKj90b5Kt4oe5n6RO2ucyd1nDunZlcdbczHdvNlevyaW
 AAO5U9O/QAD41owlnR25EjN+dnbcQsVp2qBAzR8/owf7FtyY53KOotnl/fUuWf5fmwGa+YRCagN
 b9Ewl1nGsvNthDrCDjMg8YoTQUJ7yfm78frcZUVGnakSscUKm9EaeJYLAui9DM4a/C5mAGiwQGE
 zjLZJeVurunrig8XFhA==
X-Proofpoint-GUID: 329o0ENs-wGI3tXzGDnpnDvX5bbwU8xl
X-Authority-Analysis: v=2.4 cv=V4foQuni c=1 sm=1 tr=0 ts=6ab35d08 cx=c_pps
 a=P9tLxss5Rj+yV0yjlYsIvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=eqJagXuFR_UGHyBZsbkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 329o0ENs-wGI3tXzGDnpnDvX5bbwU8xl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX04Z4anLSHmkT
 T1Rej+s53AUKAM7diZsLXyTYn1MZKLaQOatq0oCuNMJX60JW+gpATfNRQOjt5AoD9xTyOIM4Vs1
 o5P1TmSNlGGBScQFGeuo/Yv1qZX1nKqsbUaoiWmWBlJz5URUahx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130184

When packages are installed outside of Yocto's normal image creation
(e.g., using multistrap, debootstrap, or dpkg directly on a host),
the postinst script fails to enable systemd services.

The issue is that the entire enable logic is gated behind
"if systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
- If systemctl is absent on the host: the check fails, script is skipped
- If host systemctl is present: it cannot find target unit files

Fix this by separating the offline ($D set) and online ($D unset)
code paths into distinct branches. The previous code used a single
OPTS variable to switch between "--root=$D" (offline) and "" (online)
within one unified block. This variable is removed because the two
scenarios now have dedicated branches with different logic:

- Offline ($D set): Tries "systemctl --root=$D preset" first, which
  reads preset files from the target rootfs and creates symlinks
  without needing the host systemctl to understand the target's unit
  files. Falls back to "systemctl --root=$D enable" per service.

- Online ($D unset): Same as before - enable, daemon-reload, preset,
  restart. No behavioral change for on-target installs.

The OPTS variable is no longer needed because each branch now directly
uses the appropriate systemctl invocation for its context, making the
intent clearer and the offline path functional.

Fixes [YOCTO #14118]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/classes-recipe/systemd.bbclass | 32 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 0f7e3b5..2f655c4 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,26 +29,32 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
-	OPTS=""
-
-	if [ -n "$D" ]; then
-		OPTS="--root=$D"
+if [ -n "$D" ]; then
+	# Offline/cross-install: apply presets to the target rootfs.
+	# This handles multistrap, debootstrap, and similar tools that
+	# install packages outside of Yocto's normal image creation.
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		if systemctl --root=$D preset ${SYSTEMD_SERVICE_ESCAPED} 2>/dev/null; then
+			:
+		elif systemctl >/dev/null 2>/dev/null; then
+			for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+				systemctl --root=$D enable "$service" 2>/dev/null || true
+			done
+		fi
 	fi
-
+elif systemctl >/dev/null 2>/dev/null; then
+	# Online: running on the target system
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
-			systemctl ${OPTS} enable "$service"
+			systemctl enable "$service"
 		done
 	fi
 
-	if [ -z "$D" ]; then
-		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+	systemctl daemon-reload
+	systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
 
-		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
-		fi
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 fi
 }
-- 
2.54.0


