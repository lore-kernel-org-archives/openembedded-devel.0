Return-Path: <iipeace5@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA4D7BDFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 07:26:48 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id i73so14214323ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 23:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uFprv7c7EJOmZpm9O/YxIxSrSMn2RpjYUmiAsQ4lAjc=;
	b=BNDtrqHiQ+LoS9qPDFxQQpSJkMwXwzaT3FuXS9trhOf2yTZ1n4ZCunZChaCQtNiWeC
	ok0cOrQKgeWI463s9iYPsYbFiOWtAsRElX9YWkSkwiQC24174wS+bduzIKz+6Kr/yND5
	EWJ8Wgbtu9IM/R4AW4t6qU7XD7zL1GTbksox95KNDjsF9QWoiEiO3rbcjWzh3B8MSMxs
	p1bOgKC8uIwJAoFQ+UWFictMJgkH54AMW0hB5yXNE8QuNYsmr5YsLN9tI6REJziJdVsS
	zX/eFikaEeIJPfCscHkjXuS9yvoiyJIYUKnaa1bauYWHYbHqHUvKTjIUBMJRGoBwJcYV
	RBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uFprv7c7EJOmZpm9O/YxIxSrSMn2RpjYUmiAsQ4lAjc=;
	b=mii6/kNpsHiOtRbkzdfEMFqivRCq7Gez0p0FoZFEtTAJ9TIXQKRFNz2o6NrqOUcD9H
	qkyejinYc0THflA/h04XCkC+ccPNYpZWtSmgCfLOyqW5yaQ+HdfT3viWW29K1XuhAJGc
	CW2QH086OaAsi0EyQQm0dEWxOQbKYTnfAo3QxtNeBam0ABHt80k2LoRIp7uYC+DIG7vN
	6inQrMxO+mVCQNsQuxlsNT0qGBUbsIA7BRlRMNn+ZL6goBKUb98qjndKEBlyOQwrRv63
	9XxgdvETabI/iTimlEu1pcjFPWhIvSZcmwoegIP8/s+vimU1Kn8cji+6BlRmdcfzuv9n
	izCg==
X-Gm-Message-State: AA+aEWb/5RZxj3m8BVzfBKbZHMox9/t9WvagoSUaQd2rs+NpRKVPK6XN
	8g0Ss0feTCZRUSU2vpH4wWcoijawpatuzWps8IQ=
X-Google-Smtp-Source: AFSGD/UxaW2eN1k/lmMy6f3iGKcqYuXIL04aIM6nkR+7U6wRQTSjFZYr2mzquoMd+Unh7cHx7LNor9kDzXHULmD80k4=
X-Received: by 2002:a0d:ea81:: with SMTP id
	t123mr51245867ywe.496.1546586809367; 
	Thu, 03 Jan 2019 23:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20181230165033.8850-1-raj.khem@gmail.com>
	<b9c25a20-eee6-c603-87a7-324bfca98587@windriver.com>
	<CAC53cca8St1ML=govQowc5OtpNS2ftv-d-ZGBBn8YH6=k-mHjg@mail.gmail.com>
	<07876792-0a06-c91c-fb4d-4efb033ef5c5@windriver.com>
In-Reply-To: <07876792-0a06-c91c-fb4d-4efb033ef5c5@windriver.com>
From: Peace Lee <iipeace5@gmail.com>
Date: Fri, 4 Jan 2019 16:26:39 +0900
Message-ID: <CAC53ccY4dcv45x98HQOxaPV7-8MRf4jL=JR3-byufu=95-K1GA@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Jan 2019 07:26:48 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for your advice Randy :)

>   Do you have a document that explains your motivation for creating guider
>   and perhaps documents a few cases where it's better than the standard
>   tools? I likely just need to play with guider a bit more but it seems
>   like a use case that walked people though a performance issue that you
>   resolved more easily with guider than with the plethora of linux tools:
>      http://www.brendangregg.com/linuxperf.html
>   would be good marketing.

The document for guider is only available at
https://iipeace.github.io/docs/guider.html.
I think so that I need to write more documents and articles for users of
guider.
It's my plan for this year :)

I submitted patch v2 to GitHub,
please check it out if Khem Raj move it to ML.


Thanks.
Peace Lee.


