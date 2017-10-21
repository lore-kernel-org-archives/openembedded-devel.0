Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 72E9971974
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 00:15:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n14so13188825pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ipe4w/2xIM/rY9fAkDfJ+yX172aZQQ23NKdNuypiFAU=;
	b=dlZgKDmVE+2fXaQ0FH/IYtpAzgRFZteoHe+ll6r7EISpZQLb7WV9r/anN9l/ZTGkeT
	cVuRV7/Z0imSfrUgcQbDxmaGCc20ZDUpOszMfD+2dG3z439iJZAGhJAFh5e1O68LhhNo
	7YesTjb8wXaiDiRODJZ0+NqL2sXc4JdXdwKkA4A9Ov8FRyD2IEe1pkt5Cv3iHw57tw/k
	NRl9lgmsZ2HQOSs1d7s5CJNA/gRSUvGgsaCa4KGlXu+hl8GjPB02hEZXEMelhygJuIDn
	tBNlNvhRBSmTIrL3es/SilQjRlWtIY4KOiq+IkeEZHAYuESVKuD67LjHmKOoPFuPFX1m
	SMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ipe4w/2xIM/rY9fAkDfJ+yX172aZQQ23NKdNuypiFAU=;
	b=keZrF97vg2jNLe5SgmSHFaplb9/sG707Vhp7DryGSJe2UyZm4KnSxBKffJT5KuSEiA
	CxQgIsk6HOwzksSBnCMgwXx53k7pVOMNfjuH2QBHVb/7w95OaEkeyKkIHWUceD8q/IgN
	vR4VbAAFG9lPvnNTbcEWD4AOIZNF5PzAyGuVvPGJIzCajJpE4DHSSEXbJ+pspecNWy9u
	ABuN/m+65BTe5f5HU9n0+41A2Zft3EN8MosITaR7z2kYEGiS/KOZwXlWBZz7dHeybk5w
	E4CPDwqsjtgaIP3aaSBB9/8b2pFDA6yCKsyKOIvBzu4NDy/kbkY/ecyMmQdCJGl+gEnB
	mE/A==
X-Gm-Message-State: AMCzsaVB4h4Vku37jc7uGZOTuEXOsuKN5QvAKv6/JpygbJuAP+226bl9
	Fb2QCujx8jw09EGq1I4flf1UMVX2yzZxdQhthuY=
X-Google-Smtp-Source: ABhQp+SY97wGo+O923HhS38kbKJayrSHutSzk9cYCnekeYSNwNQ6cdF8HFmPlT6Gsw3b295QTBhmu8bFpoalS+IG3gA=
X-Received: by 10.99.107.197 with SMTP id g188mr5860719pgc.341.1508544910033; 
	Fri, 20 Oct 2017 17:15:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 20 Oct 2017 17:14:39 -0700 (PDT)
