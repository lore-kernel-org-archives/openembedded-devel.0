Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE2B7E797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 04:44:55 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id q4so4515571qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 21:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ngKS6+4KAkLq26OytDdDakmnEJ7GNndcXiEfh4CA2+A=;
	b=ueSOg0lU1KoUvf2NEaFAfzl/KM17lQU2hFxTTJS/aAfe7xa9J3Lmv5Og+u8/5FFNYe
	23DabbNRVoJqGbZfZUMC1Jl9+HPilDN+hgwFR0bSRBCnt+ySVFs7lqkYR+29ocM9MIwN
	ztmLz77vFpIN2yCCDUiWCYw6agZIrCF6fLILpOrtfduW92mMEB87vSnaqxIZeHP55bLy
	MKbTOgPNdhXz/SVmjTn24MzBY2TbjJbw8VuP4ciNcWCU+t2UaFWMxJlC5eN03CJDQJ+P
	KPblkmGZPzUaqpt7jxGD9P9Jf4VREbQMdq4ERFOUJ2N0OUqT9ukNUaT5cItv1S+Jt/7r
	xlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ngKS6+4KAkLq26OytDdDakmnEJ7GNndcXiEfh4CA2+A=;
	b=ndtJ1it0Ww8rE3N3uUCeb915xkcy8uKNzDfvCmhhu3+oHxPyxZMZ88PZUqbMZCV+JI
	Q3wuTfNLf1z4xNT9IzWJdG+RU+zNFQVdLBKNdqX3ylL091iQkTkNzGWl69ngIZBY+MZx
	8EBI0cbmk3LvcNfxI6bP5//UftMUMY6v9q0/H3tuFjTCEud6B6tIRBZgVMg4l/lKmclF
	KpOFF2Yc3W6lKyElLdB0XDuMXWMzPdEZzxTAbL9MGXhlDGPwuMC1Ehz4XJchXBRzV37f
	UWVIEqIY9bRcveIDD3+5sP+YosGX7XZK1WoqbJjVeAULnLVAZCCIPhBSSHHz1T8rPL67
	9Cuw==
X-Gm-Message-State: APjAAAXE6FIoedz3umHLNXSEjTTbrRsfFJ/A7SYTfJoGmAcQHaNOwBxc
	zDyyV+f1809EnnqqGaMkk0+jK5zJUpMFLNGQL+U=
X-Google-Smtp-Source: APXvYqzKY6JPH0z65n9dIteEWyiJNolbWDI75WOWWRq2X73yRQKPbLiKKlPbb/2haom0U0IBcxgM9RCApPfq+aX8zEc=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr28627644qtn.378.1565585096276;
	Sun, 11 Aug 2019 21:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
	<a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
	<CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
	<910f1d32-e526-6ecc-ba4f-cf5c75461725@gmail.com>
	<CA+chaQdCTa5q5ds7OVxiss-rwTvjj_uP8fGcoz=oVNBYnehkKg@mail.gmail.com>
In-Reply-To: <CA+chaQdCTa5q5ds7OVxiss-rwTvjj_uP8fGcoz=oVNBYnehkKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 21:44:30 -0700
Message-ID: <CAMKF1sroB7p8YhnLCumPT+Fk1cCk5s90SdDPdhzeXfyOf6bAng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 12 Aug 2019 04:44:55 -0000
Content-Type: text/plain; charset="UTF-8"

thx applied, lets see in next run

