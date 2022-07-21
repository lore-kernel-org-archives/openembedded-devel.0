Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2068FC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 01:50:12 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.1175.1658368202449241311
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jul 2022 18:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q1o1oWdm;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id t7so160567qvz.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jul 2022 18:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Q/m/X5RNvmFL+3VrJx1sWOmeSQLBmF+M8TH7+Mj8P4=;
        b=Q1o1oWdm7TmYoEW1qD0MRuzn58g3+8VjJPvxf9jAYrpekPkBL6HLluzkS/bsCLpjh7
         I1ump1yz5dcqrioqH7T40F1Oz3er80GMx6ncYfTKWLdB8SVpovLF/U+G0GpQpdfl+ui/
         JUAVnbggcyMekmZbgVLVrz6QNfoZjt6n/mvcr1UV9ZLLZhFh3RNJ6YstZMOqk+YABS4p
         XDux6QocOa4/wCvQfoNjlB+vV+iWrk8FEX+MvaCgkzQyOqrnes/X4c2lVw0UU9v6dGZ7
         x9WMQc+0MNdkbXADrX5BPw8qni/S+5AkGH0ePXK+0y0qhgCUpOPEb1f/ljgglKY0li0g
         qGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Q/m/X5RNvmFL+3VrJx1sWOmeSQLBmF+M8TH7+Mj8P4=;
        b=Vf9fLGJSkDBRLjTIUJ2Pa0/5HsNncljcvmEAkoh6OuUObCgYGknAgQ2NpDKFYEbeJ7
         OvlaEpNrmh+uSZLyl0UonB12yzFGOctNMHmr12WcmRfscr0w3MaXEnKEI5/QJuq2+zfO
         nN72XOlmd1Jx8GNjwZuvNRlAU2QE1k+F/fqNaQ6LeYtprUwjMwnPgKgQiy9PF4BIiLYI
         qpijWpyDYJZj+q3L0HqqYgvWItIWHd4b7emzbKshuj4cW4IRiRc0yMtrkwjDZ/QP9vJY
         9XItXqiAouzryGUa0k/EMr/9kQS2g8rG74QGZmJhUKzC7Fmy1zC7Gh0jtld+Yw/1pWmW
         Mlqg==
X-Gm-Message-State: AJIora80+0IcwH/cxy0/FYYXo1p7ToAHrXv7azbJgGI5u8W1iA1FiI8P
	JPX/QE/JtWtXOL4inYGDsp7QKdZ4fa9ClUM4s9U=
X-Google-Smtp-Source: 
 AGRyM1usBlNZRxX/UyXluAge8eoWN774GABWZPrg3VJH1Q8eaMENgHvF3WaKlfLnZPdV8vPcS8GFmUtyfycyWcHKGy0=
X-Received: by 2002:ad4:5bcf:0:b0:473:75ec:9f75 with SMTP id
 t15-20020ad45bcf000000b0047375ec9f75mr32112962qvt.36.1658368201048; Wed, 20
 Jul 2022 18:50:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABTo8gCtGV+rgy-gP1pz56n7mTUs=pVeUmeJ70ii1L+qU_YC0Q@mail.gmail.com>
In-Reply-To: 
 <CABTo8gCtGV+rgy-gP1pz56n7mTUs=pVeUmeJ70ii1L+qU_YC0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jul 2022 21:49:34 -0400
Message-ID: 
 <CAMKF1sov5CZrAS1EpDcX0rrHpE_hPFTQnH336japgtY6_NCnaQ@mail.gmail.com>
Subject: Re: [oe][meta-perl] Update the HOMEPAGE variables that reference
 http://search.cpan.org
To: "J. S." <schonm@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 01:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97910

Can you rebase it on latest master or master-next and resend please

