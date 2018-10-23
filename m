Return-Path: <anders.roxell@linaro.org>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63FE071C54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 13:33:11 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i185-v6so522723ywa.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oE/C98QSTqCnpJOG0ZKxQvbaQwvmGNGAlWA+h4wRjKM=;
	b=Q7IBWhXOq3Om4xV9mTUn+pDmBTQ9SwOwwW3GU0EjZu59vIgJr8JpA/3YfoIIYXtVa5
	LWlQZq2mugj0i7g4Cj6n56bY7jEEgceCqKGh/HjyZXS9mVwItnrsxTbO4vuPh4U2bmi0
	IMlPQ5Og02Loh0vsp9PlQI85DErOWg6tvN3EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oE/C98QSTqCnpJOG0ZKxQvbaQwvmGNGAlWA+h4wRjKM=;
	b=h4jrGnfUKWG5MR+tnTQIloFYsVJg4VRXSdEnBfJHPaJTOaR5iI02dmtXtF61BK2TUN
	x3qSy5poe/UVt52986SLUoJ4KRv7BICCM+1YgLc5JfBUiv3Qc/hLoL7DUq8sW4AIjgQd
	T4IX2Ez2UChh4eXRXKeG7UvD4TCiVhU/0ATyvvk4Jb2VIkDEX1mLNlfefctNzWd2Qsya
	cJRsiGX1hRnUu/doO1y/iAb7c0EGCY3qNiJPIjmsJzXR4ZDUcyGW+S6xFoXgKqn6k6/m
	HMXdUF0AIldMERPM/a0KEnmFi4ul8YJJzEy4JFFv/BG3gqq9sezpvIJ8+8xzo5QIMbUa
	7zAQ==
X-Gm-Message-State: ABuFfojL9OXtI5+nCVsVNMlkgZeDsPquqbP0D4MgOtW3UIGv6wxDDDu4
	lVJ0PgEQHeJgXQFLjwsMHfkfq9Zi97AwFwMTS8wn6w==
X-Google-Smtp-Source: ACcGV62s9PpV7gt/a0wtUoUks90CduuNw0T+ucYGDZ2uh4iqEnHcNbSY+5SvOFnFTJzVHmd7VJfj6ZArUrFzSCQLwGg=
X-Received: by 2002:a81:a40f:: with SMTP id
	b15-v6mr34903133ywh.56.1540301592090; 
	Tue, 23 Oct 2018 06:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181019145416.8021-1-anders.roxell@linaro.org>
	<407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
	<CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
In-Reply-To: <CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 23 Oct 2018 15:33:00 +0200
Message-ID: <CADYN=9+7AwJAPhr-59fU5nKTySat=auW6_ab-1WkAjpn4qYksQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paolo Valente <paolo.valente@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] add a storage I/O benchmark test suite
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
X-List-Received-Date: Tue, 23 Oct 2018 13:33:11 -0000
Content-Type: text/plain; charset="UTF-8"

CCing in the package maintainer.

On Sun, 21 Oct 2018 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Oct 21, 2018 at 12:29 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > On 10/19/18 10:54 AM, Anders Roxell wrote:
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > ---
> > >   .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 +++++++++++++++++++
> > >   1 file changed, 30 insertions(+)
> > >   create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > >
> > > diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > > new file mode 100644
> > > index 000000000000..77d172814065
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > > @@ -0,0 +1,30 @@
> > > +SUMMARY = "Small collection of benchmarks for storage I/O"
> > > +LICENSE = "GPLv2"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> > > +
> > > +SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> > > +PV = "0.0+git${SRCPV}"
> > > +SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +# installing in /opt/S-suite since the package has
> > > +# dependencies to the directory structure.
> > > +do_install() {
> > > +    install -d ${D}/opt/S-suite
> > > +    for i in $(find ${S}/* -type d); do
> > > +        install -d ${D}/opt/S-suite/$(basename $i)
> > > +        install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
> > > +    done
> > > +
> > > +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
> > > +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> > > +}
> > > +
> > > +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> > > +
> > > +FILES_${PN} = "/opt/S-suite/"
> > > +
> > > +# added to INSANE_SKIP since s-suite have an runtime
> > > +# dependency (RDEPENDS) on libaio-dev.
> > > +INSANE_SKIP_${PN} += "dev-deps"
> > >
> >
> > Thanks for the submission but from:
> >
> >     https://github.com/Algodev-github/S
> >
> >     "These benchmarks have been written just for internal use,
> >      and are more a yard than a well-finished work."
> >
> >
> > That doesn't lead to a lot of confidence that these suite will
> > be maintained for years. What's the value to meta-oe users to add
> > this recipe compared to something that has been around for years
> > if not decades such as Bonnie++:
> >     https://layers.openembedded.org/layerindex/recipe/864/
> >
>
> how I read this is that they have not made proper installation
> targets and its dependencies or letting user know of the dependencies
> which actually is not a problem with OE since both
> of these would be taken care of in the recipe with
> do_install and DEPENDS

Do you mean DEPENDS or RDEPENDS?

Cheers,
Anders

