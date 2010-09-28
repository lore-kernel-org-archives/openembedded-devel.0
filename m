Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0cBJ-0002Qu-Pq
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 17:33:32 +0200
Received: by iwn2 with SMTP id 2so4291305iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=nlwMBTugwjU1iA0BCrK2T9dNuvY8boQd6EKa+1WOUoM=;
	b=mQ8WSWEiCk4y1bUOWrTILTeX+gpKXbtneCEHH5nDxNNoI0diFFN/oGHlKSwhaEhSbL
	35ggbWoeSeVZQmIqo8BBvCpAloyI8N/iDiCpWrp/YMpog4dnHaW6RcKSTejsYhThY3V9
	EZB3aOXmXBuGD0uPLZKJvnd2FG/5jTaqK16sU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=JzfwdhQF4uSePIkNRWJ36F2l06OVij8VCkUzMABqBG6jGpOQGhi4iZjtdm6upmswc7
	sIH7gtczANw8qu6ZA8fIsugsFFKVrYMEQQP7A8umlXOgnY4L5qT2GWkQEF4Kihy9e32q
	hntEj/pWBT0R/3x7yX4J3qbeRlY8mVJlNTKfE=
Received: by 10.231.183.200 with SMTP id ch8mr77177ibb.124.1285687995423; Tue,
	28 Sep 2010 08:33:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 28 Sep 2010 08:32:55 -0700 (PDT)
In-Reply-To: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
References: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Sep 2010 08:32:55 -0700
Message-ID: <AANLkTinQgVoMYi6WvU-+xDrZMuo6XEF1LhRa65NLC+MV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: Re: [PATCH] grep: update 2.6.3 to 2.7
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
X-List-Received-Date: Tue, 28 Sep 2010 15:33:32 -0000
X-List-Received-Date: Tue, 28 Sep 2010 15:33:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2010 at 9:47 PM, Scott Garman <sgarman@zenlinux.com> wrote:
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> ---
> =C2=A0recipes/grep/grep-2.6.3/uclibc-fix.patch =C2=A0 =C2=A0| =C2=A0 50 -=
--------------------------
> =C2=A0recipes/grep/grep-2.7/uclibc_libiconv.patch | =C2=A0 18 ++++++++++
> =C2=A0recipes/grep/grep_2.6.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 45 ------------------------
> =C2=A0recipes/grep/grep_2.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 42 ++++++++++++++++++++++
> =C2=A04 files changed, 60 insertions(+), 95 deletions(-)
> =C2=A0delete mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
> =C2=A0create mode 100644 recipes/grep/grep-2.7/uclibc_libiconv.patch
> =C2=A0delete mode 100644 recipes/grep/grep_2.6.3.bb
> =C2=A0create mode 100644 recipes/grep/grep_2.7.bb

Please also do a build for uclibc based system if you have not done so.
and see if new grep builds/works

