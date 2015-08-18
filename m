Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1908E60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:02:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 18 Aug 2015 08:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,702,1432623600"; d="scan'208";a="627734300"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga003.jf.intel.com with ESMTP; 18 Aug 2015 08:02:20 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 18 Aug 2015 08:02:20 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
	ORSMSX159.amr.corp.intel.com (10.22.240.24) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 18 Aug 2015 08:02:19 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.72]) by
	fmsmsx101.amr.corp.intel.com ([169.254.1.27]) with mapi id
	14.03.0224.002; Tue, 18 Aug 2015 08:02:19 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 1/2] OpenJDK-8u: For x86 and arm
Thread-Index: AQHQ1sgrLpTmZx4mZEqKIi09w5+GjJ4SNrOA//+pGOA=
Date: Tue, 18 Aug 2015 15:02:19 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A37058290@FMSMSX108.amr.corp.intel.com>
References: <1439580903-32301-1-git-send-email-vinay.k.awasthi@intel.com>
	<20150818131156.GA64804@sestofb10.enea.se>
In-Reply-To: <20150818131156.GA64804@sestofb10.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 1/2] OpenJDK-8u: For x86 and arm
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
X-List-Received-Date: Tue, 18 Aug 2015 15:02:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Openjdk-8-jre is changed to openjdk-8u-jre (Openjdk-8 update)
I will incorporate other comments and send out an updated patch.

Thanks,
Vinay

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Maxin B. John
Sent: Tuesday, August 18, 2015 6:12 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][PATCH 1/2] OpenJDK-8u: For x86 and arm

Hi,

On Fri, Aug 14, 2015 at 12:35:03PM -0700, Vinay K. Awasthi wrote:
> From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
>=20
> OpenJDK-8 Update Build 40b27:
>=20
> This package enables OpenJDK-8 update for x86 and arm in following vm con=
figurations.
>=20
> x86: hotspot VM
> arm: interpreter mode (zero vm)
>=20
> Openjdk-8u also supports compact profiles (see=20
> http://openjdk.java.net/jeps/161 for more details). These compact profile=
s can also be built by going over the comments.
>=20
> oe_runmake profiles will build compact profile one two and three java=20
> runtimes (jre) oe_runmake images profiles will build compact profile=20
> JDKs
>=20
> Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
> ---

#  bitbake java-test-image

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'openjdk-8-jre' (but /media/data/fb/majo/test/poky=
/meta-java/recipes-images/images/java-test-image.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'openjdk-8-jre' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openjdk-8-jre']
ERROR: Required build target 'java-test-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['java-test-image', 'openjdk-8=
-jre']

Please fix this build error.

Best Regards,
Maxin

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

