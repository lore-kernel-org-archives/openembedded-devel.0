Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 9956D60034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 18:50:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2IIoAaX021977;
	Wed, 18 Mar 2015 13:50:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2IIo942020259;
	Wed, 18 Mar 2015 13:50:09 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 18 Mar 2015 13:50:09 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: Max Krummenacher <max.oss.09@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Query on meta-java layer: openjdk-7-jre: compilation
	issue with '-fuse-ld-bfd'
Thread-Index: AdBg76GigPIijuwIRJSeq1NY3JWS8gARdG2AABnJ47A=
Date: Wed, 18 Mar 2015 18:50:08 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058151608@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905814FFE9@DLEE11.ent.ti.com>
	<CAEHkU3XTfCB5DdmsOo4V1kRuR1+NzqoV-Rn-UsMM95ReK7zKrQ@mail.gmail.com>
In-Reply-To: <CAEHkU3XTfCB5DdmsOo4V1kRuR1+NzqoV-Rn-UsMM95ReK7zKrQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Query on meta-java layer: openjdk-7-jre: compilation issue with '-fuse-ld-bfd'
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
X-List-Received-Date: Wed, 18 Mar 2015 18:50:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for your response. Appreciate it.
I have created a patch as you  have suggested and it works now.
I will send out a patch to the mailing list.
Regards,
Sam
> -----Original Message-----
> From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> Sent: Tuesday, March 17, 2015 7:39 PM
> To: OpenEmbedded Devel List; Nelson, Sam
> Subject: Re: [oe] Query on meta-java layer: openjdk-7-jre: compilation is=
sue
> with '-fuse-ld-bfd'
>=20
> Hello Sam
>=20
> > I am using an openembedded setup and using the daisy branch.
> > I am trying to use meta java: git://git.yoctoproject.org/meta-java  to =
compile
> openjdk-7-jre and seeing the following error:
> >
> > | arm-linux-gnueabihf-gcc: error: unrecognized command line option '-fu=
se-
> ld=3Dbfd'
> >
> > Looks like the addition of '-fuse-ld=3Dbfd" was introduced with the fol=
lowing
> commit in meta-java:
> > commit cb351db824b0eb4a71514156bba543f6dde19740
> > Author: Max Krummenacher <max.oss.09@gmail.com>
> > Date:   Tue Jan 20 16:14:23 2015 +0100
> >
> > I am using linaro toolchain: gcc-linaro-arm-linx-gnueabihf-4.7-2013 and=
 does
> not support "-fuse-ld" option. Any ideas on how this can be fixed?
> >
> The openemembedded built toolchain in daisy, both from the oe-core and
> the linaro layers are gcc 4.8 based and do support the option.
> So  having the toolchain built by oe or using a newer external
> toolchain can fix your issue.
>=20
> If you're looked to a 4.7 toolchain because of some other issue you
> could go through the commit which introduced the -fuse-ld and remove
> the -fuse-ld=3Dbfd from the patches in
> recipes-core/openjdk/openjdk-7-25b30/. I guess your toolchain by
> default does link with the classic bfd linker rather than using gold.
>=20
> If that is a bigger problem one could probably add support for your
> use case, e.g. by trying to compile on failure without the option and
> commit such a patch to meta-java. :
>=20
> $(CC_COMPILE) -static -fuse-ld=3Dbfd -o $@ $< $(COMPILE_DONE) ||
> $(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)
>=20
>=20
> Regards
> Max

