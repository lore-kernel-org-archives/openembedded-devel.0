Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8E39660589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 20:12:32 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id h129so81646831lfh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=11TYy/lnR87VyPtk9B0y8h05YPY1kNJkClH7L3oFs+Q=;
	b=ZSsz3WIL+5X/dUukMQsuQ6WrgwJreu5pRDg4eLa430NHtsLXtYBBbDQbpdFyIwYd7E
	z3Tm6CntjpMy54LZFVkA7oQTJR5BU4+5JbVkutJXUL9C2hj2aS+ZnQuZK6gXDu0hT4Q0
	DmSF2jviGbGL8SuzcDehd79210vz5AIUF1Du9VfSZBorq2e+2V2FhlAHCfdChCk2vyYZ
	X6Z+xYtBejuY1DBwbns2vTnvCIaPot5o87Jsshiu20XMkNCHsR+0qONpqeC9DLJphI62
	mC/Fhc+D6dJOQx4m8eE2HSEfXJR2X+zLOXQmnwn8QIyE5E3kkmzckZweVO0XF9Cnqdx1
	r+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=11TYy/lnR87VyPtk9B0y8h05YPY1kNJkClH7L3oFs+Q=;
	b=Qv2RTPsrSyNuiAcvQNG4Uo9I1qEcJsL1mSgNcWdMeDWjrwXD/qzQURVq/F3dkUPVYQ
	C9hxSuLU90qoVb/odN30Sr9sloV0gTvVIRpj5h9a+ntlff3VqXRm4GgHJYv5Bwav+hGL
	PZF3DC8e3VK4Ikf/mDEimBfP81tsLWvPakeATJRzZ+g+mCFRs03/xDBnWEL1ft7OSyVZ
	mZpjOzWi0A+LR3+sK71d6s16QFDsi35LiGM/T6fAi2Ttk2p9dc6F+A7n7y/sVX+5nsNx
	o41c00QSMARdQpLBPAjWbCeR/Hvs77T9fGSd57B6GyTh0vUy6NocMzADGXTtVa9uYW3H
	pBCw==
X-Gm-Message-State: ALyK8tJtB67xtET/AeUszMYftn1gvmd1NEZEf/5h34Vg70/fcQyXTXb0FWxgtFdR2UMZVHXwtZt/GEhJkbvjyw==
X-Received: by 10.25.4.202 with SMTP id 193mr6808121lfe.204.1468267951798;
	Mon, 11 Jul 2016 13:12:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Mon, 11 Jul 2016 13:12:30 -0700 (PDT)
In-Reply-To: <CADNbA1pfxK1PNxXXEmP9281MzvsnBtVU+iAbMpjUkpqRjdLy0A@mail.gmail.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-6-git-send-email-mingli.yu@windriver.com>
	<CANx9H-DVRsHZGBJVkc2k1p4fTdWOchBhQBnm3Y8HuhTtiuzwMA@mail.gmail.com>
	<57836590.7@windriver.com>
	<CADNbA1pfxK1PNxXXEmP9281MzvsnBtVU+iAbMpjUkpqRjdLy0A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 11 Jul 2016 13:12:30 -0700
Message-ID: <CANx9H-BqbQv_P2KGQSMdWxyQztc_1v8JQeo5QGKcjNCvt3R=8Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Mon, 11 Jul 2016 20:12:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

NOTE to self: we should update the README on meta-python to give best
practices for pypi packaging.

On Mon, Jul 11, 2016 at 5:41 AM, Derek Straka <derek@asterius.io> wrote:

> Could you use PYPI_PACKAGE =3D "setuptools_scm" to override the default p=
ypi
> package name?
>
> On Mon, Jul 11, 2016 at 5:23 AM, Yu, Mingli <mingli.yu@windriver.com>
> wrote:
>
> >
> >
> > On 2016=E5=B9=B407=E6=9C=8809=E6=97=A5 01:09, Tim Orling wrote:
> >
> >> Built ok for beaglebone.
> >>
> >> NOTE: SRC_URI probably not required with Derek's pypi.bbclass patch
> >> https://patchwork.openembedded.org/patch/125551/ but I did not test fo=
r
> >> that.
> >>
> > We still need this SRC_URI as we do translation for the package
> > python-setuptools-scm as the previous packages name as
> > python-setuptools_scm which includes underline=EF=BC=8C but the package=
 name part
> > can't include underline for a recipe name.
> >
> > Thanks,
> > Grace
> >
> >>
> >>
> >> Acked-by: Tim Orling (Intel OpenSource Technology Center) <
> >> ticotimo@gmail.com>
> >>
> >> On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>>
> >>> * Add python-setuptools-scm bb as python-pytest-runner depends
> >>>    on python-setuptools-scm
> >>>
> >>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>> ---
> >>>   .../python/python-setuptools-scm_1.11.1.bb             | 18
> >>> ++++++++++++++++++
> >>>   1 file changed, 18 insertions(+)
> >>>   create mode 100644 meta-python/recipes-devtools/python/
> >>> python-setuptools-scm_1.11.1.bb
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/
> >>> python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python=
/
> >>> python-setuptools-scm_1.11.1.bb
> >>> new file mode 100644
> >>> index 0000000..2a3b97d
> >>> --- /dev/null
> >>> +++ b/meta-python/recipes-devtools/python/
> >>> python-setuptools-scm_1.11.1.bb
> >>> @@ -0,0 +1,18 @@
> >>> +SUMMARY =3D "the blessed package to manage your versions by scm tags=
"
> >>> +LICENSE =3D "MIT"
> >>> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b35f2"
> >>> +
> >>> +inherit pypi setuptools
> >>> +
> >>> +SRCNAME =3D "setuptools_scm"
> >>> +
> >>> +SRC_URI =3D "
> >>>
> >>>
> https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303=
caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz
> >>> "
> >>> +
> >>> +SRC_URI[md5sum] =3D "4d19b2bc9580016d991f665ac20e2e8f"
> >>> +SRC_URI[sha256sum] =3D
> >>> "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
> >>> +
> >>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> >>> +
> >>> +RDEPENDS_${PN} =3D "python-py python-setuptools python-argparse
> >>> python-debugger python-json"
> >>> +
> >>> +
> >>> --
> >>> 2.8.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>> --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

