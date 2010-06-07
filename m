Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLjpx-0001iw-H9
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 23:26:36 +0200
Received: by iwn6 with SMTP id 6so1866451iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=AxdY9dVtUSiJSZ0qxsEKG+WBNrqbEaWEe13Gh2G16SY=;
	b=HO8gFFhXEiLJRbhVptV6WoDMh0QeqIWMGeEhPA9r2gcVnlhanEQUt22LXJZ8XgsO0X
	IbIqhonabor04Q0uPdvbLxr3WAuoZoWHuDPdsUwKhWOUqCrlSfy8XHRK60c6P/8OJjUj
	CgEQYfHqQ3Z+XXo0kVeCNVNB1JshOgk+IkIJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uiNKmsLvxEhPPQ+fO0U+TJ9ReXvvniSne+pzzCIMpzdAeIopLyrDQLaJbduBZuOOOt
	hC1qpX41bjSJ9UiS47B8SM/39FYUPzUx1Z7hVafYxKeySxGIYEBVIr4kEzDuQo/x/p8Z
	cBnNQv5GYDZkctv5pq5PIecSVWn9xDXCAIADk=
Received: by 10.231.176.74 with SMTP id bd10mr980349ibb.38.1275945726479; Mon, 
	07 Jun 2010 14:22:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.39.137 with HTTP; Mon, 7 Jun 2010 14:21:46 -0700 (PDT)
In-Reply-To: <4C0D498A.4030709@mentor.com>
References: <4C0D498A.4030709@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jun 2010 14:21:46 -0700
Message-ID: <AANLkTil8i1-1ie4msx9B09WeJ5ggquP7WisRIyWKMUpx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Mon, 07 Jun 2010 21:26:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 7, 2010 at 12:33 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On some host distributions the provided linux kernel headers are too old
> to compile utilities we need[1]. =A0Given that we need these utilities to
> run things on the target the best solution is to provide
> linux-libc-headers-native. =A0Rather than get things into an inconsistent
> state, we make linux-libc-headers-native be a default dependency.

could it be made optional so people who use distribution where this is not
needed are not penalized.

>
> [1]: A prime example of this would be mtd-utils-native and UBI
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index e0f9184..e26a45e 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -75,6 +75,12 @@ def base_dep_prepend(d):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (bb.data.getVar('HOST_SYS', d, 1) !=3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.data.getVar('BUILD_SYS', d, 1))=
:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0deps +=3D " virtual/${TARG=
ET_PREFIX}gcc virtual/libc "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 elif bb.data.inherits_class('native', d) an=
d \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.data.get=
Var('PN', d, True) not in \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ("linux-lib=
c-headers-native",
> "quilt-native",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"unifdef=
-native", "shasum-native",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"stagema=
nager-native", "coreutils-native"):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 deps +=3D " linux-libc-head=
ers-native"
> =A0 =A0 =A0 =A0return deps
>
> =A0DEPENDS_prepend=3D"${@base_dep_prepend(d)} "
> diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc
> b/recipes/linux-libc-headers/linux-libc-headers.inc
> index 0487e65..0b0d05a 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers.inc
> +++ b/recipes/linux-libc-headers/linux-libc-headers.inc
> @@ -1,7 +1,8 @@
> =A0DESCRIPTION =3D "Sanitized set of 2.6 kernel headers for the C library=
's
> use."
> =A0SECTION =3D "devel"
> =A0LICENSE =3D "GPL"
> +NATIVE_INSTALL_WORKS =3D "1"
> +BBCLASSEXTEND =3D "native"
>
> =A0RDEPENDS_${PN}-dev =3D ""
> =A0RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPV})"
> -
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> index b66e768..0a1159a 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> @@ -1,6 +1,7 @@
> =A0require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> +NATIVE_INSTALL_WORKS =3D "0"
> =A0PR =3D "r4"
> =A0# NOTE: no need to package these headers, since the c library includes
> them.
> =A0PACKAGES =3D ""
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> index 4893cab..6cbd8ba 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> @@ -1,5 +1,6 @@
> =A0require linux-libc-headers.inc
>
> +NATIVE_INSTALL_WORKS =3D "0"
> =A0HOMEPAGE =3D "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
> =A0# license note from the package:
> =A0# =A0 Linux-libc-headers are derived from linux kernel headers. For
> license of a
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


