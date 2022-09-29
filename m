Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A34C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 13:52:16 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.77])
 by mx.groups.io with SMTP id smtpd.web11.10591.1664459530661649475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 06:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=iPezAM3F;
 spf=pass (domain: kpit.com, ip: 40.107.222.77,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd/aq31CcNC++zOV+GVzqyBJ+OVL6SwRoHXWZLzSzNNpsHQYqjalfG7NnxEN1JY3GDa1+OgM5/WW6z+2zdXqI9QL8pp4487JSinu2m///JLqVcru4Tx4Ud/5cyjC6yYKS9KRfH6zS3uh2F8pfiY5veeC3pNCc/VPsp3jtg9NLVG3Sq5CVNClktdpmmioB0Ex5w9CSRRppnqazXoHx37sEx2FgxbFqvq+lcU6kelorzRfPKh1jCHtgfpQI/7TUhW4sI8ymM7CdSihJNej0MAtXKf3DOslh2nCTxgcQd62lDlBv+rESJLIB1/f+uGzmcYslxN7nRweU4EPuKZT6MZHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5VRTebd2WlVETvR7f53JhwfiJgudZaEhy1T3biKfsc=;
 b=RsIyb8aEaPLwa+zA1K2yoG24JAVu4JE6OZn5KRHfU3LjFeEmoTaZ2deipalC/OhXLodIVjMYWBTI1dX7cMa8whXA1WV+p62my6M5Pz67e0FLXKiqhsXNqQr2I6oShKTcgpmHnSEEpY3vPLw6he4VC0w0fDQu82QeUbOyyDTyiJLweI+4xVpgqXGRCLi5+QEOPsOdU+pkqmo93D34MnBkmtvYzQRT+zmLd+Gx18e36D5eRyw/W65UwyFK1RTJsxLxmNOjuWv8TJJctxm5EHKiN010YSV8FQ1uwe6h3mbVi7BPVpC/iysNcNbdVbkPfSgoX56hOy4TjRU2cbZLib7qEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5VRTebd2WlVETvR7f53JhwfiJgudZaEhy1T3biKfsc=;
 b=iPezAM3FtlFZdpYH2zEOsOSbgNnPX003ZunyO2RNJU0N6cKoOfN/uTRX1Q3+V5MUx/jSy7RIeQRXtWiURdQ7uWP1HFQvmU4FYUcvgs78GoRQjtLcKS4gO8mXEpaWmjVpJjFQN2znME4PE5PF9d4BDMLgkiP/fD62b465gRhVMIo=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MAZPR01MB6034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 13:52:02 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%4]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 13:52:01 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][dunfell][PATCH ] dnsmasq: Fix CVE-2022-0934
Thread-Topic: [meta-networking][dunfell][PATCH ] dnsmasq: Fix CVE-2022-0934
Thread-Index: AQHYzaGezPRb546ykkmQVOJOJ4BJ2a32cEcAgAACytM=
Date: Thu, 29 Sep 2022 13:52:01 +0000
Message-ID: 
 <MAXPR01MB4327A9B049374316163B77259D579@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <20220921100445.12649-1-virendra.thakur@kpit.com>
 <ff26c94d-dbf0-f67c-a200-b2f2a641aba2@gmail.com>
In-Reply-To: <ff26c94d-dbf0-f67c-a200-b2f2a641aba2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|MAZPR01MB6034:EE_
x-ms-office365-filtering-correlation-id: e81e44a3-6566-4316-2d5f-08daa221c8ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DdNwQzGG2XIFCYdfm21e2Jlr1hNnPC/hCsz0vD++nB2/bBUSMtW9/ay+ZOr9WJzQ5bqwZJHKn8+zVLI3y9qfXVzCIc2GilwES6+WfrVsXBTQ7TS2lcAW3jCtrQGl+jSkQYrd3vKZbWdVl2+C9qOT+/+XFfakVn6/U5VexOEGJ0j9cYex1aK+KRwht3dtvdsIoCi0hgkEOrU84I+8J+Mf9KIoELQic0Zbjm8oHqAkTPyd82yaRtN4YVbiIfMt7dd1pWb3yo7D9XsKF4cS3M42yuf5ZiBd9yrIat9+rBfMYt3D390iRUX3ySqUv2ZRWnZT9jPYYFKmfK11s3m37ZD8aFSQN4JtdEIomx8ExaplS3T6i/EtWJh+F4quUYr5pukKGXbIoK0frRgC44+EH2PZOMyaO86GjmUMe/zsJFzDPms6H6trJ4Wz1+nmV3GCrXoDDWU3E8HpNxO69wK56LRo7FZTl7cWGloUS9ECqB5fbiNtpJrDTnFDGrF32751rUuGQ/QEk0wotM0l6GDITKv6jKzCjbxm50Uhmz/nUOgWHgZJiO8lTHkA2JZJWOd/VDGH66rP0ihljCsxvJGe1IbYsWqRBhhGp0/kR4OmK13ohSqZTp+t2TA3xkHrbfsSn6BZeGw786I4HKAvDu/DW7Jk0FnkWc7mQyh2LIhis5MeRtngipGT6yV63hkxu+AoEmgsquDuj0cZsaW+tT2liaDNrZLJAsnpBtblxeAYR+HkM8k5mLArbarK7qVxSFplra6b7jviCVSk0eYlRsEG3q+y7mWbwgImPUYrmbGFo6UBBz8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(38100700002)(66556008)(66574015)(83380400001)(45080400002)(84970400001)(26005)(9686003)(38070700005)(99936003)(33656002)(110136005)(122000001)(316002)(91956017)(2906002)(52536014)(5660300002)(55016003)(30864003)(64756008)(66446008)(186003)(66476007)(76116006)(8676002)(41300700001)(86362001)(66946007)(166002)(71200400001)(966005)(478600001)(19627405001)(8936002)(6506007)(7696005)(53546011)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GMy1hxcVDOc4Dceio2WqMxRb9Joqp5rYx1CO/znV7bGbnhmzarcS35sSOp?=
 =?iso-8859-1?Q?GfWSCMa97hKLZP+XOzBfg8fYdYaI5dZiNSxUDMi9pgcHtoYZwDDznR8rQP?=
 =?iso-8859-1?Q?SzM7j99s1s3qPKpuekrlKaz+uSm7x/e+bkA6OQ6q9gny7icetsBtwxSy0G?=
 =?iso-8859-1?Q?LY8M0K2J58eJ67MRo4nfnsJTsfIT8IiZMXcp9/HrHk25dRClHD8UQ5lEAQ?=
 =?iso-8859-1?Q?+JyW8GBeJjmq2DU35rQDlH41LMFePN6MFAAaQDZqazgTR2kTBNefbgK68g?=
 =?iso-8859-1?Q?nqM/WXv4aIFLl6gF8/6cfiG9TkC6qPsP1/oAnFANM6S39RkTFwnhuc6cfs?=
 =?iso-8859-1?Q?hD2HOe6bvoqrP0BaGHg1egfmgrYdBUlqwfnqaaiIZZBor8/B28FtK+QmMQ?=
 =?iso-8859-1?Q?318u+aoucywQ1sdOJyhWlxuJsHrjl4ptHRcnFd6SJIFK57NSAejf61p/eW?=
 =?iso-8859-1?Q?mEH1PIh4QI6+FHvoF4Sq8jUK+GFF7nH2QJJgDHzAxJWun43hhi/0LVyNCp?=
 =?iso-8859-1?Q?nGo4cMC+GFxtguMXKtRIW4X8sKvyoGGfNY2Cf3FtobYqciCoVHW5opSGYh?=
 =?iso-8859-1?Q?TiuBlFyw/w8OA2LRlW9Htw1LQL6UQ2Hspnbw1nbXpg5c5MsqPNvMdt7lp2?=
 =?iso-8859-1?Q?85pbHSh6+LnoP7N6WFaawfUewUMePhKM8M495pMR++KKjYHnBLco0yWpEy?=
 =?iso-8859-1?Q?uTZNFPDN9bs7k4e7lTdqHn6e1VmKrGyt5X565TCYVuqKpdXzzXh/LyJZ6E?=
 =?iso-8859-1?Q?o/Y+HK+/gvLY/652Nc9zlbiMD8Am6TcbWbloivwSya0tb+BGWP3wttaeKZ?=
 =?iso-8859-1?Q?euX/TGWK2iOy35YAd1YRQwzUY7u5GxgYQreH0fGG3p49v6QbT69FQLJojW?=
 =?iso-8859-1?Q?67f7soPcKx0l4Vf8rum7PpH11xIll+Zh60+uWt6zni3lKa1nz3mkuJ1DY9?=
 =?iso-8859-1?Q?cT1FK8cT0w2Ogo9VA3/t8BETq6Q0N+wnHf0oeJNfnwUSK2sgFGpvUYEJ4N?=
 =?iso-8859-1?Q?pUgXpHfk0tCQuVanVl+oEbN0w4ZMaCjmQTxQbE/wwEZrU+QXMd+FIQnwJq?=
 =?iso-8859-1?Q?ObJW9PZt3sdAsy3O1CyecblzWEjsXYSQRxuADYZzz8X2fhcLAzJwwsZy6y?=
 =?iso-8859-1?Q?+GZoSxpGSqqfGaEhkoi2cwmqwP3AgvKbD3d38may9F37X+o6Hz+Ku4i75/?=
 =?iso-8859-1?Q?NW7mIg/o1U/VioVIT2/lbztqoF+uNfTjKP9AhR52wXG82sId4/qjF2Wm/d?=
 =?iso-8859-1?Q?YBumcQBWctRLf1ymV0TTAeHZH3pGNLxuthCBt6LOCyaZ+o01AgoU+3T6ZC?=
 =?iso-8859-1?Q?edAfywxQcQ6zmgGLz3nZILDykdjHAEF4RbCMStL8CDMxu1Lucq553LErgT?=
 =?iso-8859-1?Q?/T4q2/q3jEBlF8rE5IooL0Mjo9yr3+jc958I8ORuZNYhDvXj4aI+bVIOPE?=
 =?iso-8859-1?Q?Gz8qA5zKDT5+qbp0bsD/IiW2kYFORfbukFs5db+G+7bI/asGcJQHlH+gMV?=
 =?iso-8859-1?Q?72hG99O7hjHGls+IvasXg1FqV2dnmcjtOHQSoqTpHkPzyKUUOnQMRX9sOX?=
 =?iso-8859-1?Q?EXc4/4myRmudtfIQCWerRx1b/bKZOG0bQAbRtJisIg2INUv3y9MpL13+HR?=
 =?iso-8859-1?Q?Esu4HUpDKEgf/qny8tkCrtFZ/oYPo8oMk9?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e81e44a3-6566-4316-2d5f-08daa221c8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 13:52:01.4863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 NCJXcnMSwXRK+VDvqkwoUJOJza9AbGcpAWV7ZaWt4jt/Grt6xtNtF6G8F/rXzbNz4/zKomrErF2RLfZsBPSmNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 13:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99005

