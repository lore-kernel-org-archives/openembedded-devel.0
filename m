Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.12431.1601129935090837977
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 07:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKAmIglp;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id s131so1449121qke.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Slo88vTujm0Qi6CzPAZJdvqAugs6W8dCHTENeNFZCCA=;
        b=hKAmIglpPH1S/qEa4utpAAiYMfeHKNwoqfbJRnP2vOGxHvrUWm0rAOf8oZ3GhEBB6k
         9wE6h3s6bPtAoOnAe6JqAgx82kn8h82OQ4WL2NcNG0NWNPvArITasAabrvMEldVshQ/+
         sqnaELvoZxU/5i5U0EfEhrf37nqVIltjUtLCLAOo/q6kM8xpA41mjyiMDGwzpHDFDOxd
         xM4/KWPQAMrkNuhrZhaDHiTKlbhY3QL3+w7yA7bsaCMOOjOg+prxacsPNzA8PgBLsrMy
         MWlxYufv2V0eOqQdHftE/h/5YoJWUAIcYWCxclCTqzihtDP0rtsfv95gbylSbrdY3/9B
         vB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Slo88vTujm0Qi6CzPAZJdvqAugs6W8dCHTENeNFZCCA=;
        b=IiEuxFToEAwBCys2eml0n3+8zyWz6Rlz2VOpQoVsWKjIFNQMWWP0OgFOuOAnZdUHmx
         PMzRJGvTM9DZ8ikTNz63vX1tB5h4j8uQGhR1CcHNu39n42MPIFDe9wS7X+pLSNlutDEQ
         ItcRGiRMhKS39WEXGGFxY7FxKov5pXjAbQl0EWuXckkcwQoflTj0fmCwzOh8LooOJFaA
         w6eK3II1FGtXAgXUNP480xUrkvTndiWaSGI3Uzb5xaFGtZyreG7ISRh0+a6okkCJrS1f
         063rO9yVnQ6GEBqh1qEds+cV3M1As2+TQ5X42d4zisZ49ycUzBAui0+1nD4xCieXxxsb
         LdKw==
X-Gm-Message-State: AOAM530EYynkscBn8nhvAYWrYJ7ZelxTRBBXFHR0apkEk0povls3fs1z
	iWudfcQzQiaTM2xNeheQ8gxE2NFD0H2+qYChSVY=
X-Google-Smtp-Source: ABdhPJxGyMJduTuuA8JHe8luIgHsdQafvj+ESXZ6e6rD8uy0ApVuOP79+jLhREWBIf1AnFQE3eSCzIm8KQkPBSOidxc=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr4815980qko.474.1601129934114;
 Sat, 26 Sep 2020 07:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200925212051.18414-1-akuster808@gmail.com> <CAMKF1sq_NeerBCsR1LKAMA0QMFtSWrZRm9czC8ALNSh8Xuk02Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq_NeerBCsR1LKAMA0QMFtSWrZRm9czC8ALNSh8Xuk02Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Sep 2020 07:18:26 -0700
Message-ID: <CAMKF1so9SbeLv81oU20aE4RGvS9hx93YWNt0khUrSwRGOEzvGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmocka: add recipe
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster@mvista.com>
Content-Type: text/plain; charset="UTF-8"

Now this recipe is added I wonder if libldb and samba can use this
copy instead of their internal version ?

On Fri, Sep 25, 2020 at 5:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you add it to appropriate packagegroups too for testing purposes
>
> On Fri, Sep 25, 2020 at 2:20 PM akuster <akuster808@gmail.com> wrote:
> >
> > From: Armin Kuster <akuster@mvista.com>
> >
> > includes ptest and bundling of examples that can be used for testing
> >
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 37 +++++++++++++++++++++
> >  meta-oe/recipes-test/cmocka/files/run-ptest | 10 ++++++
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> >  create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest
> >
> > diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> > new file mode 100644
> > index 0000000000..6125d116cd
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> > @@ -0,0 +1,37 @@
> > +DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
> > +objects. It only requires the standard C library, works on a range of computing \
> > +platforms (including embedded) and with different compilers."
> > +HOMEPAGE = "https://cmocka.org/"
> > +
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
> > +SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
> > +           file://run-ptest "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake ptest
> > +
> > +EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
> > +
> > +do_install_append () {
> > +    install -d ${D}${datadir}/${BPN}/example
> > +    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
> > +    install -d ${D}${datadir}/${BPN}/example/mock/uptime
> > +
> > +    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
> > +    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
> > +    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> > +    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> > +}
> > +
> > +do_install_ptest () {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> > +}
> > +
> > +PACKAGE_BEFORE_PN += "${PN}-examples"
> > +
> > +FILES_${PN}-examples = "${datadir}/${BPN}/example"
> > diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
> > new file mode 100644
> > index 0000000000..48b9cd9fc5
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/cmocka/files/run-ptest
> > @@ -0,0 +1,10 @@
> > +#!/bin/sh
> > +
> > +cd tests
> > +for i in `ls *`; do
> > +   if [ ./$i ] ; then
> > +       echo "PASS: $i"
> > +   else
> > +       echo "FAIL: $i"
> > +   fi
> > +done
> > --
> > 2.17.1
> >
> >
> > 
> >
