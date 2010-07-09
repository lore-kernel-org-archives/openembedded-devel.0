Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXHQn-0005ll-1K
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 19:32:10 +0200
Received: by gwj22 with SMTP id 22so1535210gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=N60mZyqKlw+daoBr15J5yJk8HVbSacY4W6CeXBA30Ws=;
	b=St/7XUGSXyOAf2VwwI8dnKpEljE+MTybaik6uxRzcoiMnoMxCW2BU8UBn+YJVRVssl
	bDPkpIGJ1EewbfbjZbuwNyVUjSxcFRrgNJRxCW9nIJcHw7KnA/uQqelFgE8rFwk50D2B
	/inEpGB5cAJPMroSz6RZeFN2bC2P85sTeOsTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tAmsoVxKyxUG/dPOqh0qc9kMj1+9rp1Y/GiXsE6JSfPZ0/blWz0qgxIrT9pJDn6s7q
	GaIBbQt1qcbTGLMFkOGn+JXXViRFKYGGfQIXv0/UEIlo4Mu/N/r8XkYiHYZQRyNFSDuL
	HstS/GTN9chYjZoHOgHeNqVVlepoukU+yOEGA=
Received: by 10.151.116.2 with SMTP id t2mr2226827ybm.336.1278696434222; Fri, 
	09 Jul 2010 10:27:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Fri, 9 Jul 2010 10:26:54 -0700 (PDT)
In-Reply-To: <AANLkTilZLkPIUyR-9VUjtukyfTDo7KzcAPt0p0og_zCD@mail.gmail.com>
References: <AANLkTilZLkPIUyR-9VUjtukyfTDo7KzcAPt0p0og_zCD@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Jul 2010 10:26:54 -0700
Message-ID: <AANLkTik1KwzaMkn6ZBH9-BkMVPb09p_1SSjJClwJxsMS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] gcc patch to avoid host include when compiling gcc-cross
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jul 2010 17:32:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 9, 2010 at 4:57 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Since the introduction of linux-libc-headers-native my gcc-cross fails
> to build (unless I avoid building linux-libc-headers-native by telling
> that it is ASSUME_PROVIDED).
>
> Reason is that linux-libc-headers-native installs the host
> asm/unistd.h in sysroots/i686-linux/usr/include/asm/unistd.h
> My architecture (nios2) has a different unistd.h.
>
> Now gcc-cross compiles libgcc.a and adds among others $(GMPINC) to the
> include path.
> However this is a host path pointing to sysroots/i686-linux/usr/include.
> This causes gcc-cross for nios2 to pick up the wrong unistd.h (causing
> compilation of libgcc to fail).
>
> libgcc does not need GMP (at least not to my knowledge) and having a
> host include when compiling target code does not seem like a good idea
> either.
> In order to fix this I've made a small patch to Makefile.in
> This one creates a new var TARGET_INCLUDES which contains all includes
> minus GMPINC.
> THen INCLUDES is defined to $(TARGET_INCLUDES) $(GMPINC.) (to get the
> original includes back.
> And lastly the build rule for libgcc.a is modified to use
> $(TARGET_INCLUDES) instead of =A0$(INCLUDES)
>
> Below is the patch I made. This is not yet a formal patch submission.
> Instead this posting is made for a few reasons
> - to create awareness and explain the issue

The approach is ok. however it has to be applied to other libraries too
and also the crt so its not limited to libgcc only.

> - to get some feedback on the patch
> - if there are suggestion for improvements or for better solutions I'd
> like to know
> - and last but not least: assuming the patch is ok, how are we going
> to get it in.
> I've tested this for gcc 4.1.2 (but there are 20 other gcc versions aroun=
d :-( )

We need to patch all used gcc versions 4.5 and 4.4 and 4.3

>
> Enjoy! Frans.
>
> Index: gcc-4.1.2/gcc/Makefile.in
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- gcc-4.1.2.orig/gcc/Makefile.in
> +++ gcc-4.1.2/gcc/Makefile.in
> @@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
> =A0# -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> =A0# currently being compiled, in both source trees, to be examined as we=
ll.
> =A0# libintl.h will be found in ../intl if we are using the included libi=
ntl.
> -INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> +#
> +# TARGET_INCLUDES is added to avoid that GMPINC (which points to the hos=
t
> +# include dir) is used for compiling libgcc.a
> +TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> =A0 =A0 =A0 =A0 =A0 -I$(srcdir)/../include @INCINTL@ \
> - =A0 =A0 =A0 =A0 =A0$(CPPINC) $(GMPINC)
> + =A0 =A0 =A0 =A0 =A0$(CPPINC)
> +INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
>
> =A0.c.o:
> =A0 =A0 =A0 =A0$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> @@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> =A0 =A0 =A0 =A0$(MAKE) \
> =A0 =A0 =A0 =A0 =A0CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
> =A0 =A0 =A0 =A0 =A0CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
> - =A0 =A0 =A0 =A0 INCLUDES=3D"$(INCLUDES)" \
> + =A0 =A0 =A0 =A0 INCLUDES=3D"$(TARGET_INCLUDES)" \
> =A0 =A0 =A0 =A0 =A0MAKEOVERRIDES=3D \
> =A0 =A0 =A0 =A0 =A0-f libgcc.mk all
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