--_004_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_"

--_000_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Looks like there is some issue with the mailer . as it was observed earlier=
 also when i submitted my patch to poky .

I am attaching here with the patch file with this can you please check.
 Hope issue will not come.  As with the same change i am able to build in m=
y setup.

Sorry for inconvenience.

Best Regards
Virendra Thakur


________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Thursday, September 29, 2022 6:47 PM
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>; openembedded-devel@li=
sts.openembedded.org <openembedded-devel@lists.openembedded.org>
Cc: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: Re: [meta-networking][dunfell][PATCH ] dnsmasq: Fix CVE-2022-0934

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On 9/21/22 06:04, Virendra Thakur wrote:
> From: Virendra Thakur <virendrak@kpit.com>
>
> Add patch to fix CVE-2022-0934
>
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fthekelleys.org.uk%2Fgitweb%2F%3Fp%3Ddnsmasq.git%3Ba%3Dpatch%3Bh%3D03345ece=
feb0d82e3c3a4c28f27c3554f0611b39&amp;data=3D05%7C01%7Cvirendra.thakur%40kpi=
t.com%7Caefd0b7e69094f3d442008daa21ceabf%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638000542342694093%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dy=
5Uxy%2B1s1lgqDCdoGqq9T18QgaPeBgrUqnlrMayCuBo%3D&amp;reserved=3D0

This patch does not apply.

ERROR: dnsmasq-2.81-r0 do_patch: Applying patch 'CVE-2022-0934.patch' on
target directory
'/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/=
2.81-r0/dnsmasq-2.81'
Command Error: 'quilt --quiltrc
/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/2=
.81-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2022-0934.patch
patching file CHANGELOG
Hunk #1 succeeded at 225 with fuzz 2 (offset 137 lines).
patching file src/rfc3315.c
Hunk #1 FAILED at 33.
Hunk #2 FAILED at 104.
Hunk #4 FAILED at 296.
Hunk #5 FAILED at 347.
Hunk #6 FAILED at 619.
Hunk #7 FAILED at 809.
Hunk #8 FAILED at 921.
Hunk #9 FAILED at 1033.
Hunk #10 FAILED at 1097.
Hunk #11 FAILED at 1106.
Hunk #12 FAILED at 1171.
Hunk #13 FAILED at 1251.
12 out of 13 hunks FAILED -- rejects in file src/rfc3315.c
Patch CVE-2022-0934.patch does not apply (enforce with -f)
ERROR: Logfile of failure stored in:
/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/2=
.81-r0/temp/log.do_patch.3767721
ERROR: Task
(/builds/stable/meta-openembedded-contrib/meta-networking/recipes-support/d=
nsmasq/dnsmasq_2.81.bb:do_patch)
failed with exit code '1'

>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>   .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   1 +
>   .../dnsmasq/files/CVE-2022-0934.patch         | 188 ++++++++++++++++++
>   2 files changed, 189 insertions(+)
>   create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-20=
22-0934.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> index 2fb389915..8db57edb7 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> @@ -11,4 +11,5 @@ SRC_URI +=3D "\
>       file://CVE-2020-25686-1.patch \
>       file://CVE-2020-25686-2.patch \
>       file://CVE-2021-3448.patch \
> +    file://CVE-2022-0934.patch \
>   "
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patch
> new file mode 100644
> index 000000000..f14fc358b
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patch
> @@ -0,0 +1,188 @@
> +From 03345ecefeb0d82e3c3a4c28f27c3554f0611b39 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Thu, 31 Mar 2022 21:35:20 +0100
> +Subject: [PATCH] Fix write-after-free error in DHCPv6 code. CVE-2022-093=
4
> + refers.
> +
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fthekelleys.org.uk%2Fgitweb%2F%3Fp%3Ddnsmasq.git%3Ba%=
3Dpatch%3Bh%3D03345ecefeb0d82e3c3a4c28f27c3554f0611b39&amp;data=3D05%7C01%7=
Cvirendra.thakur%40kpit.com%7Caefd0b7e69094f3d442008daa21ceabf%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C638000542342850915%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DV0PUvHu2OXcyxHXcXYJIQT36GOVYRMgog3%2FftKF90iM%3D&amp;r=
eserved=3D0]
> +CVE: CVE-2022-0934
> +Comment: Hunk from CHANGELOG and rfc3315.c are refresh base on dnsmasq 2=
.81 version
> +Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> +---
> +Index: dnsmasq-2.81/CHANGELOG
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dnsmasq-2.81.orig/CHANGELOG
> ++++ dnsmasq-2.81/CHANGELOG
> +@@ -88,6 +88,9 @@ version 2.81
> +
> +       Add --script-on-renewal option.
> +
> ++      Fix write-after-free error in DHCPv6 server code.
> ++      CVE-2022-0934 refers.
> ++
> +
> + version 2.80
> +       Add support for RFC 4039 DHCP rapid commit. Thanks to Ashram Meth=
od
> +Index: dnsmasq-2.81/src/rfc3315.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dnsmasq-2.81.orig/src/rfc3315.c
> ++++ dnsmasq-2.81/src/rfc3315.c
> +@@ -33,9 +33,9 @@ struct state {
> +   unsigned int mac_len, mac_type;
> + };
> +
> +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t =
sz,
> ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff=
, size_t sz,
> +                            struct in6_addr *client_addr, int is_unicast=
, time_t now);
> +-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbu=
ff, size_t sz, int is_unicast, time_t now);
> ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned c=
har *inbuff, size_t sz, int is_unicast, time_t now);
> + static void log6_opts(int nest, unsigned int xid, void *start_opts, voi=
d *end_opts);
> + static void log6_packet(struct state *state, char *type, struct in6_add=
r *addr, char *string);
> + static void log6_quiet(struct state *state, char *type, struct in6_addr=
 *addr, char *string);
