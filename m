Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M28x4-0003Wi-En
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:08:14 +0200
Received: by wf-out-1314.google.com with SMTP id 25so822189wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GL5vrKc+wuYP0C3ALYODZYhsi5wGg3N33vHYuJeOv+o=;
	b=PdIYT11XRV3tbeDikjH5y3rqu2ks7B20NG4fJ8TBr+zp9vPq8NCRcdxkxP1Nw4hl8R
	6WwWSYDnqxPUVIgxDcGMa5hyFvdyE9eSDzbTYkxHKp6Qnv+0Z9Th87a1g8VEA9G/BrB+
	o2OEqDL+nG3x0q5w0N/h0rycoIUeGw6j9YM6k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vP5wphANevv8KdO9rV17TCBPfJh0EGuQtB3jdS4Gs8waQjoUD29oOq5EwkITY3OCN6
	eK3liUSaoRgF4tSI0HVdOQ324P9LH1rfPr7Mh7jXUSQlWXHt9yv0+6u3qnkN2Q1VfJWO
	4mcv7aP34BgVBb86AuHb3NGc1HHg8ug+DrvFo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.7 with SMTP id j7mr1118126wfg.165.1241722924991; Thu, 
	07 May 2009 12:02:04 -0700 (PDT)
In-Reply-To: <1241720835-17998-3-git-send-email-msmith@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<1241720835-17998-3-git-send-email-msmith@cbnco.com>
Date: Thu, 7 May 2009 12:02:04 -0700
X-Google-Sender-Auth: 0c7362226b1022ae
Message-ID: <b6ebd0a50905071202l6d595de3v66d2ac043a84a2af@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] grub: split menu.lst into a separate package, grub-config.
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
X-List-Received-Date: Thu, 07 May 2009 19:08:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm not sure if you realize, but you can let your overlay override
file:// files by manipulating FILESPATH.  You don't need to split up
all the recipes.

FILESPATHBASE =3D.
"/path/to/my/overlay/recipes/${os.path.basename(os.path.dirname(d.getVar('F=
ILE',
1)))}:"

Would ensure that /path/to/my/overlay/recipes + the name of the dir
the recipe resides in is searched before the default location (which
is the dir the recipe is in).  We can't sanely set a default FILESPATH
based on COLLECTIONS because we can't necesasrily globally assume all
collections have the same layout.  But you know your layouts, so you
can set it yourself and have it work just fine.

An alternative, if you're just providing a local change rather than a
overlay specific change would be to do something like:

FILESPATHBASE =3D. "${TOPDIR}/files"

and drop your menu.lst into ${TOPDIR}/files/grub/.

On Thu, May 7, 2009 at 11:27 AM, Michael Smith <msmith@cbnco.com> wrote:
> This makes it easier for overlays to override the configuration.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =C2=A0recipes/grub/files/menu.lst =C2=A0 =C2=A0 | =C2=A0 =C2=A06 ++++++
> =C2=A0recipes/grub/grub-0.97/menu.lst | =C2=A0 =C2=A06 ------
> =C2=A0recipes/grub/grub-config_1.0.bb | =C2=A0 13 +++++++++++++
> =C2=A0recipes/grub/grub_0.97.bb =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12 +++++---=
----
> =C2=A04 files changed, 24 insertions(+), 13 deletions(-)
> =C2=A0create mode 100644 recipes/grub/files/menu.lst
> =C2=A0delete mode 100644 recipes/grub/grub-0.97/menu.lst
> =C2=A0create mode 100644 recipes/grub/grub-config_1.0.bb
>
> diff --git a/recipes/grub/files/menu.lst b/recipes/grub/files/menu.lst
> new file mode 100644
> index 0000000..510e8f8
> --- /dev/null
> +++ b/recipes/grub/files/menu.lst
> @@ -0,0 +1,6 @@
> +# menu.lst
> +default 0
> +timeout 5
> +title =C2=A0 OpenEmbedded Linux (hda1)
> +root =C2=A0 =C2=A0(hd0,0)
> +kernel =C2=A0/boot/bzImage root=3D/dev/hda1 ro
> diff --git a/recipes/grub/grub-0.97/menu.lst b/recipes/grub/grub-0.97/men=
u.lst
> deleted file mode 100644
> index 510e8f8..0000000
> --- a/recipes/grub/grub-0.97/menu.lst
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# menu.lst
> -default 0
> -timeout 5
> -title =C2=A0 OpenEmbedded Linux (hda1)
> -root =C2=A0 =C2=A0(hd0,0)
> -kernel =C2=A0/boot/bzImage root=3D/dev/hda1 ro
> diff --git a/recipes/grub/grub-config_1.0.bb b/recipes/grub/grub-config_1=
.0.bb
> new file mode 100644
> index 0000000..f6e82a7
> --- /dev/null
> +++ b/recipes/grub/grub-config_1.0.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Configuration file for grub"
> +SECTION =3D "bootloaders"
> +PRIORITY =3D "optional"
> +PR =3D "r0"
> +
> +SRC_URI =3D "file://menu.lst"
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 install -D -m 0644 ${WORKDIR}/menu.lst \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/grub/i38=
6${TARGET_VENDOR}/menu.lst
> +}
> +
> +FILES_${PN} +=3D "${libdir}"
> diff --git a/recipes/grub/grub_0.97.bb b/recipes/grub/grub_0.97.bb
> index e1162ef..8822b7e 100644
> --- a/recipes/grub/grub_0.97.bb
> +++ b/recipes/grub/grub_0.97.bb
> @@ -3,11 +3,13 @@ HOMEPAGE =3D "http://www.gnu.org/software/grub"
> =C2=A0SECTION =3D "bootloaders"
> =C2=A0PRIORITY =3D "optional"
> =C2=A0RDEPENDS =3D "diffutils"
> -PR =3D "r4"
> +PR =3D "r5"
> +
> +# menu.lst is shipped in a separate package that overlays can override.
> +RRECOMMENDS =3D "grub-config"
>
> =C2=A0SRC_URI =3D "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://automake-1.10.patch;patch=3D1=
 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://menu.lst"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://automake-1.10.patch;patch=3D1=
"
>
> =C2=A0inherit autotools
>
> @@ -21,10 +23,6 @@ python __anonymous () {
> =C2=A0do_install_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/boot/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ..${libdir}/grub/i386${TARGET_VENDOR}/ =
${D}/boot/grub
> -
> - =C2=A0 =C2=A0 =C2=A0 # TODO: better use grub-set-default script here?
> - =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/menu.lst \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/grub/i38=
6${TARGET_VENDOR}/
> =C2=A0}
>
> =C2=A0FILES_${PN}-doc =3D "${datadir}"
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


