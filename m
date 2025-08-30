Return-Path: <josephjamesmills@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2A0CA0FFE
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 20:14:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.17206.1756584883528855274
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 13:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNvm5+g4;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: josephjamesmills@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61cbe5cef28so6177886a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756584881; x=1757189681; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQgyP8l1MDXAgQDd+XzrJDH9ATS8xQxfuRXQbKngag4=;
        b=MNvm5+g4jR2FodNJPjLjoUs0WoeHv3hhj7MbIj0bJC5G7SwPuAgGK/RVyCPwqbFMUS
         OJTSXtYNz3WGOQDjNHJ3Ur60poZLBezpZY60KgI6H+a60Hj6bRfFlB+BpPVBYMJ68pPf
         igy6PEoBfCSa9XKI8mvD9s4SyDB0oHzM5VkUqIbuEQNzQUjYi8BKEaQ/niSEPvwYVyqk
         oPpIehjltE6+BlZ3u2eY8TM2b9aGVycDkdDVPUMV9mhx5lcW9Js6am399ray8JPuHLI5
         ZsRevzbo3vDuqRHrsFUob9TBqF2NMYEQUwsfVTQjrUOCn8mF2u3ndyAtJ88EqcOp56ux
         ms0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756584881; x=1757189681;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQgyP8l1MDXAgQDd+XzrJDH9ATS8xQxfuRXQbKngag4=;
        b=I8dDlwlW70FBmFQhyTFQhQ8PZbcuh2PDceSQNmW0unrwkWcTw0fdKmKtAdt2NkqWS9
         j8GKYyL44UQQ+WoA3UJ8qCbNTwmptY1aKldwoHRxjqDtlcZesoETd8MvEcvzJfYmDd4A
         QH6hdFnanvYcLGScyJiPZNqepNhd4NVMVMK+nAIcx2FkQaaLPuvJxj/XNRMwe7OgFPkz
         cR9IGqbxLAetz4HEyK4+hm64X2i7PUB5vQgs4oaHFq6A0mxtvrr1SfmmnLj+9rpC5v5E
         bSGmYe5ahjuyIkwffgTo6l9R5Lccy0gGa2LzEeAKI4KJYsHq098EDLRgtyf33+P1MfWz
         qXMw==
X-Gm-Message-State: AOJu0Yzzksp/H1qN4y1oWO5HPkBB2PrEkCZzd6R14lUG2SKozKfe8Zag
	jq+DmvZtucjSprn6bY6huZRFj4PdrwjPay07SwmKjVoqcA2p0tH5nXVIz8qrTcv3CQhrcpbUqHB
	LfSCzHiRHs8Ok3WV5DtT+zFkAooZT9ms5bRkeIz4=
X-Gm-Gg: ASbGncsboLiVZLNwO18OxPOd8OT6MAF8Os7SEyY6YR6ULiCLUEBUUvjPdjeBlpL2oOH
	fnClaBrLo7fmi8T0XhLXI4nSj3CexRxjF7wCOrF4CVMdV3gzS3DkNfWj2ozjWQRsdA30iqKhZin
	pCXKMMCOeW3VEqwU2ivskC5mTOUmN9C7uWkrLAlp1AvaJiHI7mkH1sP+jwWfsNasSjXayvGqWZD
	QRbYwUCDfe8L0MD
X-Google-Smtp-Source: AGHT+IEJ1q5+WI09dgus0Q7WaWnjs+6plo9f3fWneCRHHRtSm9EueDwKlBk5ExIQpvdY/1zJB0UyIU4q6PxhhLSE1zM=
X-Received: by 2002:a05:6402:46c5:b0:61c:e7c3:923c with SMTP id
 4fb4d7f45d1cf-61d26d5bdf6mr1982438a12.12.1756584881191; Sat, 30 Aug 2025
 13:14:41 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Mills <josephjamesmills@gmail.com>
Date: Sat, 30 Aug 2025 15:14:30 -0500
X-Gm-Features: Ac12FXynmAKqss25dvqYqddwqcx4bf634gQhxI0ij3sPn1LtDFKgCnWcBau6Tco
Message-ID: <CAKv13C+yecjvKL8OGsRqDas5J6kW--i+8vruei7aH9RwBPSb2A@mail.gmail.com>
Subject: [BUG] meta-perl: libcapture-tiny-perl-native installs into
 ${D}${STAGING_DIR_NATIVE} so Capture/Tiny.pm never reaches native sysroot
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dc82f4063d9ac98b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 20:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119150

--000000000000dc82f4063d9ac98b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I=E2=80=99m seeing a native-packaging/sysroot staging issue with
libcapture-tiny-perl on current meta-perl.

Environment
Host: Debian sid (for reproducibility reports)
Poky: perl-native 5.38.4 (meta/recipes-devtools/perl/perl_5.38.4.bb)
meta-perl: libcapture-tiny-perl 0.48 (BBCLASSEXTEND =3D "native")
cpan.bbclass + perlnative.bbclass

