Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.54])
 by mx.groups.io with SMTP id smtpd.web08.11961.1616416606321438216
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 05:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.com header.s=selector1 header.b=TzankMPe;
 spf=pass (domain: skidata.com, ip: 40.107.0.54, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw5iCwOVUWHHKjzlhYOhBUsDVpQ36YXX5rGTL158LNN4lBaqsrDjstpCd6vUdg/HTqkG+86S0ABKKTvqzGxE6QlK5p/fL1cEbn0HVhbEfCMXIbJcRGv0t3BA3OcYmyawUxdM1xL9d9m2VNYq8469/vaN/pDoBtC7XX45NHw1gN8xViSLf9SbOn2NugPnrEFAUXVRZEtw1D0R9zQpCcK9j9BRYcq28VwweJrZgIrfEFIbsmRI8GXMEJEXRbIZe7UdIJi+5QhfxJvCU1PgS5zWVWc9WYltHN0I6UicEvT7CiB+jqqrQ1MIintu7Yzh6IeqeMalFk80hYflsvtkwcy6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFEXsyeug67XhkzMV7Ku0O7Y9tumuXNsuTkiA7Ii1i4=;
 b=cgXvlx7/GEPzLi1XWR5C+NpVoTscCG4qaJwvVo73PQ1BAG5ZfnaNrQWswQjJb1IFLkTfbK8JcOIK9OyFH7qSgY75YM9x5nb3boGyXcb1MJjD1dFn5Fs0jMdPomU6R/hEHBSzBHguAM9TMXxUkFyRyw8LAIgelOR2gaffLpEhqP/tsQ3GbuRdUKSYI8sVd0GiS5Rq5vN9HV16NhdymxZBgcYu9/J50XarALMuLYG1EgHGyWKBoHXfYnX1nI4GKFzu2o9JC7QT9ufTzMg/wdokPRgFd9rmSRBAe9W8tO5Nu/Tj88kbV7beks4m5xQZFNGUstH4sb/AHHHktHF/W5fCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFEXsyeug67XhkzMV7Ku0O7Y9tumuXNsuTkiA7Ii1i4=;
 b=TzankMPeztT0eD8dxPAZVHoaEkagWqXRK1ed7fu2FzoJY/xqY1uUOn/tyADm6ddQV/164q7iJkuSMaWx5AyhTpeHIyrbLy9PC9t09iMDmS1/x3P7haVmYBqLIq9TOKSA9bO4l6fcAw9NRtH63wbRT0pM++QaCu0+6UV7AHbVUWA=
Authentication-Results: topic.nl; dkim=none (message not signed)
 header.d=none;topic.nl; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB5421.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:36:42 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 12:36:42 +0000
Date: Mon, 22 Mar 2021 13:36:39 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
Message-ID: <YFiPV45+9llagCwv@brokenbit>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl>
 <YFiFTHaVZUBoq7uW@brokenbit>
 <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl>
In-Reply-To: <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM8P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::23) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM8P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.22 via Frontend Transport; Mon, 22 Mar 2021 12:36:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce62544a-bceb-4931-7437-08d8ed2f2586
X-MS-TrafficTypeDiagnostic: VI1PR01MB5421:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB5421E7D7CA0CEDD64DB707E9F0659@VI1PR01MB5421.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M78o/wvr3Jcl3WQt8HYmZx3C2HHHDi/1CqsC7OsB107kLTcQ17VFqXPr/3wYMvhJJ6uZXXvw60WH0yf5iYzzo4w9Joqtq7oswOKdcoJTuKK/fvUJOmzmYT6QFblj9ApQwNa9xI1+cVQwAMiVgmnAzFiqs2aC1T2RIzzF8/mJILIULc51QAKyzdPj8WQBEK8OJyDlOZvP3sazq2lyja/o2lMyKTsDcZaDRjqRDuG0HCUAWJ8L2YNptqW0CTpvCELxXQakrGmf/YMhWvFQ3BFdg+yPkur9UafiWRKekgWrq6PvkAb6TDG+DM2gM6yfHJB9y6/7DjoKY9M97emjbvmEqUXwBiw7KYbaPjjmWuxDTaoKcJxlcpehMsHOlEpQ3QMsLvKZvRqUms7hHsvlQkLkCdhs6ieS5P4m7wilviOn58oPrNYM2J0nF3XzKurLm7X+Ip291IEyVSnRzwUoheMxs74cFU20HRMQSxzL/dON8L3T08jp2tMY+xL7ck1s/GegNntLxmZkNyALNYRyimHIm1/IjRY01+x+6Iiw3IMTNIY44DZY43x0+yt+7GWIQUZwVPVU44LgH150x5UYQXJXNV4L4qpjwSz46bP2IfnaE0/XOKpo8l9A8cwVTakyX464qHSnmxw1YbfGH8cGzM0oDmxlE7mQaOxVmwcQdNu9g9n9u5dZSYh14rE9gfiWLfdmPjy0Sy/RIIB4d/ftj2mvYKSbobHdS3sGSfnPmY5uzCp9Iv22nuA/cBwBdcRPBP699F7rAua8OI+KGSNEz7u3Kw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39850400004)(136003)(396003)(376002)(5660300002)(66946007)(26005)(6916009)(956004)(9576002)(9686003)(55016002)(66476007)(2906002)(66556008)(478600001)(8936002)(186003)(16526019)(86362001)(4326008)(6496006)(52116002)(44832011)(8676002)(83380400001)(33716001)(53546011)(15974865002)(38100700001)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Y2dA0sCYQ/HRSzFzALgRWXIw+EzFo9rPSCkd6uOAfj6QE4pCjD8bvYnh1Ry2?=
 =?us-ascii?Q?4ryHjzwDznOAdwHEmZ5yWybC8bk2XrvTWe5alBKjtLdpGKUCQapQ4hvBadBd?=
 =?us-ascii?Q?BOezAs8tmBbybdfrZTtoLiUd9af4kkxSH5FRDxpxpImEpn02bRTOylFTPa4e?=
 =?us-ascii?Q?+29lI6yhOYceiCASdoFReDXjdUObzk66CpFvxjVqoGN3K+lp9+ZkDD8kH4Um?=
 =?us-ascii?Q?5gAlmhcKDIYfBM7O7zm4UE4y3wMG89KckKOO4XQvapCQjaP6zP6sY01jlglL?=
 =?us-ascii?Q?aSUXAnIaGrLJup3TAFnXKGAqQN29QN9RRiJbm7SjSczS7188AcIUkduhJocO?=
 =?us-ascii?Q?QQgKGY40exnEzK8Tkjqntrsz+kQ7hAy10Notw4c0cvnyZlKxBV3/VjbZG6hr?=
 =?us-ascii?Q?7zSq/3LAfCQKv2q2rMfFml93o0do4n5nBVUx8xMegVWMC/eimvL6HA2ymHmn?=
 =?us-ascii?Q?LjE/50wG4G4Fou6/jvq+VHcE0AjHPGoqQrlYjA3w0weD4OOla9i3Et2uqzWC?=
 =?us-ascii?Q?BRWsevSJcJWeyo5st/4PBw6qWgvwbDpPNEFovYNoQR6K73dhCSMIAG4x0T5z?=
 =?us-ascii?Q?OVsSdAtPgFLjPThqutYsYa4pQAJZL71gZGJpOI9lW754hTo17hXC7pe/xu5a?=
 =?us-ascii?Q?cPFwMwUoVVsV1qtwSnbI3gQcW9v/MjJylnldEYdkLyvNtnIQCypa6wF39s8l?=
 =?us-ascii?Q?JiXu2ZO4CbCShcSbojbpOFbY2CpHLjI8p7e5QrS3Th1cmVpqEuAtEBvA6tRh?=
 =?us-ascii?Q?dDrOzeVMxl7uV4sdQrxZPRecIuZt7HFpfYihgkXen0a1s5edEQfvqtJtpm4N?=
 =?us-ascii?Q?uODq9+BHkc/iFjut6JcyZoMMCgUJlm5kSZVrtxzsi5fEmIh8N9JBKtzkSC2e?=
 =?us-ascii?Q?fZiSeBy4+Bn0k4JMG9lUX1DyfKiigafxXRiEoOSD+zhOE+uPmgL7FhtLe84y?=
 =?us-ascii?Q?EfnZlvegc0KE/T1giUe+/kg1FTUJMp+miCxVwk1AmVkOB2h2pge6XVTx5yJ+?=
 =?us-ascii?Q?JZ39pniUvFIklZQoAPNDS0To3XWDw6rHzR3S+eMLpaDWdc4jr7EOAkc0TWaz?=
 =?us-ascii?Q?K95sm0hIfcglI1lTXebQ9zdHBQFv7oNsvtVkDeSQSnppEuOQLD5OXT6w1Fks?=
 =?us-ascii?Q?UbifqC7jR/3t2GjNxnBhtm/ug4V2aGMWj0LN1rRgyu7dj6P9XCeM8WG+lumG?=
 =?us-ascii?Q?f85FH67yeQTc7Hq+KY0pSjNf+GrN2vnzwafvZ3MPpfqGdhgHMJZzjlzeQgqG?=
 =?us-ascii?Q?IqVd7JKrecu6ENL11ffEf0FEcvgQ7HJseQY29AvRp0VPCTuQnmglg5xGkDTa?=
 =?us-ascii?Q?9mMleuTGAY2DZ0hgdyZjk+Hu?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce62544a-bceb-4931-7437-08d8ed2f2586
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:36:42.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXlBHS9/3TRoQ4wc9Qs4P6Q/j9TFPZN6reHw9sHP6X5LdaSXgOQGqy2Q/imjrNfN3U9ihrNjeJVBnif69UPWhJBP1cqSk/6IwsnqKdnDDNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB5421
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If I get it right these flags should be filtered out by the adlc flags
patch [1].

