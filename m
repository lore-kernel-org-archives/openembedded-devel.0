Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id BCB307CEF7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 04:40:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h13so4334690edq.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 21:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=30AQMPIfcVpg1OdcPsbmu+5EhSg58YqdMTIvWP81ksY=;
	b=hUIN0rQwhVgusqiHZZF/TanGt8ERZPaESQL9JoQCNu3z4pfyP9HeUFZS0bIDy1lACM
	4t3JVj7NdOL6LSkSZeXQ5WZ7ZkrwE5e0UiTBCmwDFCFx/ZmAyUJp0gpL7y2BZxyPrNGr
	IRJZCxcY+mwjqU1u6GLDJat9Hed/o5PwsQ2Wg1KMdXzZ8dyFlJ09rwReAmpdoWkkCTJn
	iFyfuBFT1BCVQsbS4jrijl+xUsxM7TZArHV3rjPF8wWMO+5OKhpsYs5ZJFpLxIjM5h/C
	m9u6NlM2AJCpHzq/5EAfoGggnnTQYW30D76rBAZWKu0/MGWbKnf5r8OdG9gSvI+UYADD
	oZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=30AQMPIfcVpg1OdcPsbmu+5EhSg58YqdMTIvWP81ksY=;
	b=t/rZ8Y+5A9chbsOwczzmgWvZIJKXVHCgExm8abpAJM+VQAMpom4gAK9OnBXW1/KmHd
	ZY9gqk+2tnwHYOXNNquzZef47Ml2U+6EJLiEGFdYaTkhoQ8I9DeEtxp1JlkVghqRKfbw
	j2Seskn+kykI3hIfTLdUo1d8fXCHS2rACO3vzHTML1S1Y98youYzKZp1+55D4oyIf1LO
	xzBQexk7Ww3p5Pn7x8DIbx+GSar+1SQ3/6bn3K8h2ee+6F/H3vV+n7jqvvopk72vzOAF
	AITg67pcdy/ujS5uyfFmzP0F3vxjOXHpz2rX3qBgjpwf2giWidZHCAVbBSXB7MW3nkQf
	fvqg==
X-Gm-Message-State: APjAAAV7koJ4vKbhBg1Xdgr8xhQT67iQRFoIBnIIrLeByvaVw1/JJk3l
	MoBITh/VDuJnUfEe0iqO4t+/DLLEZjNSe+8rp6I=
X-Google-Smtp-Source: APXvYqxuwrG/Oyks1WRyXhYCf5AKL7ez7bGw6gBiaqdeK0brCz4cuk0I7n5EivUgn08VQYDaV3o1LYSdYJM2C2A4DYY=
X-Received: by 2002:a17:906:1105:: with SMTP id
	h5mr28652404eja.53.1565584808284; 
	Sun, 11 Aug 2019 21:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
	<a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
	<CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
	<910f1d32-e526-6ecc-ba4f-cf5c75461725@gmail.com>
In-Reply-To: <910f1d32-e526-6ecc-ba4f-cf5c75461725@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Aug 2019 06:39:57 +0200
Message-ID: <CA+chaQdCTa5q5ds7OVxiss-rwTvjj_uP8fGcoz=oVNBYnehkKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/9] libdbi-perl: fix dependencies
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
X-List-Received-Date: Mon, 12 Aug 2019 04:40:08 -0000
Content-Type: text/plain; charset="UTF-8"

khem: see
https://github.com/kraj/jenkins-jobs/pull/1
which might fix the oe_world_workspace-compare-signatures jenkins job for
you.

On Sun, Jul 21, 2019 at 4:22 AM Khem Raj <raj.khem@gmail.com> wrote:

