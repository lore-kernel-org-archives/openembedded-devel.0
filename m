Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E455C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:05:08 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.85])
 by mx.groups.io with SMTP id smtpd.web11.4255.1707735902314007480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=PQJDXlEA;
 spf=pass (domain: arri.de, ip: 40.107.249.85, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWbEUhytFVbDtYY7QF0nhH7McXX3YVg5RAULIf+rWW791rd/cfphzDoVIsxIUU87vjlAMlalUCDXtournNDl+iH7XeyBwvwBu+StNI8meCjkxcbQvVU8Mtuv6/5TfxFzmkMeIROv1W7F681Nvi1CGS83FvaHQDqnEVzkCdqom/En6qe5SPf5qmq76zJ1NbDN1IjHNZBhZCpQIgAyB4tUSwqhQ03Sc+ll9zLEvDNyCaXUHUOKuMDRmwNDVnH8O2fJtm6BPMFjC/9OQ0y5XY+o6snPR+HvABvSXqcSZqJ5IslyeYIOT38kFcxkMzIK9098FLGBuiqit2dsqPyCmJacdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsZPk4W1FscEAYj3l634hLuWzAR7IoEA9zK+DLP4Fgc=;
 b=XwlIK+2Kz8SYclQ0YtDV3jVwGpAxH7BVbEyAQqUwwnXKacicUmBj5IXzUgs81uBzmcv77BByWn7tiBcZUeq37GJGbpwutltAkP8HtJEzH/ZaFva+Ee3ROpJiko5w3J5FWCc8OliSl+jTh7o9sqF9hlWujhD27+k9HimHefjtfCmSQn8bmi1XTT2upC1tFHDmR8GFgP+FTnaE3hCIT00n1YOW/OB6xI+2P/pfDZODTwV/5NG++vT0Mea3gdtAO6B6Rwo+jSlO/Dx6zG13MOyMNUzInWb2XKFoJ4SFDP14P/xyP3hYBj/XuxT9Ez2isHjmzgYhyp2hmnH8FVahJihnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=google.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsZPk4W1FscEAYj3l634hLuWzAR7IoEA9zK+DLP4Fgc=;
 b=PQJDXlEAwROCn3LSSOffo9DG8DSMTj8pbwJzF407vawv0/BpGFW37n1yITyvZA9it6K55gbalEwatltYmkh3T/wAUv2MmkFQ3lI+nj/kciKS3tHjMf91g8lHRQtLoNEif2EXszOukgglbvw1UGXK5pyxlQKi799b/lqnH87u4ww=
Received: from AS8PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:310::18)
 by AS8PR07MB7063.eurprd07.prod.outlook.com (2603:10a6:20b:25f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 11:04:59 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::d4) by AS8PR04CA0013.outlook.office365.com
 (2603:10a6:20b:310::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35 via Frontend
 Transport; Mon, 12 Feb 2024 11:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 11:04:58 +0000
Received: from n95hx1g2.localnet (10.30.5.105) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Mon, 12 Feb
 2024 12:04:58 +0100
From: Christian Eggers <ceggers@arri.de>
To: William Kennington <wak@google.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] nanopb-runtime: Enable shared library
Date: Mon, 12 Feb 2024 12:04:58 +0100
Message-ID: <2735292.mvXUDI8C0e@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAPnigKnLjhfzOpXTAtE9vcn9q8AuB192mXYFxAyXWxq4ramTOw@mail.gmail.com>
References: <20240210005921.1909326-1-wak@google.com> <2723178.mvXUDI8C0e@n95hx1g2> <CAPnigKnLjhfzOpXTAtE9vcn9q8AuB192mXYFxAyXWxq4ramTOw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.30.5.105]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AS8PR07MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 74378216-808a-4033-3c17-08dc2bba7401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LSpfNVwy+4u1Ci74SNMyhhvYhyObWeooJyqOrpRR2w8D6JyVBJ/QwkXcqEO52woBcCHsDMyh9QzeJAfWrTO+RetwTBcIJBzzmvw/05abx5usX6Lnc0NJmO+Qr9wIXozRuimIKyA5RBqyNEO7seKDkeUsV5Kq9lgMRcmA68CxP/bvLewOotcEHtkVtPXYzKm0YN5uOUbzBIm3LiBsyWD4NbTRERWUzjoAtsHyiXF/YyN84r9miWP8WVecJQkwXfb07H540OlhCntJBq4LXCDbA+jVcr+PO32kx+uQ4L+UzCvHQxLIkblr/TsvSw+tRa6eIPAtaPxz3EuzXc/WFeZn35FxFItfioRTszymzYiVDvvW/LKQAWJo2Hq4FELQnJoyY6yXX3dqBYx1arIAJGe6SJM4UhoXVPvLFdUjmjFOJomLuJTbmB6GiBv38mNM/0lsfSOaK536/iHYsQ2Rli9pdq8oICIfoS2SwDL4k18m5Hr/R3SDmdmf45aSfDs4aOe98gVRjcZo75TLywl+2XveUQfufvDwRhHZRDfigpezEVSnI61YvuPYn5Mnq+7WUxlTzqNacqoaLPizb6cH8OO5kOO+BA5belc4dc5agwppkaU=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(46966006)(36840700001)(478600001)(53546011)(9686003)(36916002)(26005)(426003)(16526019)(336012)(9576002)(5660300002)(2906002)(6916009)(70586007)(70206006)(4326008)(8936002)(8676002)(41300700001)(316002)(82740400003)(356005)(81166007)(86362001)(33716001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 11:04:58.9604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74378216-808a-4033-3c17-08dc2bba7401
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 11:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108708

On Monday, 12 February 2024, 12:00:22 CET, William Kennington wrote:
> On Sun, Feb 11, 2024 at 10:07=E2=80=AFPM Christian Eggers <ceggers@arri.d=
e> wrote:
> >
> > On Saturday, 10 February 2024, 01:59:20 CET, William A. Kennington III =
via lists.openembedded.org wrote:
> > > Some users would like to be able to share library code between multip=
le
> > > applications without embedding a static copy.
> >
> > Some CMake based recipes have a PACKAGECONFIG for this:
> >
> > PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF"
> >
> > Particularly for permissive licenses I personally prefer static linking
> > due to performance benefits.
>=20
> You could still statically link if you want to, this just builds both
> sets of libraries instead of the static library only. I don't mind
> adding the option though.

I didn't actually try, but this sounds fine for me.

=46rom usual CMake projects am I am used to get either shared or
static libraries, depending on BUILD_SHARED_LIBS.

>=20
> >
> > regards,
> > Christian
> >
> > >
> > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > ---
> > >  .../meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb  | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nano=
pb/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-dev=
tools/nanopb/nanopb-runtime_0.4.8.bb
> > > index e36abf808..e43931a4e 100644
> > > --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nano=
pb-runtime_0.4.8.bb
> > > +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nano=
pb-runtime_0.4.8.bb
> > > @@ -2,6 +2,7 @@ require nanopb.inc
> > >
> > >  EXTRA_OECMAKE +=3D " \
> > >    -Dnanopb_PROTOC_PATH=3D/bin/false \
> > > +  -DBUILD_SHARED_LIBS=3DON \
> > >    -Dnanopb_BUILD_RUNTIME=3DON \
> > >    -Dnanopb_BUILD_GENERATOR=3DOFF \
> > >    "
> > >
> >
> >
> >
> >
>=20





