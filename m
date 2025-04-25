Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0F1C369D5
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:16:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5164.1745583407938030157
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PARKS4010033
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:16:47 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhauqqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQWXDxhYM1/+dtmlqdfQmaCYsdxxYxWGtZetYx4JC6nIFso581qaXf/X1EAQe2FyScM5m6KsNg0kUF3uwOqEn0ueqnqtLoUeFGk3XJSuGIvAo854vBaTfpRbUIykKe7h9g5JO+U4YKYAXnls8iYy3AWJc9BCnctkKIgzAUYY6TsVSDJNLJknhrPk+dq69vuq51cACD29TUaIGI5+eNyYvF/xZ3jcj+fF9BPTuNdwbVrnTkKBJ5aQGdkXHcmUKQ2rzlxkX4WTPa4amGSTdbaVthTEzYETcHA4PdF1OTb7omJ3MORmaHCRQ9jCCReODYG1CFAn60/aeg2HZ155wyVfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMDlef/qhdJuQWWX2LFFjVfVVq8gEhMR3MG+OAi92OY=;
 b=lhDRn2XLIdMYZZY8mTlCqbRcp4MexbqDF3diBYqZ/qwhuwacKb/u3PYgxR+UC1tIAjEKKohRvhA8hoSouf8dlX3KsTp7Pbxyb0/stJL//KpznM5K28gv98C3vwnAQ7/PXDLRBVI1qEgBbRuke9vGuq6lxrcVqViRhvzAacyCItbFqXhngII/pyc2bweWUI/yNGqxRanqkkRzm6Yo5+RtVb66x2W9WcgzdDHa6XLf7tfWCneILcXxdRF0RNx1D/1S5rVIIFHVt/6la/MrL05wIJDsBtvcTRoVPv9jhsWVvGl37yUQmeQ4YvFTT2otkVSIPQO0iyFDY4KA5V7ZQ9bKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 12:16:43 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 12:16:43 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe] [oe-core][scarthgap][PATCH 1/3] perlcross: update 1.5.2 ->
 1.6
Thread-Topic: [oe] [oe-core][scarthgap][PATCH 1/3] perlcross: update 1.5.2 ->
 1.6
Thread-Index: AQHbtS0cKPBO8RHWQ0Kp9/m2eWxTAbO0TWfP
Date: Fri, 25 Apr 2025 12:16:43 +0000
Message-ID: 
 <DM8PR11MB570323E6B16BE42816BF635D84842@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <18394A8CBB8215ED.24164@lists.openembedded.org>