On Wed, Jul 20, 2022 at 10:51 AM J. S. <schonm@gmail.com> wrote:
>
> http://search.cpan.org redirects traffic to https://metacpan.org
>
> Update the HOMEPAGE variable to the newly resolved address.
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../recipes-extended/mime-construct/mime-construct_1.11.bb      | 2 +-
>  .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb    | 2 +-
>  meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb  | 2 +-
>  meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb    | 2 +-
>  meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb  | 2 +-
>  meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb               | 2 +-
>  meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb     | 2 +-
>  meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb    | 2 +-
>  meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb    | 2 +-
>  meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb               | 2 +-
>  .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb   | 2 +-
>  .../recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb  | 2 +-
>  .../recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb  | 2 +-
>  .../libextutils/libextutils-installpaths-perl_0.012.bb          | 2 +-
>  meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 +-
>  meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb        | 2 +-
>  meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb | 2 +-
>  meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb  | 2 +-
>  meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb       | 2 +-
>  .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb   | 2 +-
>  .../recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb      | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb        | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb        | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb        | 2 +-
>  meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb    | 2 +-
>  meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb     | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb   | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb        | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb    | 2 +-
>  .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb   | 2 +-
>  meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb      | 2 +-
>  meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb    | 2 +-
>  32 files changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> index a5d28265d..b8787da74 100644
> --- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> +++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Constructs and (by default) mails MIME
> messages. \
>                 It is entirely driven from the command line, it is \
>                 designed to be used by other programs, or people who act \
>                 like programs."
> -HOMEPAGE = "http://search.cpan.org/~rosch/mime-construct/mime-construct"
> +HOMEPAGE = "https://metacpan.org/release/ROSCH/mime-construct-1.11/view/mime-construct"
>  SECTION = "mail"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=5e2e5da619ac8ef8c84767ccc4656e96"
> diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> index d87df0974..49c8ecf20 100644
> --- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> +++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> @@ -7,7 +7,7 @@ program.   It is guaranteed to find the *smallest
> possible* set of \
>  differences. \
>  "
>  SECTION = "libs"
> -HOMEPAGE = "http://search.cpan.org/~nedkonz/Algorithm-Diff/"
> +HOMEPAGE = "https://metacpan.org/release/NEDKONZ/Algorithm-Diff-${PV}"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =
> "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> index ee7c4d750..be9c7af1c 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "The Authen::Radius module provides a
> simple class that \
>      Radius server. \
>  "
>
> -HOMEPAGE = "http://search.cpan.org/~manowar/RadiusPerl"
> +HOMEPAGE = "https://metacpan.org/release/MANOWAR/RadiusPerl-${PV}"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-2.0"
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> index 8545eb50f..998fcdc71 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> @@ -2,7 +2,7 @@ SUMMARY = "SASL Authentication framework for Perl"
>  DESCRIPTION = "SASL is a generic mechanism for authentication used by
> several network \
>  protocols. Authen::SASL provides an implementation framework that all \
>  protocols should be able to share."
> -HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
> +HOMEPAGE = "https://metacpan.org/dist/Authen-SASL"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> index a51d327a3..cad459a36 100644
> --- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> +++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> @@ -8,7 +8,7 @@ a dozen capturing modules to use in any particular
> situation and just use \
>  this one."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~dagolden/Capture-Tiny/"
> +HOMEPAGE = "https://metacpan.org/dist/Capture-Tiny"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
> diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
> b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
> index 4c9864094..b20430ab6 100644
> --- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
> +++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.54.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "CGI.pm is a stable, complete and mature
> solution for processing a
>  HTTP requests and responses. Major features including processing form \
>  submissions, file uploads, reading and writing cookies, query string
> generation \
>  and manipulation, and processing and preparing HTTP headers."
> -HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
> +HOMEPAGE = "https://metacpan.org/release/LEEJO/CGI-4.28/view/lib/CGI.pod"
>  SECTION = "libs"
>  LICENSE = "Artistic-2.0 | GPL-2.0-only"
>
> diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> index 4493a7e5e..3ef2abe7e 100644
> --- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> +++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> @@ -7,7 +7,7 @@ of each line shows the printable characters \
>  (all others are shown as single dots).\
>  "
>
> -HOMEPAGE = "http://search.cpan.org/~ftassin/Data-HexDump-0.02/lib/Data/HexDump.pm"
> +HOMEPAGE = "https://metacpan.org/release/FTASSIN/Data-HexDump-0.02/view/lib/Data/HexDump.pm"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0"
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> index 51a2ad349..74b47bfd7 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Keyed-Hashing for Message Authentication"
>  DESCRIPTION = "Keyed-Hashing for Message Authentication"
> -HOMEPAGE = "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
> +HOMEPAGE = "https://metacpan.org/release/GAAS/Digest-HMAC-1.03"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> index cd6367512..68c3fb5e1 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Perl interface to the SHA-1 algorithm "
>  DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
> -HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
> +HOMEPAGE = "https://metacpan.org/release/GAAS/Digest-SHA1-2.13"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> index 79fff9d52..af7fec70d 100644
> --- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> +++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Perl maintains environment variables in
> a special hash named %ENV
>  For when this access method is inconvenient, the Perl module Env
> allows environment \
>  variables to be treated as scalar or array variables."
>
> -HOMEPAGE = "http://search.cpan.org/~flora/Env/"
> +HOMEPAGE = "https://metacpan.org/dist/Env"
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> index a58d96582..20a07ce15 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> @@ -2,7 +2,7 @@ SUMMARY = "ExtUtils::Config - A wrapper for perl's
> configuration"
>  DESCRIPTION = "ExtUtils::Config is an abstraction around the %Config hash."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
> +HOMEPAGE = "https://metacpan.org/dist/ExtUtils-Config"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
> b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
> index 04a29fdc2..5f7ed29a2 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
> @@ -6,7 +6,7 @@ It can generate the necessary options to the
> Module::Build constructor or \
>  to ExtUtils::MakeMaker's WriteMakefile function."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~smueller/ExtUtils-CppGuess/"
> +HOMEPAGE = "https://metacpan.org/release/SMUELLER/ExtUtils-CppGuess-0.07"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =
> "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
> b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
> index 8534822e6..988bca6ed 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
> @@ -2,7 +2,7 @@ SUMMARY = "ExtUtils::Helpers - Various portability
> utilities for module builders
>  DESCRIPTION = "This module provides various portable helper function
> for module building modules."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
> +HOMEPAGE = "https://metacpan.org/dist/ExtUtils-Helpers"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=223c04045664f72c3a6556462612bddd"
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> index 07dab4e16..91e96610f 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "This module tries to make install path
> resolution as easy \
>  as possible."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
> +HOMEPAGE = "https://metacpan.org/dist/ExtUtils-InstallPaths"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
> diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
> b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
> index 1d04f0054..4234e65f8 100644
> --- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
> +++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
> @@ -6,7 +6,7 @@ needs to write a full-featured SSL client or server
> application: \
>  multiple SSL contexts, cipher selection, certificate verification, and \
>  SSL version selection. As an extra bonus, it works perfectly with \
>  mod_perl."
> -HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
> +HOMEPAGE = "https://metacpan.org/dist/IO-Socket-SSL"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> index 389be2c16..684fb2d9e 100644
> --- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> @@ -2,7 +2,7 @@ SUMMARY = "IPC::Signal - Utility functions dealing with signals"
>  DESCRIPTION = "IPC::Signal - This module contains utility functions for \
>  dealing with signals."
>
> -HOMEPAGE = "http://search.cpan.org/~rosch/IPC-Signal-1.00/"
> +HOMEPAGE = "https://metacpan.org/dist/IPC-Signal"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> index 1e4b56353..98ac834ed 100644
> --- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> +++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> @@ -4,7 +4,7 @@ functions for retrieving message strings from
> databases constructed to \
>  internationalize software."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~pvandry/Locale-gettext-${PV}/"
> +HOMEPAGE = "https://metacpan.org/release/PVANDRY/Locale-gettext-${PV}"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
> diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
> b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
> index 20557a3f3..0c5a1b9fe 100644
> --- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
> +++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "MIME::Charset - Charset Information for MIME."
>  DESCRIPTION = "MIME::Charset provides information about character
> sets used for MIME \
>  messages on Internet."
> -HOMEPAGE = "http://search.cpan.org/~nezumi/MIME-Charset-${PV}/"
> +HOMEPAGE = "https://metacpan.org/release/NEZUMI/MIME-Charset-${PV}"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
> b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
> index 2c06728ed..c53ee70c1 100644
> --- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
> +++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
> @@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a
> mime-type is need.\
>  \n\
>  This module maintains a set of MIME::Type objects, which each describe \
>  one known mime type."
> -HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
> +HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-${PV}"
>  SECTION = "libraries"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
> b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
> index ff3f4d694..929399389 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.039.bb
> @@ -7,7 +7,7 @@ Whereas Module::Build has over 6,700 lines of code;
> this module has less than \
>  120, yet supports the features needed by most distributions."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
> +HOMEPAGE = "https://metacpan.org/dist/Module-Build-Tiny"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=57b8100f0b648cd37fbc3725fe3c111a"
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> index 205df6802..e15ba3024 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> @@ -14,7 +14,7 @@ are applied on any Perl version where the bugs
> exist, except for a case where \
>  one of the bugs cannot be adequately worked around in pure Perl."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
> +HOMEPAGE = "https://metacpan.org/dist/Module-Runtime"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =
> "file://README;beginline=36;endline=44;md5=9416434672a57853d6181f3da9094963"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> index 4c4faab4d..93e818d5d 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> @@ -6,7 +6,7 @@ Turbo Fredriksson's PHP-IDN. \
>  "
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> -HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
> +HOMEPAGE = "https://metacpan.org/dist/Net-LibIDN"
>  DEPENDS += "libidn"
>  # We must need glibc-gconvs to enable charset related functions,
>  # such as Net::LibIDN::idn_to_ascii().
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> index 5d0eccd84..9a06c9e82 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> @@ -4,7 +4,7 @@ web pages on SSL servers (for symmetry, same API is
> offered for \
>  accessing http servers, too), a sslcat() function for writing your own \
>  clients, and finally access to the SSL api of SSLeay/OpenSSL package \
>  so you can write servers or clients for more complicated applications."
> -HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
> +HOMEPAGE = "https://metacpan.org/dist/Net-SSLeay"
>  SECTION = "libs"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> index d7d420104..be0083b37 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> @@ -8,7 +8,7 @@ These interactive features include the ability to
> specify a time-out and to \
>  wait for patterns to appear in the input stream, such as the prompt from a \
>  shell."
>
> -HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
> +HOMEPAGE = "https://metacpan.org/dist/Net-Telnet"
>  SECTION = "Development/Libraries"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> index ffd87ed0b..543bcc54c 100644
> --- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Interpret and act on wait() status values"
>  DESCRIPTION = "This module contains functions for interpreting and acting \
>  on wait status values."
>
> -HOMEPAGE = "http://search.cpan.org/~rosch/Proc-WaitStat/"
> +HOMEPAGE = "https://metacpan.org/dist/Proc-WaitStat"
>  SECTION = "libraries"
>
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> index f4ce3131d..8064226e9 100644
> --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> @@ -6,7 +6,7 @@ handy functions for working with terminals. One of the
> main goals is to \
>  have the functions as portable as possible, so you can just plug in 'use \
>  Term::ReadKey' on any architecture and have a good likelihood of it \
>  working."
> -HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
> +HOMEPAGE = "https://metacpan.org/release/JSTOWE/TermReadKey-${PV}"
>  SECTION = "libraries"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> index 29118129a..75a2c9263 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> @@ -10,7 +10,7 @@ width of the first character of the given string and
> mbswidth() gives the \
>  width of the whole given string."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~kubota/Text-CharWidth-${PV}/"
> +HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-CharWidth-${PV}"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> index afdf63ede..b4f538ee4 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> @@ -6,7 +6,7 @@ faster than shelling out to a system's diff executable
> for small files, \
>  and generally slower on larger files."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
> +HOMEPAGE = "https://metacpan.org/release/OVID/Text-Diff-${PV}"
>
>  LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> index 017e951d3..114ddb505 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> @@ -11,7 +11,7 @@ characters). Also, minimal handling of languages
> which doesn't use \
>  whitespaces between words (like Chinese and Japanese) is supported."
>  SECTION = "libs"
>
> -HOMEPAGE = "http://search.cpan.org/~kubota/Text-WrapI18N-${PV}/"
> +HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-WrapI18N-${PV}"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> index 7962d22c9..ca20542da 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> @@ -8,7 +8,7 @@ of putting all characters into a single event. \
>  "
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> -HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
> +HOMEPAGE = "https://metacpan.org/dist/XML-Filter-BufferText"
>  DEPENDS += "libxml-sax-perl-native"
>  RDEPENDS:${PN} += "libxml-sax-perl"
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> index c2898a901..1ab3a7b54 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> @@ -6,7 +6,7 @@ The module is split into several packages which are
> not described in this \
>  section; unless stated otherwise, you only need to use XML::LibXML; in \
>  your programs."
>
> -HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
> +HOMEPAGE = "https://metacpan.org/release/SHLOMIF/XML-LibXML-1.99"
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0|GPL-1.0-or-later"
>  DEPENDS += "libxml2 \
> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> index 487a5c22c..17b65dba5 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> @@ -8,7 +8,7 @@ the AxKit XML Application Server. \
>  "
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> -HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
> +HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Writer"
>  DEPENDS += "libxml-filter-buffertext-perl-native"
>  RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
>
> --
> 2.34.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97907): https://lists.openembedded.org/g/openembedded-devel/message/97907
> Mute This Topic: https://lists.openembedded.org/mt/92506170/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

