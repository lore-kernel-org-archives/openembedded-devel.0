Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzX28-0001NO-Aq
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 17:23:44 +0100
Received: by bwz10 with SMTP id 10so668087bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=N3+nYO/s2jCB+T7CXpuCthGaeItiQ8ITZBnEHkz4TMk=;
	b=O+6j95UUI+ANwf01OwJBSmPdGi0irlL7LXvzbSqiA4rkEysntuI6z2Jx9OoaF8HLvR
	DTnjL0mx4O6/+txgLbVOloIM3ZmksKkZ6ag7gyz/o6ixjRNKm/ioPuT6IHqij2NIKkKM
	p2EPpIyJftL7sWFqUZJmu4fbcIHk0EKDN0bp0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=GUrkL3+AGAmta03ojgPARm4OSF02HOcklWqeucm1vGRXAyGGVmkehOsSIJvxH15M+/
	jdCmB6W9IpyYbKg+bc1m6Hbgf2NBLdL/kI8lgXy7av8vkKiq4U/bxt/TXbhdtPy276nr
	JBjYDSB1TkxMKkT3Dbal89470ChdjG69Y8WfY=
Received: by 10.223.143.86 with SMTP id t22mr5548436fau.68.1300206089388; Tue,
	15 Mar 2011 09:21:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Tue, 15 Mar 2011 09:20:29 -0700 (PDT)
In-Reply-To: <1300184267.3759.123.camel@mattotaupa>
References: <1300184267.3759.123.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2011 09:20:29 -0700
Message-ID: <AANLkTinEtbUXarNyKutN7y4FvfmpAT3u8=sUrBVT-9-c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] mango-lassi: `touch config.rpath` to fix `configure.ac:127: required file `./config.rpath' not found`
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
X-List-Received-Date: Tue, 15 Mar 2011 16:23:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2011 at 3:17 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Tue, 15 Mar 2011 10:58:26 +0100
>
> Task configure fails with the following error message.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Build Configuration:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.1=
2.0"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0METADATA_BRANCH =C2=A0 =3D "<unknown>"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0METADATA_REVISION =3D "b1fbaf6"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "lin=
ux-gnueabi"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 "beagleboard"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "angstrom"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_VERSION =C2=A0 =C2=A0=3D "v20110315"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "har=
d"
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autoreconf: running: /oe/build-angstrom-next/a=
ngstrom-dev/sysroots/i686-linux/usr/bin/autoheader --include=3D/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/a=
clocal-1.11 --include=3D/oe/build-angstrom-next/angstrom-dev/sysroots/armv7=
a-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=3Dcross
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autoreconf: running: automake --foreign --add-=
missing --copy --force-missing --warnings=3Dcross
> =C2=A0 =C2=A0 =C2=A0 =C2=A0automake: unknown warning category `cross'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:39: installing `./compile'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:127: installing `./config.guess'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:127: required file `./config.rpat=
h' not found
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:127: installing `./config.sub'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:27: installing `./install-sh'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0configure.ac:27: installing `./missing'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile.am: installing `./depcomp'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autoreconf: automake failed with exit status: =
1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ oefatal 'autoreconf execution failed.'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ echo FATAL: 'autoreconf execution failed.'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0FATAL: autoreconf execution failed.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ exit 1
>
> `touch config.rpath` in `do_configure_perpend() {}` fixes the issues.
>
> Mango Lasso includes `bootstrap.sh` [1] which also does the same. Using `=
bootstrap.sh` [1] for configuring Mango Lassi is not considered because `pu=
lseaudio_git.bb` [2] also uses the proposed fix.
>
> [1] http://git.0pointer.de/?p=3Dmango-lassi.git;a=3Dblob;f=3Dbootstrap.sh=
;h=3D089d445b3cce3374b48fc083f1f87983c4100052;hb=3DHEAD
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/pulse=
audio/pulseaudio_git.bb?id=3Dfcb12f3a4448621ccc75d37dcad4a01820fdf89d#n27
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

This patch is ok.

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/avahi/mango-lassi_git.bb | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/avahi/mango-lassi_git.bb b/recipes/avahi/mango-lassi=
_git.bb
> index 1faee4b..049ac24 100644
> --- a/recipes/avahi/mango-lassi_git.bb
> +++ b/recipes/avahi/mango-lassi_git.bb
> @@ -11,3 +11,6 @@ S =3D "${WORKDIR}/git"
>
> =C2=A0inherit autotools
>
> +do_configure_prepend() {
> + =C2=A0 =C2=A0touch config.rpath
> +}
> --
> 1.7.4.1
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