In-Reply-To: <18394A8CBB8215ED.24164@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|MW5PR11MB5931:EE_
x-ms-office365-filtering-correlation-id: be51bcd6-93d4-494d-5dd5-08dd83f30a8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cQwxCdE5OxJ2wOpT5ADl9/DcKQpIqzIkOb9/HORmy08xt76Sx9TzaK25q26U?=
 =?us-ascii?Q?eeRogxf5lzohvvKBPz3x9RPz18k5Fu7gQXAXkfazftU/i1jUTV+PU6FE4jjo?=
 =?us-ascii?Q?80do+/T0mwKPD/eYpMVtn647y6ScHv/gEpQbGrPadAxB7MXiuLqqk88HPYBf?=
 =?us-ascii?Q?5cEtn+7pXhIB65hge8eAUba/wTJ7min8SLS0XELwh+M1cOxJfroSNK8qdgmy?=
 =?us-ascii?Q?jgZ0QT6SulwJ2Hmy2zW1wsdmowHrHiwDE5GJrFsT/i/CWStz9UwqpnJqGMjX?=
 =?us-ascii?Q?1Nq6AxcZXW/Ibj7tiw2C3hAr9bPFDciH87iBDphL+2ZeM2Qui2Y5JFBAKMlj?=
 =?us-ascii?Q?LL2M1mcSFKZRxKj66BvG2QizDIrNLkg9RyCOsQUiaz44EqSkDZt5ZPTcIJqi?=
 =?us-ascii?Q?EwFe03ddd8GtgXwOzgj0MDfv6ctEZalI6hpkU1EqUjiPRPBLsMJjMLurMNfV?=
 =?us-ascii?Q?rjpwj7L2T/9w0M4JtfXhEPZgMiRXI+WPxZXabAw/LIJzjGKNiy1blkenXDfC?=
 =?us-ascii?Q?k5twV2fuy5Yss6RwV47OA0+wLipbGE7LNEnBQdq6rL+iX6ZvyoaTNkjNn09w?=
 =?us-ascii?Q?EX5vlNR6deNOptzCkKc7SUNBO4h3fHEjbOs1Dmt4ljkf0uVeUzbdjGYOnJt8?=
 =?us-ascii?Q?4XFdd9WXOJtbkd57yrcSusxfVY2FJ253UWo+AFk3X3GqEsn/L89wVn/I5KEF?=
 =?us-ascii?Q?XbC9LP4PYqk4gPcLBth1/2aRwX6CVRGvK3M9ViD/pW2YjCLafxyWNjmOweFp?=
 =?us-ascii?Q?dZt9TiqRvzXGWk9925vucx7+ZSGuqtRt+5puVRV5fxODnWRIssmWBgE6syql?=
 =?us-ascii?Q?5QH2AfYnuXzy1viEqr4CQPHQWglGlw+snEOenmS8eY69yzYyUrRFikoAmgYi?=
 =?us-ascii?Q?CmgUrMCYxRnlUgLOMy6QG/4XDF3WQU9QFeOZwtmVMxmi3i6MbCMlxJQ72ROX?=
 =?us-ascii?Q?CpuC9Js/LPRM3psr8eiuQknEDfSjYhdKWP/l1iK6JGNNj8TZ2uU+N6s4B3Q0?=
 =?us-ascii?Q?2bOLpOqWA8QJie3idDnxY8xFAin8O1HWLZB/PIBRJVfHGhWDh7WkJkDwpcex?=
 =?us-ascii?Q?HdEGysMpC4TlHXBLtcWjWJ/A5zWz5OY7DxF4mWC4OP9zrMayefb/z5QcI/+H?=
 =?us-ascii?Q?wmdRGTcIEk5+sg5vL9AtpBqrWwknwOkQE8H+BTgIM4xH66mdXJ4bfa9fqdTp?=
 =?us-ascii?Q?0XoCiRXkNeNDzPd73ocZUp2i6lu24QQQJBxBr4G6Nxi8eMMGqb4wKlbwDC2v?=
 =?us-ascii?Q?Zla0VMwSxnZeIxb/Asr0L+ypXdEOfD4rJAqYjLAmNGItXQYnUn2ae6aSDm3e?=
 =?us-ascii?Q?7YuC7pWMUoodbaBas43YoyMsS56rColyc7A7Be8+MSAb9sQUiOwJH9cOzn1e?=
 =?us-ascii?Q?YsMqWreA/bMa/odzE71mPsFexeBsVXEkXnwFbuu9AzSb1gxA8r4gYCtDLkyW?=
 =?us-ascii?Q?n2Pq1DzSM9Tt4wQSZssQ2azoTP0jhcKe?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yubEexH2fiux2IAo1W8dwWZgjvGl1LhHM2g2QKarAM0nMo/+15v+/33EEIwT?=
 =?us-ascii?Q?d77n/KuZwyXNQHa/L9gvoscTqAIgROUG0mNm+GxCTMi9MfQr6mXsQnZCMn9D?=
 =?us-ascii?Q?3fMMJmfXmuAFk6m0eHKohhR5URkT0fCvmT9hztS47Y69lY2i0HhUhUjEmc8H?=
 =?us-ascii?Q?IfO/kB+7sHocJIYHFBIPi/DPN0phLVVUqajWf0pd8acc1gCUz3no3uvveBb2?=
 =?us-ascii?Q?YpcJR4DlVUlDYlBIzTKskRrlBjyPFAv4Z47yafcjqITKGlEJBAAoL3vCbkhG?=
 =?us-ascii?Q?ZT/n1Gykt8b+kcE4j2gMr6Hoevvw76xLplzszB+Iff/4MjfcbIw5ZbySIr70?=
 =?us-ascii?Q?WsxfsqTWV90zJNwnc80nvmqw2b12CLQ1hRpqVXP7deAnGcyxT1g9LCSkCDTh?=
 =?us-ascii?Q?o1n4O6P4Wak7XCV2zEdRZpEy7B/3eKS967fXRupisLwpiwacrL9EY91FIlwc?=
 =?us-ascii?Q?68JrFKY/HCDmYI0BEOFNnnv7apEsDkLbhbd8B6qxImJNMZedtS8Zv/P2E93A?=
 =?us-ascii?Q?01sbgIUb1qv5AAK0jXDPHX8qmyJbOHM73kdDrou2VLh3RoMg7NXunP0/wlFG?=
 =?us-ascii?Q?TdLlPOUdRNAuYV+I/VT5IHJEwVAbo9C91hXvsZfqljfrW3QZgnTaYoXAyLfy?=
 =?us-ascii?Q?HWNnSGAALSxryn1JxbdtoQ10Upuu4gPc/iiEXVj57ysjO0UQKgkVoZWdu1QW?=
 =?us-ascii?Q?/nVjjKS5PWqDK/N0Mxx5GgXz/r8OPVo8DDdgIy1VHMxI5Lzl5JjuYURNMMGv?=
 =?us-ascii?Q?MDdfw1qlTtZBBiUh2gx1BP5x2nURNf1QyoiOJ/IMGxDy2cRaf5XLmKGDrKxh?=
 =?us-ascii?Q?jDtXh2opN5V63O10Ip68N0VSNS/KZhbKNzd5/3jFtWGmJX7vpr6I4s3IN4ij?=
 =?us-ascii?Q?KIcwMEOZ59JOn5w9Opa5nQolDUBSK7ondsxJ5YmG1Bn/kiT+nkBhl8POoIOJ?=
 =?us-ascii?Q?+QjJRU8ge6XVJ8Xre3J+VXilW1AMgpaEcHjxpv+lHNMEIZBXV+4kqUjkdyfQ?=
 =?us-ascii?Q?F98HapMqfD9dRrhGsZkEN4RISEcIfEHr0eTjUwoNk/1M9wBbC029nUoL8Ex2?=
 =?us-ascii?Q?i4hsstlRtqhzVYog07UZzQWm1Sc0jzherklz8ti4471PSFd0+ELqfc1+DJCD?=
 =?us-ascii?Q?figizOEoAYkJER0xYLNIOfdz6eEocGUNKhu+RjJ99F8zguv7Z41u/mK6B7di?=
 =?us-ascii?Q?qHaQsxABDct4JszZs0JhGnsFk8EqhI1Ny8mut+h0cN4tXhXaWQh8nlCCt3XW?=
 =?us-ascii?Q?QYIdeZyL45LsxkX2D9MkJhGVDlTnMc972It0whUlrEqS87vRoCihu/qtpM78?=
 =?us-ascii?Q?Tr406/cZbqjRUxbiPgr80iUOr3tJEA2+kDsPhgem9uhP6jHn/qOYv5c0zZXc?=
 =?us-ascii?Q?1Ye1PZVzXzRNMt2mywPUIoWacwDauvyHx0Q43N+VUnDfA0IpcNRrvPKV7TQB?=
 =?us-ascii?Q?cLs7KpDxVGykXvNI2IS6o/7zHFXq3rBL3rnl9uwv2GsejelJzxTZgUG0KlTP?=
 =?us-ascii?Q?kqgdfUFtxk2KHpEG1QsxymJ2ZnhLHVx+tJJoLhtfD2/jwgTxiF69w9RmZIg7?=
 =?us-ascii?Q?3HHSv5/IpQZ6N3fJfbBqAmDdKxEnFXjHUAB7gnWksILZOtfzF/slfxvT61wW?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB570323E6B16BE42816BF635D84842DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be51bcd6-93d4-494d-5dd5-08dd83f30a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 12:16:43.3415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxAB8K0WbbWWGPCEigfRNDcQQtOw8AYpV9SO+D5Xoyw7NpuZgqlp/F2e0ai82MXhim8sMFJhTsO2N0Ne4vKjQ9kVWCjO9jJXVIRUL6uIYmXSr7+c4+Purg04vF67UjOX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-GUID: TvYe0XbdE39hUU4dcV0VD2vux3e3aIgH
