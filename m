Return-Path: <erkka.kaaria@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D92975894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 09:09:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2015 02:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,217,1444719600"; d="scan'208";a="807325178"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 30 Oct 2015 02:09:39 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.116]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.150]) with mapi id
	14.03.0248.002; Fri, 30 Oct 2015 09:09:38 +0000
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for
	openjdk-8	and openjre-8
Thread-Index: AQHREPaXLSg2BVeMs0WobWuMatwRWJ6DuWEQ
Date: Fri, 30 Oct 2015 09:09:37 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
In-Reply-To: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8	and openjre-8
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
X-List-Received-Date: Fri, 30 Oct 2015 09:09:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Jens Rehsack
> Sent: Tuesday, October 27, 2015 10:32 PM
> To: OE-devel <openembedded-devel@lists.openembedded.org>
> Subject: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8
> and openjre-8
> =

> =

> This adds openjdk-8 for native and target builds and allows a stripped
> openjre-8 being built as well instead of trying to cherry-pick jre
> components from jdk-image.
> =

> The recipes allow building openjdk-8 with or without:
> * x11
> * cups
> * alsa/pulseaudio
> and let packager enable unlimited-crypto, if desired.
> =

> Since there can be only one PROVIDES for virtual/java-native and
> virtual/javac-native,
> move the provides to openjdk-8-native (I think everyone agrees it's a bet=
ter
> choice than ecj-bootstrap-native).
> =

> Plus: Applying a fix from openjdk-9 repository which fixes build issues u=
sing
> gcc5
> =

> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> <snip>
> Jens Rehsack - rehsack@gmail.com
> =

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Hi,

I tried applying this patch, but openjdk-8 do_fetch task failed due to mult=
iple incorrect checksums (corba, jaxp, jaxws, openjdk).

After fixing the checksums manually, openjdk8-fix-shark-build.patch failed =
due to hotspot/make/Makefile portion not applying.

Also, the openjdk-8-cross.inc currently uses openjdk-8-native as the boostr=
ap jdk for the openjkd/openjre-8. The build readme (http://hg.openjdk.java.=
net/jdk8/jdk8/raw-file/tip/README-builds.html) however suggests  that you s=
hould use the previous jdk version as the boostrap jdk and that using openj=
dk 8 to boostrap openjdk 8 may introduce unwanted dependencies. Perhaps usi=
ng icedtea7-native would be better here?

Best Regards,
Erkka K=E4=E4ri=E4
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


