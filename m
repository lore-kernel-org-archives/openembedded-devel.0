Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oms0G-0004f6-F4
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 19:37:13 +0200
Received: by iwn2 with SMTP id 2so1521459iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=i5s4Q6vmsIiIdDVht1+uGKNR7qbPtsdya/k5ao5qoXs=;
	b=PbQsZuiIDXIw9DXd0hbQbEnbtgUnxor2Sj80m66alOir9p+Sy37g1nXg2PX74V/+3F
	pTDOTJdTiD7zuIel9/KXgNQm4bpAPnNnO70HBXxRr4N7kuwz4wxGuYE28QZHAaT0lkFH
	Ea6EUXpOyzqfliPv6FLeC87E+7gCCwxpRK/C0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wAUcalJQ893VDDec+uaA7VzA5+0D2CmCYSNW+7mjzALa9I2lMBwm3bE4b4truKcbXi
	bJbkPDYMM0f5YnNnPaMVH7fqdczSqVpIjf6/t2v7tyPfqgbilwilKJcpdNWl2q3zYWp7
	z+iKKpRSj/yFiC8aWbo8YkvFdKmg21G47voxA=
Received: by 10.231.193.135 with SMTP id du7mr3444252ibb.176.1282412211167;
	Sat, 21 Aug 2010 10:36:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Sat, 21 Aug 2010 10:36:31 -0700 (PDT)
In-Reply-To: <1282406429-13062-1-git-send-email-khimov@altell.ru>
References: <1282406429-13062-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Aug 2010 10:36:31 -0700
Message-ID: <AANLkTimP_m6bur02tUH+sfLuW_qsO6iPnAu36SU4of68@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpcre: fix QA 'non -dev package contains symlink .so' issue
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
X-List-Received-Date: Sat, 21 Aug 2010 17:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2010 at 9:00 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Effectively reverts 402f1f697406d4d1a844a6c6b7736435053d69c6, maybe it wa=
s
> useful back then, but as of today libpcre packages better without prepend=
ing
> pythonic functions.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/libpcre/libpcre_7.6.bb | =A0 15 ++++-----------
> =A01 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/recipes/libpcre/libpcre_7.6.bb b/recipes/libpcre/libpcre_7.6=
.bb
> index b0eff17..aec3a5c 100644
> --- a/recipes/libpcre/libpcre_7.6.bb
> +++ b/recipes/libpcre/libpcre_7.6.bb
> @@ -5,7 +5,7 @@ provides a POSIX calling interface to PCRE; the regular e=
xpressions \
> =A0themselves still follow Perl syntax and semantics. The header file for=
 \
> =A0the POSIX-style functions is called pcreposix.h."
> =A0SECTION =3D "devel"
> -PR =3D "r7"
> +PR =3D "r8"
> =A0LICENSE =3D "BSD"
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://pcre-cross.patch"
> @@ -43,17 +43,10 @@ do_install_append () {
> =A0 =A0 install -m 0755 ${D}${bindir}/pcre-config ${STAGING_BINDIR}/
> =A0}
>
> -python populate_packages_prepend () {
> - =A0 =A0 =A0 pcre_libdir =3D bb.data.expand('${libdir}', d)
> - =A0 =A0 =A0 pcre_libdir_dbg =3D bb.data.expand('${libdir}/.debug', d)
> - =A0 =A0 =A0 do_split_packages(d, pcre_libdir, '^lib(.*)\.so$', 'lib%s-d=
ev', 'libpcre %s development package', extra_depends=3D'${PN}-dev', allow_l=
inks=3DTrue)
> - =A0 =A0 =A0 do_split_packages(d, pcre_libdir, '^lib(.*)\.la$', 'lib%s-d=
ev', 'libpcre %s development package', extra_depends=3D'${PN}-dev')
> - =A0 =A0 =A0 do_split_packages(d, pcre_libdir, '^lib(.*)\.a$', 'lib%s-de=
v', 'libpcre %s development package', extra_depends=3D'${PN}-dev')
> - =A0 =A0 =A0 do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.*', 'lib%s=
', 'libpcre %s library', extra_depends=3D'', allow_links=3DTrue)
> -}
> -
> -FILES_${PN} =3D "${libdir}/libpcre.so.*"
> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> =A0FILES_${PN}-dev +=3D "${bindir}/*"
>
> +LEAD_SONAME =3D "libpcre.so.*"
> +
> =A0SRC_URI[md5sum] =3D "2af38e083fb90ef60fa9eda7cc290e86"
> =A0SRC_URI[sha256sum] =3D "362e4b4473f2f7a3bfa28ea73e80ec00a2fe525a1aceb5=
f66e1c528a900bd735"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