On Thu, Jan 3, 2019 at 1:59 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 1/2/19 9:00 AM, Peace Lee wrote:
> > Thanks for your advice :)
> >
> > Should I submit a new patch again after changing a below patch?
> > I am not familiar with this process ;)
>
> I expect that Khem will do that once he wakes up.
>
> > It couldn't be reached to openembedded-devel members When I sent patch
> > first so that I sent github pull-request to Khem Raj.
>
> We send patches to the oe-devel list, people comment, the gatekeeper
> merges at some point. The process is documented here:
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> >
> > Anyway, I agree with your comments (fixing typos, moving the recipe to
> > meta-tool, dropping last some lines).
> > But what does "_Shouldn't the packages that guider uses be recommended
> > at least?_" mean?
>
> I thought that you were forking top, perf, etc and then screen-scrapping
>   the output but it seems that you have reimplemented(parts of)
> the functionality of these tools so we don't need to add a
> DEPENDS/RECOMMENDS to the recipe to ensure that top for example
> is added to the system image.
>
> > Guider only requires "python-ctypes, python-shell, python-json,
> > python-subprocess" package :)
>
> Khem's recipe has that covered then:
>
> +RDEPENDS_${PN} = "python-ctypes python-shell \
> +                  python-json python-subprocess"
>
> > Some kernel configurations and patches are needed to trace user-level
> > functions but it depends on users.
>
> The yocto-kenrel-cache:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/00-README
>
> has the concept of features:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features
> such as:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/lttng
>
> since this recipe is for meta-openembedded rather than oe-core,
> we'd leave it up to users as you say. meta-openembedded depends on
> oe-core but the two projects are organized by different people.
>
>
>
> Do you have a document that explains your motivation for creating guider
> and perhaps documents a few cases where it's better than the standard
> tools? I likely just need to play with guider a bit more but it seems
> like a use case that walked people though a performance issue that you
> resolved more easily with guider than with the plethora of linux tools:
>    http://www.brendangregg.com/linuxperf.html
> would be good marketing.
>
>
> ../Randy
>
> >
> > Happy new year!
> >
> > On Tue, Jan 1, 2019 at 4:30 AM Randy MacLeod
> > <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>>
> wrote:
> >
> >     Neat tool! I'll have to play with it a bit more.
> >
> >     On 12/30/18 11:50 AM, Khem Raj wrote:
> >      > From: Peace Lee <iipeace5@gmail.com <mailto:iipeace5@gmail.com>>
> >      >
> >      > guider [1] is a system-wide performance analyzer for platforms
> based
> >
> >     Well, it seems to be more of a meta-tool that uses standard tools.
> >     In addition, it improves usability at the cost of defining policy
> >     such as immediately analyzing some data collection on target.
> >     It would be nice to succinctly summarize that if you can.
> >      > on linux kernel. it can measure vary system resource usage and
> >     s/it/It/
> >     s/vary/a variety of/
> >      > trace thread/process activities. and it reports vary meaningful
> >      > output to analyze system status.
> >     It reports very meaningful output to analyze system status.
> >      >
> >      > [1] https://github.com/iipeace/guider
> >      >
> >      > Signed-off-by: Peace Lee <iipeace5@gmail.com
> >     <mailto:iipeace5@gmail.com>>
> >      > Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >      > ---
> >      >   .../recipes-devtools/guider/guider_3.9.3.bb
> >     <http://guider_3.9.3.bb>   | 34 +++++++++++++++++++
> >      >   1 file changed, 34 insertions(+)
> >      >   create mode 100644
> >     meta-oe/recipes-devtools/guider/guider_3.9.3.bb <
> http://guider_3.9.3.bb>
> >      >
> >      > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> >     <http://guider_3.9.3.bb>
> >     b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> >     <http://guider_3.9.3.bb>
> >      > new file mode 100644
> >      > index 0000000000..96d6c62ae2
> >      > --- /dev/null
> >      > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
> >     <http://guider_3.9.3.bb>
> >      > @@ -0,0 +1,34 @@
> >      > +SUMMARY = "runtime performance analyzer"
> >      > +HOMEPAGE = "https://github.com/iipeace/guider"
> >      > +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> >      > +AUTHOR = "Peace Lee <ipeace5@gmail.com <mailto:ipeace5@gmail.com
> >>"
> >      > +
> >      > +LICENSE = "GPLv2+"
> >      > +LIC_FILES_CHKSUM =
> >     "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> >      > +
> >      > +SRC_URI = "git://github.com/iipeace/${BPN}
> <http://github.com/iipeace/$%7BBPN%7D>
> >     <http://github.com/iipeace/$%7BBPN%7D>"
> >      > +SRCREV = "ac05a2ce0ab480957d642d947d8f617bd224031d"
> >      > +
> >      > +S = "${WORKDIR}/git"
> >      > +R = "${RECIPE_SYSROOT_NATIVE}"
> >      > +
> >      > +inherit distutils
> >      > +
> >      > +GUIDER_OBJ = "guider.pyc"
> >      > +GUIDER_SCRIPT = "guider"
> >      > +
> >      > +do_install() {
> >      > +    python ${S}/setup.py install
> >      > +
> >      > +    install -d ${D}${bindir}
> >      > +    install -v -m 0755 ${R}/${bindir}/${GUIDER_SCRIPT}
> >     ${D}${bindir}/${GUIDER_SCRIPT}
> >      > +
> >      > +    install -d ${D}${datadir}/${BPN}
> >      > +    install -v -m 0755 ${R}/${datadir}/${BPN}/${GUIDER_OBJ}
> >     ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> >      > +}
> >      > +
> >      > +RDEPENDS_${PN} = "python-ctypes python-shell \
> >      > +                  python-json python-subprocess"
> >
> >     Shouldn't the packages that guider uses be recommended at least?
> >     I'm not familiar with the app so maybe it can do useful things
> without
> >     top, perf, etc.
> >
> >     Should we add a kernel cfg fragment?
> >
> >      > +
> >      > +FILES_SOLIBSDEV = ""
> >      > +#FILES_${PN} = "usr"
> >     Drop that line?
> >
> >      >
> >
> >
> >
> >     --
> >     # Randy MacLeod
> >     # Wind River Linux
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

