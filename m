Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB2FCD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 11:36:12 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.116])
 by mx.groups.io with SMTP id smtpd.web10.19074.1695382569169750578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 04:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@einfochips.com header.s=selector1 header.b=cD/oDGVX;
 spf=pass (domain: einfochips.com, ip: 40.107.237.116, mailfrom: sanjay.chitroda@einfochips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLI7MMl2H/yNSorQm3xr9+N/nmKenR6m48Tn+YAX6B1/n47XhFAwtayYITHv1a2fIxLJwvuNvRNgtFwvWD0kUwktlmPEPsJT1YHMDiZgdyAe5KGJFce74MzdvjPuuE20QPRFUapbYwiswhlb8dIxuGXQRl0tcuCjEnSY/AePVNQ/QqcYR+ipRjTtzgc0aIlAXtNeJELfe2fLH0mBsQQShGLQEUWP6nUS/BnZDOioKCwmu+ziKS92F8H7i8XjYeKvuHSHQm0ytwbLyCF72osLQKp4gOtK32UpASW9cSB8p584eDzgkha6VxhVqaxGbEIpuDEdorRqdVo1D45AAn8TpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnAONth/+Wc/h3M4M/1CrVIErf0qfJGc4Ci2Nz2K2UE=;
 b=V48d7Ut/qOYDDnPScOUq9CcOepOhbJ0O0NbpGmNO7SZVpTZmrjal3P7aQGyPwteq0Jngyi1J1nLwLlhICz7vBZP6c/U9DrPJ4/SO6JncYScsgoqWFvjbzMHPDW8e3AIa1LRIizEqE18iZwyhdVt/SSmIYKLYnS0JTtJRiWlSJnL0KK6yQgdxrPlFj4TOVPv7jCz/X4rrUYsSseih0r7BdAWdWK5bzZcUaTtinomy2/AFfsGA/Q2yydELywquwtFhirZeWNLJtug3f50XqDWPFSJMvOVQzlQeC7VWc5CBVdX8vBk2b8IZal0PQACII/6dZzLsazN7jVw021AQE509ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnAONth/+Wc/h3M4M/1CrVIErf0qfJGc4Ci2Nz2K2UE=;
 b=cD/oDGVXu1qEdMUuVSTQ1zrooekI/rKfQMI8hnVAYN05yskyR4Xx3xtw9v+AAp1jQWMiodwST6/FK6bROundEvgIGJ6jusKWIC+u0tVzFSys/ENk4YwU9tbsXhgFRxgPHS2XZ6FMXYSjunNxAvGne/U2GFjy05pZRVqDFPLvAMs=
Received: from SA3PR04MB8628.namprd04.prod.outlook.com (2603:10b6:806:2f8::16)
 by SA0PR04MB7404.namprd04.prod.outlook.com (2603:10b6:806:e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 11:36:06 +0000
Received: from SA3PR04MB8628.namprd04.prod.outlook.com
 ([fe80::5508:b63f:6d7a:c0e6]) by SA3PR04MB8628.namprd04.prod.outlook.com
 ([fe80::5508:b63f:6d7a:c0e6%7]) with mapi id 15.20.6838.010; Fri, 22 Sep 2023
 11:36:05 +0000
From: SANJAYKUMAR CHITRODA <sanjay.chitroda@einfochips.com>
To: SANJAYKUMAR CHITRODA <SANJAY.CHITRODA@einfochips.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: RE: [External] [oe] [meta-oe][PATCH] netkit-telnet: Fix
 CVE-2022-39028
Thread-Topic: [External] [oe] [meta-oe][PATCH] netkit-telnet: Fix
 CVE-2022-39028
Thread-Index: AQHZ7UZoNMvq5PFCgUafZ7zZhpzjILAmtYXg
Date: Fri, 22 Sep 2023 11:35:38 +0000
Deferred-Delivery: Fri, 22 Sep 2023 11:34:47 +0000
Message-ID: 
 <SA3PR04MB8628E7A365794AB3ED2387E391FFA@SA3PR04MB8628.namprd04.prod.outlook.com>
References: <1787347413C68877.23138@lists.openembedded.org>
In-Reply-To: <1787347413C68877.23138@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=f0a3dabe-37d3-4f1f-99c3-557c105eed75;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2023-09-22T11:29:22Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8628:EE_|SA0PR04MB7404:EE_
x-ms-office365-filtering-correlation-id: 5cc5b809-b64c-4119-2930-08dbbb601b9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vuU7gFRL88b6DuMSmNw48PQtRfz/hjWBMqoOsar5p6OeK8yQVe+QgO2RIRRC/XOHI834T117UnCtypBA6s9+Gas6vymvSMeYNQDiBlkJinIqxIO+asRUABJ7gxgy6GJ2HRiW9PMyyqN2om6RlXfrIFFhkBALRWSNFmoNatuOeiLAyvfT3zI88CQm9ohbfINtRhzPcdsVo3YlQ7+SHP257/OkNypTrIxgBs7QbwOhZpoUxaHAFSQa278EZAagT6Z95kUzXMApjl60O+VdQRlpD+4AXcYQvf7HQNiTZL+nsRXTGOJREPfHV6bRjNFYAo9W+px0dfydVGnO2qn49D7IBsu7StPq+dKQmeLBqpZNiL3LQKYK/4Q6doOu5odwGOV3unBYWZq6mOoTMVPw6/Llsrm54moYxO7N+zZMSbMIpUjiH/GM2mV1/UqIs+J3ihhBAheslJbjOdXek0h21jNv+jc9NTSD4q6EJuMnlGWAZPUTBdtqHdy1roUm0TCw4Z+iCpuOp9Qy2/i6UOtbG4p735ngtUF4VJWpbLyWirKaGGIGTY3qBZZbF7vKvykGSew00su7yZnI4VMLLJz4OKvjU1Tk4/H9HViQOeVi/GPxqqo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8628.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(186009)(451199024)(1800799009)(66899024)(38100700002)(38070700005)(6506007)(7696005)(6666004)(71200400001)(55016003)(82950400001)(82960400001)(86362001)(33656002)(8676002)(966005)(9686003)(478600001)(83380400001)(2906002)(52536014)(45080400002)(110136005)(316002)(5660300002)(64756008)(8936002)(76116006)(41300700001)(122000001)(66446008)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gl/QLJUFT1H+KxMhYYa6XP3aPWtBeaADDhlFYO/7igmGKsix3J1bS6mUVtc9?=
 =?us-ascii?Q?ZshVWItK2R/78J77lFB45kDRBEVY6eC6yBXNDoRgj/m00/H0O7z5lXXiB1XW?=
 =?us-ascii?Q?WpPlQ4PIq6DgX/f/74opiWsQqMmacqkpllDHPppeeBJKOn1eMmwXykQYEnSa?=
 =?us-ascii?Q?ZXKES0eA88EE9v2dTLjAXtLfyeVipnlyfXm3uTHQqN8NwBdpGb6WlmDrL17C?=
 =?us-ascii?Q?rJliEWqF7Rb7ApUdNsz6GF6InEy1SzF9xJXj/6PxBZIV3OGAxj+pSL2MuhE/?=
 =?us-ascii?Q?nXuCkTXHOw1KsVPSrb16og6QIzxkfHmd11GvpkrnOeWw3eFYqm6dzzr5AVNJ?=
 =?us-ascii?Q?bEnmBrYHeMGjzvPUU8bDncxiqMp4XLfa+C/+k3vmvrIJuxs7QLH7ePWRc2Dw?=
 =?us-ascii?Q?hqh+XvMsbiXQMIJPfnAhNopfVLHk91lj6aIUEirj4ydmIxDE3mFe7sPloG4Q?=
 =?us-ascii?Q?QUOZVbK58kaFvIPoe1D19UKVIOgr3vN/vH0wkaOgk1gbA8fMiP7IKC+duYTX?=
 =?us-ascii?Q?mflBg8tWhXy6mk9ruCyQ0sjoOELqGcxUkCoHGtX1G+jvw5ChWSoK5UtRUG9p?=
 =?us-ascii?Q?/FYLaKx8l4ob7elztQ/9D5CTVDpogzFA7ONTCszOWbJJfHGyVa7OskMApEui?=
 =?us-ascii?Q?I2LfodOLp+zv62Qe+Ir2r7dwDYCR1Lawq6jL3w3s/5li5rP2mx5tQfApC2s0?=
 =?us-ascii?Q?eCjdCT6O5vr2MZvG1VOEqv77OXzIiAkXCfiW7ZvNymqOcHfqAfOyKJl8E4ec?=
 =?us-ascii?Q?UZl44rcqFMazKRDO56DvVLmelc5Ewgn3D554oVf6tHFhthRHDKqL9zX449AO?=
 =?us-ascii?Q?T0c5Iv7KoUBPiuC0c1qXIIsEdINn3OA2q/FYLiQW+bIB9xnVams27H7fzbeh?=
 =?us-ascii?Q?BQ3UwyQK78Q9Tsj2s7sQZEQaj2r5KxoLLRMPXVJtYYROxKX5SN6G46a3ORNK?=
 =?us-ascii?Q?2I2lVH2IkPmSPcFhbAnAqV4L9/qeyjSj/c3FrFYw+qqp/p5dk1yvGGKC2Vwe?=
 =?us-ascii?Q?aPRc/P10SkRliHaTjZfLvLyHCPBufQ1E0jAtog6zjRZEJZInKLyG9lCWqGxc?=
 =?us-ascii?Q?L8bYQ4Y/qtiFkH08jgZjD4rHQsaJ5RF87VVAWU0E3OrNGMd4swEWD0+F3k08?=
 =?us-ascii?Q?PnwvKxNrXpKcwb1K+b81xBBZvJulgGar6GJjdNlb7xBFhF7mWElqq/ypq8E+?=
 =?us-ascii?Q?Obl61/aDOEilchQ+01d+gCAez3s2gGhOyYTmyrnRETq7qGqBcgbby4Wc37eZ?=
 =?us-ascii?Q?VTeScZlFNSaJi94ekYfNe1OCYIfc9obluPmuSYonSsldNmAkI7QqpcAc98j0?=
 =?us-ascii?Q?fchBw1TD4mMoWIuvMwKfi61hN73ugONRy6NQRehB2jnusB8+/dIY9/ILEmOG?=
 =?us-ascii?Q?NvbrZEEDmIUf4ZakaSmVHRuEoqfCMRACyA5db7+i7LtNmVe4SojVUB0d6oe3?=
 =?us-ascii?Q?gJ2TFd78ClukHeyyEkSLrFgA29f9RqYC4DM0hvrKgY62sgzQqRcyBYQUJuuR?=
 =?us-ascii?Q?B1yC29ClWF+/7NRWBXjDapZ3qC5XzG2Ul5uYBTmxkN4OtDrwTipSaABh/zFn?=
 =?us-ascii?Q?OJjrUixbZwP0OqPTNTlJbevdZBCj0RwEsVY9UhD+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8628.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc5b809-b64c-4119-2930-08dbbb601b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 11:36:05.6812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zy8873dt6ZRa724YKVGdR8WPKL1VkntdCnzuIslHqB1n9RiV9OgW4KLz6n/wdy38uXuowXBj2wqzhMuQX1foIscAlvfGZI905FRR6Q+glOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7404
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 11:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105057

Hi Richard and Steve,

This CVE is not detected with CVE report tools as there is discrepancy in N=
VD database.
CVE is vulnerable to netkit-telnet package but not updated on https://nvd.n=
ist.gov/vuln/detail/CVE-2022-39028.

Additionally, all stable branches have same version 0.17 of netkit-telnet p=
ackage.
Once these changes got approve and merge on master branch
I would request you to cherry-pick same on all stable branches.

Thanks,
Sanjay

>-----Original Message-----
>From: openembedded-devel@lists.openembedded.org <openembedded-
>devel@lists.openembedded.org> On Behalf Of SANJAYKUMAR CHITRODA via
>lists.openembedded.org
>Sent: Friday, September 22, 2023 4:47 PM
>To: openembedded-devel@lists.openembedded.org
>Cc: SANJAYKUMAR CHITRODA <sanjay.chitroda@einfochips.com>
>Subject: [External] [oe] [meta-oe][PATCH] netkit-telnet: Fix CVE-2022-3902=
8
>
>
>CAUTION: This email originated from outside of the organization. This mess=
age
>might not be safe, use caution in opening it. If in doubt, do not open the
>attachment nor links in the message.
>
>
>From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
>
>References:
>https://nvd.nis/
>t.gov%2Fvuln%2Fdetail%2FCVE-2022-
>39028&data=3D05%7C01%7CSANJAY.CHITRODA%40einfochips.com%7C158a1105
>621a4754519e08dbbb5d8800%7C0beb0c359cbb4feb99e5589e415c7944%7C1
>%7C0%7C638309782639739868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
>wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
>%7C%7C&sdata=3Dz%2F3WhzV2TN%2FL%2Bkgox4zTaZw6VaBcUewEeoM9LES8sG
>U%3D&reserved=3D0
>https://securit/
>y-tracker.debian.org%2Ftracker%2FCVE-2022-
>39028&data=3D05%7C01%7CSANJAY.CHITRODA%40einfochips.com%7C158a1105
>621a4754519e08dbbb5d8800%7C0beb0c359cbb4feb99e5589e415c7944%7C1
>%7C0%7C638309782639739868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
>wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
>%7C%7C&sdata=3Dv3Wyl2XT%2FfOEDO%2F5JMZP6baB4%2BwN%2BWbNtkfQAr
>p1eoc%3D&reserved=3D0
>
>Upstream Patch:
>https://cgit.fre/
>ebsd.org%2Fsrc%2Fcommit%2F%3Fid%3D6914ffef4e23&data=3D05%7C01%7CSA
>NJAY.CHITRODA%40einfochips.com%7C158a1105621a4754519e08dbbb5d8800
>%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C63830978263973986
>8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DgjdgME8y%2
>FIw8ZApproq4EkHP3FM3n%2Fxk8oFKWUfv5Mk%3D&reserved=3D0
>
>- Patch is adopted from FreeBSD, as same vulnerability of
>  telnetd is applicable to FreeBSD and netkit-telnet packages.
>
>Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
>---
> .../netkit-telnet/files/CVE-2022-39028.patch  | 53 +++++++++++++++++++
> .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
> 2 files changed, 54 insertions(+)
> create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE=
-
>2022-39028.patch
>
>diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-
>39028.patch b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-
>39028.patch
>new file mode 100644
>index 000000000..e8c3f1d84
>--- /dev/null
>+++ b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.
>+++ patch
>@@ -0,0 +1,53 @@
>+From 4133a888aa256312186962ab70d4a36eed5920c1 Mon Sep 17 00:00:00
>2001
>+From: Brooks Davis <brooks@FreeBSD.org>
>+Date: Mon, 26 Sep 2022 18:56:51 +0100
>+Subject: [PATCH] telnetd: fix two-byte input crash
>+
>+Move initialization of the slc table earlier so it doesn't get accessed
>+before that happens.
>+
>+For details on the issue, see:
>+https://pierr/
>+ekim.github.io%2Fblog%2F2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-ne
>+tkit-telnetd-inetutils-telnetd-kerberos-telnetd.html&data=3D05%7C01%7CSAN
>+JAY.CHITRODA%40einfochips.com%7C158a1105621a4754519e08dbbb5d8800
>%7C0beb
>+0c359cbb4feb99e5589e415c7944%7C1%7C0%7C638309782639739868%7CUn
>known%7CT
>+WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ
>XVCI6
>+Mn0%3D%7C3000%7C%7C%7C&sdata=3DfBoVN%2B9yM%2B4DrREUJjjIuNQwP
>Yle3PUIHXQ2%2
>+BoOsXeE%3D&reserved=3D0
>+
>+Reviewed by:   cy
>+Obtained from: NetBSD via cy
>+Differential Revision:
>+https://revie/
>+ws.freebsd.org%2FD36680&data=3D05%7C01%7CSANJAY.CHITRODA%40einfochi
>ps.com
>+%7C158a1105621a4754519e08dbbb5d8800%7C0beb0c359cbb4feb99e5589e
>415c7944%
>+7C1%7C0%7C638309782639739868%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
>iMC4wLjAwMD
>+AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C
>&sdata=3D
>+aq1Jl3S0W9WlKBfN0OPW7%2FbFxQTS5cLY76XwufME9F4%3D&reserved=3D0
>+
>+CVE: CVE-2022-39028
>+Upstream-Status: Backport
>+[https://cgit/
>+.freebsd.org%2Fsrc%2Fcommit%2F%3Fid%3D6914ffef4e23&data=3D05%7C01%7
>CSANJA
>+Y.CHITRODA%40einfochips.com%7C158a1105621a4754519e08dbbb5d8800%
>7C0beb0c
>+359cbb4feb99e5589e415c7944%7C1%7C0%7C638309782639739868%7CUnkn
>own%7CTWF
>+pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
>CI6Mn
>+0%3D%7C3000%7C%7C%7C&sdata=3DgjdgME8y%2FIw8ZApproq4EkHP3FM3n%
>2Fxk8oFKWUfv
>+5Mk%3D&reserved=3D0]
>+
>+(cherry picked from commit 6914ffef4e2318ca1d0ead28eafb6f06055ce0f8)
>+Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
>+
>+---
>+ telnetd/telnetd.c | 10 +++++-----
>+ 1 file changed, 5 insertions(+), 5 deletions(-)
>+
>+diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c index
>+f36f505..efa0fe1 100644
>+--- a/telnetd/telnetd.c
>++++ b/telnetd/telnetd.c
>+@@ -615,6 +615,11 @@ doit(struct sockaddr_in *who)
>+       int level;
>+       char user_name[256];
>+
>++      /*
>++       * Initialize the slc mapping table.
>++       */
>++      get_slc_defaults();
>++
>+       /*
>+        * Find an available pty to use.
>+        */
>+@@ -698,11 +703,6 @@ void telnet(int f, int p)
>+     char *HE;
>+     const char *IM;
>+
>+-    /*
>+-     * Initialize the slc mapping table.
>+-     */
>+-    get_slc_defaults();
>+-
>+     /*
>+      * Do some tests where it is desireable to wait for a response.
>+      * Rather than doing them slowly, one at a time, do them all
>diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.=
17.bb
>b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>index e28eeae49..d3de038d1 100644
>--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>@@ -16,6 +16,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netkit-
>telnet/netkit-telnet_${PV}.orig.tar.gz
>            file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprint=
f.patch \
>            file://0001-utility-Include-time.h-form-time-and-strftime-prot=
ot.patch \
>            file://0001-Drop-using-register-keyword.patch \
>+           file://CVE-2022-39028.patch \
>            "
>
> UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
>--
>2.35.6


