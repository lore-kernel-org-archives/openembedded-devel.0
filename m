Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id EDC64606B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 01:07:28 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id p102so33262858uap.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 18:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=drDH1OevGxSqm3vU5jnXnUjwLmXHjHo9z/iKttJirC4=;
	b=gic+n17uRs9OK9O64QBUPPwfYICUXw5uP1c9/alrZmgl1QH92Gb29LE/NQYljq69zf
	E9m3gJz4cL/DMRG3GyiXSbZgtJpPyOQIEHsrMMEJ1HWpSX7xbk6uJLBozNQsy5uSLtQm
	uJBM1z496DS384nF+P73/8ajMX32+FIlWCTPF3skEFDDlaLHEBuQIAHwUTs30HI5Q7iT
	dt2JWHVkyOFvVHlmswoepwt+K2bK1Lzgk9HWwU22rSbko97wYM/ISyMHLVIUgd9JME5k
	Who8Lve0hd2SdKMVF5xvvPD6naGKZaUp5VXlSQmPCsKWxZpgpd/nG2gkmBnKiS+4gg3s
	n7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=drDH1OevGxSqm3vU5jnXnUjwLmXHjHo9z/iKttJirC4=;
	b=ezQpBeJoC3P+nhVMrZLHJGR/b2+PKhdCnN1ni8s3cbeCTmp+SXEcZgcZBmzJtGvIxT
	q4oaHREXKVtOB8xWKb2EXZTwoDBOucAGm26OM0XvwZtIzY52WdMr+0bvAVGgsG2PfNWQ
	4kwMIvAEOPhEyeCjIKYUxK0qFwaikroIld1yWWnuptjJk8RFbp/vH+mk2MBAlrbyI+3G
	/jyrhdlhadC2QTugoU7CMR4eaknWcy5aSoH3F6zvftWYXKij46VVGYYRGdZEe+vQckZF
	weKgsjPjbfo9pFkKLH3ipsFX/qAT73xSi2hLw/TVnAuy1gEyWw0h78kVQkSJmN28KFpS
	cHEQ==
X-Gm-Message-State: AA6/9RneyzlIpMQxFlNOGOhO0GbMx/FVYw/Xf4xf3QP+P8FQX4UFd/T7uu/BTgWbwnB3wcnLpkiBX1TwaqCzYw==
X-Received: by 10.176.65.10 with SMTP id j10mr11254563uad.17.1475802448849;
	Thu, 06 Oct 2016 18:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.114.9 with HTTP; Thu, 6 Oct 2016 18:07:28 -0700 (PDT)
In-Reply-To: <1F10663F-D6B7-4A28-BB4C-0F8E65B0D5CD@gmail.com>
References: <1475783887-20739-1-git-send-email-denis@denix.org>
	<1F10663F-D6B7-4A28-BB4C-0F8E65B0D5CD@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 6 Oct 2016 18:07:28 -0700
Message-ID: <CANx9H-Bc5OT+VogpFWhciMt=aPi0_Lyzu_F-666QBWF0+i=-MA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Fri, 07 Oct 2016 01:07:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Agree with Khem, we don't use PR in anything new anymore.

I built (on krogoth) both python-pybind11 and python3-pybind11 and both
import inside their respective pythons. I did not do any more testing than
that.

I'll try on master too.

As always, it would be nice to add ptest, but hardly any python recipes
have it. :/

--Tim (Intel)

On Thu, Oct 6, 2016 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Oct 6, 2016, at 12:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > meta-python/recipes-devtools/python/python-pybind11.inc       | 9
> +++++++++
> > meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb  | 2 ++
> > meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb | 2 ++
> > 3 files changed, 13 insertions(+)
> > create mode 100644 meta-python/recipes-devtools/
> python/python-pybind11.inc
> > create mode 100644 meta-python/recipes-devtools/python/
> python-pybind11_1.8.1.bb
> > create mode 100644 meta-python/recipes-devtools/python/
> python3-pybind11_1.8.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc
> b/meta-python/recipes-devtools/python/python-pybind11.inc
> > new file mode 100644
> > index 0000000..e13f6a5
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pybind11.inc
> > @@ -0,0 +1,9 @@
> > +SUMMARY =3D "Seamless operability between C++11 and Python"
> > +HOMEPAGE =3D "https://github.com/wjakob/pybind11"
> > +LICENSE =3D "BSD-2-Clause"
> > +LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3D1e9383cd3e97753d7dd6067d07=
9519
> ea"
> > +PR =3D =E2=80=9Cr0"
>
> Drop this
>
> > +
> > +SRC_URI =3D "https://pypi.python.org/packages/89/0b/
> f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9
> /pybind11-1.8.1.tar.gz"
> > +SRC_URI[md5sum] =3D "67845d8fd89a1c400dc7c61ccdee14d6"
> > +SRC_URI[sha256sum] =3D "358d4b7d8c38cd1dde66064178c6bb
> aaa2c479a44e67e642820fe0f329a4fff8"
> > diff --git a/meta-python/recipes-devtools/python/python-
> pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python-
> pybind11_1.8.1.bb
> > new file mode 100644
> > index 0000000..e567430
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
> > @@ -0,0 +1,2 @@
> > +inherit pypi setuptools
> > +require python-pybind11.inc
> > diff --git a/meta-python/recipes-devtools/python/python3-
> pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python3-
> pybind11_1.8.1.bb
> > new file mode 100644
> > index 0000000..355e284
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
> > @@ -0,0 +1,2 @@
> > +inherit pypi setuptools3
> > +require python-pybind11.inc
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

