Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 61F2265DA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 06:19:55 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id z60so6445576qgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 23:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DpjjFRgzTvYc/9KbY17h7mC1M+bfDK4kqlICcHuwqmE=;
	b=bKlYVtZJ8kgLKOE3kwjvmpdbeCwAlL1yy6lNPqT6bMa5wpjysfkgXPsDGVW9vHAqrK
	uIL9Dm/4eCxm+XXIf0KrW9+K2zUgfgh6IYViZlU8YNenh2FYk2POKE10pnAIM8WBRyV9
	eKnaubK233D7d3voUOUvmDiJukwOa0+qMhkWX/zZWh5bGjAFbFvZzUJ2PTPSZ6503rv1
	oXR1l3hp1jDyJL5YyrQMLtvG5PxHjDqK0TwdTITH2CIibV/P3Y2ZigA/vS06qHDAlSJ+
	kII2KEctoZuGZdSo8GLJZGpSkJ4KvEu7fb1Strv3p/ItYgt3Fl1+iWuu1/LGgtVOuRbo
	D4Ig==
X-Received: by 10.140.81.134 with SMTP id f6mr4774784qgd.60.1408688395972;
	Thu, 21 Aug 2014 23:19:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Thu, 21 Aug 2014 23:19:35 -0700 (PDT)
In-Reply-To: <CANx9H-DwW-abesYFg1TLz-zGszB3pRA2gUbUnZjpQvMieWf-cA@mail.gmail.com>
References: <1408603607-32536-1-git-send-email-sujith.h@gmail.com>
	<2646587.gJzHJE2pH7@peggleto-mobl5.ger.corp.intel.com>
	<CANx9H-DwW-abesYFg1TLz-zGszB3pRA2gUbUnZjpQvMieWf-cA@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Fri, 22 Aug 2014 11:49:35 +0530
Message-ID: <CADyYWLkj+2zHtaPP-GicQMGaehaq9JP_POVV=4Av2R+aLC_MwA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyparted: Add recipe
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
X-List-Received-Date: Fri, 22 Aug 2014 06:20:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 10:06 AM, Tim Orling <ticotimo@gmail.com> wrote:

>
> On Thu, Aug 21, 2014 at 6:47 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> Hi Sujith,
>>
>> I think this recipe is almost there, just some minor tweaks:
>>
>> On Thursday 21 August 2014 12:16:47 Sujith H wrote:
>> > From: Sujith H <Sujith_Haridasan@mentor.com>
>> >
>> > This recipe will provide a set of Python modules that
>> > provide Python programmers an interface to libparted,
>> > the GNU parted library for disk partitioning and filesystem
>> > manipulation.
>> >
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>>
> Tested-by: Tim Orling <TicoTimo@gmail.com>
> (qemuarm, core-image-sato)
>
> NOTES:
> (1) In order to get help for this module,
> IMAGE_INSTALL_append =3D " python-pyparted python-pydoc python-pkgutil
> python-io"
> $ python
> >>>import parted
> >>>help(parted)
>
> (2) I used the examples (list_devices.py, list_partitions.py) from the
> following to test:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D692503
>
>  > ---
>> >  .../python-pyparted/python-pyparted_3.9.bb          | 21
>> > +++++++++++++++++++++ 1 file changed, 21 insertions(+)
>> >  create mode 100644
>> > meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
>> >
>> > diff --git
>> > a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
>> > b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
>> new
>> > file mode 100644
>> > index 0000000..db1b936
>> > --- /dev/null
>> > +++ b/meta-python/recipes-extended/python-pyparted/
>> python-pyparted_3.9.bb
>> > @@ -0,0 +1,21 @@
>> > +DESCRIPTION =3D "pyparted is a set of Python modules that provide Pyt=
hon
>> > programmers \ +an interface to libparted, the GNU parted library for
>> disk
>> > partitioning and \ +filesystem manipulation."
>> > +SUMMARY =3D "Python bindings for libparted"
>> > +HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
>> > +LICENSE =3D "GPL-2.0+"
>> > +LIC_FILES_CHKSUM =3D "\
>> > +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
>> > +
>> >
>> file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd73782a0=
3f56a0571
>> > a9f08ea46 \ +"
>> > +DEPENDS +=3D "parted"
>> > +RDEPENDS_${PN} +=3D "python-stringold python-codecs python-math"
>>
>> Could you please move the RDEPENDS line down to just before the
>> BBCLASSEXTEND
>> line? (i.e. where any other definitions that concern packaging would
>> appear).
>>
>> > +
>> > +S=3D"${WORKDIR}/pyparted-${PV}"
>>
>> Please move this after the SRC_URI / checksums and add spaces around the
>> =3D .
>>
>> if you could also please ensure that your next version is marked [PATCH
>> v3]
>> (if it will be the third version of this patch) rather than just [PATCH]
>> so
>> that it's clear that it supersedes an earlier version.
>>
>
> I agree completely with Paul and meant to mention that on the previous
> patch [PATCH v2].
>

Sure the next patch will be mentioned as [PATCH v3].

Thanks and Regards,

Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

