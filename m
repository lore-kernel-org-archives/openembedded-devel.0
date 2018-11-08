Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 796847458B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 18:32:22 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d19so28243819qkg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2018 10:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z03D8HyOo/D2vqfBnV7LuD7WK9ZDY7AU9uVBCBREsJE=;
	b=cZerosLc/IM0+jgq7ZRF7zSSuTlyhb+tD4akh+IR32y2i4WDjethQo4cO/GZNwrur2
	QgVh6I9hj1gSd6fvYWzN6fouPHwskcnjqPY5j7IgbPsQm0yk4s3UjQk/HqKtPZ4u3hM7
	1fhToUXQjV46fdNptZmpjSjAj/ygzacmVm7tU0A422hxULajDWGcrTabaffWXCqTYR67
	7s7DPy2Cet/+To0BOklObSyxjY4PJUQT6EHdmVzZi+0RBUu6Yz+ZxZIfsRdH9VmHPkga
	JytpzNt0TkiPgjaCD6JsY5onsg0DgTePAn4D7btJlxAC6yr+IwzATc265R+IJqcFAkq0
	fsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z03D8HyOo/D2vqfBnV7LuD7WK9ZDY7AU9uVBCBREsJE=;
	b=DvWmMlgF/X9Jj900FymQIQY0yVYyTiTqD/EZYxRDpJaG6jXcM+MUqUu5YwSN0jxrP5
	jVka8zILniTLs5HRSb/vhPWhSWp4Q0TevY5FMyDeJ61WydX/Atmuo7xxdhRJzknqc9kn
	35NWs3nEV4OQofLExH1aDiKw80cd/I0FhE/wGbkFYA0l9PLmU9AzZmpQcZJEcgjilPpO
	q73aUD5QcrgKxr+H+66dcmF8IbxtGNCqlsCOBXjInThg2Po91qu4JwgowenUdoKNfbxI
	UY/25GcvivP5t/4aNXik1wHP00RZb3kmgnT9DYf7K0YZPlIgFPTv9BlJJRbfUvJdOq7n
	sdNA==
X-Gm-Message-State: AGRZ1gLYw/Gzxynjnd3THTAf+l+w19t2VVhA3hmXK00FU74TdDDuV75Z
	/WJ4wNE7b1AHT5Fp7psUA7FLNwjsyB88dJsbtBI=
X-Google-Smtp-Source: AJdET5fpLS335KYYIbmdrY+Ux+SY3TopPVz+E8b4/sADFk5f/G0fD6Cqewkrx0uNDybLORmXlAdqV5uXfGriW5lEeFY=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr5458236qtc.236.1541701942718; 
	Thu, 08 Nov 2018 10:32:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
	<CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
	<CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
In-Reply-To: <CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Nov 2018 10:32:11 -0800
Message-ID: <CAMKF1srDKUr=e-0b8szOy1qEynr5vVUBginn5RY6D1JmifDuiA@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 18:32:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 8, 2018 at 9:28 AM Brendan Kerrigan <brendank310@gmail.com>
wrote:

> Yeah it does have a build time dependency on gtk+2. I've made the other
> changes, though I still have two libraries that are in subdirectories of
> libdir that are giving me an installed vs. shipped QA warning. Is it
> appropriate to do a more specific packaging within libdir (e.g. FILES_${PN}
> += "${libdir}/subdir/subdir.so") or should I take a different approach?
>

Are they plugins ? If so you can add them to new package like PN-plugins
otherwise this approach is ok

>
> Thanks,
> Brendan
>
> On Tue, Oct 30, 2018 at 7:25 AM Burton, Ross <ross.burton@intel.com>
> wrote:
>
> > On Mon, 29 Oct 2018 at 16:41, brendank310 <brendank310@gmail.com> wrote:
> > > +DESCRIPTION = "Intelligent Input Bus for Linux/Unix"
> > > +LICENSE = "LGPLv2.1"
> > > +DEPENDS = "prelink \
> > > +           gtk+ \
> > > +          "
> >
> > It depends on gtk+2?
> >
> > > +S = "${WORKDIR}/${PN}-${PV}"
> >
> > This is the default.
> >
> > > +inherit autotools pkgconfig gtk-doc distro_features_check vala
> > gobject-introspection
> >
> > distro_features_check isn't being used.
> >
> > > +FILES_${PN} += "${libdir}"
> >
> > Definitely wrong.
> >
> > Ross
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