> +@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_c
> + }
> +
> + /* This cost me blood to write, it will probably cost you blood to unde=
rstand - srk. */
> +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t =
sz,
> ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff=
, size_t sz,
> +                            struct in6_addr *client_addr, int is_unicast=
, time_t now)
> + {
> +   void *end =3D inbuff + sz;
> +   void *opts =3D inbuff + 34;
> +-  int msg_type =3D *((unsigned char *)inbuff);
> ++  int msg_type =3D *inbuff;
> +   unsigned char *outmsgtypep;
> +   void *opt;
> +   struct dhcp_vendor *vendor;
> +@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct stat
> +   return 1;
> + }
> +
> +-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbu=
ff, size_t sz, int is_unicast, time_t now)
> ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned c=
har *inbuff, size_t sz, int is_unicast, time_t now)
> + {
> +   void *opt;
> +-  int i, o, o1, start_opts;
> ++  int i, o, o1, start_opts, start_msg;
> +   struct dhcp_opt *opt_cfg;
> +   struct dhcp_netid *tagif;
> +   struct dhcp_config *config =3D NULL;
> +   struct dhcp_netid known_id, iface_id, v6_id;
> +-  unsigned char *outmsgtypep;
> ++  unsigned char outmsgtype;
> +   struct dhcp_vendor *vendor;
> +   struct dhcp_context *context_tmp;
> +   struct dhcp_mac *mac_opt;
> +@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *
> +   v6_id.next =3D state->tags;
> +   state->tags =3D &v6_id;
> +
> +-  /* copy over transaction-id, and save pointer to message type */
> +-  if (!(outmsgtypep =3D put_opt6(inbuff, 4)))
> ++  start_msg =3D save_counter(-1);
> ++  /* copy over transaction-id */
> ++  if (!put_opt6(inbuff, 4))
> +     return 0;
> +   start_opts =3D save_counter(-1);
> +-  state->xid =3D outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] =
<< 16;
> +-
> ++  state->xid =3D inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
> ++
> +   /* We're going to be linking tags from all context we use.
> +      mark them as unused so we don't link one twice and break the list =
*/
> +   for (context_tmp =3D state->context; context_tmp; context_tmp =3D con=
text_tmp->current)
> +@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *
> +       (msg_type =3D=3D DHCP6REQUEST || msg_type =3D=3D DHCP6RENEW || ms=
g_type =3D=3D DHCP6RELEASE || msg_type =3D=3D DHCP6DECLINE))
> +
> +     {
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +       o1 =3D new_opt6(OPTION6_STATUS_CODE);
> +       put_opt6_short(DHCP6USEMULTI);
> +       put_opt6_string("Use multicast");
> +@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *
> +       struct dhcp_netid *solicit_tags;
> +       struct dhcp_context *c;
> +
> +-      *outmsgtypep =3D DHCP6ADVERTISE;
> ++      outmsgtype =3D DHCP6ADVERTISE;
> +
> +       if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_CO=
MMIT, 0))
> +         {
> +-          *outmsgtypep =3D DHCP6REPLY;
> ++          outmsgtype =3D DHCP6REPLY;
> +           state->lease_allocate =3D 1;
> +           o =3D new_opt6(OPTION6_RAPID_COMMIT);
> +           end_opt6(o);
> +@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *
> +       int start =3D save_counter(-1);
> +
> +       /* set reply message type */
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +       state->lease_allocate =3D 1;
> +
> +       log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NU=
LL);
> +@@ -921,7 +922,7 @@ static int dhcp6_no_relay(struct state *
> +     case DHCP6RENEW:
> +       {
> +       /* set reply message type */
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +
> +       log6_quiet(state, "DHCPRENEW", NULL, NULL);
> +
> +@@ -1033,7 +1034,7 @@ static int dhcp6_no_relay(struct state *
> +       int good_addr =3D 0;
> +
> +       /* set reply message type */
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +
> +       log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
> +
> +@@ -1097,7 +1098,7 @@ static int dhcp6_no_relay(struct state *
> +       log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("ig=
nored") : state->hostname);
> +       if (ignore)
> +         return 0;
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +       tagif =3D add_options(state, 1);
> +       break;
> +       }
> +@@ -1106,7 +1107,7 @@ static int dhcp6_no_relay(struct state *
> +     case DHCP6RELEASE:
> +       {
> +       /* set reply message type */
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +
> +       log6_quiet(state, "DHCPRELEASE", NULL, NULL);
> +
> +@@ -1171,7 +1172,7 @@ static int dhcp6_no_relay(struct state *
> +     case DHCP6DECLINE:
> +       {
> +       /* set reply message type */
> +-      *outmsgtypep =3D DHCP6REPLY;
> ++      outmsgtype =3D DHCP6REPLY;
> +
> +       log6_quiet(state, "DHCPDECLINE", NULL, NULL);
> +
> +@@ -1251,10 +1252,15 @@ static int dhcp6_no_relay(struct state *
> +       }
> +
> +     }
> +-
> ++
> ++  /* Fill in the message type. Note that we store the offset,
> ++     not a direct pointer, since the packet memory may have been
> ++     reallocated. */
> ++  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] =3D outmsg=
type;
> ++
> +   log_tags(tagif, state->xid);
> +   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, dae=
mon->outpacket.iov_base + save_counter(-1));
> +-
> ++
> +   return 1;
> +
> + }
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Armin,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Looks like there is some issue&nbsp;with&nbsp;the mailer . as it was observ=
ed earlier also when i submitted my patch to poky .</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am attaching&nbsp;here with the patch file with this can you&nbsp;please =
check.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;Hope issue will not come.&nbsp; As with the same change i am able to =
build in my setup.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry for inconvenience.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Virendra Thakur</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> Thursday, September 29, 2022 6:47 PM<br>
<b>To:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;; openembe=
dded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedded=
.org&gt;<br>
<b>Cc:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Subject:</b> Re: [meta-networking][dunfell][PATCH ] dnsmasq: Fix CVE-202=
2-0934</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">Caution: This email originated from=
 outside of the KPIT. Do not click links or open attachments unless you rec=
ognize the sender and know the content is safe.<br>
<br>
On 9/21/22 06:04, Virendra Thakur wrote:<br>
&gt; From: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
&gt;<br>
&gt; Add patch to fix CVE-2022-0934<br>
&gt;<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fthekelleys.org.uk%2Fgitweb%2F%3Fp%3Ddnsmasq.git%3Ba%3Dpatc=
h%3Bh%3D03345ecefeb0d82e3c3a4c28f27c3554f0611b39&amp;amp;data=3D05%7C01%7Cv=
irendra.thakur%40kpit.com%7Caefd0b7e69094f3d442008daa21ceabf%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638000542342694093%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&amp;amp;sdata=3Dy5Uxy%2B1s1lgqDCdoGqq9T18QgaPeBgrUqnlrMayCuBo%3D&amp=
;amp;reserved=3D0" data-auth=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fthekell=
eys.org.uk%2Fgitweb%2F%3Fp%3Ddnsmasq.git%3Ba%3Dpatch%3Bh%3D03345ecefeb0d82e=
3c3a4c28f27c3554f0611b39&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.co=
m%7Caefd0b7e69094f3d442008daa21ceabf%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C638000542342694093%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3Dy=
5Uxy%2B1s1lgqDCdoGqq9T18QgaPeBgrUqnlrMayCuBo%3D&amp;amp;reserved=3D0</a><br=
>
<br>
This patch does not apply.<br>
<br>
ERROR: dnsmasq-2.81-r0 do_patch: Applying patch 'CVE-2022-0934.patch' on<br=
>
target directory<br>
'/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/=
2.81-r0/dnsmasq-2.81'<br>
Command Error: 'quilt --quiltrc<br>
/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/2=
.81-r0/recipe-sysroot-native/etc/quiltrc<br>
push' exited with 0&nbsp; Output:<br>
Applying patch CVE-2022-0934.patch<br>
patching file CHANGELOG<br>
Hunk #1 succeeded at 225 with fuzz 2 (offset 137 lines).<br>
patching file src/rfc3315.c<br>
Hunk #1 FAILED at 33.<br>
Hunk #2 FAILED at 104.<br>
Hunk #4 FAILED at 296.<br>
Hunk #5 FAILED at 347.<br>
Hunk #6 FAILED at 619.<br>
Hunk #7 FAILED at 809.<br>
Hunk #8 FAILED at 921.<br>
Hunk #9 FAILED at 1033.<br>
Hunk #10 FAILED at 1097.<br>
Hunk #11 FAILED at 1106.<br>
Hunk #12 FAILED at 1171.<br>
Hunk #13 FAILED at 1251.<br>
12 out of 13 hunks FAILED -- rejects in file src/rfc3315.c<br>
Patch CVE-2022-0934.patch does not apply (enforce with -f)<br>
ERROR: Logfile of failure stored in:<br>
/builds/stable/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/dnsmasq/2=
.81-r0/temp/log.do_patch.3767721<br>
ERROR: Task<br>
(/builds/stable/meta-openembedded-contrib/meta-networking/recipes-support/d=
nsmasq/dnsmasq_2.81.bb:do_patch)<br>
failed with exit code '1'<br>
<br>
&gt;<br>
&gt; Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../recipes-support/dnsmasq/dnsmasq_2.81.bb&nbsp;&nbsp; |&=
nbsp;&nbsp; 1 +<br>
&gt;&nbsp;&nbsp; .../dnsmasq/files/CVE-2022-0934.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 188 ++++++++++++++++++<br>
&gt;&nbsp;&nbsp; 2 files changed, 189 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-networking/recipes-support/dnsmasq=
/files/CVE-2022-0934.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b=
/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
&gt; index 2fb389915..8db57edb7 100644<br>
&gt; --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
&gt; +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
&gt; @@ -11,4 +11,5 @@ SRC_URI +=3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25686-1=
.patch" data-auth=3D"NotApplicable">file://CVE-2020-25686-1.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25686-2=
.patch" data-auth=3D"NotApplicable">file://CVE-2020-25686-2.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2021-3448.pa=
tch" data-auth=3D"NotApplicable">file://CVE-2021-3448.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2022-0934.patch" data-auth=
=3D"NotApplicable">file://CVE-2022-0934.patch</a> \<br>
&gt;&nbsp;&nbsp; &quot;<br>
&gt; diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2022-09=
34.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 000000000..f14fc358b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2022-0934.patc=
h<br>
&gt; @@ -0,0 +1,188 @@<br>
&gt; +From 03345ecefeb0d82e3c3a4c28f27c3554f0611b39 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
&gt; +Date: Thu, 31 Mar 2022 21:35:20 +0100<br>
&gt; +Subject: [PATCH] Fix write-after-free error in DHCPv6 code. CVE-2022-=
0934<br>
&gt; + refers.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fthekelleys.org.uk%2Fgitweb%2F%3Fp%3Ddn=
smasq.git%3Ba%3Dpatch%3Bh%3D03345ecefeb0d82e3c3a4c28f27c3554f0611b39&amp;am=
p;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7Caefd0b7e69094f3d442008daa21=
ceabf%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638000542342850915%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DV0PUvHu2OXcyxHXcXYJIQT36GOVYRMgo=
g3%2FftKF90iM%3D&amp;amp;reserved=3D0" data-auth=3D"NotApplicable">https://=
apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fthekelleys.org.=
uk%2Fgitweb%2F%3Fp%3Ddnsmasq.git%3Ba%3Dpatch%3Bh%3D03345ecefeb0d82e3c3a4c28=
f27c3554f0611b39&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7Caefd=
0b7e69094f3d442008daa21ceabf%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
38000542342850915%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DV0PUvHu2O=
XcyxHXcXYJIQT36GOVYRMgog3%2FftKF90iM%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +CVE: CVE-2022-0934<br>
&gt; +Comment: Hunk from CHANGELOG and rfc3315.c are refresh base on dnsmas=
q 2.81 version<br>
&gt; +Signed-off-by: Virendra Thakur &lt;virendra.thakur@kpit.com&gt;<br>
&gt; +---<br>
&gt; +Index: dnsmasq-2.81/CHANGELOG<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- dnsmasq-2.81.orig/CHANGELOG<br>
&gt; ++++ dnsmasq-2.81/CHANGELOG<br>
&gt; +@@ -88,6 +88,9 @@ version 2.81<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add --script-on-renewal option.<=
br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fix write-after-free error in DHCPv6 =
server code.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CVE-2022-0934 refers.<br>
&gt; ++<br>
&gt; +<br>
&gt; + version 2.80<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add support for RFC 4039 DHCP ra=
pid commit. Thanks to Ashram Method<br>
&gt; +Index: dnsmasq-2.81/src/rfc3315.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- dnsmasq-2.81.orig/src/rfc3315.c<br>
&gt; ++++ dnsmasq-2.81/src/rfc3315.c<br>
&gt; +@@ -33,9 +33,9 @@ struct state {<br>
&gt; +&nbsp;&nbsp; unsigned int mac_len, mac_type;<br>
&gt; + };<br>
&gt; +<br>
&gt; +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size=
_t sz,<br>
&gt; ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inb=
uff, size_t sz,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct in6_addr *client_addr, int is_unicast, time_t now=
);<br>
&gt; +-static int dhcp6_no_relay(struct state *state, int msg_type, void *i=
nbuff, size_t sz, int is_unicast, time_t now);<br>
&gt; ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigne=
d char *inbuff, size_t sz, int is_unicast, time_t now);<br>
&gt; + static void log6_opts(int nest, unsigned int xid, void *start_opts, =
void *end_opts);<br>
&gt; + static void log6_packet(struct state *state, char *type, struct in6_=
addr *addr, char *string);<br>
&gt; + static void log6_quiet(struct state *state, char *type, struct in6_a=
ddr *addr, char *string);<br>
&gt; +@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_c<br>
&gt; + }<br>
&gt; +<br>
&gt; + /* This cost me blood to write, it will probably cost you blood to u=
nderstand - srk. */<br>
&gt; +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size=
_t sz,<br>
&gt; ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inb=
uff, size_t sz,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct in6_addr *client_addr, int is_unicast, time_t now=
)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp; void *end =3D inbuff + sz;<br>
&gt; +&nbsp;&nbsp; void *opts =3D inbuff + 34;<br>
&gt; +-&nbsp; int msg_type =3D *((unsigned char *)inbuff);<br>
&gt; ++&nbsp; int msg_type =3D *inbuff;<br>
&gt; +&nbsp;&nbsp; unsigned char *outmsgtypep;<br>
&gt; +&nbsp;&nbsp; void *opt;<br>
&gt; +&nbsp;&nbsp; struct dhcp_vendor *vendor;<br>
&gt; +@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct stat<br>
&gt; +&nbsp;&nbsp; return 1;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static int dhcp6_no_relay(struct state *state, int msg_type, void *i=
nbuff, size_t sz, int is_unicast, time_t now)<br>
&gt; ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigne=
d char *inbuff, size_t sz, int is_unicast, time_t now)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp; void *opt;<br>
&gt; +-&nbsp; int i, o, o1, start_opts;<br>
&gt; ++&nbsp; int i, o, o1, start_opts, start_msg;<br>
&gt; +&nbsp;&nbsp; struct dhcp_opt *opt_cfg;<br>
&gt; +&nbsp;&nbsp; struct dhcp_netid *tagif;<br>
&gt; +&nbsp;&nbsp; struct dhcp_config *config =3D NULL;<br>
&gt; +&nbsp;&nbsp; struct dhcp_netid known_id, iface_id, v6_id;<br>
&gt; +-&nbsp; unsigned char *outmsgtypep;<br>
&gt; ++&nbsp; unsigned char outmsgtype;<br>
&gt; +&nbsp;&nbsp; struct dhcp_vendor *vendor;<br>
&gt; +&nbsp;&nbsp; struct dhcp_context *context_tmp;<br>
&gt; +&nbsp;&nbsp; struct dhcp_mac *mac_opt;<br>
&gt; +@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp; v6_id.next =3D state-&gt;tags;<br>
&gt; +&nbsp;&nbsp; state-&gt;tags =3D &amp;v6_id;<br>
&gt; +<br>
&gt; +-&nbsp; /* copy over transaction-id, and save pointer to message type=
 */<br>
