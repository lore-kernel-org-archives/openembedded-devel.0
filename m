Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421BCC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:17:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5172.1745583421385288061
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P4o3vp027570
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:17:01 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhauqqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 05:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TprPwpGWBi3C8eY415BOM81B1XKx1uU8G2zijozfKtxFRyczuiTH8DLbCQe2ujQfm0elc2uq39V/YPsHK5xqK0IkkeuovKma4XlACeJegUbgQSVF76WQ/fMRGwN+45ZXRcsfWlCiO5WGK4VrsMrQbwzyQ2UwTfJDabgOWBbCXi7bCx8I0dZItW3wujut+JBoyhw5Xge17941skbYHrSGWVLi/Kk8RblT+lEPSLon2831a6NeaZtp2kxCtLqqKbHxmDDt1MPua+w5ZgmYwAEfzIBppQ6/U7+vOQjsTZbcBgGfAYzKsGsa/yrhi2WIOUgIidqFPaizPU9gcv2yWxRz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImwAsJJlldjYbaAyg/fqn6lcC2BJznVVsPMpQ0naPCU=;
 b=J3+MZVkzHooNateQ6r6sVY+4F9+1GCZyEJEtmk/ZqtY4Pqp1RNS0XWmj1Wde8LKkvf5Rq18igNWHFLWZ6gLZ38ZuOi1+Xb+qNpSQamTJZDdwFW6bdkrRJSGSSqcJYoeDoM6PeguyattsL9KfqMmnV38HiDeooKYex4xnuu47eCZyW46srpL6wjlHS2mvsPZ7dcSm3sCzR1XRDd/UIR+j5fa1Epltx1f4d0Wxe9+oJLNzUWTfvrz7cWAgS4RyPF4KsIHuESlKneFNf2VpbY0hFfbifpHeNddH8BRGPfI/9MDKkvtAFJhoFD1uxNwhdY8TvVthuMwuP5UUDQ39X+BPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 12:16:59 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 12:16:59 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe] [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -> 1.6.2
Thread-Topic: [oe] [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -> 1.6.2
Thread-Index: AQHbtS0n4mqOncksf0eDx/T5TYEOd7O0TX8f
Date: Fri, 25 Apr 2025 12:16:59 +0000
Message-ID: 
 <DM8PR11MB57038E2152456A1525471F6184842@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20250424152453.2431217-1-archana.polampalli@windriver.com>
 <18394A8D008B9476.15875@lists.openembedded.org>
In-Reply-To: <18394A8D008B9476.15875@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|MW5PR11MB5931:EE_
x-ms-office365-filtering-correlation-id: f649893e-c1ba-43c7-4a15-08dd83f313e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?U+SLjawDaRicEs81ZToDKVCSnCAI8sqZjNp3lLEETr/8+qKT0NYTPpsu9q2t?=
 =?us-ascii?Q?1S8Ayud5wqPme79yBlLJeVt8y6ophqf2o3DeJOQyc5llwunSkP1wtYyNk+oY?=
 =?us-ascii?Q?426J/ga2E2Uxna/exlx+ZSV1lljxXFgNeNoorRqGSOZ9j5a+ZWYWeOZu+Nrr?=
 =?us-ascii?Q?6YuYCEtDwAh8+0AF4gobrzl7ftHmSs2aCt6Sa7SIMw5btaX7uEBlX0xBwrze?=
 =?us-ascii?Q?DCfEJMMUmpnHsefsWlp+k0Ulrdgktl2viuPgTXONK2LR4j5QM9dcUw1TsxDg?=
 =?us-ascii?Q?cHlmgPC1pLvIWeWWu1A3d0blQp1UUgWkbrq5OtgbvMrVV0H3xydaN6hFWnDp?=
 =?us-ascii?Q?pW015kUXf9Bpuf8ubVUrq5BzQoUlYzLJHlA2wS68cRJ2wdbwZ2dprD5/32UY?=
 =?us-ascii?Q?PTg2/KdKlcPt0ysDXW7ewVEZz27TX/7CpdaaL7yswZBSzMeUrA5watMxPfnc?=
 =?us-ascii?Q?DmqXgXFbO9tIoQrKOwmzbnbFkTe0IzJBkhFzegwVnaW9Z09t7gTIey7L4jG4?=
 =?us-ascii?Q?yRWtjjfSU188d6Li0/9na53AKKFL6gH+x+uR7ioB6LIvCUCLvKheEz68yY1T?=
 =?us-ascii?Q?mQ8jZHbxJbUqeAal9QdhPUFnejAcw5+Rjw2xFMvW6pF+LEKaTTTsH7vEMzlQ?=
 =?us-ascii?Q?ioV8ujDH3Qo035gc7dBTV7qFb/Unc85JuofQTkHiChfnRTi33wlkWIp6Ci6X?=
 =?us-ascii?Q?FMsFytBhhFWt2VUxj0XWN5tRBtMuXI1KQnuVaGBOT1GB1iWCoi98tvzSHIi0?=
 =?us-ascii?Q?nSAuANEtmKTz1uLBQ25L9Yh2l97RY57yvELF0iEE53jWQmmDoVo5m84gWcCh?=
 =?us-ascii?Q?CSlv0K3k5xu0pGu3fVJ8ZqNZj2GQtItz3H+PijpDgP4TaMT8KhzfckqhHFvS?=
 =?us-ascii?Q?9TN2VARn6o5GTvaBef1gadaBbwwiIOgMAb5gj9iVNIljPZTQMJypeqhJhQou?=
 =?us-ascii?Q?XQ+xG7dAUyerWsv+UWhT2I2nlR6V4bAAXxwZzw5t/LrytIHJCXaf29KnszY8?=
 =?us-ascii?Q?iTpe3tq8MkFNiGF/FsMC+nzPIsmDq9C3Ij7LrMCOZYFcHvNWnilHYrA5+PAs?=
 =?us-ascii?Q?MkXXdpg5PDPX83IRiTbEFUipC8Fx+AYzDNyjmzdydQXWcc2PPP7rbwODST1h?=
 =?us-ascii?Q?kGlqfjdkiS1PiN2ncimyFqJdj0a5bWdeupDlXSIqlXj+QKLRAW7QZOeONgjP?=
 =?us-ascii?Q?cjkqA2xTwZSUYeGoaJE3EkqV5ibliF6FdzDWvTa+AQJWVeNbXUrHKT+bvCAn?=
 =?us-ascii?Q?aYfsErnEPjCGN+EE8vyYE+sFa80xXyqWWTw2ioBtcasRUIg6hCsBcdz75wqo?=
 =?us-ascii?Q?5jbU93NDhmCGP3qe+mUpJQBjOf9ObnNVpq0Q/63sBRAijDaKz8eoRc916wtw?=
 =?us-ascii?Q?GbPTzTaMdaCh85gDdky4h1aaruEIFQPlaTI6nQabZkTqv6Bt27TDWVWtCqrv?=
 =?us-ascii?Q?2LA0ziRPg2pw8MBGIny/UakkxWmkcB/4wM0H1jTQyRsg5tWNS8X8+OWfeCjf?=
 =?us-ascii?Q?YxbtWUHgngLNJB0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Lmj+vnytUsXev2wREA36p4dzoist/q/qHECE7wuxRpmgRdcnJ1dQedKp15CD?=
 =?us-ascii?Q?boADoL9AlptUwf3IP8euKal/P5nNHiLxi9N35cArVz5NS5EzSyV8ZecaXF4U?=
 =?us-ascii?Q?IXCiy+ItTQsvFNaaaSaqcxiFMAuHqXQbOYXOFx4F89MGWzGtIc+kXez8Y8mw?=
 =?us-ascii?Q?ps+jjumDI6yHGmjmS6jY+qB+9nNwffP/3xsctlWHMwBrnMRbhTJutS8mnghD?=
 =?us-ascii?Q?pJrnZ8khyQrBYiFf84R4ka5PeTQJWpCAToyovnmQltNUgaLk0DuwRGL/FP6/?=
 =?us-ascii?Q?mr5Xhyrwpd63k8kYV9fh61YhldbI1IAZKHK9quWX3ZlTMuqs5ZZJl06gi/HU?=
 =?us-ascii?Q?ZROTI830rjjEJY1KZM6kOVcb9fPrKULgwkEEZWO0Ps+/opEj40OA85piGltc?=
 =?us-ascii?Q?n7YmJ5Y95wm1MQB5lORNBM3wzYTTKnmw6bGLXjHw4iSV1azhW33esmXKHRT+?=
 =?us-ascii?Q?ZMmdUfQ+IDLKHvv2MlzRESFEzpN7Ri+HxKXHq2sOKsWgBWvYPfcM2eSgKOho?=
 =?us-ascii?Q?Q5zG32kZh57b1nEI7XRsATRD3ftVNsvit2iIBHacgH1+bDn1jkW/x+mNU4pR?=
 =?us-ascii?Q?GK3kaK6zNSOI7edBs8oa24zNyq8GULe55f6/evXx9X5Nz1bAwAnu42LUitNI?=
 =?us-ascii?Q?vP2gwF1m7Rsf46tJL1fKK9ZQ9JrIs0aIeyNhh0O1Zh5RKVb7R1IdP9uIk/4T?=
 =?us-ascii?Q?bKwZqcoznwG9iyzBmAPD4lHhEyRz9umSLXcn2NLcf5Ma7cOO+OUDCapL5tjZ?=
 =?us-ascii?Q?NZRQqD5ygbEvlovzVyvLYT+GNi9JAFbuBd1tWsGm8AYwcc7/BEgSYwqrDMPl?=
 =?us-ascii?Q?EMGZkbpr3+UAgfBQu8h0flvZJPH9UHSowbu77Gq0fRh69O3/ty1fGSTOA8UP?=
 =?us-ascii?Q?EeyRbeuUdyb2HRiGY66qx64lJju9ieh/sX7+NiCaxgt++nylLqdhDVtFpTzx?=
 =?us-ascii?Q?sbFWBLreOSfr+yngZzALRM19zk8t4had0aJdrrfnKZjRbV5PLdfb+wJVr3Wy?=
 =?us-ascii?Q?rG5B+aOGFfugU+SjPd3j4fehZsSDJj/CAqrDUKLdzLIibyWjAbWUGQYiJ5Im?=
 =?us-ascii?Q?NvD8uY2uIhWlf+avjmlvMD/EXSjTk/2rWzC8AUqOcqwNTfuuVv0vktJ4kl0L?=
 =?us-ascii?Q?ByTunzJiAGSPoFmLuC7vvZsfd0h3jbKe2EJTTa7MRDcMGmxjZoiNt9eOaMoa?=
 =?us-ascii?Q?ugpTwStyaLRvwRSFYVcfBvtFRbmKYoUHqCzEucErFA8uAomTnO439I6rlasq?=
 =?us-ascii?Q?TrL0hNinyktp4jDVijdJl3FimvVQQF3UPuo/Y9R/SuwjTfQ2eU5LuVsCOikG?=
 =?us-ascii?Q?fJkjWpdJY7iBdPb0Y+9+52XrPMuhZ1wzqKj8YfWtAt5YmdKCRJKN7PEscUpQ?=
 =?us-ascii?Q?okB8BBNIXILxnrFVCLxv/TERVgVTQl/sHNsIn6hjUcI5lXBzDlgqZekZiKht?=
 =?us-ascii?Q?JXv8ZmsPwY5QDfGDP5pXeEVZbw7flA0I+1UxuyWSFAvPZnZ+bOu5h59BPC3I?=
 =?us-ascii?Q?tbYjFD32+q7+f6tM7h4q+9crGYRg0xP8o+ukJvzcT98f9uRE04/5nnlbaA+3?=
 =?us-ascii?Q?c2hV07xiGYY32K6ZxUfTJAatxHH0nCC6b6EZdMD/v3hd4TiZCzreuWkbB4B9?=
 =?us-ascii?Q?5Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB57038E2152456A1525471F6184842DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f649893e-c1ba-43c7-4a15-08dd83f313e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 12:16:59.0544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xh1aOhR9rNN909j+MiNGOcK9fidDpVnH4PJnW20B9OeTxUX5ER+qqDn7FMxdywS0Vk/+fDs75xFB3/1Fo9eQSeesatguWW+YjNAKfe7H+KS3cI/ICO0e3kwF0lD66pIO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
X-Proofpoint-GUID: wEeFUhEgz7Lzb3vr4A-358OTJePYCpDr
X-Proofpoint-ORIG-GUID: wEeFUhEgz7Lzb3vr4A-358OTJePYCpDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfX2FaPjfuY0ezF JypQWR5ogJokxvZaAEVewsGu/3YnORAUxc/psLUcd+QfilgCe7PEpWuHxqwRuFjfFMRLZD69Vg7 qy/W8hIglwEtgbTbUSnQfOkuw5yUl3ICHbXIHKm1MqEpp6iW0djptXV2jLm7A46mvZpBj3Hzt87
 1fzL/2bviI2sC7lNb+mbMA/p0CfNzoyJHOcghYx5h8+YvCqSRHILEjRIpmMru0u69rRXTvns3OE mnCiG+BW41jXL2TztJOZ1rKs1smnTmkSWol2M604I88D/s0arpUJhInMA9dvjsQrOw9+SSiazCj r+AR6ogtTLi4MIljBuWpwuQsto9DCK64LO5oHfH5Yi/kXqEkcqAd6Y1f09bTL2nvhHfw0XAfrBY
 qMfQDoPzXIhNHA202GGAYZQs1on/BJ+XxVjFa96bBqIBZhyA3qehLd5/6YHx1TC+LdwNx+9F
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680b7d3c cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=YiLq546vFVBZOcSZ4AIA:9 a=CjuIK1q_8ugA:10 a=fEGJki5vP9p_wmuK:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
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
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 12:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117127

--_000_DM8PR11MB57038E2152456A1525471F6184842DM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Thursday, April 24, 2025 20:54
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -> 1.6.2

From: Archana Polampalli <archana.polampalli@windriver.com>

https://github.com/arsv/perl-cross/releases/tag/1.6.2

Provide support for Perl 5.38.4

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../perl-cross/{perlcross_1.6.bb =3D> perlcross_1.6.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb =3D> perlcross_1=
.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recip=
es-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 295dd0cfc1..e4bd90c572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"

-SRC_URI[perl-cross.sha256sum] =3D "5abf198ee50ce9e69eb68fede68c87f65241caa=
744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] =3D "131f7496152ee32067dbac2bc9b44b2f582fc77=
8140e545701b3b2faee782f1d"

 S =3D "${WORKDIR}/perl-cross-${PV}"

--
2.40.0

pLK@tY:ATbOf1"dW

--_000_DM8PR11MB57038E2152456A1525471F6184842DM8PR11MB5703namp_
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
Kindly ignore this patch</div>
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
<b>Subject:</b> [oe] [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -&gt;=
 1.6.2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
<a href=3D"https://github.com/arsv/perl-cross/releases/tag/1.6.2">https://g=
ithub.com/arsv/perl-cross/releases/tag/1.6.2</a><br>
<br>
Provide support for Perl 5.38.4<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../perl-cross/{perlcross_1.6.bb =3D&gt; perlcross_1.6.2.bb}&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb =3D&gt; per=
lcross_1.6.2.bb} (92%)<br>
<br>
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recip=
es-devtools/perl-cross/perlcross_1.6.2.bb<br>
similarity index 92%<br>
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb<br>
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb<br>
index 295dd0cfc1..e4bd90c572 100644<br>
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb<br>
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${PV}/perl-=
cross-${PV}.tar.gz;name=3Dperl-c<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/arsv/perl-cro=
ss/releases/">https://github.com/arsv/perl-cross/releases/</a>&quot;<br>
<br>
-SRC_URI[perl-cross.sha256sum] =3D &quot;5abf198ee50ce9e69eb68fede68c87f652=
41caa744e4203e97490fa59b45ed69&quot;<br>
+SRC_URI[perl-cross.sha256sum] =3D &quot;131f7496152ee32067dbac2bc9b44b2f58=
2fc778140e545701b3b2faee782f1d&quot;<br>
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

--_000_DM8PR11MB57038E2152456A1525471F6184842DM8PR11MB5703namp_--

