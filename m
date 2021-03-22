Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.86])
 by mx.groups.io with SMTP id smtpd.web08.11394.1616414036890012173
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 04:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.com header.s=selector1 header.b=geVyeas6;
 spf=pass (domain: skidata.com, ip: 40.107.1.86, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQwC4K02d3gIdiQJniJ4L0JTbSqLtbTaerCuzY8vj79Ku0nDaUZBUef7z+PTZRsfSqWojZnBAF76IKgxhR7mMUvnTWsNtVTr4nAIJQD8jxn9ZZmmK8r88H9v+YbcxgsieUTRf4oxvX1raEyRFZHpyx5fb1E8gNMdaBAUhjm7ors8FKRjwgNK9YVPWqkp1gxILNYb/2uYw3OKEJmt24gwgp9Z2JXyxtzMraL33fOQZhbHsvpNwZAmmRsjTGnK2IEFkdcnNrhaZSO7QH925a0yQdhTinV8GqjFX5tC3P53EXP4f0IP1y6kOhfiF+Lx2wCMELEY7trO5XUvgpfY9XW4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9mYHbAHqFmtwkQ4k0H3vRFsRlYxraxo51sZaCcWEmU=;
 b=PaYRfmfgMEMS2pwhvFeQP++dlYByDkVAf7a9LfMNus4Cl7mNEZtotXty0ymviH2KKX1Mw0N4czebX1KaqUvN5CP5j/1yfhsSV1mAJD4vNMA5EtQ7nCGJNsj4A7f0yg40QBWmblBmrMC5cPfCNMYDRrX/29koY9oDOHfIfvUUdddqC+TBYFXnr70Dg0Iq4WwzrcLCO9N+1hhTHKKJFxDq7i8hgzC1IDfALUxfBk68QgrHhb42i3JBZLfUuH1J0hRIHTTc5BGsfTTqmxH3tIRQniIHpD3Ea4OtxfaBxS3C9LgdpqTHxJP2K4lKqE0RvMXgojETY2uHy00+uDMP+o7sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9mYHbAHqFmtwkQ4k0H3vRFsRlYxraxo51sZaCcWEmU=;
 b=geVyeas61RiKxuWidLU/KdYN2ars0fJQEuaNhmJDbQR70waoG0MhnjEAc3yB5n74KRj2b5S/Q7hB2dVZFsomTKmeB2PQX6S2QdKM6qE2zse/D0Z2Jv9eKbYmg1c+1iPM9O3RUdrWGd/vkbRjLCJfCyer0WJDyEgVx83cwmZoKe0=
Authentication-Results: topic.nl; dkim=none (message not signed)
 header.d=none;topic.nl; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR0101MB2575.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:5a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 11:53:53 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 11:53:53 +0000
Date: Mon, 22 Mar 2021 12:53:48 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
Message-ID: <YFiFTHaVZUBoq7uW@brokenbit>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl>
In-Reply-To: <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:208:1::40) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM0PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:208:1::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 11:53:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81c8b12c-ea7c-4724-0450-08d8ed292a0f
X-MS-TrafficTypeDiagnostic: VI1PR0101MB2575:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0101MB2575B8AB32163B1D22FA51D7F0659@VI1PR0101MB2575.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3RpBheyCxCzlDg3q0URwByml9/ZxbJzi6IkFFNlWGeLxfDICpz1CtDjFiF1c0FIqYWhh7JYYC0wDIgS6YWDuVtoj5/wlAjg88RMBAPIohAcxnvgO2P6N7QKA9KqmM4TqKZ/VfH6zMwmD6u0Ku8zE17u72Kdq9kej1IT5TmsZeepRb75ZF5wEvRyVGdsbpHMZEjqv1X9ek91O01wi5IuKk7sIGH7D/sCoTM6RfhB76Pc1Kekto0Z+sRTm54R7Dr9xJK2iB7WvRXc6cPoCw3Fhf2nLM8tc77OvInrd92Y93uwwI/xhj6N9sY5RuRTMXNi+w5EDtLAey49swG+g5yTqoOLYvz7JoNR/SID/+I+Dqp4UePmkOMe1H0BTdOIiY4O/kwVocWSEVUKEEJPZuJ9K83heB7cy+Vi8FL3WMKU/rUVrdtMnG+pYAzJmwq1BMyXAlO1a47NO7ZsGBupGxruZF+es7IdAF7x11CV82NH+sX9FgFcdky8EZ3Ruuj1zZ4wReVxS58UCCw9a0knpilBnKdlhraJNFzzWCgQ4JWFoT1DA+Z2rE0ucUClberk3FsM9ZwI9oa+TSz1Dd/Z0lcXxYzJxU0vK0rSOK8cHTWNCSkOVAA4pqRdHv8dpZ+eTbhwjX7TBwzYOGbWXQfMY8YzyTsvyUj612AwQEZtLd8vWRHVrf5cz8T5RVFittvBpd3BizRHftKSm7HIqvK5IEzhbmHlu2h/qSO8ziZx9EPJoKlyyR0zttdHm6IzKMuoTMXi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(376002)(346002)(396003)(366004)(66476007)(66556008)(186003)(16526019)(66946007)(4326008)(316002)(86362001)(26005)(83380400001)(15974865002)(44832011)(38100700001)(956004)(6666004)(478600001)(33716001)(9576002)(2906002)(5660300002)(55016002)(9686003)(8936002)(52116002)(6496006)(8676002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lsZNYirqse8t48+QcDUxP59mKzx1O/7Eb16OS46+KqcAduu+mcecRQJjQ5Ss?=
 =?us-ascii?Q?kvAmaWQgYK5S4gM1ROrzTV31Scu+5nweCfOLixGRzpCYGbX2Hpo8i2BgBvsH?=
 =?us-ascii?Q?oimMGM+u25GVNNN2k06PBJVUcNwmY5tPf34/nwzqV1JWnHIeOznTJ3N+VsMT?=
 =?us-ascii?Q?ilTmh/Ctc5/IjVcgy0UYoVaWZ6HkMJxIN7SUShlKoIBIEfGbNeZPDhXtYwP6?=
 =?us-ascii?Q?t44ZXk6Ew2c7h7ddHzgEal2rnmHJdAtHV7aMQiwf2gPP9kvEOeiDmGWH1mD+?=
 =?us-ascii?Q?JdjfDxNOdgLp5tMMoz5hk4mhTAtrGnAfqD36eS0j1EmDQdVIRO5dOXWqE/ps?=
 =?us-ascii?Q?FsJrJaBWnzDwKtS8oYXs6uMfshlqRJ6ArsSOUsejy5EM2kLOyc7y/kdp63GK?=
 =?us-ascii?Q?y5hDehy1dVfcO5fu+mb4aq07eEA3jFvUYE+m+Y8JaWQaQvHVsAJRkThzoyXs?=
 =?us-ascii?Q?VJIjkCjlTsga4A9PNKUiEdUl2gVP+pt4N7hXRvJS4y4fD8dhe1MN6YoJ85wf?=
 =?us-ascii?Q?gwtUIjK6j/WOJ93KTaPqUYsMkFICkFSyfRq5TyLzkPZPVAmF4Nd6KJ4k/Kph?=
 =?us-ascii?Q?auqMgTvEp4oOinniX1oMVE+42QsCQcrXvgavK+N4c5Nntm89rCYS/GN+o3ID?=
 =?us-ascii?Q?Be2qppMzcoeb3OgAsCfjJTOOWJaAHbHetaiZtz57tykHHxGBzN2R8LW11f2J?=
 =?us-ascii?Q?IQXPxzX1I3q9fpUAm6SIHA6aqzxOHpXqldoHAnSxZw4jRgIaXaf6+NngViSt?=
 =?us-ascii?Q?aHcFU+/pUt+r6ICP4wjkSdqXmpnnI5epwPeDsUov0cnGKHYY2vcPCg12hWdY?=
 =?us-ascii?Q?K8YarIy1y+f20lYuD9KMtlC+ehjpkINUzobXgq3tl/RIWDPegNEz4eAKeGgs?=
 =?us-ascii?Q?MAjqzz6hZamqP4HMlXrKgEhYpIZ/3wvdlhY0ATxkosJ3p4HWzXnhP528W3Nn?=
 =?us-ascii?Q?5SkwbX4BpOr6FTMPvy502HpvslIWA8sCF66yi7Lg8WAs+p4V2XJus7AnjXsc?=
 =?us-ascii?Q?nZacVDsgDH6SLqrRE579KSLqck3PFpHD2V0kamimFNR2zwrlJQkicef8YJWV?=
 =?us-ascii?Q?YKa8bIXfSxtCa6uPbJYhj7mU0vHpchwz/2NuDgsgruhR5advk+FAnQeK5TxF?=
 =?us-ascii?Q?D1LSAjYhje1leFRIG+tTuCwavKSJt6gDlapOXiT2sqDphT9vIphNgs4q79PL?=
 =?us-ascii?Q?qkMezRtgVTOTEjBVD9g/emRHOtJyyQvYNFGB1TKtceYXvLYnILpz/72v3Lzg?=
 =?us-ascii?Q?H4d61es2VcKOAgmbdZo84GE3Zf7WtYer2pN5Tg5wxIThvl0o5KPEuoKyDMDn?=
 =?us-ascii?Q?xRUibcWo2uzzoM4BmP4+JgX+?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c8b12c-ea7c-4724-0450-08d8ed292a0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:53:53.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJe4Dm2nOIVIWU0pWedmtig9EhaGLHaeKtTWuCX3o00KrSONVbUMpDOwXmPuPD98MCJu0QkiutGhBHKQqbmBaz0P4RYRdk6odtZNFIxlECs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0101MB2575
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

which meta-java and oe-core branch are you using?

regards;rl

On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
> I cannot get openjre8 to compile. Any ideas what the real issue is?
>=20
> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>=20
> ...
> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-ma=
p=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/sr=
c/debug/openjre-8/272-r0=E2=80=99
> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-ma=
p=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/sr=
c/debug/openjre-8/272-r0=E2=80=99
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.m=
ake:228:
> recipe for target '../generated/adfiles/output_c.o' failed
> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.m=
ake:228:
> recipe for target '../generated/adfiles/main.o' failed
> | make[6]: *** [../generated/adfiles/main.o] Error 1
> | g++: error: unrecognized command line option =E2=80=98-fmacro-prefix-ma=
p=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/usr/sr=
c/debug/openjre-8/272-r0=E2=80=99
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/adlc.m=
ake:228:
> recipe for target '../generated/adfiles/output_h.o' failed
> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
> | make[5]: *** [ad_stuff] Error 2
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/top.ma=
ke:91:
> recipe for target 'ad_stuff' failed
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284:
> recipe for target 'product' failed
> | make[4]: *** [product] Error 2
> | Makefile:230: recipe for target 'generic_build2' failed
> | make[3]: *** [generic_build2] Error 2
> | make[2]: *** [product] Error 2
> | Makefile:177: recipe for target 'product' failed
> | HotspotWrapper.gmk:44: recipe for target '/.../build/tmp-glibc/work/cor=
texa72-oe-linux/openjre-8/272-r0/build/hotspot/_hotspot.timestamp'
> failed
> | make[1]: *** [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/27=
2-r0/build/hotspot/_hotspot.timestamp]
> Error 2
> | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u-she=
nandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
> recipe for target 'hotspot-only' failed
> | make: *** [hotspot-only] Error 2
> | WARNING: /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/=
temp/run.do_compile.9267:189
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../build/tmp-glibc/work/cortexa72=
-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> line 189
> | =C2=A0=C2=A0=C2=A0 #2: die, /.../build/tmp-glibc/work/cortexa72-oe-linu=
x/openjre-8/272-r0/temp/run.do_compile.9267,
> line 179
> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../build/tmp-glibc/work/cortexa72-=
oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> line 168
> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../build/tmp-glibc/work/=
cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> line 163
> | =C2=A0=C2=A0=C2=A0 #5: do_compile, /.../build/tmp-glibc/work/cortexa72-=
oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> line 158
> | =C2=A0=C2=A0=C2=A0 #6: main, /.../build/tmp-glibc/work/cortexa72-oe-lin=
ux/openjre-8/272-r0/temp/run.do_compile.9267,
> line 202
> |
> | Backtrace (metadata-relative locations):
> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/logging.b=
bclass, line 72
> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass, lin=
e 56
> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.bbcla=
ss, line 65
> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../oe-core/meta/classes/=
autotools.bbclass,
> line 243
> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
> ERROR: Task
> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile) failed
> with exit code '1'
>=20
> --=20
> Mike Looijmans
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>=20
> Please consider the environment before printing this e-mail