In-Reply-To: <1508538555-12051-1-git-send-email-armccurdy@gmail.com>
References: <1508538555-12051-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Oct 2017 17:14:39 -0700
Message-ID: <CAMKF1sqAdkRhgMhuh0JsYcFyGMmbz42WUEDwM8coowqW8qQynQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
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
X-List-Received-Date: Sat, 21 Oct 2017 00:15:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 20, 2017 at 3:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>  - Backport Debian fix for "partial loss of message body, sending
>    message to wrong recipicients" issue:
>
>      https://sources.debian.net/patches/ssmtp/2.64-8/ssmtp-bug584162-fix.patch/
>
>  - Control ipv6 support based on ipv6 DISTRO feature.
>  - Enable ssl support by default (and add PACKAGECONFIG option to
>    control it).
>  - Drop inetutils dependency (inetutils provides only applications,
>    not libraries or header files, so a build dependency on it doesn't
>    make sense).
>  - Drop pkgconfig class (the ssmtp configure script etc doesn't make
>    any use of pkg-config).
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../ssmtp/ssmtp/ssmtp-bug584162-fix.patch          | 126 +++++++++++++++++++++
>  .../recipes-support/ssmtp/ssmtp_2.64.bb            |  24 ++--
>  2 files changed, 140 insertions(+), 10 deletions(-)
>  create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
>
> diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch b/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
> new file mode 100644
> index 0000000..e087bc7
> --- /dev/null
> +++ b/meta-networking/recipes-support/ssmtp/ssmtp/ssmtp-bug584162-fix.patch
> @@ -0,0 +1,126 @@
> +Bug-Debian: http://bugs.debian.org/584162
> +Reported-By: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
> +Forwarded: not-needed
> +Reviewed-By: Anibal Monsalve Salazar <anibal@debian.org>
> +Last-Update: 2014-08-15
> +
> +From: "Daniel Richard G." <skunk@iSKUNK.ORG>
> +Subject: Re: ssmtp: Partial loss of message body, sending message to wrong recipicients
> +Date: Thu, 19 Jun 2014 14:44:30 -0400
> +
> +Attached is a patch against the original 2.64 source that should address
> +this bug, and hopefully not break anything. An overview of my changes:
> +
> +* Added code to standarise() to drop the trailing '\r' if the line
> +  originally ended with "\r\n".
> +
> +* Added a check to header_parse() that effectively converts an "\r\n" in
> +  the input into '\n'.
> +
> +* Added a conditional so that header_parse() doesn't pass the empty
> +  string to header_save()---a behavior I observed in testing, at the end
> +  of a header block with "\r\n" line endings.
> +
> +* Simplified the last if(in_header) conditional in header_parse(),
> +  because it erroneously assumes that if in_header == True, then c could
> +  have some value other than EOF. (See the condition on the previous
> +  "while" loop, and the lack of any other way to exit said loop.)
> +
> +  header_parse() will now properly grab a header if fed a message
> +  without a body (i.e. no "\n\n" ending the header block), although this
> +  code will still drop a header if there is no newline at the end.
> +
> +Christoph, thank you for your excellent analysis, and the test cases. I
> +made use of them, and with my changes sSMTP appears to do the right
> +thing.
> +
> +Debian patch from: https://sources.debian.net/patches/ssmtp/2.64-8/
> +
> +Upstream-Status: Backport [debian]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +
> +Index: ssmtp-2.64/ssmtp.c
> +===================================================================
> +--- ssmtp-2.64.orig/ssmtp.c
> ++++ ssmtp-2.64/ssmtp.c
> +@@ -375,6 +375,12 @@ bool_t standardise(char *str, bool_t *li
> +       if((p = strchr(str, '\n'))) {
> +               *p = (char)NULL;
> +               *linestart = True;
> ++
> ++              /* If the line ended in "\r\n", then drop the '\r' too */
> ++              sl = strlen(str);
> ++              if(sl >= 1 && str[sl - 1] == '\r') {
> ++                      str[sl - 1] = (char)NULL;
> ++              }
> +       }
> +       return(leadingdot);
> + }
> +@@ -768,6 +774,14 @@ void header_parse(FILE *stream)
> +               }
> +               len++;
> +
> ++              if(l == '\r' && c == '\n') {
> ++                      /* Properly handle input that already has "\r\n"
> ++                         line endings; see https://bugs.debian.org/584162 */
> ++                      l = (len >= 2 ? *(q - 2) : '\n');
> ++                      q--;
> ++                      len--;
> ++              }
> ++
> +               if(l == '\n') {
> +                       switch(c) {
> +                               case ' ':
> +@@ -790,7 +804,9 @@ void header_parse(FILE *stream)
> +                                               if((q = strrchr(p, '\n'))) {
> +                                                       *q = (char)NULL;
> +                                               }
> +-                                              header_save(p);
> ++                                              if(len > 0) {
> ++                                                      header_save(p);
> ++                                              }
> +
> +                                               q = p;
> +                                               len = 0;
> +@@ -800,35 +816,12 @@ void header_parse(FILE *stream)
> +
> +               l = c;
> +       }
> +-      if(in_header) {
> +-              if(l == '\n') {
> +-                      switch(c) {
> +-                              case ' ':
> +-                              case '\t':
> +-                                              /* Must insert '\r' before '\n's embedded in header
> +-                                                 fields otherwise qmail won't accept our mail
> +-                                                 because a bare '\n' violates some RFC */
> +-
> +-                                              *(q - 1) = '\r';        /* Replace previous \n with \r */
> +-                                              *q++ = '\n';            /* Insert \n */
> +-                                              len++;
> +-
> +-                                              break;
> +-
> +-                              case '\n':
> +-                                              in_header = False;
> +-
> +-                              default:
> +-                                              *q = (char)NULL;
> +-                                              if((q = strrchr(p, '\n'))) {
> +-                                                      *q = (char)NULL;
> +-                                              }
> +-                                              header_save(p);
> +-
> +-                                              q = p;
> +-                                              len = 0;
> +-                      }
> ++      if(in_header && l == '\n') {
> ++              /* Got EOF while reading the header */
> ++              if((q = strrchr(p, '\n'))) {
> ++                      *q = (char)NULL;
> +               }
> ++              header_save(p);
> +       }
> +       (void)free(p);
> + }
> diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> index 9d4864d..07e3ffe 100644
> --- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> +++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> @@ -1,25 +1,29 @@
>  SUMMARY = "extremely simple MTA to get mail off the system to a mail hub"
>  HOMEPAGE = "http://packages.qa.debian.org/s/ssmtp.html"
> -
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
>
> -SRC_URI = "\
> -           ${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
> +SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
> +           file://ssmtp-bug584162-fix.patch \
>             file://build-ouside_srcdir.patch \
>             file://use-DESTDIR.patch \
> -          "
> -
> -EXTRA_OECONF += "--mandir=${mandir}"
> -
> -EXTRA_OEMAKE = "GEN_CONFIG='/bin/true'"
> +"
>
>  SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
>  SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
>
> -inherit autotools pkgconfig
> +inherit autotools

Is this intentional to drop pkgconfig ?

> +
> +PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +
> +PACKAGECONFIG[ssl] = "--enable-ssl,--disable-ssl,openssl"
> +PACKAGECONFIG[ipv6] = "--enable-inet6,--disable-inet6"
> +
> +EXTRA_OECONF += "--mandir=${mandir}"
> +
> +EXTRA_OEMAKE = "GEN_CONFIG='/bin/true'"
>
> -DEPENDS += "openssl inetutils"
> +LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'ssl', '-lssl -lcrypto', '', d)}"
>
>  do_install_append () {
>      install -d ${D}${mandir}/
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

