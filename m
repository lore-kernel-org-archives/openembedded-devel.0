Return-Path: <rcalhoun@shotspotter.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.141])
	by mail.openembedded.org (Postfix) with ESMTP id BF401605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 19:26:26 +0000 (UTC)
Received: from CO1PR04MB556.namprd04.prod.outlook.com (10.141.73.23) by
	CO1PR04MB555.namprd04.prod.outlook.com (10.141.73.22) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Wed, 21 May 2014 19:26:25 +0000
Received: from CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) by
	CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) with mapi id
	15.00.0944.000; Wed, 21 May 2014 19:26:25 +0000
From: Robert Calhoun <rcalhoun@shotspotter.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] how to create a new layer
Thread-Index: AQHPdSJHBlG7sg6x/U2GftVgtQM5UptLJ64A
Date: Wed, 21 May 2014 19:26:24 +0000
Message-ID: <CFA27259.284985%rcalhoun@shotspotter.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
In-Reply-To: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [50.43.173.41]
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(428001)(24454002)(199002)(189002)(479174003)(377454003)(51704005)(57704003)(86362001)(99286001)(19580395003)(19580405001)(83322001)(36756003)(99396002)(83506001)(74662001)(31966008)(81542001)(74502001)(81342001)(80022001)(20776003)(77982001)(83072002)(85852003)(50986999)(54356999)(64706001)(76176999)(76482001)(2656002)(21056001)(92726001)(46102001)(4396001)(87936001)(101416001)(92566001)(79102001);
	DIR:OUT; SFP:; SCL:1; SRVR:CO1PR04MB555;
	H:CO1PR04MB556.namprd04.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: shotspotter.com does not designate permitted sender
	hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rcalhoun@shotspotter.com; 
MIME-Version: 1.0
X-OriginatorOrg: shotspotter.com
Subject: Re: how to create a new layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 19:26:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86CC8626AC8C3C44AD4401962F126C79@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



On 5/21/14 2:26 PM, "Richard Cagley" <rcagley@gmail.com> wrote:

>I'd like to create a new machine that inherits from an existing
>machine. What's the easiest way to do this?
>
>Looking through the yocto documentation I see "yocot-bsp create" but I
>don't seem to have that executable. Do I need to use this or is there
>an alternate method?

The script is in: poky/scripts/yocto-bsp

You don't really need it. The script creates a directory structure for you
and generates some files, but there is nothing magical about it; you can
create those manually using the meta-yocto-bsp layer as an example.
Machine configs are in poky/meta-yocto-bsp/conf/machine.

To make bitbake use your new layer:
a) add your layer to poky/build/conf/bblayers.conf so that that bitbake
knows what directories to search
b) set your machine name in poky/build/conf/local.conf

I would recommend putting your own layer into git (or scm of choice).
Switching branches on poky will make the build fail if your .bbappends no
longer match up with recipes in oe-core, so it's helpful to be able to
switch between e.g. "a version of my layer that works with branch daisy"
and "a version of my layer that works with branch master".

Rob Calhoun






