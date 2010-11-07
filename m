Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PF2AE-0005z6-CJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 11:07:56 +0100
Received: by gwaa11 with SMTP id a11so3017978gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=xEcQulI0wG5KzMvcW+C1z2Vr1iXQPo1DRa2q/OqLiSk=;
	b=ghlw7eEK/l00hbsYsLlWGYWSwZgeoFrZsqU6YozBo4mPLbvd0rMSfAL0a+SnYKiZNT
	zRt5TjoaluAiSeV7tbmTleekT36f4FRtzEvEF6wc818eZ2hteZc0OU6i2dZSZM3k+oGr
	4ExCABzybsKVt2JalV5Rk7TGQuHS4juhTD0ag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QQutEVIVYFVegbMNx0yj0V7ODsYp0E4y8LtvqtJVWK+CMqbk9RZIOfRNZwBjJPHD6o
	wOcYhcEqtp8TfKCaCUP01ejRT64WkXkf8slWDHdBmTw4qDNeX2j2ScmbvZOlBBiE3q8i
	veFI1XMR7dj7sb/NLN9XpFJfLHsdr1x3n94GA=
Received: by 10.91.11.6 with SMTP id o6mr3666842agi.91.1289124416276; Sun, 07
	Nov 2010 02:06:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sun, 7 Nov 2010 02:06:36 -0800 (PST)
In-Reply-To: <1289113016-26867-1-git-send-email-khimov@altell.ru>
References: <1288773858.3980.10.camel@mattotaupa>
	<1289113016-26867-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Nov 2010 02:06:36 -0800
Message-ID: <AANLkTikrb+s-A5aXmHN66fU+xG8Vw20YDS96jQfr=_xL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libprelude: workaroung build failures with libtool 2.4
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
X-List-Received-Date: Sun, 07 Nov 2010 10:07:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 11:56 PM, Roman I Khimov <khimov@altell.ru> wrote:
> Like:
>
> In file included from prelude-plugin.c:56:0:
> /include/prelude-plugin.h:66:20: error: conflicting types for 'lt__PROGRA=
M__LTX_preloaded_symbols'
> /oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include/ltdl.h:106:36: note: previous declaration of 'lt__PROGRAM__L=
TX_preloaded_symbols' was here
> make[4]: *** [prelude-plugin.lo] Error 1
>

hmmm is  /include/prelude-plugin.h a generated file then you could see
if it needs alteration.
will this patch still work with older libtools

> Originally reported by Paul Menzel <paulepanter@users.sourceforge.net>.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../libprelude-1.0.0/fix-ltdl-hack.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 21 ++++++++++++++++++++
> =C2=A0recipes/libprelude/libprelude_1.0.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 23 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/libprelude/libprelude-1.0.0/fix-ltdl-hac=
k.patch
>
> diff --git a/recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch b/re=
cipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch
> new file mode 100644
> index 0000000..c6f147f
> --- /dev/null
> +++ b/recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch
> @@ -0,0 +1,21 @@
> +libtool 2.4 changed lt__PROGRAM__LTX_preloaded_symbols definition to
> +
> +extern LT_DLSYM_CONST lt_dlsymlist lt__PROGRAM__LTX_preloaded_symbols[];
> +
> +but there is no easy way to find its version to fix it properly, so it's=
 a
> +temporary hack to make at least libprelude compile.
> +Index: libprelude-1.0.0/src/include/prelude-plugin.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libprelude-1.0.0.orig/src/include/prelude-plugin.h 2010-11-06 21:30:=
18.000000000 +0300
> ++++ libprelude-1.0.0/src/include/prelude-plugin.h =C2=A0 =C2=A0 =C2=A020=
10-11-06 21:30:47.000000000 +0300
> +@@ -61,9 +61,8 @@
> + =C2=A0*/
> + #ifdef PRELUDE_APPLICATION_USE_LIBTOOL2
> + # define lt_preloaded_symbols lt__PROGRAM__LTX_preloaded_symbols
> +-#endif
> +-
> + extern const void *lt_preloaded_symbols[];
> ++#endif
> +
> + #define PRELUDE_PLUGIN_SET_PRELOADED_SYMBOLS() =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 prelude_plugin_set_preloaded_symbols(lt_pre=
loaded_symbols)
> diff --git a/recipes/libprelude/libprelude_1.0.0.bb b/recipes/libprelude/=
libprelude_1.0.0.bb
> index d99af1c..85f7acd 100644
> --- a/recipes/libprelude/libprelude_1.0.0.bb
> +++ b/recipes/libprelude/libprelude_1.0.0.bb
> @@ -2,13 +2,14 @@ DESCRIPTION =3D "Libprelude is a library that guarantee=
s secure connections betwee
> =C2=A0SECTION =3D "net"
> =C2=A0DEPENDS =3D "gnutls libgcrypt zlib perl perl-native"
> =C2=A0LICENSE =3D "GPLv2"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI =3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://www.prelude-ids.com/download/releases/l=
ibprelude/${PN}-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libprelude-dont-regenerate-perl-makefil=
e.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libprelude-perl-build-with-gnu-hash.pat=
ch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libprelude-fix-uid-gid-conflicting-type=
s.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://fix-ltdl-hack.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> =C2=A0SRC_URI[md5sum] =3D "a5bb76538d240e5fac5f6ab0b7fabfe5"
> =C2=A0SRC_URI[sha256sum] =3D "e16d83a6a7bcc43a02d6f2bd40c91a03a258a9a86ba=
b42262cbb5adaba8c4640"
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


