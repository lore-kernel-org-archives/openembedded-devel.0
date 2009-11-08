Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N79KS-0001fN-2e
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 16:05:23 +0100
Received: by bwz9 with SMTP id 9so2496697bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 07:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=avB5EC/iPh61/QLrbnPJ2WW6LcRpGluBDA6iwGMwnBc=;
	b=r2ZmLC2Y9hoRegcQFx8j0DjOL4PH+sHH//UHY07r+66fCudjXyoP+Wdy8TD+AiwYx/
	fLyODDyRTxvQVnvT8OpRbBBnMNhAW0EIF+0ZCeJT0qXymBHvL0s0Zgibv71UKFQzr4Vg
	b2p1lbFTF6aUJ8e0QNMW7GTR2E5Q2DmsJdzmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vw6WSMfaAweTHEUmjA4vGy6HfwU447xPCF0YlYa115LfcdhTIJt2PKG3kbTnyN/lig
	Ydyi1s6cWBbFtnKJ376FGdEBXCj5fVU3BGM8YwGHRnyt/vLcPsqpwCFJOIvkmUEoBgv0
	SyRpw18YQYcW8i/4MsbIz1iB9TpYHICukes+A=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.153 with SMTP id q25mr663448hbg.138.1257692643486; 
	Sun, 08 Nov 2009 07:04:03 -0800 (PST)
In-Reply-To: <1257689055-4508-1-git-send-email-ynezz@true.cz>
References: <1257689055-4508-1-git-send-email-ynezz@true.cz>
Date: Sun, 8 Nov 2009 13:04:03 -0200
X-Google-Sender-Auth: 2d6e5683802cd585
Message-ID: <be7a9f3d0911080704k33a223fay7bbeeea2672a594c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux: Linux 2.6.31.5
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
X-List-Received-Date: Sun, 08 Nov 2009 15:05:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sun, Nov 8, 2009 at 12:04 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A04 ++++
> =C2=A0recipes/linux/linux_2.6.31.bb | =C2=A0 =C2=A04 ++--
> =C2=A02 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index afbd67f..9dae471 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -20750,6 +20750,10 @@ sha256=3Ded167dcbdf52c2563a30e7c81a0f2b3d79eb04a=
cc5728e6d484166a4fe8a39e4
> =C2=A0md5=3D02078f4231baee4f0004212f2875df2b
> =C2=A0sha256=3Dbc670682ed9b81d5d3859130c600601bd72053fd738b51b2daf8ddf3f4=
614a66
>
> +[http://kernel.org/pub/linux/kernel/v2.6/patch-2.6.31.5.bz2]
> +md5=3D6cac5e59d5562b591cdda485941204d5
> +sha256=3D41e7d98a205d58a62901daf4e46ecf5fb0b177e5a233a3c0ad3250a3a0abe8a=
a
> +
> =C2=A0[http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
> =C2=A0md5=3Dd6249654087f0bcafaa860ac573316a4
> =C2=A0sha256=3D91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f29710=
90d9ac
> diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.31.b=
b
> index 1559710..f0ff516 100644
> --- a/recipes/linux/linux_2.6.31.bb
> +++ b/recipes/linux/linux_2.6.31.bb
> @@ -1,6 +1,6 @@
> =C2=A0require linux.inc
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0S =3D "${WORKDIR}/linux-${PV}"
>
> @@ -13,7 +13,7 @@ DEFAULT_PREFERENCE_qemumips =3D "1"
> =C2=A0DEFAULT_PREFERENCE_qemux86 =3D "1"
>
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.=
tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${KERNELORG_MIRROR}/pub/linux/kernel=
/v2.6/patch-${PV}.3.bz2;patch=3D1 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${KERNELORG_MIRROR}/pub/linux/kernel=
/v2.6/patch-${PV}.5.bz2;patch=3D1 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> =C2=A0SRC_URI_append_db1200 =3D"\
> --
> 1.5.6.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


