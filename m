Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUv8R-0001SU-UI
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 06:51:44 +0100
Received: by gxk21 with SMTP id 21so2226328gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 21:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wp0AK+cOBHbdzVFkA3u+gVLCconUk9+62kwi3bPWpeY=;
	b=n1aX3FUMtPIoCP99of2mOUKZarYD2UkIu3Hg3lSEH5lfcuOfWZ52wJOLKKdL/qNZSy
	vMobzA9xv8g3UDAHffo7gUMXyAUqWGR9VaLXJsw6mrsDk52OcNO0ttTupSW15XiPugWB
	Hq1yuQjZKVRi4zhKjvaV/7hCZ0l22qMYxdD4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OJQNuS1TEKmXpUdLAJDpXzj0n1tbF8hOXUi+z7FPYE63Ht3OkiWI1R1Xh/EcBQb2Jd
	nHdSiX/LKk18tjHUgGllRMqcVEoMcvOWAO/kAjswvZLQdD8X5sdn4WKAM7FAAOirXhjZ
	LMua52z8cpjTYrXhMagiYSY1Gn12cPI9kgycs=
Received: by 10.90.98.11 with SMTP id v11mr6542143agb.58.1292910697402; Mon,
	20 Dec 2010 21:51:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 20 Dec 2010 21:51:17 -0800 (PST)
In-Reply-To: <4D103319.4080002@gmail.com>
References: <4D103319.4080002@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Dec 2010 21:51:17 -0800
Message-ID: <AANLkTin=QemQV=Lbc5QC_9i22Bi5G88cJTJ8KxUUmD+D@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] acl_2.2.49.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 21 Dec 2010 05:51:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2010 at 8:54 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Does it function correctly at runtime ?

> ---
> =C2=A0recipes/udev/acl-2.2.49/nolargefile.patch | =C2=A0 15 +++++++++++++=
++
> =C2=A0recipes/udev/acl_2.2.49.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +++++++--
> =C2=A02 files changed, 22 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 recipes/udev/acl-2.2.49/nolargefile.patch
>
> diff --git a/recipes/udev/acl-2.2.49/nolargefile.patch b/recipes/udev/acl=
-2.2.49/nolargefile.patch
> new file mode 100644
> index 0000000..272b97e
> --- /dev/null
> +++ b/recipes/udev/acl-2.2.49/nolargefile.patch
> @@ -0,0 +1,15 @@
> +--- acl-2.2.49/chacl/chacl.c.orig =C2=A0 =C2=A0 =C2=A02010-12-21 14:00:4=
2.563984943 +1030
> ++++ acl-2.2.49/chacl/chacl.c =C2=A0 2010-12-21 14:01:15.614983219 +1030
> +@@ -315,6 +315,12 @@
> + =C2=A0 =C2=A0 =C2=A0 return(failed);
> + }
> +
> ++#ifndef __USE_LARGEFILE64
> ++/* XXX: hack! */
> ++#define dirent64 dirent
> ++#define readdir64 readdir
> ++#endif
> ++
> + static int
> + walk_dir(acl_t acl, acl_t dacl, const char *fname)
> + {
> diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
> index 027a8c6..5a37c57 100644
> --- a/recipes/udev/acl_2.2.49.bb
> +++ b/recipes/udev/acl_2.2.49.bb
> @@ -1,11 +1,12 @@
> =C2=A0DESCRIPTION =3D "Commands for Manipulating POSIX Access Control Lis=
ts"
> =C2=A0LICENSE =3D "GPLv2"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0DEPENDS =3D "attr"
>
> -SRC_URI =3D "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src=
.tar.gz"
> +SRC_URI =3D "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src=
.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nolargefile.pat=
ch"
>
> =C2=A0inherit autotools lib_package
>
> @@ -21,6 +22,10 @@ do_configure_append() {
> =C2=A0 =C2=A0 echo "#define _(str) str" >> ${S}/include/config.h
> =C2=A0}
>
> +do_configure_prepend() {
> + =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed =
-i -e "s/-D_FILE_OFFSET_BITS=3D64//" ${S}/include/builddefs.in', d)}
> +}
> +
> =C2=A0do_install() {
> =C2=A0 =C2=A0 export PKG_BIN_DIR=3D${D}${bindir}
> =C2=A0 =C2=A0 export PKG_SBIN_DIR=3D${D}${sbindir}
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


