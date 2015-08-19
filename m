Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD2360043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 02:59:37 +0000 (UTC)
Received: by iodb91 with SMTP id b91so211623722iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 19:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=HNE9QgRFyn3GZ/laNWWzBFhjyk8EInTnPGZhCTo4jw8=;
	b=GJue9NVCJMTN+4O43EZnPFcuYACT9XEN8WKDBxGoF70kwTqANtTpGrOI4jr9H9oW+K
	2om91ULq7yiZInHzzGs6m0LKMGxvxbfwMFhmBoXK+zKMsPMHFGdWDhzGeZu1fVKxM8uh
	tacSaZhCdDdRDThtba8LTbHl2cFqT09oamn/yab1UkrTX/ujFg961V9EXcl90tGif3uV
	u3LaWRB1n0OZGJjpqdDUjh+N+o32nBM2uEMscmrhgURO4plubWIOqwNoc08LXjrsSXjH
	EyVTePqwLoJvYOB+DUpCeh5e25xidHsxrAa8VBtRI29L14v6EF3m+GpZHExhnGRqgl3X
	HJ2w==
X-Gm-Message-State: ALoCoQnEaxie7XB4pEaIUe+I+ALoqt7X6JOPGtGBGvgunXKiiilepZMQl12v0B3gSAURYttTsnrF
MIME-Version: 1.0
X-Received: by 10.107.132.146 with SMTP id o18mr10072196ioi.134.1439953177400; 
	Tue, 18 Aug 2015 19:59:37 -0700 (PDT)
Received: by 10.79.13.8 with HTTP; Tue, 18 Aug 2015 19:59:37 -0700 (PDT)
In-Reply-To: <868C0C7A-10F1-48D7-81EB-5429043F1295@gmail.com>
References: <1439916593-11597-1-git-send-email-jkrishnanjanappa@mvista.com>
	<868C0C7A-10F1-48D7-81EB-5429043F1295@gmail.com>
Date: Wed, 19 Aug 2015 08:29:37 +0530
Message-ID: <CAD3vsf5qqcEM_5_m3i2c1e-EYvFxUh4L9ss=fsdri8JarKepsw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] pmtools: add new recipe
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
X-List-Received-Date: Wed, 19 Aug 2015 02:59:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>
> > On Aug 18, 2015, at 9:49 AM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
> >
> > pmtools contains small collection of power management test and
> > investigation tools,
> > acpidump - dump a system=E2=80=99s ACPI tables to an ASCII file
> > acpixtract - convert ASCII acpidump output to raw binary table
> > madt -  parser for ACPI table
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> > .../recipes-devtools/pmtools/pmtools_20130209.bb   | 27
> ++++++++++++++++++++++
> > 1 file changed, 27 insertions(+)
> > create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> >
> > diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> > new file mode 100644
> > index 0000000..1d278fc
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
> > @@ -0,0 +1,27 @@
> > +DESCRIPTION =3D "This is a small collection of power management \
> > +               test and investigation tools"
> > +HOMEPAGE =3D "http://lesswatts.org/projects/acpi"
> > +LICENSE =3D "GPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> > +
> > +PR =3D =E2=80=9Cr0"
>
> punt it.
>
> So, you mean to say remove PR =3D "r0" line in the above commit ?


> > +
> > +SRC_URI =3D "https://github.com/anyc/${BPN}/archive/${PV}.zip=E2=80=9D
>
> are they consistent now ? github could regenerate archives and invalidate
> the checksums.
> may be it would be better to use git fetcher
>
> Okay. I will send v2 to pull in source using git protocol.

Thanks,
Jagadeesh

> > +SRC_URI[md5sum] =3D "98b63903e61b1145b1b17bcfef6ac0b4"
> > +SRC_URI[sha256sum] =3D
> "a043a959d44d616f06dedd30e2045e8e95fed93580e2c146818b6ed3a4b6e448"
> > +
> > +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> > +
> > +do_configure[noexec] =3D "1"
> > +
> > +do_compile() {
> > +     oe_runmake
> > +}
> > +
> > +do_install() {
> > +     install -d ${D}${bindir} ${D}${docdir}
> > +     install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
> > +     install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
> > +     install -m 755 ${S}/madt/madt ${D}${bindir}
> > +     install -m 644 ${S}/README ${D}${docdir}
> > +}
> > --
> > 1.9.1
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

