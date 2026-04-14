Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A61ED7B88
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13680.1776153349165066881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iWQRXbqY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4OeKo3645336
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Kvn1kg1ILacSUKQynJPyd4sEFD5Q8KBwMJaW8KADkZw=; b=iWQRXbqYCW2t
	qy2EWErggum/1+dXzwBQ9bQ3WjiXECjMNaLFH59GHhLTB1nU2farrSYwq6jEXnUV
	aI+slzV9jgEptfbtzIFrNHqbVJZ7AZOTOh7TVXBEYJ3XIH6RjxEd/zt+XgRNUshk
	jb9bdZ7+i0R2lCQJcUwlsQhTVSHklSgvNcFv3k8uS77A17BommdImjez5vPmXQWE
	VXVJOc4w7MytmfKl0dq50U0LJWFLsqpoqK1hwI/ujvYtBteX/tUJ/zsozUllCGV7
	gXBeIHTix6+mRE+svH3qr/lTV8UZe/4poLv49seoZ9lFRxIKi+xsi0fdGJzEn6LU
	Dvpan8DGSQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8ejt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMqHH2oQ0UJuoIzHspMOoH0eczIAWz7aQk3e1ImovmvtG85aAdXpUyWRmlXqQVLzAdyLH9QmX9dZFsMb5jDqjd4Y8We/Nj25cHasSEq8YbBj8dcBZD5iCX1sFeNhwEyxJX+sLRQbI3cccqa2EcLRA/UEb3bTcn9iFbEAPKUlKVSMH2RS6GWrDdpct1NlhLcyLCDpXCogCnAY3fxfQzwIHNFDcBauEKfKoMz0tJROx2FDvJ7OrIRNxAsBbUdpc3Q3A794lzj5r2FjbvBbOgc2eiOnaU2Oq322jUIM2c9gsM3Jf9b/VmSD+MShRDLWgoo+u4xtYNvCYjfOui1nFv/Mqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kvn1kg1ILacSUKQynJPyd4sEFD5Q8KBwMJaW8KADkZw=;
 b=edfPlyfVL49S2xn7htqam3ZBO390evT3hi+HFKfhMNfHhnrkknN5WcPRCnk3dfYMtPE+TxmmlPZ0pWVcklARaWky7W+pkz3MadkcHXo1iFHIH3tSuXBfAgt+gEYbxrIiKcZCx+Gb9Ag4y9QPWHUT1P8OQvI5WmH0PSe35ADWbNGoquIjsE3WEIEMIj/wYy8x/wjKr7r2OXAh9U/UhKnU2RY1gt7fM4CCM/XHpP/HN7zwDbDkJte1+m3uJYIMxmjQGA0FzbfbeO+ko/IBxDcADYvrgj+v7GYYRerMMshhCXRGN0cNPrRDElmUhAbjfIPnDwQ7suQnePQ3PJGDdJwdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:47 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:46 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 6/7] libxfce4ui: add wayland PACKAGECONFIG
