Return-Path: <erkka.kaaria@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76FB3607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:41:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Oct 2015 05:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,218,1444719600"; d="scan'208";a="675022262"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Oct 2015 05:41:04 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.116]) by
	irsmsx110.ger.corp.intel.com ([169.254.15.151]) with mapi id
	14.03.0248.002; Fri, 30 Oct 2015 12:41:02 +0000
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for
	openjdk-8 and openjre-8
Thread-Index: AQHREwizo5FIc1ejQEa/QsaLNYhHu56D8U0Q
Date: Fri, 30 Oct 2015 12:41:02 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
	<25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
In-Reply-To: <25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for	openjdk-8 and openjre-8
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
X-List-Received-Date: Fri, 30 Oct 2015 12:41:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Jens Rehsack
> Sent: Friday, October 30, 2015 1:47 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for
> openjdk-8 and openjre-8
> =

> <snip>
>
> > Also, the openjdk-8-cross.inc currently uses openjdk-8-native as the
> boostrap jdk for the openjkd/openjre-8. The build readme
> (http://hg.openjdk.java.net/jdk8/jdk8/raw-file/tip/README-builds.html)
> however suggests  that you should use the previous jdk version as the
> boostrap jdk and that using openjdk 8 to boostrap openjdk 8 may introduce
> unwanted dependencies. Perhaps using icedtea7-native would be better
> here?
> =

> openjdk-8-native uses icedtea7-native to bootstrap, openjdk-8 and openjre-
> 8 use openjdk-8-native to bootstrap.
> Can you explain which unwanted dependency openjdk-8-native might
> introduce you don't even have by using icedtea7-native?
> =

> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
> =

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Hi, =


I don't know if there are actually any issues when bootstrapping with openj=
dk-8-native. I just wanted to raise the issue as the openjdk build readme w=
arns against this. =


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


