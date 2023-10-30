Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE8C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 08:40:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.73])
 by mx.groups.io with SMTP id smtpd.web11.144287.1698655213354271896
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 01:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=FcEqKtD6;
 spf=pass (domain: navimatix.de, ip: 40.107.7.73, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTtH3Jiw93p+t79OdmdKVD0DPHkyAMMHebINvmaeS9LrRo0c0i19YeN0eloD7jRBk1PibiLrcYKRz7ooW1UcOktAB4B71/NDbXPqI5TigdPQImdIaCzlSDKvG8oHrljtYICqTzy4PkS76vON9eEFlPMyWSivhXWJufpPen1DWolUbGzm9UQDxrE6DAkIb0eU7dwIvGTc9BESNOF78HrzWby4V+/3VacptOywJ5/ioXh41ANcIj8gljkDfNWxdDefW011rHHoma142xf7nS54KJeQK8b+7zzie4WibHMlSdw1JONe7dZoJTcDUDNHMY8mZT2qJ8OEXya0x8dzIQGY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoQPpwQjiso7YiJ+xWdZHnhuotRap4jAlZVyxTeb6Uc=;
 b=e+crHsTDtyjxziMipO12hm1LNExxaOUh1PLxx7PyHhGIT1gNiptkxDNi4n+0a6Y/dEXucIu2UTrskboogzSA773X8bOvyW7HOl5CA0wdV78p20vuOjebbxRrK2WVaPKVxNPu8wGHO7v0ct72viXppY1ydCk3OI0d32134982oxFqEHG+ZEYfjtUu2MoOv/ujqVGWgaEsx4Bughu5Jd8gwMhHvKtO+RMyNwwK0Aj6BubghXP+9GBXMLVKsUJyzP4t6rVByVrU88T2XaCA0SrLha1cr1MKR5srCq/zXP7wxEXSxl7MKPHTmAMPiciJQyQ+bD5YmWyuQuTtUBCUSX6EWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoQPpwQjiso7YiJ+xWdZHnhuotRap4jAlZVyxTeb6Uc=;
 b=FcEqKtD6A/rZfuWHRcUbjENkvWIcS7K34eivCJS0uGCuThNYSjrefErVoZ9616zFSUz5J1EE9PjE49acSQsIZM1rkPXD93kbuxwLoTK4tO6+qj0g7SgCj+xI5LMAKazO7UrP/JsxPOdaYOC5aGp4Y6+E5/lleVMUkZyV9JUgdIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by GV1PR01MB10640.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:15e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Mon, 30 Oct
 2023 08:40:07 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 08:40:06 +0000
Message-ID: <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de>
Date: Mon, 30 Oct 2023 09:40:05 +0100
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
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|GV1PR01MB10640:EE_
X-MS-Office365-Filtering-Correlation-Id: deb8f2c3-03e4-4a2b-fe9c-08dbd923d1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lyiDmRJenN5jd2xYg6+Z9fZGgyP6daJjgsgn827oMjv7SUkhCqGqQzrmh5sSIswrumIQgcrjaMlgv9WZOGjxMCcmiq0C9v2mkpkF4m2Kn1Q95Si+L4aqAqRLZ69yD2SO4VuF/KLA2L3o2l7sBpCJskl/rTUfwapDJK7LGHT0CoP8nj96NcKKYHw61Ry5hxAN3dq+zGqJdvtCnZGCKcQppLwVo+jybcjtVDnxL9WXe8dIvxiPdSIZT6c90ENn+bhOJ/OXxwRgy9PDYNnZsBHFQgfpmtlpF0VUuinAV4n6fbjn1R1sgZhPzcRSovhC0YTdLF+Y9sPfMCWYQVxNuxzCj3NGq8OpWcJBCIa7YmXAMcbbVTqwya8Xl4sgqWFE3ZKcjeB04syOKFiLmWn56NhLVzOkXylUHcrsuJc3qVWP6klf0gOVP6TKzACyY358oe2dZ/TOo3D7BSyYGEQDRYfx+hCTOSH/Tgg3k8lpjj9oEq5y//rzaBdaJmyGfpTdfHnJxADrsS2qk+mNFiTPCmhoJ/dRS1t5F5l8zYXCUSPhCM4+4gT6g00KNvtLt8RK1qzvHz+4CUgBRf4wM8mZjMsLx4gMYDWtf94xU96CaryumX4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39840400004)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(54906003)(6506007)(66476007)(6916009)(38100700002)(316002)(6512007)(53546011)(6486002)(478600001)(66556008)(2616005)(66946007)(26005)(5660300002)(41300700001)(2906002)(8676002)(8936002)(4326008)(31696002)(86362001)(36756003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VsRL5QBclQeIJMVKvsimggIkGiDB/JFH8fZFoRJWYtdVa4KtjCEfHKj9RSV3?=
 =?us-ascii?Q?9ufZnjN6S4kXftef3Tu+WtHodJ5HvEq2M3ofEChrlcBp+kxg4Puhq2i7d2DE?=
 =?us-ascii?Q?COXuooi81G1EbGoaIvnytwgU+OzZx+QHGzRoEFZz0726zTl9Wi3k6/tNe7Xe?=
 =?us-ascii?Q?2y2o54V+ZaYVjTrRjnEBLgmyFhgH22QiwRMLlXYOJ1QpSIEvBdryov17BPvT?=
 =?us-ascii?Q?YwsaFOTZ3DwO/hiinWkelnZ5qemWCn2Kc+TRxL3NQY6LbWdFOPMN1SN4fH+a?=
 =?us-ascii?Q?+IV8AymUCKxt72e2SJ5rJ1EzRwjvuGHvw3nCaUumrRaISxka6BG4iVm9W+Xo?=
 =?us-ascii?Q?DvuFApOunwGwr3nwK5U10tmSStUE6vYDy1qyFySWcDMlx+PaIYH98Kac34mY?=
 =?us-ascii?Q?yV5Zx28mJpzdSw2WJDVaFODxAg02XLlaSBmvrAcPk6VlNjDNz5EIc8k2UaCK?=
 =?us-ascii?Q?jaE/oziTjF3uxiTOMZhT9LxqdWHAIeQZu3rAbyy2Sz6zdaWKWsqnMvh94FaY?=
 =?us-ascii?Q?svEhIi67zC1tPmjRtVoJb3T8/EzbW3W6+DGdEoZDeX4rUXFROLzxD2+v2vhH?=
 =?us-ascii?Q?i5PO27A6cTpldM+ifQWn49slMVjZbJ+xBViKjQdFv0byCF+LyL7KxOz1O0lr?=
 =?us-ascii?Q?tLjwU6+OcYy9b1XZGZOgOjiXbIoXhOQrZXMjtA186hFWhPrDD2j5/pf36jd4?=
 =?us-ascii?Q?BF+TnxTeVbg3eOeQk4ib1+aR6cnYxX8YoIMmeJr4uMDJWS24Nff+w3OpZb65?=
 =?us-ascii?Q?jqsZsiR+huqUPHYoF0X7mQg/Rw36mvr7h4iaVClNJ03i4CbUGv5yLzckn3eV?=
 =?us-ascii?Q?LbjWOmA5yTSKIjONhdjoqysVnhDwJLIDdCqWmp80mgQPAS9SJ+rju/8f6n1h?=
 =?us-ascii?Q?El5silwCdpelBL66FWjWCh7swZyYPfRdG8//1+cUU4ZCaWiSTa9tokH3PU0x?=
 =?us-ascii?Q?0cuYfJfsac9do4e/yq5bI/chCsc3/wBKtrFG9p3qgip2x8JEzH7L+hmUYWa8?=
 =?us-ascii?Q?7yyNtmIe2eagrWjbUQGk9ok/MHYSkSV+c4lwX82i5+qA3+3G+cLAm0hTIejc?=
 =?us-ascii?Q?imydR85UTgnMCYQwSV2siJKZ4+aE2pY5kwvSzmOlmmzh332DW6A/FtPuW/uu?=
 =?us-ascii?Q?N9KJ+gQWoP0HHJQDzQ5fh92XgZFyxLZtZ6DYKExg1Du6JpaowCt4UPOjIi99?=
 =?us-ascii?Q?NTm1vfn9hEuGps/n8uo6r8wDlp0OpaRY/zOcly7oX/coKtesUZRQgNMaSEwo?=
 =?us-ascii?Q?ojmcTq9qY/D+WvEzwivbCSw6gshQ+Su7o1tWKE9g87X7ACYXtQGd8k+0Kl3E?=
 =?us-ascii?Q?y+dJMvlshzjsbgYJ2l4KcfTSmzGzI8IR5MFjmurNDe4yu+n/h8NaHOyTpgsD?=
 =?us-ascii?Q?7QwDesMM8tQpAX1G5bI8TFNjBqt9BVgw5Z0VCh8ydRb71eN+y60Tc/PyidZm?=
 =?us-ascii?Q?uhSS2ToX6jm+SxHQz8JM1FSmkXVQ8tGGM0WFycWzQUW7IHKkXqIXjIAE6PMK?=
 =?us-ascii?Q?tBMCVlf+GzGfD19ONuG4bbqtk0RRZGCw/nehhIoLoWXkwslMmNkM2mUQU+gS?=
 =?us-ascii?Q?HsaCY+5VBMtcy490kMITvdqBKZY5ZJldJ9pVxp+vyxnoliVrwLZ+rUnhrsD9?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: deb8f2c3-03e4-4a2b-fe9c-08dbd923d1a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 08:40:06.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Up3Syoiedm372CeMmDfBr/FfsQt/kJlijcIfKsEhzWIbrn1ymsWk9lTIZHYvd6Gc2FjOj8Eswtl03NrpxlOcO9Fbmn+vQ+PQqTsiIDpx9p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10640
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 08:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105790

On 26.10.23 17:25, Bruce Ashfield wrote:
> On Thu, Oct 26, 2023 at 7:16=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@na=
vimatix.de> wrote:
>>
>> On 26.10.23 10:34, Jose Quaresma wrote:
>>>
>>>
>>> Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu no
>>> dia quarta, 25/10/2023 =C3=A0(s) 18:18:
>>>
>>>     I wonder if something like below would help
>>>
>>>     diff --git
>>>     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>     <http://make-mod-scripts_1.0.bb>
>>>     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>     <http://make-mod-scripts_1.0.bb>
>>>     index 2cff48c39c3..6133721334c 100644
>>>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>     <http://make-mod-scripts_1.0.bb>
>>>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>>     <http://make-mod-scripts_1.0.bb>
>>>     @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
>>>
>>>      do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
>>>     openssl-native:do_populate_sysroot"
>>>      do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>>>     -
>>>     +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sysr=
oot"
>>>
>>>
>>> This doesn't solve the problem because at compile time the openssl is
>>> already there on native sysroot
>>
>> How about a patch like this:
>>
>=20
> I proposed something similar in the earlier threads on this topic (it
> has been around for quite some time, and is in bugzilla for oe-core)/

Can you give me a link to the bugzilla entry? I didn't found it.

> I ran into issues with some kernel versions, but we may have moved on
> far enough that it is no longer an issue.

Do you remember what kind of issues these were? Possibly I can check if
they still exist.

Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


