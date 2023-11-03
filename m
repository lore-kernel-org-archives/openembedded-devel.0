Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCE3C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:49:33 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web10.39172.1698997766423152863
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=N3lw03MV;
 spf=pass (domain: navimatix.de, ip: 40.107.247.46, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKD1jGR1eiwN1zyuW/MeNP41kRu+TfSNki1A2CfdvgeR1/YAaJGV6wQA0/RaIMAsSppAbZXYrPIn0Wd8W8kah63kJxzp1kT0GAbqPeJbrfKbjF1dZtPvIQ33CBPE7k0X5uUoxoSsJS+8G5s9r8PHu28ZxmnbtpUD2z2LvU5QNvNdQVZrfx8WeNVZTYYy/s++S3u9CYHdaYT6xlcMwwd6e2ZsDZa4pmMwnb9+fDSFhHvApMKyEdjMmdjieNf//E+fOVuZizlbWGeWfrLfo1dW1M33qx4HKWiWfMiasM0ShbSia0R3QEycTPgP0Qm8B7itRJb4H3K1Q+Dv1BqVk+DDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYxAQeIFYd5gaJPcXrTt750cpar88/KHrEjmHA1RmRw=;
 b=dCjEACr9n68mGJ4ZzNYObbCLD5VAJ9f134bVVj7sYega7XgTGll1HO1VGEjD+cJy+xhP5w2DwGlLeplLEpvJer+YVrRz8losPqKoOJ4akmYOp435m6D5dyaLRZW8ZBAuLK9GP0BW/4AAUSRrNqzJHmiLV2Uzr1Mj90e4s1vJrBfnrbwiPkFP61CMFjNxPFcGUPNYUEQiU9PK6jDudSaFY4YD5sq4MzdqcPgvs7XdB28m+DrNqGP7jv1yFwWXCzBc5rafAUk9X2epBJedVKo/E42m5BnOE+ZjeN3k3HB5f9BWPzIlN8oTSIUO8M9y1nwDVA5pm8PsFzPWqqxI3z1k2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYxAQeIFYd5gaJPcXrTt750cpar88/KHrEjmHA1RmRw=;
 b=N3lw03MVmsjEOGsZHR+hQ+CaSAXMjn/5VZsgdVZw//y8RzWe0ujUNOGP/lGER1hXjQ7uaLuTBgxK2sbbJpK8BDtP1cc0i9lAmztJmVRtDgFDAusizSdK2IWN1FCV6vo8ncs3HZ+KOPHOY1xM+V6kpPml4B7O9bynmzVJ74PB3Lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DU2PR01MB8719.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 07:49:22 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 07:49:22 +0000
Message-ID: <ad3674f6-60e7-4b35-9c3c-4814c42cac4d@navimatix.de>
Date: Fri, 3 Nov 2023 08:49:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
Content-Language: en-US, de-DE
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
 <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de>
 <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
 <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de>
 <CADkTA4MKV9h6ttdFEtKdiQ7jP8LfPbbWk8agqK9g0goExWZNmw@mail.gmail.com>
 <1792E56CCC9D9F4D.20486@lists.openembedded.org>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <1792E56CCC9D9F4D.20486@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::12) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DU2PR01MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f2baa7-d38b-4544-d1fc-08dbdc4164ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	av/yR45pL6ZRAeYGEKV6tazZPiVFAuJRBOyoaSbDQ+nuDdNC0fZLZObzCuhlL/yhMQw+oGg8HUe4gR9JkhLL9tWiain7VTeNq7XEIXq0P/8iRFaC9BjDLs05AfBS68DkbTw35E9wSPTN8p7wfCGO4NQ4+WR/x26v6DlIb7s/LVE2hoSvYAnUlqaJg2+RGrFLZwcBr7ZBMG6y69tzE/dOLtDzFKchI4ZK286CAp+im3iRtRZtQgJOccZ1xYrTeY4SWJnqPikvy53/5S/a92rKrUu+A1JIYjgs/VifxpEo8AuBkn+zDP0iV9ecVDvYNz8rBS775YQ+MGHY9DHMYXVLtC11jPLRGwyy3fHK7xLnh+kkD8PNa4NVoptCXWiz6KLEhf9XEVAbqWiLQv4xKX8pHcgFsqYd8PY0oyzyzO9ysPeEfvmPfhZLSZdpfrctO2XgnDe3ypSjwl5XmjG+0OTPKfc8LbRrjsZ6Oj2lcZLfssN/qbho51WnmiUAaCm4w5l7PjDspI9OGBdydqMk55b5AwMATU3NC1AP/VLeo0GdcjfH+y26Rap3YioU0Gtnt6eQUhKdYKivI/q+NliIjpdoYJGe6qISBY3P3PdTVynrDJabPasIK5EqTXpw70Xmi/xR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(39840400004)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(31686004)(83380400001)(8936002)(8676002)(4326008)(2906002)(41300700001)(31696002)(5660300002)(66946007)(86362001)(6916009)(316002)(66556008)(66476007)(54906003)(6486002)(478600001)(6512007)(36756003)(6506007)(53546011)(26005)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZkNj7Y4NmMLKcODT71HQSFBRlm7ja9XJdg5UZLRNkkXfKZyqFs2nYwUl19af?=
 =?us-ascii?Q?hyEg2NMxNKycEDHaJdwFusV/DXWWh0SODVJsnTPYH0u2AJXllqokxZSWFUly?=
 =?us-ascii?Q?3WU9LNHLgdGDTMvHGq6AYekcWExkTGHY5MSdo2pEj7ykm2LNaxW1JXopyWvf?=
 =?us-ascii?Q?0eacgGU4yodlI+YchqXUFmWKgQiExxlPHMTfH5DWJxIxPZi9lhS/ah0L+K4l?=
 =?us-ascii?Q?xupfXBaeLCHMMElRwVqKhUcqTiO/QuwhB4ysKsG2fA60AocRklPpqYUthcFx?=
 =?us-ascii?Q?qB2Hp5HldyXZCbpmfahVyh0g19aWuINVv9EJSfRXHyDN9TW7WaazweaQOpIc?=
 =?us-ascii?Q?dCDxrbFX3JnvXQezwe2VulxEKvh1SGE/V5JL1pW/ye3FYuIZasfe3qsbsOkn?=
 =?us-ascii?Q?mTe+HPIID/8RYlWfWCgKWaoyZqTPytX9qi/8hEQ/oF9SVojo4IJ5NSu/pd2z?=
 =?us-ascii?Q?cHjHhRZTauCHifK4F3Z337qnLRyZaDY9y0c/mzW+bfFwLFv/yilRHjnMKymu?=
 =?us-ascii?Q?2uD9nal0ULp2Yl9nG1ioHd2YKIjsk//l3Bt3NfYlBNR5efE6z9eLDErcyT6J?=
 =?us-ascii?Q?0ExNhtRJivaWC5/cjGIqqGrOfsc0aRFboJ692LeNhWiyRVxfnTUIbubeVIeZ?=
 =?us-ascii?Q?RuztE+Ow+z26JUBlfwpDC1VVNPxCUwSeB5duSkir2dJdl1ieON/LrMYFS7kK?=
 =?us-ascii?Q?LBDS00LWOkEOsMjDjjzuJxbzOpDLIJ/xQgT5LB+5CSZoSX0ke3Qoz2/Cq+gA?=
 =?us-ascii?Q?O40tGwMYBFao0wmUM/+gVcTMasGF+v2OkS69Rs/obPCZmCoUMZ827izzDyRz?=
 =?us-ascii?Q?XKEe0Poku7gJf86kW7YT/vMe+Nv9c5JjQ+9/1+acwpyh4AdIqFqAZXfX3i3u?=
 =?us-ascii?Q?Vfxa3XA6/j3HP9VgSJ/UeT/Yqq3V90c4NP/TDR9SCkPqRR/hOa3j07iykevz?=
 =?us-ascii?Q?iI7tfgVCIgXpanG63dWWpzLB2IMJBAv9KHRdy6je0BXJxcFxOspB9W37XWxA?=
 =?us-ascii?Q?OGFgh3E479StMoBG9U8xWy9RI2iIniYMog4L8ohQJl8JwLm9MMDu7iJde3CE?=
 =?us-ascii?Q?aBQBOrBeW/EadzNX/46P2q8ynaYAWRqk0kZrQcLVuCMopQY0Tktm6kjKW1aZ?=
 =?us-ascii?Q?59YJXlR9XJ9drTGEddBGndm1YzC6RC3/u5zk9oR71PtIWuKhMOsvGaG1dxDd?=
 =?us-ascii?Q?vXYGjLQ58MgIYavxjYiBUohYo+rnYvnhCKMjD6QzjyVlabMcnz7ORLdE9Xnp?=
 =?us-ascii?Q?48ORLdj6UBiJGW5rinhcYkuNmck1DUv4KkYgMm1rSm7MKUv7PsSgvhql7ptA?=
 =?us-ascii?Q?JNeALhWzt5zzgaMknrSvav/hEAuE1mTEoLJHFcDNGoNcSHN5dEc1c2HvI3V6?=
 =?us-ascii?Q?uj/oz7s4zJ8YbUGjxuLPplJAdSupXiilyRDwNV17Ert/zmWTtUCRmYF076sY?=
 =?us-ascii?Q?3j81FJchfH28K8Eku7RIzLnnDVibLQCE0ZPtbARowuP1up6PoIVTplvSziSh?=
 =?us-ascii?Q?XTBq1/XEFyPV0Qm/27g/BZ9+h/bScR16fOFVSXRcNg+qATbRK+aajE4WaW3d?=
 =?us-ascii?Q?WCvR0CR/Z3B0gXoOBw/jdPTvzuNbFiOGJpewLfcrkz+NvbjqxxB9t522c484?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f2baa7-d38b-4544-d1fc-08dbdc4164ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 07:49:22.4738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGw29RosY/Pwo5XBE0jBZfIYldhVHzsIBGnqnaNqrRDk/VnPOjEuX3UJRTWYSSHZNb8I1w7vIVEztx4QkWw8Abrg7X29a4zhqIL4UxmVERI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8719
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105851

