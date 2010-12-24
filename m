Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PW9Mv-0001xM-Vq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:15:46 +0100
Received: by gwaa12 with SMTP id a12so673542gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=4gc4nqXz/a2H0MliYBt2hKH5adayc4j20CswK/LipoQ=;
	b=NBxkOqTVu/XgWWzykjCaYdWgi+dVEyLp1uEadYvW6p1jDgMl8pxA6jpoVf3/yUHoGI
	HtB1i5H9vwgLJSPjJuMF5CWvjpEDKeAhzriVTR3xoFOcM8iOIdIjWISgx0SSV6YB8/Nt
	+5aECS+tuwJviG1ASMWK1MPXcU2Yn0c8bBvGo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ojLd3MR8HUpcS5/UCdhaySqjC1uXX3o1ttfjwi5XKSZn0ce3exgIvcFFDrQQYRZKTT
	WJOygFYhZxBkBxbSGh0dsGDaviAf5jENJrJb9bhp2DUJhAerFyl33VWBy5bQOVQClKZM
	bNnPSlDao18zCriXKZGdLWmJiNXjA499IfN0w=
Received: by 10.90.72.2 with SMTP id u2mr905102aga.4.1293203735470; Fri, 24
	Dec 2010 07:15:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 24 Dec 2010 07:15:15 -0800 (PST)
In-Reply-To: <1293177781-29292-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293177781-29292-2-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Dec 2010 07:15:15 -0800
Message-ID: <AANLkTi=U-2SGQwev-rYCt67nU8ga9W7AtkDUrp73cZoq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] libsdl-image: moved task to do_configure_prepend changed rm into rm -f
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
X-List-Received-Date: Fri, 24 Dec 2010 15:15:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2010 at 12:03 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> - less tasks makes it slighly faster
> - other recipes also do this in do_configure_prepend or do_configure
> - rm -f avoid error of file dues not exist (e.g. because the task is ran =
twice)
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com

> ---
> =C2=A0recipes/libsdl/libsdl-image_1.2.10.bb | =C2=A0 18 ++++++++---------=
-
> =C2=A0recipes/libsdl/libsdl-image_1.2.6.bb =C2=A0| =C2=A0 =C2=A08 +++----=
-
> =C2=A02 files changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/recipes/libsdl/libsdl-image_1.2.10.bb b/recipes/libsdl/libsd=
l-image_1.2.10.bb
> index 98a4e83..7f7f5ee 100644
> --- a/recipes/libsdl/libsdl-image_1.2.10.bb
> +++ b/recipes/libsdl/libsdl-image_1.2.10.bb
> @@ -7,18 +7,16 @@ DEPENDS +=3D "tiff"
> =C2=A0# Disable the run-time loading of the libs and bring back the sonam=
e dependencies.
> =C2=A0EXTRA_OECONF +=3D "--disable-jpg-shared --disable-png-shared -disab=
le-tif-shared"
>
> -do_unpackpost() {
> +do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Removing this file fixes a libtool version m=
ismatch.
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/libtool.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/sdl.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/pkg.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/lt~obsolete.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/ltoptions.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/ltsugar.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/ltversion.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/sdl.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/pkg.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/lt~obsolete.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/ltoptions.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/ltsugar.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/ltversion.m4
> =C2=A0}
>
> -addtask unpackpost after do_unpack before do_patch
> -
> =C2=A0SRC_URI[md5sum] =3D "6c06584b31559e2b59f2b982d0d1f628"
> =C2=A0SRC_URI[sha256sum] =3D "75e05d1e95f6277b44797157d9e25a908ba8d08a393=
216ffb019b0d74de11876"
> diff --git a/recipes/libsdl/libsdl-image_1.2.6.bb b/recipes/libsdl/libsdl=
-image_1.2.6.bb
> index b014275..46d7924 100644
> --- a/recipes/libsdl/libsdl-image_1.2.6.bb
> +++ b/recipes/libsdl/libsdl-image_1.2.6.bb
> @@ -4,13 +4,11 @@ PR =3D "${INC_PR}.1"
>
> =C2=A0DEPENDS +=3D "tiff"
>
> -do_unpackpost() {
> +do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Removing this file fixes a libtool version m=
ismatch.
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/libtool.m4
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude/sdl.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude/sdl.m4
> =C2=A0}
>
> -addtask unpackpost after do_unpack before do_patch
> -
> =C2=A0SRC_URI[md5sum] =3D "b866dc4f647517bdaf57f6ffdefd013e"
> =C2=A0SRC_URI[sha256sum] =3D "88fcb1dbf934af33163667a6677312065c7d0a7f01c=
d764e3374c4c19b386ec4"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


