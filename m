Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRZ0-0000JE-9a
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:43:58 +0200
Received: by fxm9 with SMTP id 9so591855fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AsGCkPO/BSoqiAZ+pcsT5vOZW67i/lGVW2nd+z6Se3U=;
	b=J7bawMAtY9nQjDrNKvxmCGaPPR8RL8T1lHMriQpNdHaOXQxSGp4XkiOlMOjsU3ZT/A
	U/YGijKNgWjxU1GCHe64M/EUM6TDxbi+NBUuUoZf8VYKcUWHz5nVFZsw/V3B6HvLxCjY
	JLuEmSJ+DBZQMt0m46IW2CcnU1/EGQ0q2ur1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LMMTPM6y3hxVgI0zPo9TtB3lMSxlJ4RmwtN9t6FX1FZppY0TfUnpp/+kjXDaUR/f0A
	AqzPXh+m0JwGKiH2F9inQz5eHULPwvsh5CsUFNZkagShk28vdK8Ct8KdLtTLVDfJz5uS
	XNEqZshf2GIc5SpYUgFv2R6enFk/ScF3d9p0Y=
MIME-Version: 1.0
Received: by 10.223.143.20 with SMTP id s20mr11419079fau.38.1275637157794; 
	Fri, 04 Jun 2010 00:39:17 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:39:17 -0700 (PDT)
In-Reply-To: <1275510896-30845-8-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-8-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:39:17 +0200
Message-ID: <AANLkTilJ62g8nmoiOrRbKBMDhUs7RtjMNgxwW3ntzink@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 07/16] grep-2.6.3: Add recipe.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:44:58 -0000
X-List-Received-Date: Fri, 04 Jun 2010 07:44:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Fix build for uclibc as well.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/grep/grep-2.6.3/uclibc-fix.patch | =A0 50 ++++++++++++++++++++=
++++++++++
> =A0recipes/grep/grep_2.6.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 47 ++++++=
++++++++++++++++++++++
> =A02 files changed, 97 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
> =A0create mode 100644 recipes/grep/grep_2.6.3.bb
>
> diff --git a/recipes/grep/grep-2.6.3/uclibc-fix.patch b/recipes/grep/grep=
-2.6.3/uclibc-fix.patch
> new file mode 100644
> index 0000000..2e1c584
> --- /dev/null
> +++ b/recipes/grep/grep-2.6.3/uclibc-fix.patch
> @@ -0,0 +1,50 @@
> +Fix to use mempcpy instead of __mempcpy. This is needed for uclibc which
> +doesn't define __mempcpy only mempcpy. Since both uclibc and glibc have
> +mempcpy we'll just use that instead.
> +
> +Index: grep-2.6.3/lib/getopt.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- grep-2.6.3.orig/lib/getopt.c =A0 =A0 =A0 2010-03-21 00:34:02.0000000=
00 -0700
> ++++ grep-2.6.3/lib/getopt.c =A0 =A02010-05-22 21:37:11.352740539 -0700
> +@@ -41,6 +41,10 @@
> + # include <wchar.h>
> + #endif
> +
> ++#ifdef __UCLIBC__
> ++#define __mempcpy mempcpy
> ++#endif
> ++
> + /* This version of `getopt' appears to the caller like standard Unix `g=
etopt'
> + =A0 =A0but it behaves differently for the user, since it allows the use=
r
> + =A0 =A0to intersperse the options with the other arguments.
> +Index: grep-2.6.3/gnulib-tests/setenv.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- grep-2.6.3.orig/gnulib-tests/setenv.c =A0 =A0 =A02010-05-22 21:37:53=
.655168151 -0700
> ++++ grep-2.6.3/gnulib-tests/setenv.c =A0 2010-05-22 21:38:42.792745476 -=
0700
> +@@ -68,6 +68,10 @@ __libc_lock_define_initialized (static,
> + # define tsearch __tsearch
> + #endif
> +
> ++#ifdef __UCLIBC__
> ++#define __mempcpy mempcpy
> ++#endif
> ++
> + /* In the GNU C library implementation we try to be more clever and
> + =A0 =A0allow arbitrarily many changes of the environment given that the=
 used
> + =A0 =A0values are from a small set. =A0Outside glibc this will eat up a=
ll
> +Index: grep-2.6.3/lib/regexec.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- grep-2.6.3.orig/lib/regexec.c =A0 =A0 =A02010-05-22 21:36:02.6551546=
71 -0700
> ++++ grep-2.6.3/lib/regexec.c =A0 2010-05-22 21:37:26.212743273 -0700
> +@@ -22,6 +22,11 @@
> +
> + #include "verify.h"
> + #include "intprops.h"
> ++
> ++#ifdef __UCLIBC__
> ++#define __mempcpy mempcpy
> ++#endif
> ++
> + static reg_errcode_t match_ctx_init (re_match_context_t *cache, int efl=
ags,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
Idx n) internal_function;
> + static void match_ctx_clean (re_match_context_t *mctx) internal_functio=
n;
> diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.6.3.bb
> new file mode 100644
> index 0000000..c887ca0
> --- /dev/null
> +++ b/recipes/grep/grep_2.6.3.bb
> @@ -0,0 +1,47 @@
> +LICENSE =3D "GPL"
> +SECTION =3D "console/utils"
> +DESCRIPTION =3D "grep GNU utility"
> +PR =3D "r0"
> +
> +SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
> + =A0 =A0 =A0 =A0 =A0 file://uclibc-fix.patch"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--disable-perl-regexp --disable-ncurses"
> +EXTRA_OECONF_virtclass-native =3D "--with-included-regex --disable-ncurs=
es"
> +
> +do_configure () {
> + =A0 =A0 =A0 rm -f ${S}/m4/init.m4
> + =A0 =A0 =A0 autotools_do_configure
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 autotools_do_install
> + =A0 =A0 =A0 install -d ${D}${base_bindir}
> + =A0 =A0 =A0 mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
> + =A0 =A0 =A0 mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
> + =A0 =A0 =A0 mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
> +}
> +
> +do_install_virtclass-native () {
> + =A0 =A0 =A0 autotools_do_install
> +}
> +
> +pkg_postinst_${PN} () {
> + =A0 =A0 =A0 update-alternatives --install ${base_bindir}/grep grep grep=
.${PN} 100
> + =A0 =A0 =A0 update-alternatives --install ${base_bindir}/egrep egrep eg=
rep.${PN} 100
> + =A0 =A0 =A0 update-alternatives --install ${base_bindir}/fgrep fgrep fg=
rep.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> + =A0 =A0 =A0 update-alternatives --remove grep grep.${PN}
> + =A0 =A0 =A0 update-alternatives --remove egrep egrep.${PN}
> + =A0 =A0 =A0 update-alternatives --remove fgrep fgrep.${PN}
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI[md5sum] =3D "69a3bf508a3f14d12369e0e1c7a92763"
> +SRC_URI[sha256sum] =3D "ba745e2ff297ab225bf870740d35593d402a1d92999cf0d7=
e56840f10218db7c"
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


