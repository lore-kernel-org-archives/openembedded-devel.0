Return-Path: <iipeace5@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91CD76B463
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2019 14:00:57 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id t16so10503428ybk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vhR1gjiG4AcdeRBSofAdJ1yi4z7uYygo099e2uLBtAQ=;
	b=BbaTBgfjDV1VEeX91SMyh/a8Y/dYwigUlbIQ6ntPFYHkvZ3f/P+QRZ4jR1Ezx18v8a
	Jy94hDvoXBIMkYuEDs7RTdoFPsNHji0JUJoZ3GnfRCv06mkb06sQ+/UsEmkX9YQVAJYt
	9MFND8fFgAIY3mOppJgk3VfK4tObE5K/PUnSMU7I6sVTjRES27wbDIIyROw2G7zOl7YR
	XmaDC5ukI2Yzm+dncYR5ktgU/QQWRYQDaxM/zrel8CaiwnQC3llnnKmChoyCuFNJcVEC
	YEUwj6L4dqBL7JWVCCenXPB5xbqbfVO8odOUf8364CTF8uWs0Gunb3Rmxuj08YAzYnLc
	6eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vhR1gjiG4AcdeRBSofAdJ1yi4z7uYygo099e2uLBtAQ=;
	b=rbYRrbvAVqssSCDSprui8ROGhdyaEwiyVD8xxL793BtBByHUnc+b+7FCAjnnHbdz3b
	ddPOpwIGKg2opI5dzgHE/x+IZSkZdDZZSGb5p6oiXUA+NpLfpvl2Ic1we5AnW19BC8+i
	D3q52qTtDZHPbbtS1q1703aj/ctFMXtfL5JrJjd0ZSmIXG1cqvfskSm7+X0WXySxan7+
	k80/9M7b6N6i9GTJRzSzAhVyhlO3XHCxEQ0P90Hz7C0N40JvgPr53kgqiQ8yCOoZNNus
	b2PZNNvYCKTQOQ1PJgbz/DMqGNwfD6kEEE3GaDI2HwMvCmg30LaOqqfJeOvtJj0ZBEAV
	Nglw==
X-Gm-Message-State: AJcUukfCKdbvU1j9TmQ6xg6K7eN9V4IwdE3LZOefsJD3AG4DsDDzn9jp
	HqobnJedrdH5pSAC/+Wy07YcIECQPhkOBHeRCYs=
X-Google-Smtp-Source: ALg8bN7VqS2AxzKKa032bM0iU4l/8WW1pxFNtYOQ01WHtAJkByE1unjfutYJCYlGiaRHX0nNP/QtSZcNLbR4PYxDqcA=
X-Received: by 2002:a25:4dc4:: with SMTP id a187mr1543331ybb.290.1546437658404;
	Wed, 02 Jan 2019 06:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20181230165033.8850-1-raj.khem@gmail.com>
	<b9c25a20-eee6-c603-87a7-324bfca98587@windriver.com>
In-Reply-To: <b9c25a20-eee6-c603-87a7-324bfca98587@windriver.com>
From: Peace Lee <iipeace5@gmail.com>
Date: Wed, 2 Jan 2019 23:00:49 +0900
Message-ID: <CAC53cca8St1ML=govQowc5OtpNS2ftv-d-ZGBBn8YH6=k-mHjg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] guider: add a new runtime profiler package
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
X-List-Received-Date: Wed, 02 Jan 2019 14:00:57 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for your advice :)

Should I submit a new patch again after changing a below patch?
I am not familiar with this process ;)
It couldn't be reached to openembedded-devel members When I sent patch
first so that I sent github pull-request to Khem Raj.

Anyway, I agree with your comments (fixing typos, moving the recipe to
meta-tool, dropping last some lines).
But what does "*Shouldn't the packages that guider uses be recommended at
least?*" mean?
Guider only requires "python-ctypes, python-shell, python-json,
python-subprocess" package :)
Some kernel configurations and patches are needed to trace user-level
functions but it depends on users.

Happy new year!

On Tue, Jan 1, 2019 at 4:30 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Neat tool! I'll have to play with it a bit more.
>
> On 12/30/18 11:50 AM, Khem Raj wrote:
> > From: Peace Lee <iipeace5@gmail.com>
> >
> > guider [1] is a system-wide performance analyzer for platforms based
>
> Well, it seems to be more of a meta-tool that uses standard tools.
> In addition, it improves usability at the cost of defining policy
> such as immediately analyzing some data collection on target.
> It would be nice to succinctly summarize that if you can.
> > on linux kernel. it can measure vary system resource usage and
> s/it/It/
> s/vary/a variety of/
> > trace thread/process activities. and it reports vary meaningful
> > output to analyze system status.
> It reports very meaningful output to analyze system status.
> >
> > [1] https://github.com/iipeace/guider
> >
> > Signed-off-by: Peace Lee <iipeace5@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../recipes-devtools/guider/guider_3.9.3.bb   | 34 +++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> >   create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> >
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> > new file mode 100644
> > index 0000000000..96d6c62ae2
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> > @@ -0,0 +1,34 @@
> > +SUMMARY = "runtime performance analyzer"
> > +HOMEPAGE = "https://github.com/iipeace/guider"
> > +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> > +AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> > +
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> > +
> > +SRC_URI = "git://github.com/iipeace/${BPN}
> <http://github.com/iipeace/$%7BBPN%7D>"
> > +SRCREV = "ac05a2ce0ab480957d642d947d8f617bd224031d"
> > +
> > +S = "${WORKDIR}/git"
> > +R = "${RECIPE_SYSROOT_NATIVE}"
> > +
> > +inherit distutils
> > +
> > +GUIDER_OBJ = "guider.pyc"
> > +GUIDER_SCRIPT = "guider"
> > +
> > +do_install() {
> > +    python ${S}/setup.py install
> > +
> > +    install -d ${D}${bindir}
> > +    install -v -m 0755 ${R}/${bindir}/${GUIDER_SCRIPT}
> ${D}${bindir}/${GUIDER_SCRIPT}
> > +
> > +    install -d ${D}${datadir}/${BPN}
> > +    install -v -m 0755 ${R}/${datadir}/${BPN}/${GUIDER_OBJ}
> ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> > +}
> > +
> > +RDEPENDS_${PN} = "python-ctypes python-shell \
> > +                  python-json python-subprocess"
>
> Shouldn't the packages that guider uses be recommended at least?
> I'm not familiar with the app so maybe it can do useful things without
> top, perf, etc.
>
> Should we add a kernel cfg fragment?
>
> > +
> > +FILES_SOLIBSDEV = ""
> > +#FILES_${PN} = "usr"
> Drop that line?
>
> >
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