>
> diff --git a/recipes/grep/grep-2.6.3/uclibc-fix.patch b/recipes/grep/grep=
-2.6.3/uclibc-fix.patch
> deleted file mode 100644
> index 2e1c584..0000000
> --- a/recipes/grep/grep-2.6.3/uclibc-fix.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Fix to use mempcpy instead of __mempcpy. This is needed for uclibc which
> -doesn't define __mempcpy only mempcpy. Since both uclibc and glibc have
> -mempcpy we'll just use that instead.
> -
> -Index: grep-2.6.3/lib/getopt.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- grep-2.6.3.orig/lib/getopt.c =C2=A0 =C2=A0 =C2=A0 2010-03-21 00:34:0=
2.000000000 -0700
> -+++ grep-2.6.3/lib/getopt.c =C2=A0 =C2=A02010-05-22 21:37:11.352740539 -=
0700
> -@@ -41,6 +41,10 @@
> - # include <wchar.h>
> - #endif
> -
> -+#ifdef __UCLIBC__
> -+#define __mempcpy mempcpy
> -+#endif
> -+
> - /* This version of `getopt' appears to the caller like standard Unix `g=
etopt'
> - =C2=A0 =C2=A0but it behaves differently for the user, since it allows t=
he user
> - =C2=A0 =C2=A0to intersperse the options with the other arguments.
> -Index: grep-2.6.3/gnulib-tests/setenv.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- grep-2.6.3.orig/gnulib-tests/setenv.c =C2=A0 =C2=A0 =C2=A02010-05-22=
 21:37:53.655168151 -0700
> -+++ grep-2.6.3/gnulib-tests/setenv.c =C2=A0 2010-05-22 21:38:42.79274547=
6 -0700
> -@@ -68,6 +68,10 @@ __libc_lock_define_initialized (static,
> - # define tsearch __tsearch
> - #endif
> -
> -+#ifdef __UCLIBC__
> -+#define __mempcpy mempcpy
> -+#endif
> -+
> - /* In the GNU C library implementation we try to be more clever and
> - =C2=A0 =C2=A0allow arbitrarily many changes of the environment given th=
at the used
> - =C2=A0 =C2=A0values are from a small set. =C2=A0Outside glibc this will=
 eat up all
> -Index: grep-2.6.3/lib/regexec.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- grep-2.6.3.orig/lib/regexec.c =C2=A0 =C2=A0 =C2=A02010-05-22 21:36:0=
2.655154671 -0700
> -+++ grep-2.6.3/lib/regexec.c =C2=A0 2010-05-22 21:37:26.212743273 -0700
> -@@ -22,6 +22,11 @@
> -
> - #include "verify.h"
> - #include "intprops.h"
> -+
> -+#ifdef __UCLIBC__
> -+#define __mempcpy mempcpy
> -+#endif
> -+
> - static reg_errcode_t match_ctx_init (re_match_context_t *cache, int efl=
ags,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Idx n) internal_func=
tion;
> - static void match_ctx_clean (re_match_context_t *mctx) internal_functio=
n;
> diff --git a/recipes/grep/grep-2.7/uclibc_libiconv.patch b/recipes/grep/g=
rep-2.7/uclibc_libiconv.patch
> new file mode 100644
> index 0000000..de83a61
> --- /dev/null
> +++ b/recipes/grep/grep-2.7/uclibc_libiconv.patch
> @@ -0,0 +1,18 @@
> +# Needed to get grep to build with uclibc.
> +# Patch submitted by Bruno Haible to the grep ML on 2010-09-23.
> +#
> +# Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> +diff -ur grep-2.7.orig/src/Makefile.am grep-2.7/src/Makefile.am
> +--- grep-2.7.orig/src/Makefile.am =C2=A0 =C2=A0 =C2=A02010-04-04 05:22:2=
4.000000000 -0700
> ++++ grep-2.7/src/Makefile.am =C2=A0 2010-09-27 21:07:39.370222501 -0700
> +@@ -36,7 +36,9 @@
> + # must precede $(LIBINTL) in order to ensure we use GNU getopt.
> + # But libgreputils.a must also follow $(LIBINTL), since libintl uses
> + # replacement functions defined in libgreputils.a.
> +-LDADD =3D libgrep.a ../lib/libgreputils.a $(LIBINTL) ../lib/libgreputil=
s.a
> ++LDADD =3D \
> ++ =C2=A0 =C2=A0 =C2=A0libgrep.a \
> ++ =C2=A0 =C2=A0 =C2=A0../lib/libgreputils.a $(LIBINTL) ../lib/libgreputi=
ls.a $(LIBICONV)
> +
> + grep_LDADD =3D $(LDADD) $(LIB_PCRE)
> + localedir =3D $(datadir)/locale
> diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.6.3.bb
> deleted file mode 100644
> index 25c2a19..0000000
> --- a/recipes/grep/grep_2.6.3.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -LICENSE =3D "GPL"
> -SECTION =3D "console/utils"
> -DESCRIPTION =3D "grep GNU utility"
> -PR =3D "r2"
> -
> -SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.gz \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uclibc-fix.patch"
> -
> -inherit autotools gettext
> -
> -EXTRA_OECONF =3D "--disable-perl-regexp --disable-ncurses"
> -EXTRA_OECONF_virtclass-native =3D "--with-included-regex --disable-ncurs=
es"
> -
> -do_configure () {
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/m4/init.m4
> - =C2=A0 =C2=A0 =C2=A0 autotools_do_configure
> -}
> -
> -do_install () {
> - =C2=A0 =C2=A0 =C2=A0 autotools_do_install
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}
> - =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN=
}
> - =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${=
PN}
> - =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${=
PN}
> -}
> -
> -do_install_virtclass-native () {
> - =C2=A0 =C2=A0 =C2=A0 autotools_do_install
> -}
> -
> -pkg_postinst_${PN} () {
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/grep =
grep grep.${PN} 100
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/egrep=
 egrep egrep.${PN} 100
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/fgrep=
 fgrep fgrep.${PN} 100
> -}
> -
> -pkg_prerm_${PN} () {
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove grep grep.${PN}
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove egrep egrep.${PN}
> - =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove fgrep fgrep.${PN}
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -SRC_URI[md5sum] =3D "3095b57837b312f087c0680559de7f13"
> -SRC_URI[sha256sum] =3D "a340e5d1544d9a964072196be627bad3e434ff7a87f3a57e=
a15aaccbbea4d666"
> diff --git a/recipes/grep/grep_2.7.bb b/recipes/grep/grep_2.7.bb
> new file mode 100644
> index 0000000..6267162
> --- /dev/null
> +++ b/recipes/grep/grep_2.7.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "grep GNU utility"
> +SECTION =3D "console/utils"
> +HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
> +LICENSE =3D "GPLv3"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uclibc_libiconv.patch"
> +
> +SRC_URI[md5sum] =3D "e848f07e3e79aa7899345d17c7e4115e"
> +SRC_URI[sha256sum] =3D "ad14831015a79cea36785aa47415f6c0653a6ac4eaf9c154=
56f0d9d09c9e1bad"
> +
> +inherit autotools gettext
> +
> +BBCLASSEXTEND =3D "native"
> +
> +EXTRA_OECONF =3D "--disable-perl-regexp"
> +
> +do_configure_prepend () {
> + =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/m4/init.m4
> +}
> +
> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 autotools_do_install
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}
> + =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN=
}
> + =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${=
PN}
> + =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${=
PN}
> +}
> +
> +pkg_postinst_${PN} () {
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/grep =
grep grep.${PN} 100
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/egrep=
 egrep egrep.${PN} 100
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --install ${base_bindir}/fgrep=
 fgrep fgrep.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove grep grep.${PN}
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove egrep egrep.${PN}
> + =C2=A0 =C2=A0 =C2=A0 update-alternatives --remove fgrep fgrep.${PN}
> +}
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