On 30.10.23 14:24, J=C3=B6rg Sommer via lists.openembedded.org wrote:
> On 30.10.23 13:29, Bruce Ashfield wrote:
>> On Mon, Oct 30, 2023 at 4:40=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@n=
avimatix.de> wrote:
>>> On 26.10.23 17:25, Bruce Ashfield wrote:
>=20
>>>> I ran into issues with some kernel versions, but we may have moved on
>>>> far enough that it is no longer an issue.
>>>
>>> Do you remember what kind of issues these were? Possibly I can check if
>>> they still exist.
>>
>> It was kernels older than 5.10 failing to take the r-path changes and
>> hence failing when doing the signing step.
>=20
> This could be solved by setting LD_LIBRARY_PATH. Would this be okay?
>=20
> ```
> diff --git i/meta/classes/module.bbclass w/meta/classes/module.bbclass
> index a09ec3ed1e..38e1c95216 100644
> --- i/meta/classes/module.bbclass
> +++ w/meta/classes/module.bbclass
> @@ -51,6 +51,7 @@ module_do_install() {
>                    INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware=
" \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                    O=3D${STAGING_KERNEL_BUILDDIR} \
> +                  LD_LIBRARY_PATH=3D"/build/tmp/sysroots-components/x86_=
64/openssl-native/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
>                    ${MODULES_INSTALL_TARGET}
> =20
>         if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers=
" ] ; then
> ```

Hi Bruce,

I would like to here your opinion to this issue, because you've provided
the most to the discussion. I would like to submit a patch to fix
problem; either the BUILD_LDFLAGS one or the LD_LIBRARY_PATH.

Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

