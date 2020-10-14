Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.43])
 by mx.groups.io with SMTP id smtpd.web11.230.1602687513327714107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 07:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F10FD2z5;
 spf=pass (domain: windriver.com, ip: 40.107.93.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/E8QJrIChgDg+7m865Sb88causLoLQC1CAiMREk84V0iVIVJ/SVhVpOfI6VnQUZ/Bg5gCNZU51CKVPDH1fP/q4J3O7A2tkfkFRUKQxW0W2SZIT44J6JplYh8jYEo6pa79jMh4i1bmSZOc90qb4skmYVbwGki4eoC3fpUg/bQrLiLfKpOuxOlJEHpQhhFCZobW0Y0L1XvSfjeFa4UNBBIuXLNgQgJJya2SkoUB4/7wXoaOq/YjoeitVhwo5TXk37AOUmrC5M0F1vUunIKSClYhhKaBYEsWT0NejZFx2Xf1co7gRT/58xoJCQvlx7X9UuXqMH0XlEawADNtwQPduH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvb0jgFlOinAJrIaw7Sdb+L/ScFHeW5c4jF0NKLmEIA=;
 b=mWAXr9sOTv+EZXGeNIeaTPC90VsEtLwy9GWElw9rvnfiNWXNVq9HqfpG4NhdpzqQxwqtwBmvdy4QEHDOIsYy4r2jZx281shLTkwdeGIz+NG9T2JK4A5VqtWOM+r8UmMv/1W84XwKdui6BJcGuK8IcYjsX8Z6P60kQAwGNp2tF+/P9bVM7VE7w4QTsqCyrxnAV0baKaJiuXw238SEf3AgwYUJJM7EaPEHL7uj3pHq6wMJi+yeIsjv+yBNxnKpdIksG1wON2NIS4M0JFemfG1wDllBAgLIECmnSvBVSDhd5TNwQtyg+IaUxjJZpTri2YJQEeHNnJCW5Wd9B+XJn76K7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvb0jgFlOinAJrIaw7Sdb+L/ScFHeW5c4jF0NKLmEIA=;
 b=F10FD2z5tdPwe3j8ojRBPVXrLw5BzoUo+UQQK31rePeEGB5cMeAn6v8VaiuoxWgl3bu50oSSJeeWxqiIId1XrmiPXn6ZvPa/wefR1WhD8dPDptUSg0WWJgfy8vP0QPPyem+4YSFetKpfIJTd3rp5tOalQYIVmTr/HXsSkt7fXgI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 14:58:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 14:58:31 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
To: "Siming Yuan (siyuan)" <siyuan@cisco.com>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20201007052509.3526946-1-raj.khem@gmail.com>
 <afe5a405-d84f-bac9-8549-578b46020b11@windriver.com>
 <A408747A-8931-4B18-AB9E-F303B83D7703@cisco.com>
 <CAMKF1soS0H1N3zihZUMQQp2DLk9yPoZ3i5+CGSGy7jDdQeFGig@mail.gmail.com>
 <C886D40D-FDE4-4B4D-A06D-1878A5349795@cisco.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1546f6dd-3413-76e3-1302-0a78724408f2@windriver.com>
Date: Wed, 14 Oct 2020 10:58:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <C886D40D-FDE4-4B4D-A06D-1878A5349795@cisco.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0019.namprd17.prod.outlook.com (2603:10b6:a03:1b8::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 14:58:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbbcc58c-6dc9-417c-db61-08d870519d59
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB484503C280BD72BFC7B2348D9F050@SJ0PR11MB4845.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pC/VSiwuwbm1GKRusVcCjz5635l5tFhXY2YxxLZfCT7CB/gWFWlNsoP8dOZ2N+0EZ2VG1kacBqeffv5SzoAYZmt6hnrzFwg70ddSiRcVkKcSaA07lLKuyUORUjd+qKLCFcu2MGDhEcyW35t4uywCJd2e36nBvIDAz5X7hdb8mUZL3LEP5huN6djbsGRJxRXz71kjCB1IYYT2muTjyMiLRmYFIL1qpJ2xb5+iWngaAfPv/tjmJ1jYVQ3uIsEG1ZSTLip7cxhWu/xSYVg0tVB4V7nl9MeE+ExPAm3dic2VxTUm6GNYlzH2/YmMl2m0lMIkSrwwithIFF2ruNsnu1pok+t6m8c6067GUpnULR6OW/94TNRFh+UwZ1jItJ/iDX5K/sLTY44lFuSAu78MmeKUO/qDyo3IvQnOb5BIvYz+e2llgg0t/q5xKmbFxNC+0gk3CCXpGiOqmvMg0TiIZk6WxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(31686004)(26005)(44832011)(110136005)(16576012)(66556008)(316002)(66946007)(83080400001)(66476007)(478600001)(16526019)(186003)(31696002)(8676002)(8936002)(5660300002)(6486002)(36756003)(4326008)(53546011)(2906002)(86362001)(956004)(4001150100001)(83380400001)(966005)(52116002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	n9nl5Q+QwzB1Bw9CIh8erp8hTZijZw2Em1YqLUUQH2+Lvr8y4ngVg2TryIpOyDYVXid7AFOA4i1zOAozx6JWY6rdNQFwHbXTyhkTLTmsOvqzIvewPMG8Wy3Wn7+UfiA4xiA0CrKlg+izagETg3LLxXCzB/xLakyIUHpYtKw7J20NIN9fAnWqSun/8t2T8qCzDyNIrJ7hGpKu+ZXT5JUDoiUmuZxuzvZgEp06HGMjytVGGD7ehWYA4L5TNn0Z5ySRGoOExf3m9t6Ncj4lwVCrJLNuqZYmqkeLlyWYnlsFtcdv/+NOdclXphDNndVCWeljW7lamqetPnuqF3UFnWy3VQtnFB95CmsIofBnDZr42TAiA6mff0GpiMloiyPiwksuM8OP3qX5HLHYeJpN5c8mDLIw3cahe5MJz1HCvqhQaOOWQrJkwCq98nka5StBrPwClb840YP3oUwUfQ3Tf4RLoyrGW/QZurylFMF1C7ID8XHiV4/c+sd8VbV3zK/H/I4kQh6N5NUdcnO3wOLySlDV4FvGtixRUk4C7jA6e21ZIuCJjWOpt7hS2pCWwBiJNMK3epCpglfpb1X4TdDih0aDjwUmfKMvqw6o0T1tNx2WczZ3S8bwdOBjeWuzOlBJSyBBI+PkIYd9K5dCtE2g0+EMEA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbcc58c-6dc9-417c-db61-08d870519d59
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 14:58:31.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VstyBO1JfECsCTyNPVQhEj6RYmzIxrRSiBn8on7vh6Otr+UuduslIDvB/uMYWuumyiwoBCZOqJAOdtjAikR3dkaqimoY5T7Sbsh60XcdCTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 10/14/20 9:27 AM, Siming Yuan (siyuan) wrote:
> Hi
>
> I'm not sure - where I can find that module. Grepp'ed through the source=
s and couldn=E2=80=99t find a reference to it in any recipes.
>
> First time to OE sources, my apologies. Any hints?

No worries. In OE, the python standard library is split into multiple=20
recipes. It may not be immediately obvious how it's done if you look at=20
the python3 recipe itself, but if you look in the tmp directory for the=20
python3 build artifacts (e.g. in=20
tmp/work/core2-64-poky-linux/python3/3.8.5-r0/packages-split) you will=20
see the results.

Trevor

>
> Siming Yuan
> pyATS Development: cs.co/pyats <https://cs.co/pyats>
> Cisco DevX Engineering: devx.cisco.com <http://devx.cisco.com>
>  =20
>
> =EF=BB=BFOn 2020-10-14, 1:27 AM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
>      On Tue, Oct 13, 2020 at 6:43 PM Siming Yuan (siyuan) <siyuan@cisco.=
com> wrote:
>      >
>      > Hi
>      >
>      >
>      >
>      > getpass is a built-in python module though
>      >
>
>      OE has more granular packaging, so as suggested in last reply pleas=
e
>      send a new revision which has the needed dependency added
>
>      >
>      >
>      > Siming Yuan
>      > pyATS Development: cs.co/pyats
>      >
>      > Cisco DevX Engineering: devx.cisco.com
>      >
>      >
>      >
>      >
>      >
>      > From: Trevor Gamblin <trevor.gamblin@windriver.com>
>      > Date: Tuesday, October 13, 2020 at 9:00 PM
>      > To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.open=
embedded.org" <openembedded-devel@lists.openembedded.org>
>      > Cc: Siming Yuan <siyuan@cisco.com>
>      > Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing r=
untime dependencies
>      >
>      >
>      >
>      >
>      >
>      > On 10/7/20 1:25 AM, Khem Raj wrote:
>      >
>      > From: Siming Yuan <siyuan@cisco.com>
>      >
>      >
>      >
>      > added rdepends to bcrypt, cryptography, pynacl as required by the
>      >
>      > actual python package
>      >
>      >
>      >
>      > Signed-off-by: Siming Yuan <siyuan@cisco.com>
>      >
>      > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      >
>      > Overlooked this one until now, sorry. Looks like it's still missi=
ng something. Installing python3-paramiko on core-image-minimal, I see:
>      >
>      > root@qemux86-64:~# python3
>      > Python 3.8.5 (default, Jul 20 2020, 13:26:22)
>      > [GCC 10.2.0] on linux
>      > Type "help", "copyright", "credits" or "license" for more informa=
tion.
>      > >>> import paramiko
>      > Traceback (most recent call last):
>      >   File "<stdin>", line 1, in <module>
>      >   File "/usr/lib/python3.8/site-packages/paramiko/__init__.py", l=
ine 22, in <module>
>      >     from paramiko.transport import SecurityOptions, Transport
>      >   File "/usr/lib/python3.8/site-packages/paramiko/transport.py", =
line 37, in <module>
>      >     from paramiko import util
>      >   File "/usr/lib/python3.8/site-packages/paramiko/util.py", line =
34, in <module>
>      >     from paramiko.config import SSHConfig
>      >   File "/usr/lib/python3.8/site-packages/paramiko/config.py", lin=
e 25, in <module>
>      >     import getpass
>      > ModuleNotFoundError: No module named 'getpass'
>      > >>>
>      >
>      > ---
>      >
>      >  .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5=
 +++++
>      >
>      >  1 file changed, 5 insertions(+)
>      >
>      >
>      >
>      > diff --git a/meta-python/recipes-devtools/python/python3-paramiko=
_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
>      >
>      > index 324847c31b..1b81171f68 100644
>      >
>      > --- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.=
bb
>      >
>      > +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.=
bb
>      >
>      > @@ -12,3 +12,8 @@ inherit pypi setuptools3
>      >
>      >
>      >
>      >  CLEANBROKEN =3D "1"
>      >
>      >
>      >
>      > +RDEPENDS_${PN} +=3D "\
>      >
>      > +    ${PYTHON_PN}-bcrypt \
>      >
>      > +    ${PYTHON_PN}-cryptography \
>      >
>      > +    ${PYTHON_PN}-pynacl \
>      >
>      > +"
>      >
>      >
>      >
>      >=20
>      >
>      >
>