X-Proofpoint-ORIG-GUID: TvYe0XbdE39hUU4dcV0VD2vux3e3aIgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfX2+KBl0SO69OL OdWSyBGJsoc5J8UiAmZYMSbuFOtIUnO0jRCa52ZY9ly9q4eB7UT5bGX+YvswXVRO+he2Fex/59A r9wzZ4VMYwOdDGwbcdobQV2ITofMw9pp2WpbFQu5GUuZB7TXoQiQkTjzgsnIANaQUgYHdn8vjqh
 LKM/Ty3Jl3rPt7tQAQj8JdTOHXp+6iU2Ebwpeef1iz394FXGLZsXRCzNE00TryUHOBsx43qcqh1 Ck8vOPj1/8/tR8K27xJw5z62bqzaCLNCur/bmW3BNFITqdXuH2W86QbfSIiYBrXY7ii0D7H5j/2 DZ5q5WlBABw5KUEOYLiEYUOaUzQw2U5S4t5ZB/ZADFtcMJtUoNhB4S+t+2zlxMVKZB0Veg9dD9b
 g2QBm7F/lbHU09UeYextquFzisn6lYZHi93AZMxlB1cugGXc48sCzb3HbgGlkAov95mLkdtC
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680b7d2f cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=KeDYc6Dln38G1XcNr3MA:9 a=CjuIK1q_8ugA:10 a=zsLhY_EA64D5ITxom9kA:9 a=S6RmsFmYiuDkmZNZ:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 12:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117126

