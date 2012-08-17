Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2LIW-0003KH-9L
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 14:05:04 +0200
Received: by weyr6 with SMTP id r6so2493080wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5t6fIAsiVYDv77i1yHnJMTiyWZdBUDAhBuMDuvZBWS4=;
	b=i4tYVdStduqRKDTsAyTSjpKSFw6kGN/eqOBqZtnDBzSuwyZu/8k3EEzswY0MTvFzEq
	rCBb/LhSPTiYatXvGruhhqmSQzdVOLpWUeqYqjiqRxuAP5wZ8D2QFnyrsoIQqi06DPKv
	7d+YpqeRcP8J9crhq0pFyW46/PgX5/rm5YMKXC3XbYN71+qMt3QQh6EEVinnl1LSCIZ9
	fmQSyNYDCVD5zvJzcSejOyxayEdIY4/lpdqJRfZ6K3e0TVBU9oYtq9dg+fkB0bj2l68H
	BiOThmPCZLdJDWAyIvWXFbjNLxR3LBVIleWmk11RJNambK+J/hsviEg6WluAdJNEkZlu
	7Mqw==
Received: by 10.180.84.164 with SMTP id a4mr4367641wiz.12.1345204385628;
	Fri, 17 Aug 2012 04:53:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm14007856wib.2.2012.08.17.04.53.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 04:53:04 -0700 (PDT)
Date: Fri, 17 Aug 2012 13:53:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120817115300.GF3625@jama.jama.net>
References: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
	<1345056951-14036-3-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1345056951-14036-3-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] meta-gnome: add evolution-data-server
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
X-List-Received-Date: Fri, 17 Aug 2012 12:05:04 -0000
X-Groupsio-MsgNum: 40240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline

--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 07:55:51PM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Can you add dates too?

Some users are still using that here.

Thanks

> ---
>  .../avoid_automake_errors.patch                    |   83 ++++++++
>  .../eds/evolution-data-server/depbuildfix.patch    |   78 ++++++++
>  .../fix_for_automake-1.12.x.patch                  |   28 +++
>  .../eds/evolution-data-server/iconv-detect.h       |    5 +
>  .../evolution-data-server/new-contact-fix.patch    |   23 +++
>  .../eds/evolution-data-server/nossl.patch          |   70 +++++++
>  .../eds/evolution-data-server/oh-contact.patch     |  203 ++++++++++++++=
++++++
>  .../eds/evolution-data-server/old-gdk-api.patch    |   19 ++
>  .../optional_imapx_provider.patch                  |   64 ++++++
>  .../recipes-gnome/eds/evolution-data-server_git.bb |  111 +++++++++++
>  10 files changed, 684 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/av=
oid_automake_errors.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/de=
pbuildfix.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/fi=
x_for_automake-1.12.x.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/ic=
onv-detect.h
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/ne=
w-contact-fix.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/no=
ssl.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/oh=
-contact.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/ol=
d-gdk-api.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/op=
tional_imapx_provider.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_gi=
t.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_aut=
omake_errors.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/avo=
id_automake_errors.patch
> new file mode 100644
> index 0000000..ebf00c3
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_e=
rrors.patch
> @@ -0,0 +1,83 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Avoid these warning-errors
> +
> +automake: warnings are treated as errors
> +Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
> +Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variab=
le name
> +addressbook/backends/file/Makefile.am: installing './depcomp'
> +addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules ar=
e a GNU make extension
> +addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules ar=
e a GNU make extension
> +addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX va=
riable name
> +addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
> +addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERS=
ION: non-POSIX variable name
> +addressbook/libedata-book/Makefile.am:2: warning: '%'-style pattern rule=
s are a GNU make extension
> +addressbook/libedata-book/Makefile.am:3: warning: subst -,_,$*: non-POSI=
X variable name
> +addressbook/libedata-book/Makefile.am:3: (probably a GNU make extension)
> +glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extensi=
on
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extensi=
on
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extensi=
on
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extensi=
on
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extensi=
on
> +addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from =
here
> +addressbook/libedata-book/Makefile.am:86: warning: '%'-style pattern rul=
es are a GNU make extension
> +addressbook/libedata-book/Makefile.am:101: warning: pkgconfig_DATA:-$(AP=
I_VERSION: non-POSIX variable name
> +calendar/backends/weather/Makefile.am:44: warning: '%'-style pattern rul=
es are a GNU make extension
> +calendar/libecal/Makefile.am:53: warning: '%'-style pattern rules are a =
GNU make extension
> +calendar/libecal/Makefile.am:61: warning: '%'-style pattern rules are a =
GNU make extension
> +calendar/libecal/Makefile.am:62: warning: subst -,_,$*: non-POSIX variab=
le name
> +calendar/libecal/Makefile.am:62: (probably a GNU make extension) calenda=
r/libecal/Makefile.am:68: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX=
 variable name
> +calendar/libedata-cal/Makefile.am:5: warning: '%'-style pattern rules ar=
e a GNU make extension
> +calendar/libedata-cal/Makefile.am:6: warning: subst -,_,$*: non-POSIX va=
riable name
> +calendar/libedata-cal/Makefile.am:6: (probably a GNU make extension)
> +glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extensi=
on
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extensi=
on
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extensi=
on
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extensi=
on
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extensi=
on
> +calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> +calendar/libedata-cal/Makefile.am:71: warning: '%'-style pattern rules a=
re a GNU make extension
> +calendar/libedata-cal/Makefile.am:86: warning: pkgconfig_DATA:-$(API_VER=
SION: non-POSIX variable name
> +camel/Makefile.am:17: warning: '%'-style pattern rules are a GNU make ex=
tension
> +libebackend/Makefile.am:35: warning: '%'-style pattern rules are a GNU m=
ake extension
> +libebackend/Makefile.am:41: warning: pkgconfig_DATA:-$(API_VERSION: non-=
POSIX variable name
> +libedataserver/Makefile.am:91: warning: '%'-style pattern rules are a GN=
U make extension
> +libedataserver/Makefile.am:97: warning: pkgconfig_DATA:-$(API_VERSION: n=
on-POSIX variable name
> +libedataserverui/Makefile.am:108: warning: '%'-style pattern rules are a=
 GNU make extension
> +libedataserverui/Makefile.am:118: warning: pkgconfig_DATA:-$(API_VERSION=
: non-POSIX variable name
> +servers/google/libgdata-google/Makefile.am:27: warning: '%'-style patter=
n rules are a GNU make extension
> +servers/google/libgdata-google/Makefile.am:33: warning: pkgconfig_DATA:-=
$(API_VERSION: non-POSIX variable name
> +servers/google/libgdata/Makefile.am:31: warning: '%'-style pattern rules=
 are a GNU make extension
> +servers/google/libgdata/Makefile.am:37: warning: pkgconfig_DATA:-$(API_V=
ERSION: non-POSIX variable name
> +servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a=
 GNU make extension
> +servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION=
: non-POSIX variable name
> +autoreconf: automake failed with exit status: 1
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/07/09
> +
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
> + dnl Autoconf / Automake Initialization
> + AC_PREREQ(2.58)
> + AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.or=
g/enter_bug.cgi?product=3DEvolution-Data-Server])
> +-AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall -Werror foreign])
> ++AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall foreign])
> + AC_CONFIG_MACRO_DIR([m4])
> + AC_CONFIG_SRCDIR(README)
> + AC_CONFIG_HEADERS(config.h)
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildf=
ix.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.p=
atch
> new file mode 100644
> index 0000000..0785a93
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
> @@ -0,0 +1,78 @@
> +G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> +build failures. Also resolve other deprecation issues.
> +
> +RP 2011/10/12
> +
> +Upstream-Status: Pending
> +
> +Index: git/libedataserver/e-data-server-util.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622=
045788 +0100
> ++++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.73204566=
4 +0100
> +@@ -165,7 +165,8 @@
> + static gunichar
> + stripped_char (gunichar ch)
> + {
> +-        gunichar *decomp, retval;
> ++        gunichar decomp[4];
> ++        gunichar retval;
> +         GUnicodeType utype;
> +         gsize dlen;
> +=20
> +@@ -175,7 +176,7 @@
> +         case G_UNICODE_CONTROL:
> +         case G_UNICODE_FORMAT:
> +         case G_UNICODE_UNASSIGNED:
> +-        case G_UNICODE_COMBINING_MARK:
> ++        case G_UNICODE_SPACING_MARK:
> +                 /* Ignore those */
> +                 return 0;
> +                break;
> +@@ -183,7 +184,7 @@
> +                 /* Convert to lowercase, fall through */
> +                 ch =3D g_unichar_tolower (ch);
> +         case G_UNICODE_LOWERCASE_LETTER:
> +-                if ((decomp =3D g_unicode_canonical_decomposition (ch, =
&dlen))) {
> ++                if ((dlen =3D g_unichar_fully_decompose (ch, FALSE, dec=
omp, 4))) {
> +                         retval =3D decomp[0];
> +                         g_free (decomp);
> +                         return retval;
> +Index: git/addressbook/libedata-book/e-data-book-factory.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 =
01:52:25.692045500 +0100
> ++++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53=
:31.862045707 +0100
> +@@ -238,7 +238,7 @@
> + 	return g_strdup_printf (
> + 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
> + 		getpid (),
> +-		g_atomic_int_exchange_and_add (&counter, 1));
> ++		g_atomic_int_add (&counter, 1));
> + }
> +=20
> + static void
> +Index: git/addressbook/libedata-book/e-data-book.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40=
=2E752045465 +0100
> ++++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.0120=
45897 +0100
> +@@ -553,7 +553,7 @@
> +=20
> + 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/B=
ookView/%d/%d",
> + 				getpid (),
> +-				g_atomic_int_exchange_and_add ((int*)&counter, 1));
> ++				g_atomic_int_add ((int*)&counter, 1));
> + }
> +=20
> + static void
> +Index: git/calendar/libedata-cal/e-data-cal-factory.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57=
:56.612045081 +0100
> ++++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.8=
32045211 +0100
> +@@ -227,7 +227,7 @@
> + 	return g_strdup_printf (
> + 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
> + 		getpid (),
> +-		g_atomic_int_exchange_and_add (&counter, 1));
> ++		g_atomic_int_add (&counter, 1));
> + }
> +=20
> + static void
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_a=
utomake-1.12.x.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/f=
ix_for_automake-1.12.x.patch
> new file mode 100644
> index 0000000..ac77a6d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake=
-1.12.x.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Pending
> +
> +Fixed these kinds if warning-errors
> +
> +warning: 'libebookbackendfile.la': linking libtool libraries using a non=
-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/07/09
> +
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -17,6 +17,7 @@ dnl This number is meaningless, but we'r
> + dnl library names for backward compatibility.
> + m4_define([api_version], [1.2])
> +=20
> ++
> + dnl Autoconf / Automake Initialization
> + AC_PREREQ(2.58)
> + AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.or=
g/enter_bug.cgi?product=3DEvolution-Data-Server])
> +@@ -30,6 +31,7 @@ AC_LANG(C)
> +=20
> + dnl Automake 1.11 - Silent Build Rules
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> ++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
> +=20
> + dnl Required Package Versions
> + m4_define([glib_minimum_version], [2.16.1])
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-det=
ect.h b/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
> new file mode 100644
> index 0000000..46f476d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-detect.h
> @@ -0,0 +1,5 @@
> +/* This is an auto-generated header, DO NOT EDIT! */
> +
> +#define ICONV_ISO_D_FORMAT "iso-%d-%d"
> +#define ICONV_ISO_S_FORMAT "iso-%d-%s"
> +#define ICONV_10646 "iso-10646"
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/new-conta=
ct-fix.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/new-conta=
ct-fix.patch
> new file mode 100644
> index 0000000..22c293d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.=
patch
> @@ -0,0 +1,23 @@
> +When contacts called for the 1st time, adding new contact always failed =
but
> +worked after restart. The reason is e-addressbook-factory used to handle
> +addressbook leads a segmentation fault. Root cause is that factory would=
 create