&gt; +-&nbsp; if (!(outmsgtypep =3D put_opt6(inbuff, 4)))<br>
&gt; ++&nbsp; start_msg =3D save_counter(-1);<br>
&gt; ++&nbsp; /* copy over transaction-id */<br>
&gt; ++&nbsp; if (!put_opt6(inbuff, 4))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +&nbsp;&nbsp; start_opts =3D save_counter(-1);<br>
&gt; +-&nbsp; state-&gt;xid =3D outmsgtypep[3] | outmsgtypep[2] &lt;&lt; 8 =
| outmsgtypep[1] &lt;&lt; 16;<br>
&gt; +-<br>
&gt; ++&nbsp; state-&gt;xid =3D inbuff[3] | inbuff[2] &lt;&lt; 8 | inbuff[1=
] &lt;&lt; 16;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; /* We're going to be linking tags from all context we us=
e.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mark them as unused so we don't link o=
ne twice and break the list */<br>
&gt; +&nbsp;&nbsp; for (context_tmp =3D state-&gt;context; context_tmp; con=
text_tmp =3D context_tmp-&gt;current)<br>
&gt; +@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (msg_type =3D=3D DHCP6REQUEST ||=
 msg_type =3D=3D DHCP6RENEW || msg_type =3D=3D DHCP6RELEASE || msg_type =3D=
=3D DHCP6DECLINE))<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o1 =3D new_opt6(OPTION6_STATUS_C=
ODE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put_opt6_short(DHCP6USEMULTI);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put_opt6_string(&quot;Use multic=
ast&quot;);<br>
&gt; +@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dhcp_netid *solicit_tags;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dhcp_context *c;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6ADVERTISE;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6ADVERTISE;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (opt6_find(state-&gt;packet_o=
ptions, state-&gt;end, OPTION6_RAPID_COMMIT, 0))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =
=3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =
=3D DHCP6REPLY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&g=
t;lease_allocate =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o =3D ne=
w_opt6(OPTION6_RAPID_COMMIT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end_opt6=
(o);<br>
&gt; +@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int start =3D save_counter(-1);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set reply message type */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;lease_allocate =3D 1;<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPREQU=
EST&quot;, NULL, ignore ? _(&quot;ignored&quot;) : NULL);<br>
&gt; +@@ -921,7 +922,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case DHCP6RENEW:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set reply message type */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPRENE=
W&quot;, NULL, NULL);<br>
&gt; +<br>
&gt; +@@ -1033,7 +1034,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int good_addr =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set reply message type */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPCONF=
IRM&quot;, NULL, NULL);<br>
&gt; +<br>
&gt; +@@ -1097,7 +1098,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPINFO=
RMATION-REQUEST&quot;, NULL, ignore ? _(&quot;ignored&quot;) : state-&gt;ho=
stname);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ignore)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tagif =3D add_options(state, 1);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -1106,7 +1107,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case DHCP6RELEASE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set reply message type */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPRELE=
ASE&quot;, NULL, NULL);<br>
&gt; +<br>
&gt; +@@ -1171,7 +1172,7 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case DHCP6DECLINE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set reply message type */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *outmsgtypep =3D DHCP6REPLY;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outmsgtype =3D DHCP6REPLY;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log6_quiet(state, &quot;DHCPDECL=
INE&quot;, NULL, NULL);<br>
&gt; +<br>
&gt; +@@ -1251,10 +1252,15 @@ static int dhcp6_no_relay(struct state *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-<br>
&gt; ++<br>
&gt; ++&nbsp; /* Fill in the message type. Note that we store the offset,<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; not a direct pointer, since the packet memo=
ry may have been<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; reallocated. */<br>
&gt; ++&nbsp; ((unsigned char *)(daemon-&gt;outpacket.iov_base))[start_msg]=
 =3D outmsgtype;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; log_tags(tagif, state-&gt;xid);<br>
&gt; +&nbsp;&nbsp; log6_opts(0, state-&gt;xid, daemon-&gt;outpacket.iov_bas=
e + start_opts, daemon-&gt;outpacket.iov_base + save_counter(-1));<br>
&gt; +-<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; return 1;<br>
&gt; +<br>
&gt; + }<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_--