--_000_DM8PR11MB570323E6B16BE42816BF635D84842DM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly Ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Thursday, April 24, 2025 20:54
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [oe-core][scarthgap][PATCH 1/3] perlcross: update 1.5.2 -> 1.=
6

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: dee97a3d3127eeba77bc6be05dea25f89aa734e5)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ile-check-the-file-if-patched-or-not.patch |  3 +-
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  9 ++--
 .../perl-cross/files/determinism.patch        | 41 +++++++++++--------
 .../{perlcross_1.5.2.bb =3D> perlcross_1.6.bb}  |  2 +-
 4 files changed, 29 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb =3D> perlcross=
_1.6.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the=
-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001=
-Makefile-check-the-file-if-patched-or-not.patch
index 4e9153ebf1..7efee733c6 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch
@@ -1,4 +1,4 @@
-From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001
+From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
@@ -9,7 +9,6 @@ one time.
 Upstream-Status: Inappropriate (OE-specific)

 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDF=
LAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/00=
01-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6c3f08c432..6d387fe66a 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch
@@ -1,4 +1,4 @@
-From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001
+From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/Makefile b/Makefile
-index 01644cd..be811a7 100644
+index 4b80079..c6d6042 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -180,7 +180,7 @@ endif
+@@ -191,7 +191,7 @@ endif

  ifeq ($(useshrplib),true)
  $(LIBPERL):
@@ -22,6 +22,3 @@ index 01644cd..be811a7 100644
  else
  $(LIBPERL):
        $(AR) cru $@ $(filter %$o,$^)
---
-2.17.1
-
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/met=
a/recipes-devtools/perl-cross/files/determinism.patch
index e9bf752bcb..ef11b12a35 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,7 @@
-Fixes to make the perl build reproducible:
+From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 5 Feb 2020 23:54:02 +0000
+Subject: [PATCH] Fixes to make the perl build reproducible:

 a) Remove the \n from configure_attr.sh since it gets quoted differently d=
epending on
    whether the shell is bash or dash which can cause the test result to be=
 incorrect.
@@ -8,7 +11,7 @@ b) Sort the order of the module lists from configure_mods.=
sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88

-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst
    there for good measure)
    This needs to go to upstream perl (not done)

@@ -20,12 +23,26 @@ RP 2020/2/7

 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+---
+ cnf/configure         | 2 +-
+ cnf/configure_mods.sh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)