> +the data base if not exist, but use it without proper initialization.
> +
> +This patch fix it.
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
> +Index: git/addressbook/backends/file/e-book-backend-file.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/addressbook/backends/file/e-book-backend-file.c	2010-10-20 =
16:14:31.000000000 +0800
> ++++ git/addressbook/backends/file/e-book-backend-file.c	2010-10-22 14:11=
:47.000000000 +0800
> +@@ -1217,6 +1217,8 @@
> + 				EContact *contact =3D NULL;
> + 				EBookBackendSyncStatus status;
> +=20
> ++				/* Initialize file_db, or else following do_create cause seg fault =
*/
> ++				bf->priv->file_db =3D db;
> + 				status =3D do_create (bf, XIMIAN_VCARD, &contact);
> + 				if (status !=3D GNOME_Evolution_Addressbook_Success)
> + 					g_warning ("Cannot create default contact: %d", status);
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.pat=
ch b/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
> new file mode 100644
> index 0000000..67b6d07
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
> @@ -0,0 +1,70 @@
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Index: git/camel/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
> ++++ git/camel/Makefile.am	2010-02-05 15:25:20.000000000 +0000
> +@@ -80,7 +80,6 @@
> + 	camel-store-summary.c			\
> + 	camel-store.c				\
> + 	camel-tcp-stream-raw.c			\
> +-	camel-tcp-stream-ssl.c			\
> + 	camel-tcp-stream.c			\
> + 	camel-transport.c			\
> + 	camel-uid-cache.c			\
> +@@ -133,7 +132,6 @@
> + 	camel-store-summary.h			\
> + 	camel-store.h				\
> + 	camel-tcp-stream-raw.h			\
> +-	camel-tcp-stream-ssl.h			\
> + 	camel-tcp-stream.h			\
> + 	camel-transport.h			\
> + 	camel-uid-cache.h			\
> +Index: git/camel/camel.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/camel/camel.h	2010-02-05 15:26:30.000000000 +0000
> ++++ git/camel/camel.h	2010-02-05 15:26:52.000000000 +0000
> +@@ -122,7 +122,6 @@
> + #include <camel/camel-string-utils.h>
> + #include <camel/camel-tcp-stream.h>
> + #include <camel/camel-tcp-stream-raw.h>
> +-#include <camel/camel-tcp-stream-ssl.h>
> + #include <camel/camel-text-index.h>
> + #include <camel/camel-transport.h>
> + #include <camel/camel-trie.h>
> +Index: git/camel/providers/imap/camel-imap-store.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:19=
=2E000000000 +0000
> ++++ git/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:38.0000=
00000 +0000
> +@@ -51,7 +51,6 @@
> + #include "camel/camel-stream.h"
> + #include "camel/camel-string-utils.h"
> + #include "camel/camel-tcp-stream-raw.h"
> +-#include "camel/camel-tcp-stream-ssl.h"
> + #include "camel/camel-url.h"
> + #include "camel/camel-utf8.h"
> +=20
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac	2010-02-05 15:31:59.000000000 +0000
> ++++ git/configure.ac	2010-02-05 15:33:00.000000000 +0000
> +@@ -1272,7 +1272,8 @@
> + dnl We have fixed all our instances to use <libical/ical.h>. Until the =
=2Epc from
> + dnl libical is fixed, we have to work-around the buggy CFlags.
> + dnl *****
> +-	LIBICAL_EXTRA_CFLAGS=3D" -I`$PKG_CONFIG --variable=3Dincludedir libica=
l` "
> ++	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
> ++	LIBICAL_EXTRA_CFLAGS=3D" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --varia=
ble=3Dincludedir libical` "
> + 	LIBICAL_EXTRA_LIBS=3D""
> + 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
> + 	AC_SUBST(LIBICAL_EXTRA_LIBS)
> +Index: git/calendar/libecal/libecal.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/calendar/libecal/libecal.pc.in	2010-02-05 15:39:41.00000000=
0 +0000
> ++++ git/calendar/libecal/libecal.pc.in	2010-02-05 15:39:55.000000000 +00=
00
> +@@ -12,4 +12,4 @@
> + Version: @VERSION@
> + Requires: libical >=3D @LIBICAL_REQUIRED@ libedataserver-1.2 dbus-glib-1
> + Libs: -L${libdir} -lecal-1.2
> +-Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
> ++Cflags: -I${privincludedir}
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contac=
t.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.pat=
ch
> new file mode 100644
> index 0000000..b746044
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch
> @@ -0,0 +1,203 @@
> +Replace the Novell sample contact with something more appropriate
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Index: addressbook/libedata-book/ximian-vcard.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- addressbook/libedata-book/ximian-vcard.h.orig	2011-12-19 13:58:29.05=
8859231 +0000
> ++++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 14:41:48.6789185=
49 +0000
> +@@ -1,80 +1,105 @@
> + #define XIMIAN_VCARD \
> + "BEGIN:VCARD\n" \
> +-"X-EVOLUTION-FILE-AS:Novell Ximian Group\n" \
> +-"ADR;TYPE=3DWORK:;Suite 500;8 Cambridge Center;Cambridge;MA;02142;USA\n=
" \
> +-"LABEL;TYPE=3DWORK:8 Cambridge Center, Suite 500\\nCambridge\\, MA\\n02=
142\\nUSA\n" \
> +-"TEL;WORK;VOICE:(617) 613-2000\n" \
> +-"TEL;WORK;FAX:(617) 613-2001\n" \
> +-"EMAIL;INTERNET:hello@ximian.com\n" \
> +-"URL:http://www.ximian.com/\n" \
> +-"ORG:Novell;Ximian Group\n" \
> +-"PHOTO;ENCODING=3Db;TYPE=3DJPEG:/9j/4AAQSkZJRgABAQEARwBHAAD//gAXQ3JlYXR=
lZCB3aXRo\n" \
> +-" IFRoZSBHSU1Q/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJ=
yAiLCM\n" \
> +-" cHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIy=
MjIyMj\n" \
> +-" IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgAbgBkAwEiAAIRAQM=
RAf/EA\n" \
> +-" BwAAAIDAQEBAQAAAAAAAAAAAAAHBQYIBAMBAv/EAEYQAAEDAwEFBgMEBgQPAAAAAAECAw=
QABREG\n" \
> +-" BxIhMWETIkFRcYEUkaEIMkLBFSNSsbLRFmJydRgkMzY3Q0RGgpKTosLh8P/EABsBAQACA=
wEBAAA\n" \
> +-" AAAAAAAAAAAAEBQIDBgEH/8QALREAAQMCAwYGAgMAAAAAAAAAAQACAwQREiFRBRMiMUFh=
MnGBkb\n" \
> +-" HRBsEUofD/2gAMAwEAAhEDEQA/AH/RRRREVwXe9W2wwFzbpNZixkc1uqwPQeZ6CoHXevL=
fom1ds\n" \
> +-" 9h6a6D8PGCsFZHMk+CR4n86yzdbrqfaZqYBSnp0hRPZMoG62ynoOSR1Pua8Lg0XPJegX5=
Jv6k+0\n" \
> +-" bBjrWxp22LlkcBIlHs0HqEjiR64peT9umupqyWrhHhpP4WI6eHureNW7Tmw+DGaTI1FJV=
JdxksM\n" \
> +-" qKG09CrmfbFMCHpCw2xATDs8JrH4gykq+Z4mqifbMUZsxpd/QUllK53M2SCb2xa+bXvf0=
gcV0Uw\n" \
> +-" 0R/DVktH2hdUwlpFxjQrg1490tLPuOH0pvv2qE4jdchx1p8lNAj91Va87OtM3RCt+2Nx3=
Dyci/q\n" \
> +-" yPYcD7g1EZ+RR4rSMI9b/S2mhdbhKsmkdtWmNTuNxnXVW2cvgGZRASo+SV8j74PSmOlQU=
MpORWP\n" \
> +-" NU7MrjY0rlQFmdDTxOE4cQOo8R1Hyqe2Z7ZJ2m32bXfHnJVpJCUuqO8uP7+Kenh4eVXkF=
RFUMxx\n" \
> +-" G4UOSN0Zs4LU1FeEOWxOityYzqHWXEhSFoOQoHkQa963rBFFFFERUdfr1E09Y5d1mr3Y8=
ZsrV5n\n" \
> +-" yA6k4A6mpGkL9ojUym0W/TrLmAsGU+AeYBwgfPJ/4RREqrrcb1tJ1oUpBXLmObqUZ7rSB=
yT0SkZ\n" \
> +-" J8zk1pHQmiLXo+zpbabC3SAp55Q7zyvM9PIUudiGmURbS7fpCMvzFFton8LSTxx6qH0FM=
7VV9VY\n" \
> +-" 9MzZ7aQt5tASw3+26ohKB/zEVSVFVvZzGMw02tqe/kpbI8LMR6/C/Xxq9QagfbbP+IW1Q=
Q4Rycf\n" \
> +-" xncHRAIJ/rEfsmu2a9Fgsl2XIZjtj8bqwgfM1+9L2VFksESAV9o6hG886ebjqjvLWepUS=
arutdn\n" \
> +-" MXV+obRcZks/CwCQ5DKMpeBOTxzwzgA9KwfTtfxPOSB5GQUXc9pOjoC+zXe2HV5xiOC6P=
mkEfWp\n" \
> +-" xe6tAWghSVDIIOQRXxekNOx4b0WPZYLLTram19mwlJKSMHjjNUzQd2dZM7SNxczcLOstt=
qVzdYz\n" \
> +-" 3FewI9iKpK2mjMZdFe7ed9NfT9qZDI4OAd1Vkko50ndoui22kuXq2NBOO9JZSOH9sD9/z=
86c8gc\n" \
> +-" DUJNQlaFJUkKSoYII4EVGoKp9PIHt9e6lyRNlZhcqlsJ2guQpydL3F4mO7kw1KP3Fcyj0=
PEjrnz\n" \
> +-" rSAIIyOVYfvsJ3TGqlCKpTfYuJfjLHMDOR8jw9q2Foy+o1FpWBckY/XMpUoeRxxHsciu/=
jeJGB7\n" \
> +-" eRXPvaWuLT0U/RRRWaxQeVY82x3BVw2oXbJyhgoZR0AQM/UmthK+6fSsWbRQW9pV73x/t=
ZPtwNE\n" \
> +-" Wj9Nw0WuwwIKQAGI6G/cAZ+tRW0lx5nTEW4Ntqdat9xjy5CEjJLSFZP5H2qaYdCkpUk5B=
GQa7Ap\n" \
> +-" DrSm3EpWhYKVJUMgg8wRXz+kqyyTG7VXUsV22Clrfc48+CzMiPIejvIC23EHIUDXNe79b=
7HbXbh\n" \
> +-" c5SI8ZvmtZ5nyA5k9BS7d0nfdMPuSdD3JtEZaitdom5Uznx3DzT6cPWkvq/V1611fGW5n=
ZtBCgy\n" \
> +-" zFbXhtCycE5JxknxPhXR07RUeB3D11H+9lAfwcxmrrqLbxcHpikWGAw1FScByUkqWvrgE=
BPpxqi\n" \
> +-" ztdXWdqmNqIIjx7gykJUphJCXAM/eBJ5g4PQCmBZNiDKWEu364uF0jJYh4AT6qUDn2FVu=
6bPIkT\n" \
> +-" aTB08xKeMOU2H99eCtKRvZGQMZ7hwceNZxVGzsbmMzIBv5dfNeOjnsCdUwbTtKsV8nJgI=
ccZkqw\n" \
> +-" lJcThDqvJJz8s4zUtLVzpc2vZZKt+qBIkyUKt0V0ONKSe+7g5SCPDr9Kv0tznXP1cNMyQ=
fxnXBC\n" \
> +-" tqUyuB3gslftPjJLkGWB3u82o/Ij86bf2e7iqRoxyIpWfhpC0JHQ4V/5GlVtJcBt0RPiX=
if+00w\n" \
> +-" Ps5BQtNxP4TJP8Ka6rZZJpW37/Kq68ATlPeiiirBQ0HlWR9t9qVbtpEp/dwiY0h5J8Mgb=
p/h+ta\n" \
> +-" 4pM7fdKLumn2rxGbKn4BKl4HEtn73ywD7GiL7o28JuulLbKCsqLKUL/tJ7p+oqyIe4c6R=
GyzU4g\n" \
> +-" THLNJc3WpCt9gk8A54j3GPcdaZuoosy82V23QpaYpkEIdeIJKUeIAHieXPkTXA11Duass=
JsCefY\n" \
> +-" /SvYZN5FiGZU9edRwLDAXJny2mRukoStQBWQOQHjSjg7PYE7ZmzcZb7cG6KK5CZD6txOC=
cJQvPg\n" \
> +-" QAQfAn2q6RNOWi1D9J3R5dwlR2xmZPVv9mlI8ByTj59ar09Lm0jUIQl5Y0zAUMrQSPiXf=
HHpyz4\n" \
> +-" D1qTRvMQIieQAQXOtllfIDre/X2WqVmI8Qz6D9q0bP9SO37SrSpW8ZUVXw7q+YcKeSgeR=
yMZ65q\n" \
> +-" qammvWTalEv1yjOJtaWfh25CBvBOUkHPlxUeHlyq/MiPCitxorSGWG07qG0DASK45xZlx=
3GJDaH\n" \
> +-" WljCkLGQR6VGinY2ofIG8Lri2gOi37hxYG3zC+uT2HY6ZDbyFMrAUlwK7pB5HNRcp7nxq=
pzdN3G\n" \
> +-" CFQ7NObTa3nApcaSN/suOe4SDw6VK3O4swojsp9WGmxk9fIDrW4UzWkbt2K/v691vjec8=
YtZUTa\n" \
> +-" BL+IuMaIjiWWytXQn/wBD608tgtrVC0W2+tOFSFqd9icD6AVnmFFl6n1AhoAmRPdwcfgR=
4n2H7q\n" \
> +-" 2Ppi1N2exRojaQlKEBIHkAK7Gmi3MTWaLn6iTeSF+qmaKKK3rSiuedEanQ3I7qQpC0kEE=
ZzXRRR\n" \
> +-" FjnaRoSVoq/KcYQv9HOr3mHB/qzz3SenhVi0ftAbnNNwLo6G5iQEodUcJd9fJX760ZqLT=
kHUdsd\n" \
> +-" hTWEOtuJwQoVl/XGyS7aakOPwGnJcDORujK0DqPH2qJV0cdUzC/0Oi3QTuhddqY84IuFu=
kwnFFK\n" \
> +-" JDSmlEcwFDGR86ISI1tgtQ4jYaYaTuoSP/udJS1azvFoAZLnbsp4dm/klPQHmKs0faVEW=
kfEw32\n" \
> +-" 1f1CFj8q56XZNSwYG5t7fSt46yB5ucimM5L4c643pXWqU5tCteMpRKUfIIH86ipmvnnAU=
woQSf2\n" \
> +-" 3lZ+g/nWEey5yfCtrquBo8Su0+4sQ46pEp1LTSeZUfoPOlnfr67fZKQlK0QkK/VtficV5=
nrXOkX\n" \
> +-" XUk9KQHp0gnghI7qPyAp1bOdkCmH2rneQHHxxQjHdb9OvWr2j2c2Didm74VZVVplGFuQX=
Rsc2fO\n" \
> +-" Qgb1cmsSXQN1JH+TT4D+dPEAAADkK848duMylppISkDGBXrVkoCKKKKIiiqrrbX9m0JAR=
Iua1re\n" \
> +-" dJDMdoArcI58+AA8zVLsO26RqiS9Gsukpct5lHaKbTLaSrd8wFEZ9s0RN6vGRGZktlDqA=
oHzFKq\n" \
> +-" JtomzrPOuzGjZvwEBRTJfckttpbUOae9jJ5cBk8R514Wrbo7e489+3aTlvtQGTIkqElsd=
m2Mkq4\n" \
> +-" 4zyPKiKf1Hsj09flKdXEQh4/jR3VfMUvJ/2et1ZMOe8keSgFfyqz2LbfJ1M9IZs2kJsx2=
O0XnEN\n" \
> +-" yEAhA4ZwcZ58hxr7ZdtkvUS5SbTo2fJMRsuPkPoSG0jzKsDPPhz4HyoipDewC47+FXFWO=
jYH51Y\n" \
> +-" bTsAgtrSqc88/jwWrA+QxUlYtujupZ6oNo0nLlSUtqdKEyW04SMZOVYHiKjP8ACUt5/wB=
3pX/XT\n" \
> +-" /KiJnWLQ1nsTSURorad39lIFWZKUoThIAHSlNqDbLP0siKu96MnQ0ygSyVyGzvYxnlnB4=
jga87F\n" \
> +-" ttlamXJbs2j50xcZvtXUtyEZCfPB5+gyaIm9RSetm3J68RbhJgaSmPM25vtZaviW09knj=
xIOM8j\n" \
> +-" y8q7LHtzstwv/AOhrlBftkkudkFOLS43v5xgqSeHHx5daImrRX5QtK0hSTkGiiLMP2ho8=
wa1iSn\n" \
> +-" QoxVRQ20fAKClFQ9eIqq7LLJe7vreG7ZZCoZhqD8iZjustjnnwORkY8c+Wa1ZqbStt1PB=
Ma4MId\n" \
> +-" Rz7wzg+dL8bEbA1vpa7RtK+CkpdWAfXjRFB7UpCNe6Kdm6NnJft1qluKuUJlvdKznPbYH=
3hzPXJ\n" \
> +-" PMGqZsk/zc2gf3G5/Cumc3sRsTO92Rcb3uB3XVjP1r4jYfYGwoN76QsYUEurGR5HjREud=
hUt2BP\n" \
> +-" 1TMYID0eyuuoJGRvJII+oq96I2iwtVz7rb7ZZWbalyzyJ9wKUjLsrKEkjH4cE8+Jz049b=
ew+wNb\n" \
> +-" 3Z76N4YO66sZHlzob2H2Bkktb6CRglLqxkeXOiJZbAv9IMj+7X/wB6ag9lGnEaj17CRJA=
+BhZmy\n" \
> +-" lK+6EI44PQq3R6E06W9h9gZVvNb6FYxlLqwcfOhvYhYWt7s99G8MK3XVjI68aIo7UxgbR=
9IajhQ\n" \
> +-" 7/Du9yiSF3S3tMNrStlkAAt94DPDI4eJFUvYfNetqNYz4xAfjWZx5skZAUnJHD1FMVrYh=
YWVbzW\n" \
> +-" +2ojGUOrBx86EbD7A0FBvfRvDCt11YyPI8aIo23zdP6i2e621TaUJiXCfa1IucFPJt5KV=
nfHRWS\n" \
> +-" euPPNZ2YadfkNsspUp1aglCU8yTyrTSNh9gbCgjfSFjCgl1YyPI8al9PbItP2WamUywku=
J5KOVE\n" \
> +-" emeVEVw02ZH9H4YkEqdDYCifE4oqXbaS02lCRhIGBRRF//Z\n" \
> ++"VERSION:3.0\n" \
> ++"FN:Yocto Project\n" \
> ++"URL:http://www.yoctoproject.org/\n" \
> ++"EMAIL:yocto@yoctoproject.org\n" \
> ++"TEL;TYPE=3DVOICE:+00 000 000 0000\n" \
> ++"ADR;TYPE=3DHOME:;1720 Beaver Creek;Dam #4;Planet Earth\n" \
> ++"LABEL:1720 Beaver Creek\\nDam #4\\nPlanet Earth\n" \
> ++"PHOTO;ENCODING=3Db:iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pV\n" \
> ++" UAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAAFE9JREFUeJztnXmQ=
HNV9xz\n" \
> ++" +ve86dvU/tanUiCVwRQuaIhSEOMsIiEsbGRtiVGFy4EsdU4bINOICPUtkQHOxgYoiDTVJ=
xCBiwM\n" \
> ++" CBxBjAlsIUlEQzISAhZN5JW2l3tvbNz9JU/fu/N7CwgVquVmEr194/t7enu97p73vf9zv=
cbCBEi\n" \
> ++" RIgQIUKECDH5UB/0DYwXwZv/Mh8AK3ISgBs4AwAR29oCwNwFfQBKLXY/mDucHFgf9A2EK=
EXZMiT\n" \
> ++" YdtdUADff+QCA5Q/9BQB+Xk7w9a27vpxP8g0AO9J4IYA64/qOE3m/k4WQIWWGsmJI/q0f=
n2P+t5\n" \
> ++" zerwFYDK0ACAgCAMsXRuCLqPDTQ7LvBgogSDY8DODWLvguQOLkv9t6Qm5+khAypMwQfiF=
lhkmZs\n" \
> ++" vY/9rOzAXK59EkAEc87BDD9c99cC6CU8t7tumD/PQ0A/uCOHwF4Vm6pOWbnc20AlvIDOT=
nQF8nU\n" \
> ++" hJOT3XQ/AK7jyJRWUSXHIw1vAQQV078BEJ1/7f9MwqMed4QMKTNMiCF/uP/ONgC7Y/ODA=
F52YCE\n" \
> ++" ArhcBwMIDiMZiLkAsVX8fwClfvfOrALldd5wGYGe6HgRQQfpkABXxi/fjCKkCX6ihtJ6r=
tFAP8i\n" \
> ++" Ny3nAfAJ4dk/OiCQBsZSn5vLoXIJ+aezVAxfxvPDCRZz5RCBlSZpgQQzbe+qXzAYLcwAM=
AgRM0A\n" \
> ++" UTQ072Sf6JKmo8HWQVgNSc7AU6+YG4AELiZKXITIic8gsL92J5uyzXixzBGbx1tIA73yI=
MkK2Vr\n" \
> ++" x/R5cg9KaXU40gCAH2//lOkjsm3WkwB97KoEyOHUA2TTw9J5U0MWwNm5rw9g3tfuzB3lq=
zpqhAw\n" \
> ++" pM0QmclE0knIBvOywD+ApB4BAG2u2EmoEnnw+xEAAsODD7S0AuGLMKZRRnYRBRpMCfMMM=
LTNUIP\n" \
> ++" vKc0u2WPoaSz+KbeuPPQXge8I+5XeLDAqsX5k+OnK7bwJwe50bAHLZfBWAo9v2DnfK3dn=
xtQCv3\n" \
> ++" vH1WwB2TPnoWoDLLrvsXbXHY0HIkDLDhBhizzx1J4C7tXcYQAVOC4CtRYAVyKh2/DQA88=
6ZoQAS\n" \
> ++" VVGgaEqosTJsFEOUN8aJyNjB6JdeY+mxFZQ2qSwtQzw50c4eSJhjUW/wHwF275O+UpX1I=
ts0w72\n" \
> ++" 88eSPLAZwoiMfAWj1131aH3iOSUbIkDLDhBhy2me/vB9gw21XPQQQH8zcAOArmdADJ6MA=
pp5SB0\n" \
> ++" D1lKqS6wtjODBGuLYt/FGxJSM7fDNmglF/QRkfo2aORel5Zlvsy9NMKfbR0CLXJPZIG44=
n51hKP\n" \
> ++" ncLfcp+3sknALxMunbsO5kshAwpM0yIIQaLrr3rRoD1t15ZB5AY6vx7gGhKRlxNe61oOL=
Yto1Nf\n" \
> ++" F2hmKE/LBTNqNVNglP3hyvyuCtfIvm/cYyqpt7Y+T2t8Y5lSuqsvEf60z4gD8MarYvVX1=
WibRZ/\n" \
> ++" saHnlqOQWgFjDzFfe+60cG0KGlBkmNUC1/t9XngfQ1nTg1wDTZ9jizS3M23p4+qZz3X1E=
xoWy7E\n" \
> ++" JbgXHyau1JG/0of0xbuo3A1Z97pZZ9gX3umC2gHQRkhrIAvLxeLHTbEoYYZntWbBjAr5t=
6HcDHr\n" \
> ++" 73950d4DceEkCFlhmOSIWOx6LwqmYyzNdUAXrav5LiypTsVE39TwYYwE7w3yg7Rmo7Rtg=
jMyDfX\n" \
> ++" 2HrP7BsmGc1IU8pY8rbpsiinDItiCfEU19aLzdLZKYxJVNbtAnAq638CcMFxZIZByJAyw=
6TIkGD\n" \
> ++" vc7MBvM5nNgCoYKAJINDD1dIeVxPLANGEKPirHNPSqEaNvDHMUKVbY5nbhimaIfq4r4Ix=
VwW6uV\n" \
> ++" EWvyf3Y2lZ0tNrdQFs3hb7KYCTaH4U4IJrb3/j/d7BZCFkSJlhUmRILuckAGKD2SYAnAw=
AFmL5Z\n" \
> ++" jKZACCTFgs+OyzHs3kJLzg62S2fLxLW08ywtWyIxuRYLCG3XBGXbVV1BQCpSn2tlhWWHd=
VPKGIt\n" \
> ++" MHZKiSEibfiabTXNElP5y2mNjwGoj9xywphhEDKkzDApDEnMW/YmQG7DDyS2PsBXAF7ds=
PNigDe\n" \
> ++" 27msDCIzfyZZRa+mRGTExjFESzVKxkj6M1Vzwe3nCMiffr9uQ4w3V0nZzszTWWC99NDbK=
6E9WJg\n" \
> ++" ttqmhC7I7KavFhxWqbAdxI5ZSjfQeThZAhZYbwCykzTKphGF904yb971UAv1l5hQPQ3uZ=
dLZ1Jt\n" \
> ++" KngXNT+EEuZgFVxfPgFhdUIYatkz1zrG/VYq7M5TxSFvQdlf9N22R/JSDi2rqo4L86cJp=
rAwvl2\n" \
> ++" L0BFW634VWKRD2yNSciQMsOkMsRg67rVVQDD69acBoCq1u73Uoeg75e6Q7xRrhO/4IfUz=
sPRHg+\n" \
> ++" KLDNX+JackNTqbjwqR6qrdLBJG6X5UQGq/f362r2V1wF8tL71fwFinTM+sIz5kCFlhuPC=
kNxbW2\n" \
> ++" YAJOxYG0CvttYefWUnAGfOqAfg9FbZ5rXj0LOL87uvKeIaEVHIudYukDHnKW34YRtnozx=
ajzZCa\n" \
> ++" 5Ki7laM0qar4non0ZoBiC/95uaJPO9kImRImeG4MCTiZWYDxJORaQDPbpTlfvslK4hUp4=
zas2bK\n" \
> ++" fB9xSmULFI1EIzsK3nhvjLNRlTLH4M2DAwA8sWk/AOd9qA2AD0+rL56kU4yi5C/Wnzw47=
oc8Tgg\n" \
> ++" ZUmY4LgyxLW8ugB94cYADg7mSlFETNIpoGng6dBtRxfHhaoejju7iGQYYd3spIQpamQlo=
dQ8KC1\n" \
> ++" 0tW/b3yf6HWopaVkVSZIibHT7l6J/y+CBkSJlhUhnyp6eeigPk9v52FkBUB6C0x5z+rIz=
e2Y2SO\n" \
> ++" KfGWOyj00BNwoMJapnAk9L6lTVG7JgosGFKbUq0Ks+X5QoZR6/a9YoGja95FnhOJUAQBD=
F9P/mj\n" \
> ++" ffbJQsiQMsOkMiTa2akA0k5OfOCOhGaXzW8HoCct+6e31wCQ0dpVXssLNdr/ruVJoBliZ=
IrJB1K\n" \
> ++" 2DtkWBrz8Y3Sw2U3Cwnk66NSiA1mxaHEMKl8CaK4nnW1/+j6TiB0yJIRgUhmyZ+ZMF6By=
y5ZuKO\n" \
> ++" akTauS+Xx6jWzNqDbmhxfIuOjuOlxoK1mRAqD5zLMBmDp/AQAdL64FYHDPdgBc7ZuKxoW=
URitLa\n" \
> ++" at/+fxpQHHkGc8ygGuqQyjlAsxbdvngBB6bTZs2tANYFfE5APPnLPyDOaaUGjqatkKGlB=
kmlSGL\n" \
> ++" F0utqg0/ve4FAKWiVwPkA6cKIHB8naqpSuIiRvNpbGgotGVkQVWrRFNrpk4H4GC7bL0dk=
n8QT1S\n" \
> ++" U3oRxZWkZFLeMbFHvcAd4nvwfj9dMaKn0s8/ffzHAa5s2rgF4fNUaABoaG3abc35868rL=
AK65/n\n" \
> ++" vjStAOGVJmOC7VgFYGIhTO/+dr7gDIDXd+CSDieUmASCFzuvQu7FFtFOZ8bU3bKdHMRgY=
lPTWql\n" \
> ++" 5sZJcvEO4yZkdNZEb5ehOPp4zkVKdj4qqLuBYDPfu/ujx/N8z3x9H2fkrbdVQB73z4YA3=
ju8acD\n" \
> ++" gP7unsJ7bZnSlgGYffKsCwFuve3u3x6p7ZAhZYYTUi9rzc1f/i5A98G3vw9Qoxf3VyVFh=
MULDqv\n" \
> ++" Rlrp8ZhVSQsdEG8fE1M3WK0QG5eysF+QAPMt+HcCJVj5i+vibW/7zNnjv4jjveI41v1gE=
4OFLTS\n" \
> ++" 7sNgBli99goH9QATy3+qkCC/ds26kAmqc0DwEsXXrRJQBXX3f98+/WR8iQMsNx8fYaGN/=
QvXddd\n" \
> ++" T7Azr1iAO/auQcA1xGpYevRPm9mMYktEZNYSTIqW9ss3DFMcOUaNyeDeyAt+4Pa+LF04k=
heW//1\n" \
> ++" 7W3bASJnT/9X08d4mfHLX981FyDvuqKNRWyd+Ie+F6F2MiUa3+KLLixQ/Yn06gBgsKurC=
uB3v3v\n" \
> ++" uh/rQGe/WV8iQMkP4hZQZjotQf+WXP28EcBP+zwCG4sGnAQb6hy2A7l1bFcCiOgmvbu8W=
j8Xat4\n" \
> ++" vFdmrrqgFIJHX1B1MVVmc9ZLK6jsqQTINbtsv+nsOy/cxZcn0kIVpBqqVOAbTHpz1m+vj=
Kd/6tU\n" \
> ++" Bno3fDoow9MA3C9YUkAjFp1UHT1eDrDIghMtQh94SgnaW5EVmP96r/ulRXJmXwHwA/vuv=
N0gIUL\n" \
> ++" z+ka3WfIkDLDMTHk9f++NgUQT0eaAEac3JUAvV2Hvg6wr3egGmD3iIzqs5b/FQCREUnrP=
CsiAy+\n" \
> ++" bl1F0y7qBQttVzbLUpLJCC/WoKACONghHRoQJ+3d1A9CxR5gyNCLH/3yOFB46c34rANs6=
DwYAFf\n" \
> ++" 3FRSgNze1vAcSTkRsAalMtUrZ8SnsGwG+s3ghgRW0p6myq22nXj6etUM8kXhgaB6MWoUT=
Fy9nXI\n" \
> ++" UR45uHHfgTw9Avr/+GdbzRkSNlhQmrvlv/49gyA6NDw7QD5bN8lAP6weJrNiLeaWgKAzt=
e3K4C8\n" \
> ++" /v47B2UARdNSN3HJKcKCl94qEna7Tua0IibZQa6Ja89HhTYYG4fkeI1OfqhNySO98baEb=
rd3Sr5\n" \
> ++" odVRmgznVscLojXXvPwUgn0isBhipEpbVTm0GQNutONoLalnWEWeUIChlEICn1fDmltbV=
8N7MMA\n" \
> ++" gZUmYYN0N2r/1Foc5Udstr3wIg138JQKATCNxAhrEKZCQ5VlIBXLrkPACaDu0DYOfmHQA=
MW5I5F\n" \
> ++" 3xY5vmVFxb7+/4a0bjmatnRpjPmDudlgL+o5VKVzmqoTsjxXp1CGtGGpakE0ZeTezw0VJ=
QhlQlp\n" \
> ++" O6mrGFHfqAA2bJT40vwzTpf7ntqqQ7263uOYFKRgTOZ3aWK49RiAW2t9gXEgZEiZYdwM6=
d38ZiE\n" \
> ++" HM54fOgPAz4umk8nLMM27kpvpOTJENq2XmExSj5zzW8S1UN8j2lTPdAm7Zl4TO2T+1mII=
958qpI\n" \
> ++" 2WKaJtDc+eAUDt1l0A/G1C2KUCGfmNmkkHtUP+qRHZf13HiWt0FQl3OF3ow6/XNX4rErJ=
aWAe79\n" \
> ++" u4Q+2jX9r0AXHL5ZdJ3kwTQXLO+PijZoHSuUhCo9aYP2/a/CnDF0iuKHR8BIUPKDOPXsp=
LFUGkm\n" \
> ++" I3Oun5XRmdajMK0ZM5AVbaVrUOTAqoyMqFPrJCUn1yo2wut/Et28tUOOVwcFMUWtkS/aY=
u8+YxE\n" \
> ++" ATXtEDjVrmRBTIitSMWHEbJ1gl9d1fdf3y3k9SNtWtugNmK3lj601obgenhVVcp993aKp=
rb53FQ\n" \
> ++" CXXiliIFktCRieXmFkGdPcsg4CpJI115s+VnxyxdscBUKGlBnGzZDTTzqv4HN5qXfViwB=
ZV50JM\n" \
> ++" JyRytWDOWHI7l5JbN6ake97d81skTE1LQrg2ks/BsCT9z0NwOY+sbaXnrug0N+da34PwE=
U7JGQ7\n" \
> ++" c794vndoP9Kd/RLSnabXoX9xkSTjPfuaeAEe7hdZslWZer5yXrKY7MD2nhEFUF8hsizWI=
9b8SXO\n" \
> ++" mK4BX+6RvNysOtGdWP6kAPnHJ8gAgkUpqH5bqArDtxOcBVnxyxe/e80W+D0KGlBnGzRC1=
uPhzdC\n" \
> ++" /+9Ns/ARgeGJgG0DGUXQLQPTB8AGBzt5SuPhhtOB3Ar2tIAGw4JMx5/hWxQ7py0v36Pgn=
pLpozt\n" \
> ++" 9Df7mYZ6Vcf0rlrGZMYYcK+woAfzJH9tC+y5O4D0lZXXIJdkZSMfs/8RFIuU7BDtg1k0g=
DVKacX\n" \
> ++" gM7N0wDmnHlmL8CfLZwfA/jjy5sqAboPCINeenatAjh36ZJBgGgscTnAFy79whETGMaDk=
CFlhmP\n" \
> ++" y9r696rYkwM+fWf95gG279n8OoLM/PRWgI8fJAJ2pKVGAkXpJeivQUntLnRHRqM6e11Zo=
e5tekt\n" \
> ++" aTLy0uYIziuOQusETcTgxpL/Dve6T1IKK3+gnjfQcBaBop2jqtFXZeN5oGUL5bBzB9SuP=
NABd/8\n" \
> ++" Yu/AXjt5ZcfAXjzj3+sB1BW0AfwieUXXQnwtWu+s2Ycr2tcCBlSZjgmhtz07etOAtj86s=
aNAE5m\n" \
> ++" pBYgl3ctAE/n6gxlZUnbznxKAfQ0zAIgSIhtYGr0Wn7RSRQoPefrytaB+XUEnSJqKlmbK=
kAmLcj\n" \
> ++" Tn1s6CTvZK3bL9LyIicZUtNCJrbMrzHK5vF4EWlFVGQC0z5p1GsA55yw+AOA72cUA6ezw=
awDXXH\n" \
> ++" PjrqN4XeNCyJAywzEx5IpPffwJAC+fWwaQ1dZzoNtNZyUuMqLj33kdD+90RfM5VK1/TiQ=
qlq/yi\n" \
> ++" pE2W7mOfOZmAGxNEU9XCAgsKwngWzrrzpKN0nHu6NBBBTAzIzZOoy6YGo0Ux2ChrKPeut=
pGsXW9\n" \
> ++" 3qbW1ucBVj365JKjfzsTQ8iQMsOEIobf+PJfnwrQsXf3qQC5jKhCvv6Vm5z2ablBacVqS=
y8NaLI\n" \
> ++" kUhjpk/m9XzPEihfrXiz72MduBVix5NyHAJYtW9YF8MILLzQB/OSBxy8C2LZ330UAnQND=
CwGC9E\n" \
> ++" AKoCUv2lS9DvtFDDPUaIYYQhbctvIcOu6RT4+ce3Rv5tgRMqTMEH4hZYYJTVmeE9QA+L5=
UqjSra\n" \
> ++" ANLV/XxSjPSi9+7WW0rbo5qW85PepL1oLLFckCnpOxfASxfvnzLmO479XYzwLp16x4C+O=
b1Nz4C\n" \
> ++" MJTvWQCQiprqQDpLXt+Tskb9JIapYl5YA19aN8Vx8/H3exeTjZAhZYYJMSTrcxgg70uBw=
+IaDTn\n" \
> ++" ujd2aWldarTSV5Fy9TtwPxECrb6j9jenj+ptuehPghptvPuK9ZLq6+gHswBUdW7PQ9WSs=
2VrVDm\n" \
> ++" zzG0klY1BSQY2DZUxloVi8YkKrco8FIUPKDBNiyJeuurwD4I5bbt8IMJLubgfIZXMWjKq=
XaKrCm\n" \
> ++" a1ZuK5LNtTU1h8GaG+fthLg/oceusv0oVQxkHQkXPCZz/QA3HPPPSsAnn7y8SsBeroOnw=
tg4y8A\n" \
> ++" yOez8qORjluQC+YHJH1fll1F7UgOIJlK7gOYPmvubXLmpP863nsiZEiZYVKWI6xc+a2FA=
Hv/tP1\n" \
> ++" cgM7OzmqAwLdaARzP6QCobajrA5gza+5LALfefuJ+BsKgt7d3xtjP6urqxP2u1OF3XnFi=
ETIkRI\n" \
> ++" gQIUKE+H+C/wMGX8Ias1s6CQAAAABJRU5ErkJggg=3D=3D\n" \
> + "END:VCARD"
> +Index: addressbook/backends/file/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- addressbook/backends/file/Makefile.am.orig	2011-12-19 13:58:28.95485=
9229 +0000
> ++++ addressbook/backends/file/Makefile.am	2011-12-19 13:58:31.442859286 =
+0000
> +@@ -2,6 +2,7 @@
> +=20
> + libebookbackendfile_la_CPPFLAGS =3D \
> + 	$(AM_CPPFLAGS)					\
> ++	-DCREATE_DEFAULT_VCARD \
> + 	-DG_LOG_DOMAIN=3D\"libebookbackend\"		\
> + 	-I$(top_srcdir)					\
> + 	-I$(top_builddir)				\
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-a=
pi.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.p=
atch
> new file mode 100644
> index 0000000..7ef2956
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
> @@ -0,0 +1,19 @@
> +Do not disable old API after upgrading gtk+.
> +This avoid build error due to defination missing.
> +
> +Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
> ++++ git/configure.ac	2010-12-16 10:25:58.000000000 +0800
> +@@ -147,7 +147,6 @@
> + AS_COMPILER_FLAGS(WARNING_FLAGS,
> + 	"-DG_DISABLE_DEPRECATED
> + 	-DPANGO_DISABLE_DEPRECATED
> +-	-DGDK_DISABLE_DEPRECATED
> + 	-DGDK_PIXBUF_DISABLE_DEPRECATED
> + 	-DG_DISABLE_SINGLE_INCLUDES
> + 	-DGTK_DISABLE_SINGLE_INCLUDES
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/optional_=
imapx_provider.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/o=
ptional_imapx_provider.patch
> new file mode 100644
> index 0000000..d9b0940
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_p=
rovider.patch
> @@ -0,0 +1,64 @@
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Index: git/camel/providers/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +=
0800
> ++++ git/camel/providers/Makefile.am	2010-07-08 17:23:56.000000000 +0800
> +@@ -6,6 +6,10 @@
> + IMAP4_DIR=3Dimap4
> + endif
> +=20
> ++if ENABLE_IMAPX
> ++IMAPX_DIR=3Dimapx
> ++endif
> ++
> + if ENABLE_HULA
> + HULA_DIR=3Dhula
> + endif
> +@@ -15,6 +19,6 @@
> + SENDMAIL_DIR=3Dsendmail
> + endif
> +=20
> +-SUBDIRS =3D pop3 $(SENDMAIL_DIR) smtp imap imapx $(IMAP4_DIR) $(NNTP_DI=
R) local groupwise $(HULA_DIR)
> ++SUBDIRS =3D pop3 $(SENDMAIL_DIR) smtp imap $(IMAPX_DIR) $(IMAP4_DIR) $(=
NNTP_DIR) local groupwise $(HULA_DIR)
> +=20
> + -include $(top_srcdir)/git.mk
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac	2010-07-08 17:24:36.000000000 +0800
> ++++ git/configure.ac	2010-07-08 17:32:06.000000000 +0800
> +@@ -1002,6 +1002,26 @@
> + AM_CONDITIONAL(ENABLE_IMAP4, [test x$enable_imap4 =3D xyes])
> +=20
> + dnl ******************************
> ++dnl IMAPX code support.
> ++dnl ******************************
> ++AC_ARG_ENABLE(imapx,
> ++	AS_HELP_STRING([--enable-imapx=3Dno/yes],
> ++	[Attempt to compile yet another, incomplete, very unsupported IMAPv4r1=
 implementation]),
> ++	[],[enable_imapx=3Dno])
> ++
> ++if test "x$enable_imapx" =3D "xyes"; then
> ++	AC_DEFINE(ENABLE_IMAPX,1,[Really don't try this at home])
> ++	AC_PATH_PROG(GPERF, gperf)
> ++	if test -z "$GPERF" ; then
> ++	AC_MSG_ERROR([You need gperf to compile imapx provider])
> ++	fi
> ++	msg_imapx=3Dyes
> ++else
> ++	msg_imapx=3Dno
> ++fi
> ++AM_CONDITIONAL(ENABLE_IMAPX, [test x$enable_imapx =3D xyes])
> ++
> ++dnl ******************************
> + dnl Hula support
> + dnl ******************************
> + AC_ARG_ENABLE([hula],
> +@@ -1541,3 +1561,7 @@
> + if test "x$msg_hula" =3D "xyes"; then
> + 	echo "Hula support:	$msg_hula"
> + fi
> ++
> ++if test "x$msg_imapx" =3D "xyes"; then
> ++	echo "IMAPX support:	$msg_imapx"
> ++fi
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/=
meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> new file mode 100644
> index 0000000..c114c0e
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> @@ -0,0 +1,111 @@
> +DESCRIPTION =3D "Evolution database backend server"
> +HOMEPAGE =3D "http://www.gnome.org/projects/evolution/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2 & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255cf0557f3fe7d7068=
212 \
> +                    file://camel/camel.h;endline=3D24;md5=3Db02175c88f82=
1224746b347a89731a2b \
> +                    file://libedataserver/e-data-server-util.h;endline=
=3D23;md5=3D9df8127bd8cfdc5469e938fc710d1f40 \
> +                    file://calendar/libecal/e-cal.h;endline=3D24;md5=3D5=
d496b9b6fd2a4fdbbfc31ef9455c9d0"
> +
> +DEPENDS =3D "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common vi=
rtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
> +
> +SRCREV =3D "3ca578d968d09785933ebbb45b66b3bccdbd5832"
> +
> +PV =3D "2.30+git${SRCPV}"
> +PR =3D "r2"
> +
> +SRC_URI =3D "git://git.gnome.org/evolution-data-server;protocol=3Dgit \
> +           file://oh-contact.patch;striplevel=3D0 \
> +           file://nossl.patch \
> +           file://optional_imapx_provider.patch \
> +           file://new-contact-fix.patch \
> +           file://old-gdk-api.patch \
> +           file://depbuildfix.patch \
> +           file://fix_for_automake-1.12.x.patch \
> +           file://avoid_automake_errors.patch \
> +           file://iconv-detect.h"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools gtk-doc pkgconfig
> +
> +# -ldb needs this on some platforms
> +LDFLAGS +=3D "-lpthread"
> +
> +# Parallel make shows many issues with this source code.
> +# Current problems seem to be duplicate execution of the calander/backen=
ds
> +# directories by make resulting in truncated/corrupt .la files
> +#PARALLEL_MAKE =3D ""
> +
> +do_configure_append () {
> +        cp ${WORKDIR}/iconv-detect.h ${S}
> +        sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
> +}
> +
> +EXTRA_OECONF =3D "--without-openldap --with-dbus --without-bug-buddy \
> +                --with-soup --with-libdb=3D${STAGING_DIR_HOST}${prefix} \
> +                --disable-smime --disable-ssl --disable-nntp --without-w=
eather"
> +
> +PACKAGES =3D+ "libcamel libcamel-dev libebook libebook-dev libecal libec=
al-dev \
> +             libedata-book libedata-book-dev libedata-cal libedata-cal-d=
ev \
> +             libedataserver libedataserver-dev \
> +             libedataserverui libedataserverui-dev"
> +
> +FILES_${PN} =3D+ "${datadir}/evolution-data-server-*/ui/"
> +FILES_${PN}-dev =3D+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
> +FILES_${PN}-dbg =3D+ "${libdir}/evolution-data-server-*/camel-providers/=
=2Edebug \
> +                    ${libdir}/evolution-data-server*/extensions/.debug/"
> +RRECOMMENDS_${PN}-dev +=3D "libecal-dev libebook-dev"
> +
> +FILES_libcamel =3D "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
> +                  ${libdir}/libcamel-provider-*.so.* \
> +                  ${libdir}/evolution-data-server-*/camel-providers/*.so=
 \
> +                  ${libdir}/evolution-data-server-*/camel-providers/*.ur=
ls"
> +FILES_libcamel-dev =3D "${libdir}/libcamel-*.so ${libdir}/libcamel-provi=
der-*.so \
> +                      ${libdir}/pkgconfig/camel*pc \
> +                    ${libdir}/evolution-data-server-*/camel-providers/*.=
la \
> +                      ${includedir}/evolution-data-server*/camel"
> +
> +FILES_libebook =3D "${libdir}/libebook-*.so.*"
> +FILES_libebook-dev =3D "${libdir}/libebook-1.2.so \
> +                      ${libdir}/pkgconfig/libebook-*.pc \
> +                      ${includedir}/evolution-data-server*/libebook/*.h"
> +RRECOMMENDS_libebook =3D "libedata-book"
> +
> +FILES_libecal =3D "${libdir}/libecal-*.so.* \
> +                 ${datadir}/evolution-data-server-1.4/zoneinfo"
> +FILES_libecal-dev =3D "${libdir}/libecal-*.so ${libdir}/pkgconfig/libeca=
l-*.pc \
> +                     ${includedir}/evolution-data-server*/libecal/*.h \
> +                     ${includedir}/evolution-data-server*/libical/*.h"
> +RRECOMMENDS_libecal =3D "libedata-cal tzdata"
> +
> +FILES_libedata-book =3D "${libexecdir}/e-addressbook-factory \
> +                       ${datadir}/dbus-1/services/*.AddressBook.service \
> +                       ${libdir}/libedata-book-*.so.* \
> +                       ${libdir}/evolution-data-server-*/extensions/libe=
book*.so \
> +                       ${datadir}/evolution-data-server-1.4/weather/Loca=
tions.xml"
> +FILES_libedata-book-dev =3D "${libdir}/libedata-book-*.so \
> +                           ${libdir}/pkgconfig/libedata-book-*.pc \
> +                           ${libdir}/evolution-data-server-*/extensions/=
libebook*.la \
> +                           ${includedir}/evolution-data-server-*/libedat=
a-book"
> +
> +FILES_libedata-cal =3D "${libexecdir}/e-calendar-factory \
> +                      ${datadir}/dbus-1/services/*.Calendar.service \
> +                      ${libdir}/libedata-cal-*.so.* \
> +                      ${libdir}/evolution-data-server-*/extensions/libec=
al*.so"
> +FILES_libedata-cal-dev =3D "${libdir}/libedata-cal-*.so \
> +                          ${libdir}/pkgconfig/libedata-cal-*.pc \
> +                          ${includedir}/evolution-data-server-*/libedata=
-cal \
> +                          ${libdir}/evolution-data-server-*/extensions/l=
ibecal*.la"
> +
> +FILES_libedataserver =3D "${libdir}/libedataserver-*.so.*"
> +FILES_libedataserver-dev =3D "${libdir}/libedataserver-*.so \
> +                            ${libdir}/pkgconfig/libedataserver-*.pc \
> +                            ${includedir}/evolution-data-server-*/libeda=
taserver/*.h"
> +
> +FILES_libedataserverui =3D "${libdir}/libedataserverui-*.so.* ${datadir}=
/evolution-data-server-1.4/glade/*.glade"
> +FILES_libedataserverui-dev =3D "${libdir}/libedataserverui-*.so \
> +                              ${libdir}/pkgconfig/libedataserverui-*.pc \
> +                              ${includedir}/evolution-data-server-*/libe=
dataserverui/*.h"
> +
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuMJwACgkQN1Ujt2V2gBwOlwCgsKNNJntd1IXfE8SK/LxU+5iQ
fdoAnjvdrBOXiFzhyeAJMd4WXmxV4Ai8
=UurI
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--