Symptom (consumer fails to find Capture::Tiny in native sysroot)
A dependent native build (e.g. libunix-statgrab) dies with:

Can't locate Capture/Tiny.pm in @INC ...

In that consumer=E2=80=99s workdir:

$ find recipe-sysroot-native/usr/lib/perl5 -name Tiny.pm
# (empty)
$ find recipe-sysroot/usr/lib/perl5 -name Tiny.pm
.../vendor_perl/5.38.4/Capture/Tiny.pm   # target variant present

Provider logs (native variant)
libcapture-tiny-perl-native:do_install writes under an absolute path that
includes the provider=E2=80=99s recipe-sysroot-native:

NOTE: make -j 32 DESTDIR=3D.../libcapture-tiny-perl-native/0.48/image
install_vendor
Installing
.../image/.../recipe-sysroot-native/usr/lib/perl5/vendor_perl/5.38.4/Captur=
e/Tiny.pm
Installing
.../image/.../recipe-sysroot-native/usr/share/man/man3/Capture::Tiny.3

So the file ends up at:
${D}${STAGING_DIR_NATIVE}/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm

instead of the expected:
${D}/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm

Because do_populate_sysroot stages from ${D}/usr/..., anything under
${D}${STAGING_DIR_NATIVE}/usr/... is skipped. The provider=E2=80=99s
recipe-sysroot-native thus lacks Capture/Tiny.pm, and dependents can=E2=80=
=99t use
Capture::Tiny.

Configure context
cpan.bbclass runs:

perl ... Makefile.PL INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 =
...

For class-native, perl-native=E2=80=99s Config.pm advertises
installvendorlib/installvendorarch as absolute paths pointing into the
provider=E2=80=99s .../recipe-sysroot-native/usr/.... ExtUtils::MakeMaker t=
hen
combines those absolutes with DESTDIR=3D${D}, producing the
${D}${STAGING_DIR_NATIVE}/... install tree shown above.

Minimal reproduction
bitbake -c cleanall libcapture-tiny-perl-native
bitbake -c install libcapture-tiny-perl-native
# Observe absolute path under image/:
find tmp/work/*-linux/libcapture-tiny-perl-native/*/image -name 'Tiny.pm'
-print
# Observe absence in staged sysroot:
bitbake -c populate_sysroot libcapture-tiny-perl-native
find tmp/work/*-linux/libcapture-tiny-perl-native/*/recipe-sysroot-native
-name 'Tiny.pm' -print

Impact
Affects *-native CPAN modules that install into vendor_perl. Target builds
are fine; only native staging is affected. In downstream recipes this
presents as missing Capture/Tiny.pm (or similar CPAN modules) despite
correct DEPENDS.

Proposed direction
For class-native in cpan.bbclass, pass relative vendor install dirs to
Makefile.PL so DESTDIR=3D${D} lands under ${D}/usr/... (prefix-relative),
which do_populate_sysroot will stage as usual. For example:

#??? Conceptual sketch for class-native: ???
Makefile.PL ... \
  INSTALLVENDORLIB=3D${libdir}/perl5/vendor_perl/${perlver} \
  INSTALLVENDORARCH=3D${libdir}/perl5/vendor_perl/${perlver}/${perlhostarch=
}

That would keeps target behavior unchanged, and fixes native staging
without per-recipe hacks.
Workaround (recipe-local, for those blocked now) In a
libcapture-tiny-perl_%.bbappend limited to class-native, forcing relative
vendor paths at configure time unblocks the build:

EXTRA_CPANFLAGS:append:class-native =3D " \
    INSTALLVENDORLIB=3D${libdir}/perl5/vendor_perl/${@get_perl_version(d)} =
\

 INSTALLVENDORARCH=3D${libdir}/perl5/vendor_perl/${@get_perl_version(d)}/${=
@get_perl_hostarch(d)}
\
"
After that, do_install places Capture/Tiny.pm under
${D}/usr/lib/perl5/vendor_perl/..., and do_populate_sysroot stages it
correctly.

Happy to provide full logs/workdirs privately if needed. Thanks!

=E2=80=94 Joseph Mills (jmills)

--000000000000dc82f4063d9ac98b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I=E2=80=99m seeing a native-packaging/sysro=
ot staging issue with libcapture-tiny-perl on current meta-perl.<br><br>Env=
ironment<br>Host: Debian sid (for reproducibility reports)<br>Poky: perl-na=
tive 5.38.4 (meta/recipes-devtools/perl/<a href=3D"http://perl_5.38.4.bb">p=
erl_5.38.4.bb</a>)<br>meta-perl: libcapture-tiny-perl 0.48 (BBCLASSEXTEND =
=3D &quot;native&quot;)<br>cpan.bbclass + perlnative.bbclass<br><br>Symptom=
 (consumer fails to find Capture::Tiny in native sysroot)<br>A dependent na=