>
> On 7/17/19 6:04 AM, Martin Jansa wrote:
> > This causes libdbi-perl-native to depend on target perl again, why did
> you
> > revert the fix from:
> >
> http://git.openembedded.org/meta-openembedded/commit/?id=eb868d056d15a56596cbf6ed3a4b66b054f2d563
> > ?
>
>
> I think we should reintroduce the above patch Martin, would you be
> interested to send patch ? we need to rejig the checksum match tests on
> jenkins so
>
> such oversight does not happen.
>
>
> >
> >   === Comparing signatures for task do_populate_sysroot.sigdata between
> > qemux86 and qemux86copy ===
> > ERROR: libdbi-perl-native different signature for task
> > do_populate_sysroot.sigdata between qemux86 and qemux86copy
> > NOTE: Starting bitbake server...
> > NOTE: Started PRServer with DBfile: build/cache/prserv.sqlite3, IP:
> > 127.0.0.1, PORT: 38307, PID: 13970
> > Hash for dependent task perl/perl_5.30.0.bb.do_populate_sysroot
> > changed from
> e3a38726fc849347a14b574ef52a59f5578632accbf70259a6ffd09fea54dc4e
> > to de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
> > Unable to find matching sigdata for
> > oe-core/meta/recipes-devtools/perl/perl_5.30.0.bb.do_populate_sysroot
> > with hash
> de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
> >
> > ERROR: 1 errors found in
> >
> sstate-diff/1563367471/signatures.qemux86copy.do_populate_sysroot.sigdata.log
> >
> >
> >
> > On Fri, Jun 28, 2019 at 7:00 AM Tim Orling <
> timothy.t.orling@linux.intel.com>
> > wrote:
> >
> >> * Fix RDEPENDS, drop class-target (dependencies are the same for native)
> >> * Reorganize recipe to best practices
> >> * Add ptest dependencies
> >>
> >> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> >> ---
> >>   .../perl/libdbi-perl_1.642.bb                 | 38
> +++++++++++++++----
> >>   1 file changed, 31 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> index ff4a9d0610..77991bd158 100644
> >> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> @@ -7,13 +7,6 @@ database interface independent of the actual database
> >> being used. \
> >>   HOMEPAGE = "http://search.cpan.org/dist/DBI/"
> >>   SECTION = "libs"
> >>   LICENSE = "Artistic-1.0 | GPL-1.0+"
> >> -RDEPENDS_${PN}_class-target = " \
> >> -    perl-module-carp \
> >> -    perl-module-exporter \
> >> -    perl-module-exporter-heavy \
> >> -    perl-module-dynaloader \
> >> -"
> >> -
> >>   LIC_FILES_CHKSUM =
> "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
> >>
> >>   SRC_URI = "
> >> http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
> >> @@ -34,4 +27,35 @@ do_install_prepend() {
> >>          rm -rf ${B}/t/z*.t
> >>   }
> >>
> >> +RDEPENDS_${PN} = " \
> >> +    perl-module-carp \
> >> +    perl-module-exporter \
> >> +    perl-module-exporter-heavy \
> >> +    perl-module-dynaloader \
> >> +    perl-module-io-dir \
> >> +    perl-module-scalar-util \
> >> +    perl-module-universal \
> >> +"
> >> +
> >> +RDEPENDS_${PN}-ptest = " \
> >> +    ${PN} \
> >> +    perl-module-b \
> >> +    perl-module-benchmark \
> >> +    perl-module-cwd \
> >> +    perl-module-data-dumper \
> >> +    perl-module-encode \
> >> +    perl-module-encode-byte \
> >> +    perl-module-encode-encoding \
> >> +    perl-module-file-copy \
> >> +    perl-module-file-path \
> >> +    perl-module-lib \
> >> +    perl-module-perlio \
> >> +    perl-module-perlio-scalar \
> >> +    perl-module-perlio-via \
> >> +    perl-module-sdbm-file \
> >> +    perl-module-storable \
> >> +    perl-module-test-more \
> >> +    perl-module-utf8 \
> >> +    "
> >> +
> >>   BBCLASSEXTEND = "native"
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>