Date: Tue, 14 Apr 2026 15:55:20 +0800
Message-Id: <20260414075521.91846-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414075521.91846-1-changqing.li@windriver.com>
References: <20260414075521.91846-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cff1342-372e-40dd-2d33-08de99fb3cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	KBm9IHYMxs/yRkU+D+oIkNE73Tnx4eCw4NEiP5yqeNlSTG2p73FPofY4DWAs2ch+XC9gZ7oOTWOdJdbCPk73bQYdyLerXKaOgwmB5Kpq2nvMLoudyQAuyR8zrSoZ7D7TIVCTZtlB9bwvlGaOXu+DbkvzzOb/KH482rttW8kfSGpv+u31JFtzPHikIUKQZWPTW5pxGXRSBq88i3EAOqN8sn9MqIHT+3aBs26/a0FN0KemzKCFhMrqYHWvJumjjEuM8X0FY8KXRkavVZxN/kO+WFRMeArF/BTSsgDJwqUkfKxoVQNJ53vtq+DWPZAfmrwLWlyUaHOad6HUKaY67sqaGfWTrzIilPvUJiNGayMZZzqWLdtcNcxQFI9G4ImVGtKDJG9aCDBVvCzdvUE0xNFRmzDZSsb1X88w5jB/VFBzG4HqyLwSZpA/FbUDIwbx8sADfaFKqIZhr78yTxrkC29queTb/b5G3M4pcJI3FaVjYUHPDfR55K5AgH32WqksB2tPtsEzMq8G4xvcnfivsA1AqHnPvWEX16/SagHxuyZeZei0b27gZOjYtsJ6BYevanDGw812Ol7c9FlD+ODPn7jan5OlZ4+us+2+t4jw0fueCLdmEQ73z0IlLdHUfX8XNn4IVQhDAzFrgY32VOkr58nrGxHE7+vSe2vO8oiuI8KzCBMv6462/r6zG2sEqzZYxH3JqcQ8rOfIxiFHkGfYB/xCHE5kFjaYmRk0Sys6DUOxyaQievuIL+IiS8b6M2SfuziD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R2tix1plx53shiZn6xKXpYbvKkcVMsqySvlfX2/Zr9e835IzIsRLO+/Ud/9J?=
 =?us-ascii?Q?Cxax9GTHXHAKQcDAsC82w9i03Y8ItHws+DD4NvgpfIkb+b1xK7KTwcdIfZEo?=
 =?us-ascii?Q?8/ZhWst1OMZ/COOrJziRK+x2I447W6h6AnO5pNPirxCkzZAv4eOUdTPKcZUV?=
 =?us-ascii?Q?tjxzURbT7yqIesI1zpHwTsWZgYBU3Y1VTVJhO3A7LJq7ysTYIMFhcYu168sp?=
 =?us-ascii?Q?v5rETws40px6GSBgOfDXiCO8Z82pbCkeYtMCfWDROOYUbrYpRBCUoLPWTk95?=
 =?us-ascii?Q?l2YeeHfONa96+BPSuJqAE8rLNMzmLDm6d8VTOu3PDz9i1v4bW/0rfaGlrATk?=
 =?us-ascii?Q?KGMKlZxgIXQxOzGmph3D1v1Hq5+sX77/6L/QE2015K+Sr5atM93v/ugAGUdl?=
 =?us-ascii?Q?mENsHyFLaJVjiSK4QkYuGgNzb0elCWTmc2l13EJgTATHSOVlDFcxK09Gtk4H?=
 =?us-ascii?Q?u9aXT4irWkYba5HXyL6iIYxmKASZQl0bvuzH7YD/2YGlNh8zunsI/NejAx7g?=
 =?us-ascii?Q?4IsgkVM0qxq2SUIlzE8hF0XcT+5atG/Tnq1QyyQMSLX61bIfs3RfFgsH8ZZJ?=
 =?us-ascii?Q?1IgrWHJIsvFHDmpghVPlhPbK1za5shVbc34eEllrVRHe7dweUs23nnv7yLN0?=
 =?us-ascii?Q?Xbm9NqHNeF7D6RFH2pPSbwIz4esQwlGH0BwTGr1TUXauCwnzwPY+am6ER0LC?=
 =?us-ascii?Q?mEx5BbU2foOKN0JUy1GO8GZdU1mvFF9eY6nLdWWLirKnBVwthou3v5SwEbaW?=
 =?us-ascii?Q?bDIqKOu40PrsmFNyBywDlTHgSlKGx6lxEZq4d9Tyjb5u89n3Yvnd0tE0dVMS?=
 =?us-ascii?Q?oiA62UKNl6ZYyiRulmbBc1spt8Kv67APwe4E6C2D4bR4fjM2wQYbGYwdTfDA?=
 =?us-ascii?Q?wVDA2jZq6M7mFnSfja52ua8cGcQdyf0Xq1dWBGGkSD/29MEBSLd41HN/SQ/d?=
 =?us-ascii?Q?txm7BZ+AhGsmwgaL0e/YtsG+5nztUwUR7H6zQbM+uDloIKqHDs/iBHGSuBRg?=
 =?us-ascii?Q?khdBBuKIXyxrveLhvnMZTu5gVjJNWtBT0Z3ptaVY6JB1g/BQkaVH4AqZU0PG?=
 =?us-ascii?Q?GCK4EfXbvfGenHbqAVQjGCWAT13mjxXmY7CAXadY6CQYR3XsKaO/IlF17syd?=
 =?us-ascii?Q?4Uj5ZcHKAiO2jeZNDuVGPY7pO6+qFgiBrJyuTI9aIaKaoh9z3CO72K3qzIJ8?=
 =?us-ascii?Q?3ZVapdTuDxAhlds0rpEtHa6RgRGoifrCau7W8uHK21CQtw7k+H+7wY+eoop6?=
 =?us-ascii?Q?/etCtUzdtXAJBANlhKuQwf5e+gBDL1tfIysdmjQL4G8PANLAgtlhpVcZ/c3D?=
 =?us-ascii?Q?VlFH2Ge/BpLPOu/6O5H+HzRo8rZf8QIaAJJ3GkfBarqYBWgxkcS6QiPn4fPy?=
 =?us-ascii?Q?ONXvC1Fq3/E3gycWu4FNAVc7n/Y6diz2ds2Jw06YcRqso1MdFiXdvf+P/wIx?=
 =?us-ascii?Q?Yjc9FmwR0skr1pnyOEbGiWL18nfvt+nFgnQ5CMdEyP8hbvxCRrMN+grX7JZW?=
 =?us-ascii?Q?fw9RZXayrXbCIEmxcO/zn2S0UZzcyyg+rlDqSKzV8Tcw1bgQlreo8YnDp7mN?=
 =?us-ascii?Q?KC/MQxZvjvVZtu/xybxgx0GuhDtqClVNX5Rqw/iwYTqzCA/2PvVXbC7/AD19?=
 =?us-ascii?Q?OeT1at7Loa7aOQcJ0aDpibkL4uQMfPRJZcPUfDNedSRU8JqSbyVz5Dzs/7z+?=
 =?us-ascii?Q?/G79DOr1j4I4502dONY17ww0NJ4H6vtq3t5nL55F2SvC33XkTATkQLx7ZuXt?=
 =?us-ascii?Q?GkCSxlCOgx4i+d0n06cZAKHOC3iZ3Po=3D?=
