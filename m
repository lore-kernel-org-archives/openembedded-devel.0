Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pk4pd-0007HK-HA
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 02:14:57 +0100
Received: by iwn8 with SMTP id 8so6207695iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 17:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=duNQNEyRIlre1SIGFkf8zCXuqkaj0kPwKwJ5VXrTEks=;
	b=P+tipueyk2xCW6WzxHCadNBpo1LB0/iwQzMgZWqr0k07c7E67dFCZgITdVUNfbskpE
	ss52nl5Nl19RfOjI6HHclvgWex88Fp80fq196IAgKH3wK1+mH0DS9QcaFygrdEXfYeGD
	DnzOmP90K0d6WneETSDuMsVau9Z8MpocRaV1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QAVaNS+BfVRuSUI9dw9XGlLyVX7h6sO+dqqeo+oJnzPo54Nnf0MH/RciLh0SOVAQ9Q
	mNPRV3LDzgcHoJEDC3xd55d6G0IzR2JLldghIuHOIfJj4mXoGghZmSfaX3dJRuGWkeKb
	l5WmxzrDuQeRv7bPx+2Gbeqk5QlxoyQXVoo+A=
Received: by 10.42.170.6 with SMTP id d6mr8651345icz.464.1296522842872; Mon,
	31 Jan 2011 17:14:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.173.193 with HTTP; Mon, 31 Jan 2011 17:13:42 -0800 (PST)
In-Reply-To: <1296503575-9149-1-git-send-email-schnitzeltony@gmx.de>
References: <1296503575-9149-1-git-send-email-schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jan 2011 17:13:42 -0800
Message-ID: <AANLkTikViHdah8z2EpnSGR61Ab0HbkU28uDW2R63ebH8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gettext-native: force gettextize to terminate automatically
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
X-List-Received-Date: Tue, 01 Feb 2011 01:14:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2011 at 11:52 AM, Andreas Mueller <schnitzeltony@gmx.de> wr=
ote:
> * Running gettextize lead to non terminating situation:
> *
> * | You might also want to copy the convenience header file gettext.h
> * | from the /home/Superandi/tmp/sysroots/i686-linux/usr/share/gettext di=
rectory into your package.
> * | It is a wrapper around <libintl.h> that implements the configure --di=
sable-nls
> * | option.
> * |
> * | Press Return to acknowledge the previous two paragraphs.
> *
> * The necessity to use gettextize came up during creating a new recipe fo=
r
> * clutter 1.4.2. The clutter sources come with po/Makefile.in.in compatib=
le
> * with gettext 0.17. OE supports version 0.18 of gettext. This caused the
> * following error during compile:
> *
> * | Making all in po
> * | make[2]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-=
linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
> * | *** error: gettext infrastructure mismatch: using a Makefile.in.in fr=
om gettext version 0.17 but the autoconf macros are from gettext version 0.=
18
> * | make[2]: *** [check-macro-version] Error 1
> *
> * This error could be fixed by this patch and adding
> *
> * do_configure_prepend() {
> * =C2=A0 =C2=A0 =C2=A0 =C2=A0gettextize --force || true
> *
> * in the clutter recipe. For more details see
> * http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
9235.html
> *
> * This patch was build-tested (with clutter 1.4.2) by:
> *
> * bitbake xfce46-image clutter
> *
> * in the following environment:
> *
> * BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.10.2"
> * MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "overo"
> * DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> * DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110131"
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

this change is quite intrusive and I am reluctant to take it in
because its disabling
a check which is purposefully put in there. I think you could
regenerate the files
with gettextize 0.18 and commit them to clutter recipe as a patch and
so for others

Otherwise it needs to be tested well because it has potential of injecting =
bugs
and build failures that are hard to trace.

> ---
> =C2=A0recipes/gettext/gettext-0.18/gettextize-auto.patch | =C2=A0 13 ++++=
+++++++++
> =C2=A0recipes/gettext/gettext_0.18.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +++-
> =C2=A02 files changed, 16 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/gettext/gettext-0.18/gettextize-auto.pat=
ch
>
> diff --git a/recipes/gettext/gettext-0.18/gettextize-auto.patch b/recipes=
/gettext/gettext-0.18/gettextize-auto.patch
> new file mode 100644
> index 0000000..3cb3c28
> --- /dev/null
> +++ b/recipes/gettext/gettext-0.18/gettextize-auto.patch
> @@ -0,0 +1,13 @@
> +Index: gettext-0.18/gettext-tools/misc/gettextize.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-tools/misc/gettextize.in 2011-01-21 03:21:=
48.000000000 +0100
> ++++ gettext-0.18/gettext-tools/misc/gettextize.in =C2=A0 =C2=A0 =C2=A020=
11-01-28 21:48:26.000000000 +0100
> +@@ -1275,7 +1275,7 @@
> + =C2=A0 echo "Press Return to acknowledge the previous $count."
> + =C2=A0 # Read from /dev/tty, not stdin, so that gettextize cannot be ab=
used by
> + =C2=A0 # non-interactive tools.
> +- =C2=A0read dummy < /dev/tty
> ++ =C2=A0# read dummy < /dev/tty
> + fi
> +
> + exit 0
> diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.=
18.bb
> index e9e613e..b534e13 100644
> --- a/recipes/gettext/gettext_0.18.bb
> +++ b/recipes/gettext/gettext_0.18.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The GNU internationalization library."
> =C2=A0HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "GPLv3"
> -PR =3D "r4"
> +PR =3D "r5"
> =C2=A0DEPENDS =3D "gettext-native virtual/libiconv ncurses expat"
> =C2=A0DEPENDS_virtclass-native =3D "libxml2-native"
> =C2=A0PROVIDES =3D "virtual/libintl"
> @@ -17,6 +17,8 @@ SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz=
 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnulib-uclibc-sched_param-def.p=
atch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> +SRC_URI_append_virtclass-native =3D "file://gettextize-auto.patch"
> +
> =C2=A0SRC_URI_append_libc-uclibc =3D " file://gettext-error_print_prognam=
e.patch"
>
> =C2=A0nolargefile =3D "${@base_contains('DISTRO_FEATURES', 'largefile', '=
', '-DNO_LARGEFILE_SOURCE', d)}"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