On Sun, Aug 11, 2019 at 9:40 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> khem: see
> https://github.com/kraj/jenkins-jobs/pull/1
> which might fix the oe_world_workspace-compare-signatures jenkins job for you.
>
> On Sun, Jul 21, 2019 at 4:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On 7/17/19 6:04 AM, Martin Jansa wrote:
>> > This causes libdbi-perl-native to depend on target perl again, why did you
>> > revert the fix from:
>> > http://git.openembedded.org/meta-openembedded/commit/?id=eb868d056d15a56596cbf6ed3a4b66b054f2d563
>> > ?
>>
>>
>> I think we should reintroduce the above patch Martin, would you be
>> interested to send patch ? we need to rejig the checksum match tests on
>> jenkins so
>>
>> such oversight does not happen.
>>
>>
>> >
>> >   === Comparing signatures for task do_populate_sysroot.sigdata between
>> > qemux86 and qemux86copy ===
>> > ERROR: libdbi-perl-native different signature for task
>> > do_populate_sysroot.sigdata between qemux86 and qemux86copy
>> > NOTE: Starting bitbake server...
>> > NOTE: Started PRServer with DBfile: build/cache/prserv.sqlite3, IP:
>> > 127.0.0.1, PORT: 38307, PID: 13970
>> > Hash for dependent task perl/perl_5.30.0.bb.do_populate_sysroot
>> > changed from e3a38726fc849347a14b574ef52a59f5578632accbf70259a6ffd09fea54dc4e
>> > to de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
>> > Unable to find matching sigdata for
>> > oe-core/meta/recipes-devtools/perl/perl_5.30.0.bb.do_populate_sysroot
>> > with hash de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
>> >
>> > ERROR: 1 errors found in
>> > sstate-diff/1563367471/signatures.qemux86copy.do_populate_sysroot.sigdata.log
>> >
>> >
>> >
>> > On Fri, Jun 28, 2019 at 7:00 AM Tim Orling <timothy.t.orling@linux.intel.com>
>> > wrote:
>> >
>> >> * Fix RDEPENDS, drop class-target (dependencies are the same for native)
>> >> * Reorganize recipe to best practices
>> >> * Add ptest dependencies
>> >>
>> >> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> >> ---
>> >>   .../perl/libdbi-perl_1.642.bb                 | 38 +++++++++++++++----
>> >>   1 file changed, 31 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> >> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> >> index ff4a9d0610..77991bd158 100644
>> >> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> >> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> >> @@ -7,13 +7,6 @@ database interface independent of the actual database
>> >> being used. \
>> >>   HOMEPAGE = "http://search.cpan.org/dist/DBI/"
>> >>   SECTION = "libs"
>> >>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>> >> -RDEPENDS_${PN}_class-target = " \
>> >> -    perl-module-carp \
>> >> -    perl-module-exporter \
>> >> -    perl-module-exporter-heavy \
>> >> -    perl-module-dynaloader \
>> >> -"
>> >> -
>> >>   LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
>> >>
>> >>   SRC_URI = "
>> >> http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
>> >> @@ -34,4 +27,35 @@ do_install_prepend() {
>> >>          rm -rf ${B}/t/z*.t
>> >>   }
>> >>
>> >> +RDEPENDS_${PN} = " \
>> >> +    perl-module-carp \
>> >> +    perl-module-exporter \
>> >> +    perl-module-exporter-heavy \
>> >> +    perl-module-dynaloader \
>> >> +    perl-module-io-dir \
>> >> +    perl-module-scalar-util \
>> >> +    perl-module-universal \
>> >> +"
>> >> +
>> >> +RDEPENDS_${PN}-ptest = " \
>> >> +    ${PN} \
>> >> +    perl-module-b \
>> >> +    perl-module-benchmark \
>> >> +    perl-module-cwd \
>> >> +    perl-module-data-dumper \
>> >> +    perl-module-encode \
>> >> +    perl-module-encode-byte \
>> >> +    perl-module-encode-encoding \
>> >> +    perl-module-file-copy \
>> >> +    perl-module-file-path \
>> >> +    perl-module-lib \
>> >> +    perl-module-perlio \
>> >> +    perl-module-perlio-scalar \
>> >> +    perl-module-perlio-via \
>> >> +    perl-module-sdbm-file \
>> >> +    perl-module-storable \
>> >> +    perl-module-test-more \
>> >> +    perl-module-utf8 \
>> >> +    "
>> >> +
>> >>   BBCLASSEXTEND = "native"
>> >> --
>> >> 2.20.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>

