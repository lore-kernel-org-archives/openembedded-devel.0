Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P6Avk-00064Q-Vn
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 01:40:25 +0200
Received: by yxj4 with SMTP id 4so2107559yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ifV66xqxySng+e3NfHuIkrB7Jzhr+tMAnq34lbp4hAc=;
	b=eN4rwjcUj1BKqlWUcsLAY3NP53rGnkdbdo4P5PWC03ZcZed5fNI0aP7cK09iqWBLmM
	t+a7kMhQtC4atf8WN2SpNifCQ0EDePWMuSBNsSpjiGxgRzt7E4lEBOAfVuYnuve1Efp/
	2/Z0UgsQdtcZN5OJjAlxT5tJITBQcY5x/SRJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SQZORkJKaqiGUN5CgQ413pA6k8yj9XA0cTbVp7kg0hVQyTnYJmBiF1w3jnVqJsEePo
	xMH/4Kwvyv+JCsK75zkF1gthjAEPOWo0AB2o37NNLVRv2v7OrOUCV8oshvpqSUbHqNZL
	R5+a++1djtCf7PCiv/rm8o3pxGHdW8H8isbbI=
Received: by 10.90.51.1 with SMTP id y1mr4264805agy.7.1287013183659; Wed, 13
	Oct 2010 16:39:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 13 Oct 2010 16:39:23 -0700 (PDT)
In-Reply-To: <6976AB00-560A-4D45-A6CA-33F03D38502C@chumby.com>
References: <6976AB00-560A-4D45-A6CA-33F03D38502C@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Oct 2010 16:39:23 -0700
Message-ID: <AANLkTimNgCnmgcPq1vJupEa6fJZAaAOPhxRZ9B_CyQzf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] c-ares: Fix configure script
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
X-List-Received-Date: Wed, 13 Oct 2010 23:40:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2010 at 1:12 PM, Sean Cross <sean@chumby.com> wrote:
>
> The syntax of one of the AC_CHECK_FUNCS is incorrect. =C2=A0Removing the
> lines in question allows the package to configure and build.


instead of removing the check completely it would be better if we fixed it.
you can also cache the result and not run autoreconf on it but thats a fall
back.

> ---
> =C2=A0.../0001-remove-broken-configure.ac-commands.patch | =C2=A0 32 ++++=
++++++++++++++++
> =C2=A0recipes/c-ares/c-ares_1.5.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++-
> =C2=A02 files changed, 35 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/c-ares/0001-remove-broken-configure.ac-c=
ommands.patch
>
> diff --git a/recipes/c-ares/0001-remove-broken-configure.ac-commands.patc=
h b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
> new file mode 100644
> index 0000000..799332a
> --- /dev/null
> +++ b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
> @@ -0,0 +1,32 @@
> +diff -ur c-ares-1.5.3-stock/configure.ac c-ares-1.5.3/configure.ac
> +--- c-ares-1.5.3-stock/configure.ac =C2=A0 =C2=A02010-10-13 19:12:51.792=
124107 +0000
> ++++ c-ares-1.5.3/configure.ac =C2=A02010-10-13 19:25:12.932123380 +0000
> +@@ -796,28 +796,6 @@
> + )
> +
> +
> +-AC_CHECK_FUNCS([bitncmp \
> +- =C2=A0gettimeofday \
> +- =C2=A0if_indextoname
> +-],[
> +-],[
> +- =C2=A0func=3D"$ac_func"
> +- =C2=A0AC_MSG_CHECKING([deeper for $func])
> +- =C2=A0AC_LINK_IFELSE([
> +- =C2=A0 =C2=A0AC_LANG_PROGRAM([[
> +- =C2=A0 =C2=A0]],[[
> +- =C2=A0 =C2=A0 =C2=A0$func ();
> +- =C2=A0 =C2=A0]])
> +- =C2=A0],[
> +- =C2=A0 =C2=A0AC_MSG_RESULT([yes])
> +- =C2=A0 =C2=A0eval "ac_cv_func_$func=3Dyes"
> +- =C2=A0 =C2=A0AC_DEFINE_UNQUOTED([AS_TR_CPP([HAVE_$func])], [1],
> +- =C2=A0 =C2=A0 =C2=A0[Define to 1 if you have the $func function.])
> +- =C2=A0],[
> +- =C2=A0 =C2=A0AC_MSG_RESULT([but still no])
> +- =C2=A0])
> +-])
> +-
> +
> + dnl check for inet_pton
> + AC_CHECK_FUNCS(inet_pton)
> diff --git a/recipes/c-ares/c-ares_1.5.3.bb b/recipes/c-ares/c-ares_1.5.3=
.bb
> index 0def152..fa75f3f 100644
> --- a/recipes/c-ares/c-ares_1.5.3.bb
> +++ b/recipes/c-ares/c-ares_1.5.3.bb
> @@ -1,7 +1,9 @@
> =C2=A0DESCRIPTION =3D "c-ares is a C library that resolves names asynchro=
nously."
> =C2=A0HOMEPAGE =3D "http://daniel.haxx.se/projects/c-ares/"
> =C2=A0SECTION =3D "libs"
> -SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz"
> +SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-remove-broken-configure.=
ac-commands.patch \
> +"
> =C2=A0LICENSE =3D "MIT"
> =C2=A0S =3D "${WORKDIR}/c-ares-${PV}"
> =C2=A0PR =3D "r1"
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