--_004_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-dnsmasq-Fix-CVE-2022-0934.patch"
Content-Description: 0001-dnsmasq-Fix-CVE-2022-0934.patch
Content-Disposition: attachment;
	filename="0001-dnsmasq-Fix-CVE-2022-0934.patch"; size=8384;
	creation-date="Thu, 29 Sep 2022 13:49:39 GMT";
	modification-date="Thu, 29 Sep 2022 13:49:42 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1NWQyZWM3OTU3ODllZjgyZjk1MTIwNjcwNDcwODY2YTBhM2RiOTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogV2VkLCAxNCBTZXAgMjAyMiAyMDozNDoyNiArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGRu
c21hc3E6IEZpeCBDVkUtMjAyMi0wOTM0CgpBZGQgcGF0Y2ggdG8gZml4IENWRS0yMDIyLTA5MzQK
Ckxpbms6IGh0dHBzOi8vdGhla2VsbGV5cy5vcmcudWsvZ2l0d2ViLz9wPWRuc21hc3EuZ2l0O2E9
cGF0Y2g7aD0wMzM0NWVjZWZlYjBkODJlM2MzYTRjMjhmMjdjMzU1NGYwNjExYjM5CgpTaWduZWQt
b2ZmLWJ5OiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4KLS0tCiAuLi4vcmVj
aXBlcy1zdXBwb3J0L2Ruc21hc3EvZG5zbWFzcV8yLjgxLmJiICAgfCAgIDEgKwogLi4uL2Ruc21h
c3EvZmlsZXMvQ1ZFLTIwMjItMDkzNC5wYXRjaCAgICAgICAgIHwgMTg4ICsrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvZG5zbWFzcS9maWxlcy9DVkUtMjAy
Mi0wOTM0LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9y
dC9kbnNtYXNxL2Ruc21hc3FfMi44MS5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBv
cnQvZG5zbWFzcS9kbnNtYXNxXzIuODEuYmIKaW5kZXggMmZiMzg5OTE1Li44ZGI1N2VkYjcgMTAw
NjQ0Ci0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvZG5zbWFzcS9kbnNtYXNx
XzIuODEuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9kbnNtYXNxL2Ru
c21hc3FfMi44MS5iYgpAQCAtMTEsNCArMTEsNSBAQCBTUkNfVVJJICs9ICJcCiAgICAgZmlsZTov
L0NWRS0yMDIwLTI1Njg2LTEucGF0Y2ggXAogICAgIGZpbGU6Ly9DVkUtMjAyMC0yNTY4Ni0yLnBh
dGNoIFwKICAgICBmaWxlOi8vQ1ZFLTIwMjEtMzQ0OC5wYXRjaCBcCisgICAgZmlsZTovL0NWRS0y
MDIyLTA5MzQucGF0Y2ggXAogIgpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
c3VwcG9ydC9kbnNtYXNxL2ZpbGVzL0NWRS0yMDIyLTA5MzQucGF0Y2ggYi9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1zdXBwb3J0L2Ruc21hc3EvZmlsZXMvQ1ZFLTIwMjItMDkzNC5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmYxNGZjMzU4YgotLS0gL2Rldi9udWxs
CisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvZG5zbWFzcS9maWxlcy9DVkUt
MjAyMi0wOTM0LnBhdGNoCkBAIC0wLDAgKzEsMTg4IEBACitGcm9tIDAzMzQ1ZWNlZmViMGQ4MmUz
YzNhNGMyOGYyN2MzNTU0ZjA2MTFiMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBT
aW1vbiBLZWxsZXkgPHNpbW9uQHRoZWtlbGxleXMub3JnLnVrPgorRGF0ZTogVGh1LCAzMSBNYXIg
MjAyMiAyMTozNToyMCArMDEwMAorU3ViamVjdDogW1BBVENIXSBGaXggd3JpdGUtYWZ0ZXItZnJl
ZSBlcnJvciBpbiBESENQdjYgY29kZS4gQ1ZFLTIwMjItMDkzNAorIHJlZmVycy4KKworVXBzdHJl
YW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly90aGVrZWxsZXlzLm9yZy51ay9naXR3ZWIvP3A9
ZG5zbWFzcS5naXQ7YT1wYXRjaDtoPTAzMzQ1ZWNlZmViMGQ4MmUzYzNhNGMyOGYyN2MzNTU0ZjA2
MTFiMzldCitDVkU6IENWRS0yMDIyLTA5MzQKK0NvbW1lbnQ6IEh1bmsgZnJvbSBDSEFOR0VMT0cg
YW5kIHJmYzMzMTUuYyBhcmUgcmVmcmVzaCBiYXNlIG9uIGRuc21hc3EgMi44MSB2ZXJzaW9uCitT
aWduZWQtb2ZmLWJ5OiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJhLnRoYWt1ckBrcGl0LmNvbT4K
Ky0tLQorSW5kZXg6IGRuc21hc3EtMi44MS9DSEFOR0VMT0cKKz09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKy0tLSBkbnNt
YXNxLTIuODEub3JpZy9DSEFOR0VMT0cKKysrKyBkbnNtYXNxLTIuODEvQ0hBTkdFTE9HCitAQCAt
ODgsNiArODgsOSBAQCB2ZXJzaW9uIDIuODEKKyAKKyAJQWRkIC0tc2NyaXB0LW9uLXJlbmV3YWwg
b3B0aW9uLgorIAorKwlGaXggd3JpdGUtYWZ0ZXItZnJlZSBlcnJvciBpbiBESENQdjYgc2VydmVy
IGNvZGUuCisrCUNWRS0yMDIyLTA5MzQgcmVmZXJzLgorKworIAkKKyB2ZXJzaW9uIDIuODAKKyAJ
QWRkIHN1cHBvcnQgZm9yIFJGQyA0MDM5IERIQ1AgcmFwaWQgY29tbWl0LiBUaGFua3MgdG8gQXNo
cmFtIE1ldGhvZAorSW5kZXg6IGRuc21hc3EtMi44MS9zcmMvcmZjMzMxNS5jCis9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CistLS0gZG5zbWFzcS0yLjgxLm9yaWcvc3JjL3JmYzMzMTUuYworKysrIGRuc21hc3EtMi44MS9z
cmMvcmZjMzMxNS5jCitAQCAtMzMsOSArMzMsOSBAQCBzdHJ1Y3Qgc3RhdGUgeworICAgdW5zaWdu
ZWQgaW50IG1hY19sZW4sIG1hY190eXBlOworIH07CisgCistc3RhdGljIGludCBkaGNwNl9tYXli
ZV9yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCB2b2lkICppbmJ1ZmYsIHNpemVfdCBzeiwgCisr
c3RhdGljIGludCBkaGNwNl9tYXliZV9yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCB1bnNpZ25l
ZCBjaGFyICppbmJ1ZmYsIHNpemVfdCBzeiwgCisgCQkJICAgICBzdHJ1Y3QgaW42X2FkZHIgKmNs
aWVudF9hZGRyLCBpbnQgaXNfdW5pY2FzdCwgdGltZV90IG5vdyk7Cistc3RhdGljIGludCBkaGNw
Nl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCBpbnQgbXNnX3R5cGUsIHZvaWQgKmluYnVm
Ziwgc2l6ZV90IHN6LCBpbnQgaXNfdW5pY2FzdCwgdGltZV90IG5vdyk7Cisrc3RhdGljIGludCBk
aGNwNl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCBpbnQgbXNnX3R5cGUsIHVuc2lnbmVk
IGNoYXIgKmluYnVmZiwgc2l6ZV90IHN6LCBpbnQgaXNfdW5pY2FzdCwgdGltZV90IG5vdyk7Cisg
c3RhdGljIHZvaWQgbG9nNl9vcHRzKGludCBuZXN0LCB1bnNpZ25lZCBpbnQgeGlkLCB2b2lkICpz
dGFydF9vcHRzLCB2b2lkICplbmRfb3B0cyk7Cisgc3RhdGljIHZvaWQgbG9nNl9wYWNrZXQoc3Ry
dWN0IHN0YXRlICpzdGF0ZSwgY2hhciAqdHlwZSwgc3RydWN0IGluNl9hZGRyICphZGRyLCBjaGFy
ICpzdHJpbmcpOworIHN0YXRpYyB2b2lkIGxvZzZfcXVpZXQoc3RydWN0IHN0YXRlICpzdGF0ZSwg
Y2hhciAqdHlwZSwgc3RydWN0IGluNl9hZGRyICphZGRyLCBjaGFyICpzdHJpbmcpOworQEAgLTEw
NCwxMiArMTA0LDEyIEBAIHVuc2lnbmVkIHNob3J0IGRoY3A2X3JlcGx5KHN0cnVjdCBkaGNwX2MK
KyB9CisgCisgLyogVGhpcyBjb3N0IG1lIGJsb29kIHRvIHdyaXRlLCBpdCB3aWxsIHByb2JhYmx5
IGNvc3QgeW91IGJsb29kIHRvIHVuZGVyc3RhbmQgLSBzcmsuICovCistc3RhdGljIGludCBkaGNw
Nl9tYXliZV9yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCB2b2lkICppbmJ1ZmYsIHNpemVfdCBz
eiwgCisrc3RhdGljIGludCBkaGNwNl9tYXliZV9yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCB1
bnNpZ25lZCBjaGFyICppbmJ1ZmYsIHNpemVfdCBzeiwgCisgCQkJICAgICBzdHJ1Y3QgaW42X2Fk
ZHIgKmNsaWVudF9hZGRyLCBpbnQgaXNfdW5pY2FzdCwgdGltZV90IG5vdykKKyB7CisgICB2b2lk
ICplbmQgPSBpbmJ1ZmYgKyBzejsKKyAgIHZvaWQgKm9wdHMgPSBpbmJ1ZmYgKyAzNDsKKy0gIGlu
dCBtc2dfdHlwZSA9ICooKHVuc2lnbmVkIGNoYXIgKilpbmJ1ZmYpOworKyAgaW50IG1zZ190eXBl
ID0gKmluYnVmZjsKKyAgIHVuc2lnbmVkIGNoYXIgKm91dG1zZ3R5cGVwOworICAgdm9pZCAqb3B0
OworICAgc3RydWN0IGRoY3BfdmVuZG9yICp2ZW5kb3I7CitAQCAtMjU5LDE1ICsyNTksMTUgQEAg
c3RhdGljIGludCBkaGNwNl9tYXliZV9yZWxheShzdHJ1Y3Qgc3RhdAorICAgcmV0dXJuIDE7Cisg
fQorIAorLXN0YXRpYyBpbnQgZGhjcDZfbm9fcmVsYXkoc3RydWN0IHN0YXRlICpzdGF0ZSwgaW50
IG1zZ190eXBlLCB2b2lkICppbmJ1ZmYsIHNpemVfdCBzeiwgaW50IGlzX3VuaWNhc3QsIHRpbWVf
dCBub3cpCisrc3RhdGljIGludCBkaGNwNl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUgKnN0YXRlLCBp
bnQgbXNnX3R5cGUsIHVuc2lnbmVkIGNoYXIgKmluYnVmZiwgc2l6ZV90IHN6LCBpbnQgaXNfdW5p
Y2FzdCwgdGltZV90IG5vdykKKyB7CisgICB2b2lkICpvcHQ7CistICBpbnQgaSwgbywgbzEsIHN0
YXJ0X29wdHM7CisrICBpbnQgaSwgbywgbzEsIHN0YXJ0X29wdHMsIHN0YXJ0X21zZzsKKyAgIHN0
cnVjdCBkaGNwX29wdCAqb3B0X2NmZzsKKyAgIHN0cnVjdCBkaGNwX25ldGlkICp0YWdpZjsKKyAg
IHN0cnVjdCBkaGNwX2NvbmZpZyAqY29uZmlnID0gTlVMTDsKKyAgIHN0cnVjdCBkaGNwX25ldGlk
IGtub3duX2lkLCBpZmFjZV9pZCwgdjZfaWQ7CistICB1bnNpZ25lZCBjaGFyICpvdXRtc2d0eXBl
cDsKKysgIHVuc2lnbmVkIGNoYXIgb3V0bXNndHlwZTsKKyAgIHN0cnVjdCBkaGNwX3ZlbmRvciAq
dmVuZG9yOworICAgc3RydWN0IGRoY3BfY29udGV4dCAqY29udGV4dF90bXA7CisgICBzdHJ1Y3Qg
ZGhjcF9tYWMgKm1hY19vcHQ7CitAQCAtMjk2LDEyICsyOTYsMTMgQEAgc3RhdGljIGludCBkaGNw
Nl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUgKgorICAgdjZfaWQubmV4dCA9IHN0YXRlLT50YWdzOwor
ICAgc3RhdGUtPnRhZ3MgPSAmdjZfaWQ7CisgCistICAvKiBjb3B5IG92ZXIgdHJhbnNhY3Rpb24t
aWQsIGFuZCBzYXZlIHBvaW50ZXIgdG8gbWVzc2FnZSB0eXBlICovCistICBpZiAoIShvdXRtc2d0
eXBlcCA9IHB1dF9vcHQ2KGluYnVmZiwgNCkpKQorKyAgc3RhcnRfbXNnID0gc2F2ZV9jb3VudGVy
KC0xKTsKKysgIC8qIGNvcHkgb3ZlciB0cmFuc2FjdGlvbi1pZCAqLworKyAgaWYgKCFwdXRfb3B0
NihpbmJ1ZmYsIDQpKQorICAgICByZXR1cm4gMDsKKyAgIHN0YXJ0X29wdHMgPSBzYXZlX2NvdW50
ZXIoLTEpOworLSAgc3RhdGUtPnhpZCA9IG91dG1zZ3R5cGVwWzNdIHwgb3V0bXNndHlwZXBbMl0g
PDwgOCB8IG91dG1zZ3R5cGVwWzFdIDw8IDE2OworLSAgIAorKyAgc3RhdGUtPnhpZCA9IGluYnVm
ZlszXSB8IGluYnVmZlsyXSA8PCA4IHwgaW5idWZmWzFdIDw8IDE2OworKyAgICAKKyAgIC8qIFdl
J3JlIGdvaW5nIHRvIGJlIGxpbmtpbmcgdGFncyBmcm9tIGFsbCBjb250ZXh0IHdlIHVzZS4gCisg
ICAgICBtYXJrIHRoZW0gYXMgdW51c2VkIHNvIHdlIGRvbid0IGxpbmsgb25lIHR3aWNlIGFuZCBi
cmVhayB0aGUgbGlzdCAqLworICAgZm9yIChjb250ZXh0X3RtcCA9IHN0YXRlLT5jb250ZXh0OyBj
b250ZXh0X3RtcDsgY29udGV4dF90bXAgPSBjb250ZXh0X3RtcC0+Y3VycmVudCkKK0BAIC0zNDcs
NyArMzQ4LDcgQEAgc3RhdGljIGludCBkaGNwNl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUgKgorICAg
ICAgIChtc2dfdHlwZSA9PSBESENQNlJFUVVFU1QgfHwgbXNnX3R5cGUgPT0gREhDUDZSRU5FVyB8
fCBtc2dfdHlwZSA9PSBESENQNlJFTEVBU0UgfHwgbXNnX3R5cGUgPT0gREhDUDZERUNMSU5FKSkK
KyAgICAgCisgICAgIHsgIAorLSAgICAgICpvdXRtc2d0eXBlcCA9IERIQ1A2UkVQTFk7CisrICAg
ICAgb3V0bXNndHlwZSA9IERIQ1A2UkVQTFk7CisgICAgICAgbzEgPSBuZXdfb3B0NihPUFRJT042
X1NUQVRVU19DT0RFKTsKKyAgICAgICBwdXRfb3B0Nl9zaG9ydChESENQNlVTRU1VTFRJKTsKKyAg
ICAgICBwdXRfb3B0Nl9zdHJpbmcoIlVzZSBtdWx0aWNhc3QiKTsKK0BAIC02MTksMTEgKzYyMCwx
MSBAQCBzdGF0aWMgaW50IGRoY3A2X25vX3JlbGF5KHN0cnVjdCBzdGF0ZSAqCisgCXN0cnVjdCBk
aGNwX25ldGlkICpzb2xpY2l0X3RhZ3M7CisgCXN0cnVjdCBkaGNwX2NvbnRleHQgKmM7CisgCQor
LQkqb3V0bXNndHlwZXAgPSBESENQNkFEVkVSVElTRTsKKysJb3V0bXNndHlwZSA9IERIQ1A2QURW
RVJUSVNFOworIAkKKyAJaWYgKG9wdDZfZmluZChzdGF0ZS0+cGFja2V0X29wdGlvbnMsIHN0YXRl
LT5lbmQsIE9QVElPTjZfUkFQSURfQ09NTUlULCAwKSkKKyAJICB7CistCSAgICAqb3V0bXNndHlw
ZXAgPSBESENQNlJFUExZOworKwkgICAgb3V0bXNndHlwZSA9IERIQ1A2UkVQTFk7CisgCSAgICBz
dGF0ZS0+bGVhc2VfYWxsb2NhdGUgPSAxOworIAkgICAgbyA9IG5ld19vcHQ2KE9QVElPTjZfUkFQ
SURfQ09NTUlUKTsKKyAJICAgIGVuZF9vcHQ2KG8pOworQEAgLTgwOSw3ICs4MTAsNyBAQCBzdGF0
aWMgaW50IGRoY3A2X25vX3JlbGF5KHN0cnVjdCBzdGF0ZSAqCisgCWludCBzdGFydCA9IHNhdmVf
Y291bnRlcigtMSk7CisgCisgCS8qIHNldCByZXBseSBtZXNzYWdlIHR5cGUgKi8KKy0JKm91dG1z
Z3R5cGVwID0gREhDUDZSRVBMWTsKKysJb3V0bXNndHlwZSA9IERIQ1A2UkVQTFk7CisgCXN0YXRl
LT5sZWFzZV9hbGxvY2F0ZSA9IDE7CisgCisgCWxvZzZfcXVpZXQoc3RhdGUsICJESENQUkVRVUVT
VCIsIE5VTEwsIGlnbm9yZSA/IF8oImlnbm9yZWQiKSA6IE5VTEwpOworQEAgLTkyMSw3ICs5MjIs
NyBAQCBzdGF0aWMgaW50IGRoY3A2X25vX3JlbGF5KHN0cnVjdCBzdGF0ZSAqCisgICAgIGNhc2Ug
REhDUDZSRU5FVzoKKyAgICAgICB7CisgCS8qIHNldCByZXBseSBtZXNzYWdlIHR5cGUgKi8KKy0J
Km91dG1zZ3R5cGVwID0gREhDUDZSRVBMWTsKKysJb3V0bXNndHlwZSA9IERIQ1A2UkVQTFk7Cisg
CQorIAlsb2c2X3F1aWV0KHN0YXRlLCAiREhDUFJFTkVXIiwgTlVMTCwgTlVMTCk7CisgCitAQCAt
MTAzMyw3ICsxMDM0LDcgQEAgc3RhdGljIGludCBkaGNwNl9ub19yZWxheShzdHJ1Y3Qgc3RhdGUg
KgorIAlpbnQgZ29vZF9hZGRyID0gMDsKKyAKKyAJLyogc2V0IHJlcGx5IG1lc3NhZ2UgdHlwZSAq
LworLQkqb3V0bXNndHlwZXAgPSBESENQNlJFUExZOworKwlvdXRtc2d0eXBlID0gREhDUDZSRVBM
WTsKKyAJCisgCWxvZzZfcXVpZXQoc3RhdGUsICJESENQQ09ORklSTSIsIE5VTEwsIE5VTEwpOwor
IAkKK0BAIC0xMDk3LDcgKzEwOTgsNyBAQCBzdGF0aWMgaW50IGRoY3A2X25vX3JlbGF5KHN0cnVj
dCBzdGF0ZSAqCisgCWxvZzZfcXVpZXQoc3RhdGUsICJESENQSU5GT1JNQVRJT04tUkVRVUVTVCIs
IE5VTEwsIGlnbm9yZSA/IF8oImlnbm9yZWQiKSA6IHN0YXRlLT5ob3N0bmFtZSk7CisgCWlmIChp
Z25vcmUpCisgCSAgcmV0dXJuIDA7CistCSpvdXRtc2d0eXBlcCA9IERIQ1A2UkVQTFk7CisrCW91
dG1zZ3R5cGUgPSBESENQNlJFUExZOworIAl0YWdpZiA9IGFkZF9vcHRpb25zKHN0YXRlLCAxKTsK
KyAJYnJlYWs7CisgICAgICAgfQorQEAgLTExMDYsNyArMTEwNyw3IEBAIHN0YXRpYyBpbnQgZGhj
cDZfbm9fcmVsYXkoc3RydWN0IHN0YXRlICoKKyAgICAgY2FzZSBESENQNlJFTEVBU0U6CisgICAg
ICAgeworIAkvKiBzZXQgcmVwbHkgbWVzc2FnZSB0eXBlICovCistCSpvdXRtc2d0eXBlcCA9IERI
Q1A2UkVQTFk7CisrCW91dG1zZ3R5cGUgPSBESENQNlJFUExZOworIAorIAlsb2c2X3F1aWV0KHN0
YXRlLCAiREhDUFJFTEVBU0UiLCBOVUxMLCBOVUxMKTsKKyAKK0BAIC0xMTcxLDcgKzExNzIsNyBA
QCBzdGF0aWMgaW50IGRoY3A2X25vX3JlbGF5KHN0cnVjdCBzdGF0ZSAqCisgICAgIGNhc2UgREhD
UDZERUNMSU5FOgorICAgICAgIHsKKyAJLyogc2V0IHJlcGx5IG1lc3NhZ2UgdHlwZSAqLworLQkq
b3V0bXNndHlwZXAgPSBESENQNlJFUExZOworKwlvdXRtc2d0eXBlID0gREhDUDZSRVBMWTsKKyAJ
CisgCWxvZzZfcXVpZXQoc3RhdGUsICJESENQREVDTElORSIsIE5VTEwsIE5VTEwpOworIAorQEAg
LTEyNTEsMTAgKzEyNTIsMTUgQEAgc3RhdGljIGludCBkaGNwNl9ub19yZWxheShzdHJ1Y3Qgc3Rh
dGUgKgorICAgICAgIH0KKyAKKyAgICAgfQorLSAgCisrCisrICAvKiBGaWxsIGluIHRoZSBtZXNz
YWdlIHR5cGUuIE5vdGUgdGhhdCB3ZSBzdG9yZSB0aGUgb2Zmc2V0LAorKyAgICAgbm90IGEgZGly
ZWN0IHBvaW50ZXIsIHNpbmNlIHRoZSBwYWNrZXQgbWVtb3J5IG1heSBoYXZlIGJlZW4gCisrICAg
ICByZWFsbG9jYXRlZC4gKi8KKysgICgodW5zaWduZWQgY2hhciAqKShkYWVtb24tPm91dHBhY2tl
dC5pb3ZfYmFzZSkpW3N0YXJ0X21zZ10gPSBvdXRtc2d0eXBlOworKworICAgbG9nX3RhZ3ModGFn
aWYsIHN0YXRlLT54aWQpOworICAgbG9nNl9vcHRzKDAsIHN0YXRlLT54aWQsIGRhZW1vbi0+b3V0
cGFja2V0Lmlvdl9iYXNlICsgc3RhcnRfb3B0cywgZGFlbW9uLT5vdXRwYWNrZXQuaW92X2Jhc2Ug
KyBzYXZlX2NvdW50ZXIoLTEpKTsKKy0gIAorKworICAgcmV0dXJuIDE7CisgCisgfQotLSAKMi4x
Ny4xCgo=

--_004_MAXPR01MB4327A9B049374316163B77259D579MAXPR01MB4327INDP_--