Can you verify that it's getting applied?

Unfortunately I don't have a gcc-7 host machine available right now =F0=9F=
=98=95

regards;rl

[1]https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/o=
penjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch

On Mon, Mar 22, 2021 at 01:15:14PM +0100, Mike Looijmans wrote:
> Both "gatesgarth".
>=20
> Issue seems to be that the build host (Ubuntu 18) has gcc 7 and the one u=
sed
> for cross-compiling is much newer. Apparently there's something wrong in =
the
> makefile that it uses host compiler flags for the build compiler.
>=20
>=20
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
> On 22-03-2021 12:53, Richard Leitner wrote:
> > Hi Mike,
> >=20
> > which meta-java and oe-core branch are you using?
> >=20
> > regards;rl
> >=20
> > On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
> > > I cannot get openjre8 to compile. Any ideas what the real issue is?
> > >=20
> > > Compile for 32-bit ARM is okay, but building for aarch64 fails:
> > >=20
> > > ...
> > > | g++: error: unrecognized command line option =E2=80=98-fmacro-prefi=
x-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/us=
r/src/debug/openjre-8/272-r0=E2=80=99
> > > | g++: error: unrecognized command line option =E2=80=98-fmacro-prefi=
x-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/us=
r/src/debug/openjre-8/272-r0=E2=80=99
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
> > > recipe for target '../generated/adfiles/output_c.o' failed
> > > | make[6]: *** [../generated/adfiles/output_c.o] Error 1
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
> > > recipe for target '../generated/adfiles/main.o' failed
> > > | make[6]: *** [../generated/adfiles/main.o] Error 1
> > > | g++: error: unrecognized command line option =E2=80=98-fmacro-prefi=
x-map=3D/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0=3D/us=
r/src/debug/openjre-8/272-r0=E2=80=99
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
> > > recipe for target '../generated/adfiles/output_h.o' failed
> > > | make[6]: *** [../generated/adfiles/output_h.o] Error 1
> > > | make[5]: *** [ad_stuff] Error 2
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/to=
p.make:91:
> > > recipe for target 'ad_stuff' failed
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284=
:
> > > recipe for target 'product' failed
> > > | make[4]: *** [product] Error 2
> > > | Makefile:230: recipe for target 'generic_build2' failed
> > > | make[3]: *** [generic_build2] Error 2
> > > | make[2]: *** [product] Error 2
> > > | Makefile:177: recipe for target 'product' failed
> > > | HotspotWrapper.gmk:44: recipe for target '/.../build/tmp-glibc/work=
/cortexa72-oe-linux/openjre-8/272-r0/build/hotspot/_hotspot.timestamp'
> > > failed
> > > | make[1]: *** [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-=
8/272-r0/build/hotspot/_hotspot.timestamp]
> > > Error 2
> > > | /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
> > > recipe for target 'hotspot-only' failed
> > > | make: *** [hotspot-only] Error 2
> > > | WARNING: /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272=
-r0/temp/run.do_compile.9267:189
> > > exit 1 from 'exit 1'
> > > | WARNING: Backtrace (BB generated script):
> > > | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../build/tmp-glibc/work/corte=
xa72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 189
> > > | =C2=A0=C2=A0=C2=A0 #2: die, /.../build/tmp-glibc/work/cortexa72-oe-=
linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 179
> > > | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../build/tmp-glibc/work/cortex=
a72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 168
> > > | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../build/tmp-glibc/w=
ork/cortexa72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 163
> > > | =C2=A0=C2=A0=C2=A0 #5: do_compile, /.../build/tmp-glibc/work/cortex=
a72-oe-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 158
> > > | =C2=A0=C2=A0=C2=A0 #6: main, /.../build/tmp-glibc/work/cortexa72-oe=
-linux/openjre-8/272-r0/temp/run.do_compile.9267,
> > > line 202
> > > |
> > > | Backtrace (metadata-relative locations):
> > > | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/loggi=
ng.bbclass, line 72
> > > | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclass,=
 line 56
> > > | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base.b=
bclass, line 65
> > > | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile, /.../oe-core/meta/clas=
ses/autotools.bbclass,
> > > line 243
> > > | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
> > > ERROR: Task
> > > (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile) fai=
led
> > > with exit code '1'
> > >=20
> > > --=20
> > > Mike Looijmans
> > >=20
> > >=20
> > > Met vriendelijke groet / kind regards,
> > >=20
> > > Mike Looijmans
> > > System Expert
> > >=20
> > >=20
> > > TOPIC Embedded Products B.V.
> > > Materiaalweg 4, 5681 RJ Best
> > > The Netherlands
> > >=20
> > > T: +31 (0) 499 33 69 69
> > > E: mike.looijmans@topicproducts.com
> > > W: www.topic.nl
> > >=20
> > > Please consider the environment before printing this e-mail
>=20
>=20
> --=20
> Mike Looijmans
>=20
