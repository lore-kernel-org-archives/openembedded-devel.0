Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 70D6861223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 12:04:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2013 05:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,818,1367996400"; d="scan'208";a="382058816"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2013 05:04:04 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.83]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.58]) with mapi id
	14.03.0123.003; Mon, 5 Aug 2013 13:04:03 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>, Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] lvm2: Add dependency on bash
Thread-Index: AQHOigv+qQUYKmgA3EOBonOLBxNlSZl3Kn6AgAXczICAAErhkIAJOcjg
Date: Mon, 5 Aug 2013 12:04:02 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF15E80DF3@IRSMSX101.ger.corp.intel.com>
References: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
	<20130726174345.GE3280@jama> <4071302.P2cxlv2fxA@helios>
	<97BD068FB200C44AA73C2B641F162ECF15E7F957@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF15E7F957@IRSMSX101.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] lvm2: Add dependency on bash
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
X-List-Received-Date: Mon, 05 Aug 2013 12:04:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>Prica, Mihai
>> -----Original Message-----
>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>>
>> On Friday 26 July 2013 19:43:45 Martin Jansa wrote:
>> > On Fri, Jul 26, 2013 at 05:25:29PM +0300, Mihai Prica wrote:
>> > > Fixes rootfs generation error if bash is not included in the image.
>> >
>> > With rpm right?
>>
>> If it's what you're suggesting technically it's broken with any
>> package backend, to some degree.
>
>For the tests I used rpm.
>
>>
>> > Find which script it has in shebang and add bash only to that
>> > package RDEPENDS, if it's something which isn't always needed put it
>> > in separate package.

From what I discovered, the scripts in question provide some of the core fu=
nctionality
for the package so there is no point in splitting them.

>>
>> Or if practical patch the script(s) to remove the bashisms and change
>> the shebang to #!/bin/sh instead.
>
>I've looked over the scripts and there seem to be 4 files which are using =
bash. The
>files are part of the core lvm2 package. I've used checkbashism and there =
are not
>many changes that need to be done to switch to /bin/sh. I'll send an updat=
ed
>patch.

I've taken a deeper look into the problem and it seems there are some speci=
fic=20
bashisms that are hard to replace and that might break the functionality.=20

I've sent an updated patch changing the DEPENDS to an RDEPENDS.

Thanks,
Mihai

>
>Thanks,
>Mihai
>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-devel