X-Exchange-RoutingPolicyChecked: 
	jV+zD4UQUT2fM+kjcv/GPU/SH9AvnLtRxagTvdZMZ4EFf0/kiLNO+WVR73d+kwJiPg4A4z7SpVVNJUbVkxcoiVuoxwKfw0LNPmMtmjow7P+flvf1YgYtbSjnRw0hs57wWjfk06kptPZLDM8dNnRooogQJhQ6y0+o8q18yFr0fN07wDoPHXW4X3IVv9qEx5MC9NdN0mXync2mmS7MFXU2KGwgDux0qhb3LpeaFy825YKndPC1dk3+YaED0NttJVMv3ii/+oG/z2Z24XZnXBbobCG2sJAhUoXyv5rjhk+vtsOwLzqkamYXVTN4RkcWn5DnhUbXY39LzHDj+3aH3FeDZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cff1342-372e-40dd-2d33-08de99fb3cb1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:46.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bXd9JnQxzF5asnV3uT5zC3Sf/SunpZI57CVlkIe+CrlfeBlUEhXs77aw2znEoG8m9d3saRlOXecie68du+ahrY59YGbLe3FSidsJeEQq+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-GUID: dyS3n-gTvnV2TrFDjmAja7a3TCZWlAiy
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69ddf304 cx=c_pps
 a=N7UEZcGu6nKKiVkixTDHSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=J0ANhuiYi7gGgHjyVd0A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dyS3n-gTvnV2TrFDjmAja7a3TCZWlAiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX+ucLWgO58dDu
 plPWCwWUnNX8/U2uGJUjviAqhFsVgLJKgpamBvM6HJQJq0ZrPoAMXKc73uAwLis5wj7zr66hYns
 zNc4JpM9gftyQR0U/YuZzzj+woqd8cDTxBuczH4T8CZ2yCx9BvCHxu17BpNJt4RKsGtAN3fxBL/
 tKmT7/jPO1h9QhQ8B2/M4WXR3xequeRLX1sQp+bwiUBDfvPM+GL61Ett9vqi7PYe9RVLRa/PwGk
 z/qUIXgEEMTQmoTRsWE5jH2vsKbQDG3WE9gP8LqdtfP/N1CUCt2xE4rG/H2CHNkGxCJTGHD+Tlc
 fVFSagehHadOhxX2Ove1DL3cqNkB7ntPuCaspmHcrlyydjKU6Ae1780JUqXpLq5OY2qH/LKX8Qp
 ViWlTmUs6ROxoJhwDfvo9FWd2xpHXewZtzwHeX6H6OaUO5u/emZSV9+8zAP0Rpp8YNP3COYtxpd
 0OydIRVyg7S+x/JboHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126302

Add wayland PACKAGECONFIG and add wayland and x11 dependency
explicitly

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
index e672eae540..9c86da48e6 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.xfce.org/xfce/libxfce4ui/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
-DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf"
+DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf gdk-pixbuf"
 
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
@@ -26,7 +26,6 @@ SRC_URI[sha256sum] = "a72a7af39cf183819bcfb61b1747d425261e966ccb172b2fc28f1494f5
 
 EXTRA_OEMESON = "-Dvala=disabled -Dvendor-info=${DISTRO}"
 
-PACKAGECONFIG ??= " \
-       ${@bb.utils.contains('DISTRO_FEATURES', 'x11','x11', "", d)} \
-"
-PACKAGECONFIG[x11] = "-Dstartup-notification=enabled,-Dstartup-notification=disabled,libepoxy libice libsm startup-notification"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[x11] = "-Dsession-management=enabled -Dstartup-notification=enabled,-Dsession-management=disabled -Dstartup-notification=disabled,libepoxy libice libsm startup-notification"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled,"
-- 
2.34.1


