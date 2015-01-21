Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 84895726CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 09:49:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 01:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443107996"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 01:35:58 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.81]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.141]) with mapi id
	14.03.0195.001; Wed, 21 Jan 2015 09:49:16 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Query on meta-java layer openjdk-7-jre build
Thread-Index: AQHQLW6aQjfPmvGY+kWqwXu3sx6BBZy7CpYAgA9ZDJA=
Date: Wed, 21 Jan 2015 09:49:16 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4193D5@irsmsx105.ger.corp.intel.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<20150111152441.GD2465@mail.itconsulting-heinold.de>
In-Reply-To: <20150111152441.GD2465@mail.itconsulting-heinold.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Wed, 21 Jan 2015 09:49:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Henning, Nikhil,

If there is indeed a qemu issue (I assume you are talking about qemu upgrad=
e to 2.2), can you please file a bug report in YP bugtracking system?
Thanks,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Henning Heinold
Sent: Sunday, January 11, 2015 5:25 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Query on meta-java layer openjdk-7-jre build

On Sun, Jan 11, 2015 at 12:44:58PM +0530, Victor Ascroft wrote:
> Hello,
>=20
> I have OpenEmbedded setup and using the daisy branch. For the=20
> meta-java layer I am using the master branch of http://git.yoctoproject.o=
rg/cgit/cgit.cgi/meta-java/.
>=20
> For our embedded modules we have our own meta layer. I am trying to=20
> build an angstrom image with LXDE.
>=20
> We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most=20
> errors seems to be "not declared in this scope" errors. Are there some=20
> definitions to be declared in the conf file, so the build picks it up=20
> or is some modification required to the source with a custome patch decla=
red in the bb file for this?
>=20
> Not much knowledge on OpenEmbedded. Also can someone explain the qemu=20
> segmentation fault errors?
>=20

The segfaults comes with the latest update of qemu in openembedded-core. Tr=
y to revert the commits on your local branch for now.

Bye Henning
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

