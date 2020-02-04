Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1D961611F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 04:45:36 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id h8so19475778iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 20:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C4YAv3a0HBQUglACl5qpo7cm5RUNW7ldcBdTXI796rc=;
	b=pxS3c1Jjoh+bH09TcHuF8MecdSbU750jQxVJpZcvxUMLLGEr330RF42u0I+SPsVRTA
	SWCqitLKZAQrTzRcsU4aL00S45EKtEtUwPEW/q75u28i6H4QMK9V+d8KFFSGrQvodkK2
	npox1NmfkmIgn9njzsP9Hm53+f50cxMROIWfCSme0BNLs96jYCHiurr+ATm/a6QPG3eI
	jN3O+q9xy7nU0emj8YNkyusEZqcICODv4tvp4TGGnOqmbjvm/h3+AsfGyHwDXJrG4xjN
	sGAWf06TlhAa/GfPf87TKCMBLcMwq05r1vxieLH79ItL+pDT4AMuLDaAtOdEBtRs61Zg
	oeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C4YAv3a0HBQUglACl5qpo7cm5RUNW7ldcBdTXI796rc=;
	b=Bd1Y5UL1u4US7hiV07v8cldzV8Vgu/QTqgAV9COEI49i7VmNzzmrYbUtSP12kjTrIu
	g9JQzS2uMVTgCueHFIkNGj1/cHCu5uqY0e+gb7TQhBuhkRdL79KCVAKSsR8rnP27bT0X
	JGj/6/z93rBkM2dEW8vrxMVIkGb/NxU+4FSqpuZJEsrQTDAqp+32zecXMgoWOPD9z0RQ
	Ho8C9jIY5cda+U+LSJv37HAu6bKzXPJi5dLX9FQ9OFNRMhgs1lJOTzZsk3GqFIAmpqlc
	ewjbmkOIVHVfEyA8UJQUyI/cja0CmYzWsd/dWR8oHZWe0iLmd6Zhtn1rjHKKr1+JY/gr
	15DQ==
X-Gm-Message-State: APjAAAVmlmqgkneRHEsz0+JNOe9OXlg5K38sIOP/Rq2JjEusTJ/Ec9mA
	ScgKLL+yUTraroPAdZQsRYflCd68dd3OnpeSNpc=
X-Google-Smtp-Source: APXvYqzxdR4U0eX/JGE42Kl9DqIeIiD8g1WXx4VroMZG+9TrHtl/hwwGcshSWEAI09QQiW3fIGjuDwToC3BJzeR9W8o=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr20918290iof.122.1580791538020;
	Mon, 03 Feb 2020 20:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
In-Reply-To: <CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Feb 2020 20:45:26 -0800
Message-ID: <CANx9H-CSjpmXB13nkBB8PSgM8a4q=T+xHpQ4FGdij5ykEM+f+A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Tue, 04 Feb 2020 04:45:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 8:30 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Please send this fix to normal meta-python in meta-oe/zeus:
>
> http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-twisted.inc?h=zeus
>
> BTW: Why are you using meta-python2 with zeus branch? It imho doesn't have
> anything which would be missing in oe-core+meta-oe zeus branch and fixes
> like this should be resolved also for people using zeus branch without
> overlaying them by meta-python2.
>
>
Because, as I believe I have said before, I need a prior release to test
the infrastructure on. zeus allows me to work on more than just master
until we have the next stable release branching.

It has nothing to do with what is missing from meta-oe, it is a viable
alternative that also helps prove out my workflow as I have EXTREMELY
LIMITED TIME to support this.

On Fri, Jan 31, 2020 at 10:29 AM Trevor Gamblin <
> Trevor.Gamblin@windriver.com> wrote:
>
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >
> > python-twisted is currently missing some packages for its /usr/bin/twistd
> > executable to function. Add these to the RDEPENDS list, and also clean up
> > formatting since the list is getting long.
> >
> > Note that a similar patch has already been submitted for master branch,
> > but the python2 version of twisted needs more explicit RDEPENDS than the
> > python3 version submitted to master in order for /usr/bin/twistd to work
> > properly.
> >
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >  .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-twisted.inc
> > b/meta-python/recipes-devtools/python/python-twisted.inc
> > index d70104dc2..024a9fa7c 100644
> > --- a/meta-python/recipes-devtools/python/python-twisted.inc
> > +++ b/meta-python/recipes-devtools/python/python-twisted.inc
> > @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
> >      ${PN}-zsh \
> >  "
> >
> > -RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface
> > ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink
> > ${PYTHON_PN}-automat"
> > +RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
> > +                       ${PYTHON_PN}-constantly \
> > +                       ${PYTHON_PN}-core \
> > +                      ${PYTHON_PN}-debugger \
> > +                       ${PYTHON_PN}-hyperlink \
> > +                       ${PYTHON_PN}-incremental \
> > +                       ${PYTHON_PN}-misc \
> > +                       ${PYTHON_PN}-pkg-resources \
> > +                       ${PYTHON_PN}-pkgutil \
> > +                       ${PYTHON_PN}-plistlib \
> > +                       ${PYTHON_PN}-pyhamcrest \
> > +                       ${PYTHON_PN}-pyserial \
> > +                       ${PYTHON_PN}-setuptools \
> > +                       ${PYTHON_PN}-unixadmin \
> > +                       ${PYTHON_PN}-zopeinterface \
> > +"
> > +
> >  RDEPENDS_${PN}-test = "${PN}"
> >  RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
> >  RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> > --
> > 2.24.0
> >
> > --
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