tive build (e.g. libunix-statgrab) dies with:<br><br>Can&#39;t locate Captu=
re/Tiny.pm in @INC ...<br><br>In that consumer=E2=80=99s workdir:<br><br>$ =
find recipe-sysroot-native/usr/lib/perl5 -name Tiny.pm<br># (empty)<br>$ fi=
nd recipe-sysroot/usr/lib/perl5 -name Tiny.pm<br>.../vendor_perl/5.38.4/Cap=
ture/Tiny.pm =C2=A0 # target variant present<br><br>Provider logs (native v=
ariant)<br>libcapture-tiny-perl-native:do_install writes under an absolute =
path that includes the provider=E2=80=99s recipe-sysroot-native:<br><br>NOT=
E: make -j 32 DESTDIR=3D.../libcapture-tiny-perl-native/0.48/image install_=
vendor<br>Installing .../image/.../recipe-sysroot-native/usr/lib/perl5/vend=
or_perl/5.38.4/Capture/Tiny.pm<br>Installing .../image/.../recipe-sysroot-n=
ative/usr/share/man/man3/Capture::Tiny.3<br><br>So the file ends up at:<br>=
${D}${STAGING_DIR_NATIVE}/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm<=
br><br>instead of the expected:<br>${D}/usr/lib/perl5/vendor_perl/5.38.4/Ca=
pture/Tiny.pm<br><br>Because do_populate_sysroot stages from ${D}/usr/..., =
anything under ${D}${STAGING_DIR_NATIVE}/usr/... is skipped. The provider=
=E2=80=99s recipe-sysroot-native thus lacks Capture/Tiny.pm, and dependents=
 can=E2=80=99t use Capture::Tiny.<br><br>Configure context<br>cpan.bbclass =
runs:<br><br>perl ... Makefile.PL INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 NO_=
PACKLIST=3D1 ...<br><br>For class-native, perl-native=E2=80=99s Config.pm a=
dvertises installvendorlib/installvendorarch as absolute paths pointing int=
o the provider=E2=80=99s .../recipe-sysroot-native/usr/.... ExtUtils::MakeM=
aker then combines those absolutes with DESTDIR=3D${D}, producing the ${D}$=
{STAGING_DIR_NATIVE}/... install tree shown above.<br><br>Minimal reproduct=
ion<br>bitbake -c cleanall libcapture-tiny-perl-native<br>bitbake -c instal=
l libcapture-tiny-perl-native<br># Observe absolute path under image/:<br>f=
ind tmp/work/*-linux/libcapture-tiny-perl-native/*/image -name &#39;Tiny.pm=
&#39; -print<br># Observe absence in staged sysroot:<br>bitbake -c populate=
_sysroot libcapture-tiny-perl-native<br>find tmp/work/*-linux/libcapture-ti=
ny-perl-native/*/recipe-sysroot-native -name &#39;Tiny.pm&#39; -print<br><b=
r>Impact<br>Affects *-native CPAN modules that install into vendor_perl. Ta=
rget builds are fine; only native staging is affected. In downstream recipe=
s this presents as missing Capture/Tiny.pm (or similar CPAN modules) despit=
e correct DEPENDS.<br><br>Proposed direction<br>For class-native in cpan.bb=
class, pass relative vendor install dirs to Makefile.PL so DESTDIR=3D${D} l=
ands under ${D}/usr/... (prefix-relative), which do_populate_sysroot will s=
tage as usual. For example:<br><br>#??? Conceptual sketch for class-native:=
 ???<br>Makefile.PL ... \<br>=C2=A0 INSTALLVENDORLIB=3D${libdir}/perl5/vend=
or_perl/${perlver} \<br>=C2=A0 INSTALLVENDORARCH=3D${libdir}/perl5/vendor_p=
erl/${perlver}/${perlhostarch}<br><br>That would keeps target behavior unch=
anged, and fixes native staging without per-recipe hacks.<br>Workaround (re=
cipe-local, for those blocked now) In a libcapture-tiny-perl_%.bbappend lim=
ited to class-native, forcing relative vendor paths at configure time unblo=
cks the build:<br><br>EXTRA_CPANFLAGS:append:class-native =3D &quot; \<br>=
=C2=A0 =C2=A0 INSTALLVENDORLIB=3D${libdir}/perl5/vendor_perl/${@get_perl_ve=
rsion(d)} \<br>=C2=A0 =C2=A0 =C2=A0INSTALLVENDORARCH=3D${libdir}/perl5/vend=
or_perl/${@get_perl_version(d)}/${@get_perl_hostarch(d)} \<br>&quot;<br>Aft=
er that, do_install places Capture/Tiny.pm under ${D}/usr/lib/perl5/vendor_=
perl/..., and do_populate_sysroot stages it correctly.<br><br>Happy to prov=
ide full logs/workdirs privately if needed. Thanks!<br><br>=E2=80=94 Joseph=
 Mills (jmills)</div>

--000000000000dc82f4063d9ac98b--

