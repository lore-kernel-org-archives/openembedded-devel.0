Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555D7C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 13:21:34 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.118])
 by mx.groups.io with SMTP id smtpd.web11.3978.1652361690367907908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 06:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=FOj8RP9q;
 spf=pass (domain: melinkcorp.com, ip: 40.107.244.118,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNYZJPw7vhGdYN5baAyxOS02SHYy5XG4dDsvm/xCpW4V6s2zjCBPF4ckrGi5z7dAgk2pd6x0ZBi55S0+kLeP/VbxgaQ1yMwfUs12pz64TEoE9ctGngWs2Qlqq92HnsmMx1dgGAHY0u7gC9bPNiBaaYXZutvsIjVGG/6pjSmgDpsIxtQwf34VQHGpsVH4twc0E4L1F80uqvHOE1fyUGDvIXEwuWuLuC3BDqV0S9/W39akILtTI0iavDydWhJJt62aYeMCs2d8ux23QM3kI4nJ1i2q/1oWr4oKFNPi8QMGEtOZUiZSqS4G1SNVHO5GCKWzAB6KqejMT+GhgvH77b5p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJJ3Tv4EBwN848uj2Ls4r03Bx47LzIUtPRg0Yhd0t98=;
 b=mm8ZMWHdRGefq4yF2O6rZeq6RmWB+/YEXaARCwJYQzlsGE6IcgvKmtTeNQGQL18gh9rHkeStXmi2jKcEwhDZU47LFucwLonMUQvPntxJ68mSNBqSea1qa05KPQxaFkJ80DRG9ad6tsayI51lPVf0DZEFzRud/usaP2OV4t3ClFIM8Qk5aIYztfv0qiJ1W19zp7ik2pVQJLWWpzrydEyq1+o9X6LgviNrOY64fh+AsRGPseuaQ7cauENsNWrfBzuryOUnF3wW+g60pDkK4G+UVL/c5jNNgyPHgP0dGWGOh5igrYKZCcFW4p4toi/c2smMKeEy8gxKySbPn9H4FqFiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJJ3Tv4EBwN848uj2Ls4r03Bx47LzIUtPRg0Yhd0t98=;
 b=FOj8RP9qgHmbYLzf9lQwEfknXSuXlchAiGb8P6KTBgyAfe14BcdHFZdI7gW4PtIaOluxnzoou76hsb2z6Xy3YMLkr0Oahqcf34B4c4wwmVbyMslO0L0+mlcYo1ykCLrycEx+FgNEeblNvEwx4H0pOCv2vrLOZSYZKYoCosuDznWFuJ3Yf6PK5JgJpybq8YBfP/gmCP4SZh/8zX8Vldx+jTjO64y05psPAx0Q9PRKxJRDUZBFkok9jRLz0A590MCclWxLURro6FCD3ikR5DgjB+RdXoPxmy6KLXQ8DP+ccFWnf+yVCq4LFR7G2L1jXnstlyFx9XlFbpoOwewHLyT9Mw==
Received: from CY5PR20MB4820.namprd20.prod.outlook.com (2603:10b6:930:23::7)
 by MN2PR20MB2942.namprd20.prod.outlook.com (2603:10b6:208:1b6::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 13:21:26 +0000
Received: from CY5PR20MB4820.namprd20.prod.outlook.com
 ([fe80::e84b:a28c:432b:3041]) by CY5PR20MB4820.namprd20.prod.outlook.com
 ([fe80::e84b:a28c:432b:3041%8]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 13:21:26 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: ntp: prerm script is removing link to ntpd prior to stopping ntpd
Thread-Topic: ntp: prerm script is removing link to ntpd prior to stopping
 ntpd
Thread-Index: Adhl/p6RFfRFOXjAS86kDIssDtI7xA==
Date: Thu, 12 May 2022 13:21:26 +0000
Message-ID: 
 <CY5PR20MB48208E27512BA4926E6643A0BBCB9@CY5PR20MB4820.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 3398eb3f-57f5-430c-a4fd-d15552c5c2b9
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a13fc97-0e89-4762-fa4f-08da341a5179
x-ms-traffictypediagnostic: MN2PR20MB2942:EE_
x-microsoft-antispam-prvs: 
 <MN2PR20MB29425BEE7C79A4B8AE3B5698BBCB9@MN2PR20MB2942.namprd20.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e02WlfXZfw0lnEaOonMl8SM0UQZnPZ9L5pJ1NeFBqje5gXMXpau2rStpR2lhAT3Ia0muPXaAY/x20UPWNmn9BzfWkxUZ5EkvaPfKe7uPa3f9d4TNkxQj+/X3UPLbZ6KtiwTqzbCau/0cnA9mFCbhWrnyqtqdNvtHGZbKjnywKvlKz6XwgPqql39oj11ZvJFctBANv3Xe9zDv6t7laecj2wG9e3Q1BkVHwpzOGcp48dbOBZrsIUOWFDB0bnzU/lIKCposO8HQKoLPJTiEQXY32nBb7ZNXr8tphtO61PIpF4b7QeKLIWI0Rj1UT+libk1D59KAqoZfssCoLprTJMEO2M5/jZv47kiz5K8KyycuIUJ1VeAqCELtbbqjkE4bTg8ietybUq3/erjikDvnwE4dnkXs1uHfvhd1Vdv459bjbkdtPWNerBPWqfX2tfNKiUaPN1qhW3IzRfu0EnW6L2D2e8gRceTiNn/LX5NSmnOrvQPDoFzlVKYAaRkeCxvWj1G0nBPbcrfwUNayfzY5eTG8C1dPntTtZxM0yodNxUhR6OgFW301SdnOy8qZQdmbczmudMcIWqt8TeEojraRPYqADB3KIvhnPOkVt16TIiy7ISkeNMKuJK+k2JwdQkWVKAkXTHCoCZMfNEs1xFxeIfm4ULg0SdkfhHzQmz/pGXmeWxlFKCOSPzO7IddqkuBPFsFc3cz/uQOL3vvg7OxuOLjnotEQnPVr47seKamlQA341XKzvwGW9wiTjEMtKQsquMQZ09nboV3uVUGlLmq/T3PSNQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR20MB4820.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2906002)(8936002)(38070700005)(6916009)(316002)(52536014)(8676002)(76116006)(5660300002)(9686003)(122000001)(66946007)(66556008)(64756008)(66446008)(66476007)(83380400001)(6506007)(966005)(508600001)(7696005)(26005)(71200400001)(186003)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?++LsftysMUR0YI98h0tlhOlv5tXZ9/UlGI/TSrZeKH3dVrrul0joJzA5aeN4?=
 =?us-ascii?Q?d2Nru8D3K3k+Ac0ew2YPf/rge/nNCeix7ZRfaBZz0fJyDWgQEN2lHcOJU7yl?=
 =?us-ascii?Q?OvcslQLVUBrquMVmwr7f32G1pu+D5WTlypEENVSYRnAYr/Tatk43ysXRpXTt?=
 =?us-ascii?Q?HDL7KJz73lFfN0dA62aXmKSRWycG1aQhsoaUdgtS2GUFztyKBK5C8rCXzN7Z?=
 =?us-ascii?Q?8x7fERpe8pjW7gzt7i5YyZkiqQZQFZ8MGeaMd01a4GSi05aaGgq3sYfe3kq1?=
 =?us-ascii?Q?lmHWr+GXc+N3G0yV8qNPgX9TQZb4fI7Vu5BG1K/HGUY4g0somcqYETTZEd9I?=
 =?us-ascii?Q?/J5zq5SUBGhFJPMvGvRDOeV7AHShXq7fgIIbM+LI2IyPr+V1NAx20M5lGK4E?=
 =?us-ascii?Q?v/kjZfxlr/aUlJAhFrAQiGbTyEyUifnDn3cwyLQXFIRFpQeV3vQ+DNkSiBS9?=
 =?us-ascii?Q?I6lNFrC4UA+uWJI9NUXMxlwzlLPC2cW38/K1q7mkdox3GSR/vEbnhUiOtxRY?=
 =?us-ascii?Q?JTCkRBloPFoMnaN6qqv7bVAiavQu3gMUHariNvFx5l+JJZjIlRdJW09Ex2At?=
 =?us-ascii?Q?HkidohXa31pozWULXfWB1In/viYADGLcSEQ985kAKqzVShje2/ERxe/H/JmC?=
 =?us-ascii?Q?ECtVkz3rB850gOdda8zJuQhNdQoCxRKG9g15W3MS12cxuesRHW1o34J8noVX?=
 =?us-ascii?Q?8GQ3TAHVsS//MJB9lQYVkKb0qOmnKUkXqa8fy64CnfGDe9Hl+sGcBCTyA8IA?=
 =?us-ascii?Q?lcZZXWx7Lr9EAzzndcXHwxKQt/qiKFAxbHzxATlgg0Qd16UO/tx77HVihIK4?=
 =?us-ascii?Q?Py0/fTLOJwi3tTlIpQjd1Qhs0Ad1y5w+yqfCVh056kUraMWN+6St+KtwQ5sR?=
 =?us-ascii?Q?mAfSHm0dcGL3KAz5cc6yLOEX5ASB4fLH4Mxxm3c7XOHH5DKbSWlYxxbwY5eG?=
 =?us-ascii?Q?BSPariGr/Jvt2ZuTxMSfs0iIely5/Pl414zLwSDRuGPtsECKUf01j7xqeYbn?=
 =?us-ascii?Q?HyKyOyepKBW8cCIlK0Lc1GKCLBk0eeUeiFS7MYgo1pP4mojfiNfux8Dqnge/?=
 =?us-ascii?Q?ljflyvolt4shnkwesDGV/Gr7UsWNueGFzQWKJdhUPJ78bvylkPubt5ZGnOhz?=
 =?us-ascii?Q?je+W4JvZug7nAXyYNYdwqpAKbzdGc7zeIU1JB+hitKhvn98NA45NnzuX2mES?=
 =?us-ascii?Q?Fl3Vydh0fg2YDH+P0kaUOVsIv5dP1MszcaCoMX+GGBrK+RLbv1twQ/+5vFu+?=
 =?us-ascii?Q?13xwCepMpSGF81/+8GDde+SzJTUzpRLJjZDBZs9jhrofb7UvizfFtOz93dSx?=
 =?us-ascii?Q?dFxXnwTmniTRCN43z93FDUNEhyXd+4FTEJqIugopniIIQW/pNIBRGLKgltEa?=
 =?us-ascii?Q?1qH+zqCrT9NJa+bGgIsL621lByYKPJ00IGkuUXT8ybPqXR8/SiPvG0ONKs8m?=
 =?us-ascii?Q?1Ywj80hjOQUGeRVmHQUBt40HHYzyhKYWglHqe2M3HuNMM16PDGcs4XJIgXbO?=
 =?us-ascii?Q?cloFbks3jQklySLmuRFmZUrXnXAF5D96oiZ+c/YaHpC/fgFvm7uL5LEfZ/JJ?=
 =?us-ascii?Q?N7+IeRDol0MyVp2rRSjnwTu0GZFCRRsUKCXS37+nlWazXrgvCniaa0KVyuLN?=
 =?us-ascii?Q?fOs9o4tJ8QNmTWVspbLPmP4hdqYxHdOA52L00bV6HcD/mdlyx2jv/z3db/wr?=
 =?us-ascii?Q?AYMYSsB5w2C9VM2YpBb7E6lb0lmchJSTsdRMmzCJR1Et53chKO7qImPSPpoO?=
 =?us-ascii?Q?U9tNKGjeyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR20MB4820.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a13fc97-0e89-4762-fa4f-08da341a5179
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 13:21:26.6620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Sku4F3v0rvNk/3qEe9mFyi+HgmicLPm14XkPZ+/uRPRyV5CNmBSKMt9XrsvpUkcI3tilNvylevutuO85Waagbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2942
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 13:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97081

All,

I'm on the dunfell branch and I am switching my ntp client from ntp to chro=
ny.  I noticed after I upgraded that ntp was still running even though it h=
ad been removed from my system.  After checking in with opkg, I started che=
cking the prerm scripts.  Here is the prerm script as it was generated when=
 I was using the morty branch:

#!/bin/sh
# Begin section update-rc.d
if [ -z "$D" -a -x "/etc/init.d/ntpd" ]; then
/etc/init.d/ntpd stop || :
fi
# End section update-rc.d
# Begin section update-alternatives
update-alternatives --remove  ntpd /usr/sbin/ntpd.ntp
# End section update-alternatives

and here is the prerm script generated by the dunfell branch:

#!/bin/sh
set -e
update-alternatives --remove  ntpd /usr/sbin/ntpd.ntp
if true && [ -z "$D" -a -x "/etc/init.d/ntpd" ]; then
/etc/init.d/ntpd stop || :
Fi

As you can see, now ntpd cannot be stopped because the link is removed befo=
re attempting to stop ntpd.  I'm assuming this is related to this commit? h=
ttps://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D7cb9=
51a803deca151344d905bf2fab038e72e0d0  I checked all the prerm scripts on my=
 image, and ntp was the only one in which the init script name was also the=
 alternative link name.  The only script that I saw that added something di=
fferent was busybox-syslog, which adds a section to stop syslog in the begi=
nning of the prerm script.  Is ntp a corner case, or are there more package=
s which might have the same problem?

Thanks,
Bryan

