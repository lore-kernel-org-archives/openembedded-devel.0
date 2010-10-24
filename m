Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9z8U-0006Lv-Cy
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 13:53:16 +0200
Received: by ywa8 with SMTP id 8so1682098ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=I8Jmc7Z8C5bgj/PrURTySlBG1/pQP0TSOStlVu6R/ag=;
	b=u0IHWS1wkEh1HFHv/L0HVn2XYCfzVm4Iq0+OZDBEMLCwXnHf29TPWa928oj5Cbvn6i
	l78xz9yz3YhOETcXCPgIHeS1TSwJ+U3T3zD8Bh9m8g78pr+Bm2i0vrgGIUGptz+4ZACM
	BXne7vo5BKfaA6enifTkm76AQ2vWrSrN4uAHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xHbix1flViQXf9QAeur2T7GH7rD+WpFQ+ymUr//hIXe/zwLYeCkq5CxmASywaA4ON9
	OfYAhXP+YWxZL6wNYNX5mURNx4o+Qv/uXl1gwRlquCGOlXbj7WPty8d8mzBt5V+dnrgz
	Hs0UbjnIb4x7L2PDD5h9WVKzX2CMEjMCIm8fc=
MIME-Version: 1.0
Received: by 10.42.172.198 with SMTP id o6mr4210614icz.72.1287921152943; Sun,
	24 Oct 2010 04:52:32 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 04:52:32 -0700 (PDT)
In-Reply-To: <1287320407-17965-1-git-send-email-obi@opendreambox.org>
References: <1286535392-1111-2-git-send-email-obi@opendreambox.org>
	<1287320407-17965-1-git-send-email-obi@opendreambox.org>
Date: Sun, 24 Oct 2010 13:52:32 +0200
Message-ID: <AANLkTi=MSOpzgm+F5sidHjx0YByNLb2ZNCDsALViWfOQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] libdvdnav: add recipe for version 4.1.3-7 from debian
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
X-List-Received-Date: Sun, 24 Oct 2010 11:53:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/17 Andreas Oberritter <obi@opendreambox.org>:
> * v2: inherit lib_package before binconfig
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0...-dvdnavmini.pc-link-against-libdvdnavmini.patch | =A0 25 ++++++++++=
++++++++++
> =A0recipes/libdvdnav/libdvdnav_4.1.3-7.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 ++++
> =A0recipes/libdvdnav/libdvdnav_git.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 24 +++++++++++++++++++
> =A03 files changed, 54 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/libdvdnav/files/0001-dvdnavmini.pc-link-aga=
inst-libdvdnavmini.patch
> =A0create mode 100644 recipes/libdvdnav/libdvdnav_4.1.3-7.bb
> =A0create mode 100644 recipes/libdvdnav/libdvdnav_git.inc
>
> diff --git a/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libd=
vdnavmini.patch b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-l=
ibdvdnavmini.patch
> new file mode 100644
> index 0000000..84ce442
> --- /dev/null
> +++ b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmi=
ni.patch
> @@ -0,0 +1,25 @@
> +upstream: Daniel Baumann <daniel@debian.org>
> +status: pending
> +
> +From 2329cd28d7508f9809f849fa547362aa7df160ba Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Fri, 8 Oct 2010 00:50:54 +0000
> +Subject: [PATCH] dvdnavmini.pc: link against libdvdnavmini
> +
> +---
> + misc/dvdnavmini.pc.in | =A0 =A02 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/misc/dvdnavmini.pc.in b/misc/dvdnavmini.pc.in
> +index 52945b3..773be2f 100644
> +--- a/misc/dvdnavmini.pc.in
> ++++ b/misc/dvdnavmini.pc.in
> +@@ -8,4 +8,4 @@ Description: DVD Navigation mini library
> + Version: @VERSION@
> +
> + Cflags: -I${includedir} @DVDREAD_CFLAGS@ @THREAD_CFLAGS@
> +-Libs: -L${libdir} -ldvdnav @THREAD_LIBS@
> ++Libs: -L${libdir} -ldvdnavmini @THREAD_LIBS@

Is this not better done with CFLAGS and LDFLAGS ?
(personally I prefer using CFLAGS above a patch, as it is less likely
to break if you move to a newer version).

> +--
> +1.7.1
> +
> diff --git a/recipes/libdvdnav/libdvdnav_4.1.3-7.bb b/recipes/libdvdnav/l=
ibdvdnav_4.1.3-7.bb
> new file mode 100644
> index 0000000..b1d75ad
> --- /dev/null
> +++ b/recipes/libdvdnav/libdvdnav_4.1.3-7.bb
> @@ -0,0 +1,5 @@
> +require libdvdnav_git.inc

I feel that in general  an inc file should not have any version info
in the name. It is supposed to to be for multiple versions,
exception could be if an inc file is to share info between e.g. native
cross target sdk versions (like e.g. for gcc).

Since there is only one recipe using it, I'd suggest inlining the inc file.
Otherwise if you feel keeping the inc is useful, rename the file to
libdvdnav.inc


> +
> +SRC_URI +=3D "file://0001-dvdnavmini.pc-link-against-libdvdnavmini.patch=
"
> +
> +SRCREV =3D "850e513d4fea29b40879378b13003cd677e5214b"
> diff --git a/recipes/libdvdnav/libdvdnav_git.inc b/recipes/libdvdnav/libd=
vdnav_git.inc
> new file mode 100644
> index 0000000..242f765
> --- /dev/null
> +++ b/recipes/libdvdnav/libdvdnav_git.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "DVD navigation multimeda library"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "GPL"

v2+ ?

> +DEPENDS =3D "libdvdread"
> +
> +SRC_URI =3D "git://git.debian-maintainers.org/git/daniel/${PN}.git;proto=
col=3Dgit;branch=3Ddebian"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools lib_package binconfig pkgconfig
> +
> +do_unpackpost() {
> + =A0 =A0 =A0 =A0QUILT_PATCHES=3Ddebian/patches quilt push -a
> +}
> +
> +FILES_${PN} =3D "${libdir}/${PN}${SOLIB}"
> +
> +addtask unpackpost after do_unpack before do_patch
> +
> +python populate_packages_prepend () {
> + =A0 =A0 =A0 =A0description =3D bb.data.expand('${DESCRIPTION}', d)
> + =A0 =A0 =A0 =A0libdir =3D bb.data.expand('${libdir}', d)
> + =A0 =A0 =A0 =A0do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s'=
, description + ' (%s)', extra_depends=3D'', allow_links=3DTrue)
> +}
> --
> 1.7.1
>

Best regards, Frans


