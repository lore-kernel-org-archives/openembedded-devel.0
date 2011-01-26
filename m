Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PiCTu-0002IM-Vj
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 22:00:47 +0100
Received: by gyh20 with SMTP id 20so324975gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=FYp1JIDR0ViRL7geFQ4fPrDYg4ED0/yjuTdstQyISjE=;
	b=sQRNCS+GgPA1tYqkaVF1pW/qzZMzMlQte8qRLl9cZ4OO1SqvJ2f/vqJrIZRlvJj0S8
	O8mEwcOsbuHSqwN7Y2wQ1CndgDpHJwqZlSE7Fp83UTikC3JuNK4r5mzMeZH+Xr01XTc3
	knlnNiYbkDW1l6OPYs2yp1y9sFYxim/Bhcduk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ty+kKYSQUQFEnEOuo1LEqPH840dhPLnLPRF1ynlsK98/WcITS8hwVM/EKm0g48F7n5
	m+qaQ6hHxVXL/LHqJUp846c89wu6c0hwJ4Lj96nKxsuyJcl+vhyoNQluILI0bpkjtymO
	HlYaACKhgWq7l4SRVshDXOT+rdiAjjAruRmms=
Received: by 10.91.186.4 with SMTP id n4mr1899054agp.88.1296075598440; Wed, 26
	Jan 2011 12:59:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 26 Jan 2011 12:59:38 -0800 (PST)
In-Reply-To: <1296065612-9637-10-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-10-git-send-email-rep.dot.nop@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jan 2011 12:59:38 -0800
Message-ID: <AANLkTimK6GiBOP0nULT=ZAo6_ukjzV3ut1f=5aQisPEz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 9/9] util-linux: honour largefile distro feature
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
X-List-Received-Date: Wed, 26 Jan 2011 21:00:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2011 at 10:13 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> do_install on micro-image still broken (${bindir}/hexdump lives in
> ${usrbindir}/hexdump from util-linux POV. Not fixing these.)
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =C2=A0recipes/util-linux/files/MCONFIG =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0recipes/util-linux/util-linux.inc | =C2=A0 =C2=A04 +++-
> =C2=A02 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/util-linux/files/MCONFIG b/recipes/util-linux/files/=
MCONFIG
> index 3fea2c0..1e87749 100644
> --- a/recipes/util-linux/files/MCONFIG
> +++ b/recipes/util-linux/files/MCONFIG
> @@ -206,7 +206,6 @@ endif
>
> =C2=A0CFLAGS :=3D $(OPT) -I$(LIB) $(WARNFLAGS) \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(CURSESFLAGS) $(SLANGFLAGS) $(NLSFLAGS) \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -D_FILE_OFFSET_BITS=3D64 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-DSBINDIR=3D\"$(SBIN_DIR)\" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-DUSRSBINDIR=3D\"$(USRSBIN_DIR)\" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-DLOGDIR=3D\"$(LOG_DIR)\" \
> diff --git a/recipes/util-linux/util-linux.inc b/recipes/util-linux/util-=
linux.inc
> index eef4645..e1caf80 100644
> --- a/recipes/util-linux/util-linux.inc
> +++ b/recipes/util-linux/util-linux.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Util-linux is a suite of essential utili=
ties for any Linux system
> =C2=A0SECTION =3D "base"
> =C2=A0LICENSE =3D "GPL"
> =C2=A0DEPENDS =3D "zlib ncurses"
> -INC_PR =3D "r16"
> +INC_PR =3D "r17"
> =C2=A0inherit autotools
>

this has potential of breaking the distros which dont yet define
largefile in DISTRO_FEATURES so please consider the distros and see if
it does not impact
them unknowingly

> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/util-li=
nux-${PV}.tar.bz2 \
> @@ -30,6 +30,8 @@ FILES_util-linux-readprofile =3D "/usr/sbin/readprofile=
"
> =C2=A0RRECOMMENDS_${PN} =3D "util-linux-fdisk util-linux-cfdisk util-linu=
x-sfdisk util-linux-mount util-linux-readprofile "
> =C2=A0RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-lin=
ux-losetup"
>
> +CFLAGS_append =3D "${@base_contains('DISTRO_FEATURES', 'largefile', '-D_=
FILE_OFFSET_BITS=3D64', '', d)}"
> +
> =C2=A0do_compile () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0set -e
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${WORKDIR}/MCONFIG ${S}/MCONFIG
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


