Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P1hjh-0006ry-T1
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 17:41:28 +0200
Received: by iwn2 with SMTP id 2so3985466iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=XRAN8s9OJVlKsgTyVWcWJZ7DITT0va31V1RaysZNFKs=;
	b=SUweZfEV25Y2sobdqeJbu1ZLz3RrFwhg20n4zqslqCS1qeqrxetKAyt6RtIDQ1Pzs4
	IgWdpsaRT/SpVw/iqbcDBp8+alGk1ijm1WCgOq+I6M4jpMPzeH5AEtQxQwZe2daYnNjP
	z5coy9pgtPRFP4rGavLnzOACPotP00p5S+NPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=NPhZcRIHodaHaCS305dLp22nYyndm/W49PhUw7YJjZzO1DBAv3wyWWO+2x6xLFz3nM
	B3VjU6rLPsczhgH45+AQjQR3qpWRxhSmxn8BNHxK4pllKCWwh9QTVtswN4wcIWPtJAQV
	Q8Iv67lt9xd4hj0GGomwLRDkJwEI5Rq4jgHYU=
Received: by 10.231.152.143 with SMTP id g15mr5725656ibw.76.1285947672338;
	Fri, 01 Oct 2010 08:41:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 1 Oct 2010 08:40:51 -0700 (PDT)
In-Reply-To: <1285942221-29511-1-git-send-email-tom_rini@mentor.com>
References: <1285942221-29511-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Oct 2010 08:40:51 -0700
Message-ID: <AANLkTikbV0Xjp833GnUduGpjYX7ZvNKKP9L_utgH88cA@mail.gmail.com>
To: Tom Rini <tom_rini@mentor.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc/glibc: Kill off (again) zoneinfo
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
X-List-Received-Date: Fri, 01 Oct 2010 15:41:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 7:10 AM, Tom Rini <tom_rini@mentor.com> wrote:
> We want to get zoneinfo from the tzdata package.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

I removed it accidently. Thanks for re-fixing.
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/glibc-package.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0recipes/eglibc/eglibc-package.bbclass | =C2=A0 =C2=A02 +-
> =C2=A0recipes/eglibc/eglibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/glibc/glibc-package.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01 +
> =C2=A0recipes/glibc/glibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A05 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/classes/glibc-package.bbclass b/classes/glibc-package.bbclas=
s
> index 36424d5..239317f 100644
> --- a/classes/glibc-package.bbclass
> +++ b/classes/glibc-package.bbclass
> @@ -21,7 +21,7 @@ libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base=
_libdir}/libcrypt-*.so ${ba
> =C2=A0# The problem is that if PN =3D "glibc", FILES_${PN} will overwrite=
 FILES_glibc
> =C2=A0# Solution: Make them both the same thing, then it doesn't matter
>
> -glibcfiles =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@=
base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> +glibcfiles =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('US=
E_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> =C2=A0glibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.de=
bug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_bin=
dir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/=
gconv/.debug ${libexecdir}/*/.debug"
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglib=
c-package.bbclass
> index 06d91be..5871be0 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -62,7 +62,7 @@ libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base=
_libdir}/libcrypt-*.so ${ba
> =C2=A0# The problem is that if PN =3D "glibc", FILES_${PN} will overwrite=
 FILES_glibc
> =C2=A0# Solution: Make them both the same thing, then it doesn't matter
>
> -eglibcfiles =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${=
@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> +eglibcfiles =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('U=
SE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> =C2=A0eglibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.d=
ebug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_bin=
dir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/=
gconv/.debug ${libexecdir}/*/.debug"
> diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
> index 2e215c5..a68f343 100644
> --- a/recipes/eglibc/eglibc.inc
> +++ b/recipes/eglibc/eglibc.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.eglibc.org/home"
> =C2=A0SECTION =3D "libs"
> =C2=A0PRIORITY =3D "required"
> =C2=A0LICENSE =3D "LGPL"
> -INC_PR =3D "r13"
> +INC_PR =3D "r14"
> =C2=A0# nptl needs unwind support in gcc, which can't be built without gl=
ibc.
> =C2=A0DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-he=
aders"
> =C2=A0#this leads to circular deps, so lets not add it yet
> diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-packag=
e.inc
> index 2e9474d..0b263bb 100644
> --- a/recipes/glibc/glibc-package.inc
> +++ b/recipes/glibc/glibc-package.inc
> @@ -60,6 +60,7 @@ do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${WORKDIR}/SUPP=
ORTED.tmp ${WORKDIR}/SUPPORTED
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}{sysconfdir}/rpc
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${datadir}/zoneinfo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/nscd/nscd.conf ${D}${sysc=
onfdir}/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/nscd/nscd.init ${D}${sysconfdir}/=
init.d/nscd
> diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
> index 643ebd3..f3c0c08 100644
> --- a/recipes/glibc/glibc.inc
> +++ b/recipes/glibc/glibc.inc
> @@ -13,7 +13,7 @@ PROVIDES +=3D "virtual/libintl virtual/libiconv"
> =C2=A0COMPATIBLE_TARGET_SYS ?=3D "(?!nios2)"
>
> =C2=A0# INC_PR for glibc.inc, glibc-initial.inc and glibc-stage.inc
> -INC_PR =3D "r36"
> +INC_PR =3D "r37"
>
> =C2=A0inherit autotools
>
> --
> 1.6.3.3
>
>