-Index: perl-5.30.1/cnf/configure_mods.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.30.1.orig/cnf/configure_mods.sh
-+++ perl-5.30.1/cnf/configure_mods.sh
-@@ -82,7 +82,7 @@ extonlyif() {
+diff --git a/cnf/configure b/cnf/configure
+index 2f451c6..86bc865 100755
+--- a/cnf/configure
++++ b/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+
+ base=3D${0%/*}; test -z "$base" && base=3D.
+
+diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
+index d4ef5a7..8e88b48 100644
+--- a/cnf/configure_mods.sh
++++ b/cnf/configure_mods.sh
+@@ -108,7 +108,7 @@ extonlyif() {
  }

  definetrimspaces() {
@@ -34,13 +51,3 @@ Index: perl-5.30.1/cnf/configure_mods.sh
        define $1 "$v"
  }

-Index: perl-5.30.1/cnf/configure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.30.1.orig/cnf/configure
-+++ perl-5.30.1/cnf/configure
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
-
- base=3D${0%/*}; test -z "$base" && base=3D.
-
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.bb
index b41c182fad..295dd0cfc1 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"

-SRC_URI[perl-cross.sha256sum] =3D "584dc54c48dca25e032b676a15bef377c1fed9d=
e318b4fc140292a5dbf326e90"
+SRC_URI[perl-cross.sha256sum] =3D "5abf198ee50ce9e69eb68fede68c87f65241caa=
744e4203e97490fa59b45ed69"

 S =3D "${WORKDIR}/perl-cross-${PV}"

--
2.40.0

pLK@tY:ATbOf1"dW

--_000_DM8PR11MB570323E6B16BE42816BF635D84842DM8PR11MB5703namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kindly Ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, April 24, 2025 20:54<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [oe-core][scarthgap][PATCH 1/3] perlcross: update 1.5.=
2 -&gt; 1.6</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Alexander Kanavin &lt;alex@linutronix.de&gt;=
<br>
<br>
(From OE-Core rev: dee97a3d3127eeba77bc6be05dea25f89aa734e5)<br>
<br>
Signed-off-by: Alexander Kanavin &lt;alex@linutronix.de&gt;<br>
Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br=
>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;...ile-check-the-file-if-patched-or-not.patch |&nbsp; 3 +-<br>
&nbsp;...oss-add-LDFLAGS-when-linking-libperl.patch |&nbsp; 9 ++--<br>
&nbsp;.../perl-cross/files/determinism.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 41 +++++++++++--------<br>
&nbsp;.../{perlcross_1.5.2.bb =3D&gt; perlcross_1.6.bb}&nbsp; |&nbsp; 2 +-<=
br>
&nbsp;4 files changed, 29 insertions(+), 26 deletions(-)<br>
&nbsp;rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb =3D&gt; p=
erlcross_1.6.bb} (92%)<br>
<br>
diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the=
-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001=
-Makefile-check-the-file-if-patched-or-not.patch<br>
index 4e9153ebf1..7efee733c6 100644<br>
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch<br>
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001<br>
+From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001<br>
&nbsp;From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&nbsp;Date: Fri, 2 Jul 2021 09:08:21 +0000<br>
&nbsp;Subject: [PATCH] Makefile: check the file if patched or not<br>
@@ -9,7 +9,6 @@ one time.<br>
&nbsp;Upstream-Status: Inappropriate (OE-specific)<br>
<br>
&nbsp;Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
-<br>
&nbsp;---<br>
&nbsp; Makefile | 2 +-<br>
&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDF=
LAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/00=
01-perl-cross-add-LDFLAGS-when-linking-libperl.patch<br>
index 6c3f08c432..6d387fe66a 100644<br>
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch<br>
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch<br>
@@ -1,4 +1,4 @@<br>
-From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001<br>
+From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001<br>
&nbsp;From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&nbsp;Date: Tue, 27 Nov 2018 15:37:40 +0100<br>
&nbsp;Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl<br>
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin &lt;alex.kanavin@gmail=
.com&gt;<br>
&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
&nbsp;diff --git a/Makefile b/Makefile<br>
-index 01644cd..be811a7 100644<br>
+index 4b80079..c6d6042 100644<br>
&nbsp;--- a/Makefile<br>
&nbsp;+++ b/Makefile<br>
-@@ -180,7 +180,7 @@ endif<br>
+@@ -191,7 +191,7 @@ endif<br>
<br>
&nbsp; ifeq ($(useshrplib),true)<br>
&nbsp; $(LIBPERL):<br>
@@ -22,6 +22,3 @@ index 01644cd..be811a7 100644<br>
&nbsp; else<br>
&nbsp; $(LIBPERL):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(AR) cru $@ $(filter %$o,$^)<br=
>
---<br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/met=
a/recipes-devtools/perl-cross/files/determinism.patch<br>
index e9bf752bcb..ef11b12a35 100644<br>
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch<br>
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch<br>
@@ -1,4 +1,7 @@<br>
-Fixes to make the perl build reproducible:<br>
+From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001<br>
+From: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
+Date: Wed, 5 Feb 2020 23:54:02 +0000<br>
+Subject: [PATCH] Fixes to make the perl build reproducible:<br>
<br>
&nbsp;a) Remove the \n from configure_attr.sh since it gets quoted differen=
tly depending on<br>
&nbsp;&nbsp;&nbsp; whether the shell is bash or dash which can cause the te=
st result to be incorrect.<br>
@@ -8,7 +11,7 @@ b) Sort the order of the module lists from configure_mods.=
sh since otherwise<br>
&nbsp;&nbsp;&nbsp; the result isn't the same leading to makefile difference=
s.<br>
&nbsp;&nbsp;&nbsp; Reported upstream: <a href=3D"https://github.com/arsv/pe=
rl-cross/issues/88">https://github.com/arsv/perl-cross/issues/88</a><br>
<br>
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst<br>
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst<br>
&nbsp;&nbsp;&nbsp; there for good measure)<br>
&nbsp;&nbsp;&nbsp; This needs to go to upstream perl (not done)<br>
<br>
@@ -20,12 +23,26 @@ RP 2020/2/7<br>
<br>
&nbsp;Upstream-Status: Pending [75% submitted]<br>
&nbsp;Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org<=
br>
+---<br>
+ cnf/configure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
+ cnf/configure_mods.sh | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
-Index: perl-5.30.1/cnf/configure_mods.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- perl-5.30.1.orig/cnf/configure_mods.sh<br>
-+++ perl-5.30.1/cnf/configure_mods.sh<br>
-@@ -82,7 +82,7 @@ extonlyif() {<br>
+diff --git a/cnf/configure b/cnf/configure<br>
+index 2f451c6..86bc865 100755<br>
+--- a/cnf/configure<br>
++++ b/cnf/configure<br>
+@@ -1,4 +1,4 @@<br>
+-#!/bin/sh<br>
++#!/bin/bash<br>
+<br>
+ base=3D${0%/*}; test -z &quot;$base&quot; &amp;&amp; base=3D.<br>
+<br>
+diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh<br>
+index d4ef5a7..8e88b48 100644<br>
+--- a/cnf/configure_mods.sh<br>
++++ b/cnf/configure_mods.sh<br>
+@@ -108,7 +108,7 @@ extonlyif() {<br>
&nbsp; }<br>
<br>
&nbsp; definetrimspaces() {<br>
@@ -34,13 +51,3 @@ Index: perl-5.30.1/cnf/configure_mods.sh<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; define $1 &quot;$v&quot;<br>
&nbsp; }<br>
<br>
-Index: perl-5.30.1/cnf/configure<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- perl-5.30.1.orig/cnf/configure<br>
-+++ perl-5.30.1/cnf/configure<br>
-@@ -1,4 +1,4 @@<br>
--#!/bin/sh<br>
-+#!/bin/bash<br>
-<br>
- base=3D${0%/*}; test -z &quot;$base&quot; &amp;&amp; base=3D.<br>
-<br>
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.bb<br>
similarity index 92%<br>
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb<br>
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.bb<br>
index b41c182fad..295dd0cfc1 100644<br>
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb<br>
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/perl-=
cross-${PV}.tar.gz;name=3Dperl-c<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/arsv/perl-cro=
ss/releases/">https://github.com/arsv/perl-cross/releases/</a>&quot;<br>
<br>
-SRC_URI[perl-cross.sha256sum] =3D &quot;584dc54c48dca25e032b676a15bef377c1=
fed9de318b4fc140292a5dbf326e90&quot;<br>
+SRC_URI[perl-cross.sha256sum] =3D &quot;5abf198ee50ce9e69eb68fede68c87f652=
41caa744e4203e97490fa59b45ed69&quot;<br>
<br>
&nbsp;S =3D &quot;${WORKDIR}/perl-cross-${PV}&quot;<br>
<br>
--<br>
2.40.0<br>
<br>
pLK@tY:ATbOf1&quot;dW<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB570323E6B16BE42816BF635D84842DM8PR11MB5703namp_--

