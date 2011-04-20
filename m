Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCgJv-0004zE-PE
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 00:56:27 +0200
Received: by gwb11 with SMTP id 11so373863gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ICGdZNR4KVo64ozrLGS6wmIXwXDIkOuJS+h6wq/5Wew=;
	b=UOXks4x9l+JbUf+7NT5wqPHpgU2iYIECKdRQQl7JDaRaWNiDfd5DgLtTRpxcG+QvD6
	foxZ8Re9eqWvVBcI3ye/GMa42qtCI0A9lvBBhqnIG8FpGg6HkoEmLXUBnbkwbKshP9XD
	RDVmnIvlSsm3VskswdA1LRK275B7y0fmb4A1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=TrfMiaXN9HZ1gFcN/oOTPlt1GNAx0T3+EZDq3cqtUglu4Ywf5xqXpKf+DOPXE7jHEv
	J42Hl4t8bGNZXfE4TrFDGpxA99QWwZPW//3odjjiF7ScJb/TfdqoQHZAl9xkqbBG/lao
	7VWv//K3Arc5gI+Ka0riYcdb/kDAxkxN8VTJc=
MIME-Version: 1.0
Received: by 10.146.114.26 with SMTP id m26mr4671052yac.30.1303340034354; Wed,
	20 Apr 2011 15:53:54 -0700 (PDT)
Received: by 10.146.83.11 with HTTP; Wed, 20 Apr 2011 15:53:54 -0700 (PDT)
In-Reply-To: <E1QCddz-0006Jg-CA@melo.openembedded.org>
References: <E1QCddz-0006Jg-CA@melo.openembedded.org>
Date: Thu, 21 Apr 2011 00:53:54 +0200
Message-ID: <BANLkTike9cMCGdViiV32CfAvYgKOgBajcw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stanislav Brabec : tcl: Adapt tclConfig.sh modification to binconfig. class change.
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
X-List-Received-Date: Wed, 20 Apr 2011 22:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 10:04 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: 7c4aeaf7e2a2b96e700cd5230b0e7b415ab08eab
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D7c4aeaf7e2a2b96e700cd5230b0e7b415ab08eab
>
> Author: Stanislav Brabec <utx@penguin.cz>
> Date: =A0 Wed Apr 20 19:55:49 2011 +0000
>
> tcl: Adapt tclConfig.sh modification to binconfig.class change.
>
> Signed-off-by: Stanislav Brabec <utx@penguin.cz>
>
> ---
>
> =A0recipes/tcltk/tcl_8.5.8.bb | =A0 13 +++++--------
> =A01 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
> index 9bb6859..82bc1bf 100644
> --- a/recipes/tcltk/tcl_8.5.8.bb
> +++ b/recipes/tcltk/tcl_8.5.8.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Tool Command Language"
> =A0HOMEPAGE =3D "http://tcl.sourceforge.net"
> =A0SECTION =3D "devel/tcltk"
> =A0LICENSE =3D "tcl"
> -PR =3D "r8"
> +PR =3D "r9"
>
> =A0SRC_URI =3D "\
> =A0 ${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
> @@ -33,8 +33,7 @@ do_compile_prepend_pn-tcl () {
> =A0 =A0 =A0 =A0 sed -i -e 's:./tclsh :tclsh :g' Makefile
> =A0}
>
> -do_install() {
> - =A0 =A0 =A0 =A0autotools_do_install
> +do_install_append() {
> =A0 =A0 =A0 =A0 # Stage a few extra headers to make tk happy
> =A0 =A0 =A0 =A0 install -d ${D}${includedir}/tcl-${PV}/generic
> =A0 =A0 =A0 =A0 install -m 0644 ../generic/*.h ${D}${includedir}/tcl-${PV=
}/generic
> @@ -43,6 +42,9 @@ do_install() {
> =A0 =A0 =A0 =A0 install -m 0644 *Unix*.h ${D}${includedir}/tcl-${PV}/unix=
/
> =A0 =A0 =A0 =A0 rm -f ${D}${includedir}/regex.h
> =A0 =A0 =A0 =A0 ln -sf tclsh8.5 ${D}${bindir}/tclsh
> + =A0 =A0 =A0 # trick: We set it to incorrect value but binconfig will fi=
x it
> + =A0 =A0 =A0 # correctly for both target and staging package.
> + =A0 =A0 =A0 sed -i 's:${includedir}/tcl-private:${STAGING_INCDIR}/tcl-$=
{PV}:' ${D}${libdir}/tclConfig.sh
> =A0}
>
> =A0PACKAGES =3D+ "${PN}-lib"
> @@ -53,8 +55,3 @@ FILES_${PN}-dev +=3D "${libdir}/tclConfig.sh"
>
> =A0BINCONFIG_GLOB =3D "*Config.sh"
> =A0BBCLASSEXTEND =3D "native"
> -
> -tcl_sysroot() {
> - =A0 =A0 =A0 =A0sed -i 's:${includedir}/tcl-private:${STAGING_INCDIR}/tc=
l-${PV}:' tclConfig.sh
> -}
> -

Hi,

there is still
tcl_8.5.8.bb:SYSROOT_PREPROCESS_FUNCS =3D+ "tcl_sysroot"
and removing tcl_sysroot function results in new warning

NOTE: package tcl-native-8.5.8-r9: task do_populate_sysroot: Started
WARNING: Function tcl_sysroot doesn't exist
NOTE: package tcl-native-8.5.8-r9: task do_populate_sysroot: Succeeded


