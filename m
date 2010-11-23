Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PL2FQ-0000yu-IK
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 00:26:05 +0100
Received: by gwaa11 with SMTP id a11so5524267gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=/4eHYWcwzTTO/jigHwZItuOKYeHj89sCvxrUGTO5/A0=;
	b=jJa9XuzpsbnBqS/SejABhyDknLSjLXY/W4o8oRj6hndmcS6+VJAtKaK+ijrXomDcPD
	PZ3cNI5BAt0oUz8yRqJ8ImzqKQnTOojtZuth4uHa35WnvKZNT3H7dveDbaRfH3aDa/3E
	Px55JOi4SZzwFn1IUMv9DS5ThZczykpcTfw4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cH53QMp8gO8gNSLsV3L9g+qqP8ia3QF29bA+ETeZLTOsxGKIUqocCRyT4KfD3hm+yp
	NiFDKrJT1ZB2pSDGuB5YsClWi9KqealGT4QVozsSv3hs0xsu7iYxqfaE79ij9DylOSxC
	r6Gnxm6r21a1QWMXuO+9h62HfUNBX66r+KQCU=
Received: by 10.91.47.38 with SMTP id z38mr9532450agj.129.1290554690287; Tue,
	23 Nov 2010 15:24:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 15:24:30 -0800 (PST)
In-Reply-To: <4CEC4778.6070108@gmail.com>
References: <4CEC4778.6070108@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 15:24:30 -0800
Message-ID: <AANLkTi=1Whw8861UwjF=uqu4qteWwz2bDBDrnHCNsc9E@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutls_2.10.2.bb: Fix parallel build failure.
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
X-List-Received-Date: Tue, 23 Nov 2010 23:26:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 3:00 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> In file included from core.c:32:
> enums.h:3:1: error: unterminated #ifndef
> In file included from core.c:40:
> enum-map.i.c:867:1: error: unterminated argument list invoking macro "SCM=
_SMOB_PRINT"
> In file included from errors.c:28:
> enums.h:3:1: error: unterminated #ifndef
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

did you send this to gnutl upstream ml ? what do they have to say about it =
?
patch look ok to me though

> ---
> =C2=A0recipes/gnutls/gnutls-2.10.2/parallel-build.patch | =C2=A0 15 +++++=
++++++++++
> =C2=A0recipes/gnutls/gnutls_2.10.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A02 files changed, 17 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/gnutls/gnutls-2.10.2/parallel-build.patc=
h
>
> diff --git a/recipes/gnutls/gnutls-2.10.2/parallel-build.patch b/recipes/=
gnutls/gnutls-2.10.2/parallel-build.patch
> new file mode 100644
> index 0000000..d170c4f
> --- /dev/null
> +++ b/recipes/gnutls/gnutls-2.10.2/parallel-build.patch
> @@ -0,0 +1,15 @@
> +Upstream: http://git.savannah.gnu.org/gitweb/?p=3Dgnutls.git;a=3Dcommit;=
h=3D23f761290ca6f905f062d2de217acb012e5a38b2
> +
> +diff --git a/guile/src/Makefile.am.orig b/guile/src/Makefile.am
> +index e8e81b1..2ee1297 100644
> +--- a/guile/src/Makefile.am.orig
> ++++ b/guile/src/Makefile.am
> +@@ -122,7 +122,7 @@ extra-smob-types.i.c: $(srcdir)/make-smob-types.scm
> + snarfcppopts =3D $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CFLAGS) $(AM_CFLAGS) =
$(GUILE_CFLAGS)
> +
> +-.c.x:
> ++.c.x: $(BUILT_SOURCES)
> + =C2=A0 =C2=A0 =C2=A0 $(guile_snarf) -o $@ $< $(snarfcppopts)
> +
> + # Target used by doc/Makefile, to create all built sources necessary
> diff --git a/recipes/gnutls/gnutls_2.10.2.bb b/recipes/gnutls/gnutls_2.10=
.2.bb
> index 97a3c11..8af70ec 100644
> --- a/recipes/gnutls/gnutls_2.10.2.bb
> +++ b/recipes/gnutls/gnutls_2.10.2.bb
> @@ -1,6 +1,6 @@
> =C2=A0require gnutls.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0LICENSE_${PN}-extra =3D "GPLv3"
>
> @@ -9,6 +9,7 @@ EXTRA_OECONF +=3D " --without-libgcrypt-prefix "
> =C2=A0SRC_URI +=3D "file://gettextize-with-gettext-0.18.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnutls-openssl.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnutls-replace-siginterr=
upt.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://parallel-build.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0do_configure_prepend() {
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


