Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWsvf-0000WC-Vu
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 17:59:12 +0100
Received: by wgbds11 with SMTP id ds11so3083016wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JvdIRARo9EnzYGoQMJairUnZ9HPikIGCgC7UrOYYL20=;
	b=wdHAwTiWGuBJVxk+KWak3XCoRWe0soaq+dwSEPoRn7zpuuTRevFXMU/FRLHkmEtcar
	Go2KaGrqIp5iNXrrNl7ZALf8xAypx/0CaBnwfpv0BFKBKOnVWlpcaFZl/be9vxoWg0Aw
	FqbdjI/i0tliKUrPt6RerfabMIYzkFQYN2lhw=
Received: by 10.227.197.212 with SMTP id el20mr10087140wbb.7.1322931146719;
	Sat, 03 Dec 2011 08:52:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dt8sm6104421wib.21.2011.12.03.08.52.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Dec 2011 08:52:25 -0800 (PST)
Date: Sat, 3 Dec 2011 17:52:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111203165213.GB3797@jama.jama.net>
References: <4ED8307F.2060306@googlemail.com> <4ED960AB.5040502@googlemail.com>
	<4ED96455.8060008@googlemail.com>
	<201112031046.44018.GNUtoo@no-log.org>
	<4EDA504E.7070304@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4EDA504E.7070304@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Sat, 03 Dec 2011 16:59:12 -0000
X-Groupsio-MsgNum: 35843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 03, 2011 at 04:37:34PM +0000, Mr Dash Four wrote:
>=20
> > Instead of trying to edit the file manually, try "make xconfig" in the=
=20
> > directory where the kernel is extracted(something like work/htcdream*/l=
inux-
> > leviathan*/git/ ) and do it manually trough the GUI, then save back the=
=20
> > resulting defconfig, increase PR in the recipe and rebuild your console=
-image.
> >  =20
> That as a very good advice, thank you! The versioning "magic" is=20
> something I didn't know about (I always used to delete all related files=
=20
> in the tmp/stamp directory in the futile hope that the process/steps=20
> will be repeated at the next run).
>=20
> OK, since I use rm_work, the git directory is no longer there, but I've=
=20
> had the git tar archive, so unpacked it, copied defconfig, renamed it to=
=20
> .config and ran "make ARCH=3Darm menuconfig" (I prefer ncurses myself),=
=20

then you will like:
bitbake -c menuconfig virtual/kernel=20

and to save defconfig you can use -c savedefconfig (not 100% sure it's
available in linux-leviathan in OE-classic).

> then switched the appropriate option on and saved the new file. I wasn't=
=20
> sure whether I should also switch the FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=
=20
> option as I was not sure of its meaning and whether I actually need=20
> this, so left it as the default (empty/No). When I ran diff to see what=
=20
> has been changed the following has been altered:
>=20
> --- defconfig    2011-11-19 16:35:46.000000000 +0000
> +++ .config    2011-12-03 15:42:13.123656047 +0000
> @@ -1,7 +1,7 @@
>  #
>  # Automatically generated make config: don't edit
>  # Linux kernel version: 2.6.32.9
> -# Fri Aug 27 19:32:05 2010
> +# Sat Dec  3 15:42:13 2011
>  #
>  CONFIG_ARM=3Dy
>  CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> @@ -1199,7 +1199,12 @@
>  #
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_DUMMY_CONSOLE=3Dy
> -# CONFIG_FRAMEBUFFER_CONSOLE is not set
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +# CONFIG_FONTS is not set
> +CONFIG_FONT_8x8=3Dy
> +CONFIG_FONT_8x16=3Dy
>  # CONFIG_LOGO is not set
>  CONFIG_SOUND=3Dy
>  CONFIG_SOUND_OSS_CORE=3Dy
> @@ -1233,11 +1238,9 @@
>  CONFIG_SND_SOC=3Dy
> =20
>  #
> -# MSM SoC Audio support
> +# SoC Audio support Qualcomm
>  #
>  CONFIG_SND_MSM_SOC=3Dy
> -CONFIG_SND_MSM_DAI_SOC=3Dy
> -CONFIG_SND_MSM_SOC_MSM7K=3Dy
>  CONFIG_SND_SOC_I2C_AND_SPI=3Dy
>  # CONFIG_SND_SOC_ALL_CODECS is not set
>  # CONFIG_SOUND_PRIME is not set
>=20
>=20
> Interesting! In addition to a few extra options, the two SND_MSM_*=20
> options shown above are now gone - don't know why.
>=20
> Anyway, I copied this back to the appropriate directory and bumped the=20
> version number, then ran bitbake again. No problems and I've had my new=
=20
> image, kernel modules (recompiled) and a few other things. Installed it=
=20
> and fastbooted my phone. The screen appeared this time - rotated as well=
=20
> - and I've had my login prompt. Brilliant!
>=20
> Duly logged in, but there were a few further problems:
>=20
> 1. The keyboard I now have is completely unusable as the "alt" register=
=20
> (the blue row of keys) is completely unusable/inaccessible with the=20
> exception of the top row (where the numbers are). That means I cannot=20
> type/use vital keys like the pipe symbol ('|'), dash ('-') etc. There is=
=20
> also no "repeat" - i.e. when I press a key and keep pressing it, it=20
> doesn't continue typing the same key. is there any way I could fix this?

You need to add right keymap to keymaps recipe and check that it's in
/etc/keymap-2.6.map and then /etc/init.d/keymap.sh should load it for
you during boot.

> 2. My ssh login is also problematic - when I try to log in from the PC=20
> host (via usb) this time I get the following error on that (PC) end:=20
> "PTY allocation request failed on channel 0". Don't know why that is,=20
> any ideas?

This usually means that /dev/pts wasn't mounted during boot, I don't
remember if htcdream was doing something weird but for palmpre GarthPS
needed this:
http://git.openembedded.org/openembedded/commit/?id=3Dfcb43100609fcb955cfac=
6ad6b92d3b5ddf08c20
and I'm not sure if somebody tested htcdream since then.. so check order
of mountdevsubfs.sh and udev init if htcdream is using udev (not
devtmpfs)

> I cannot properly scroll/see what is happening on the phone system and=20
> neither can I see any of the log files as the keyboard is all screwed=20
> up, so I can't post any of these file in order to further help resolve=20
> the above issues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7aU70ACgkQN1Ujt2V2gBxioACgssj10U2iR7WaKyZ0j73CNXHn
168AnRzSlMLiiDyWD8pRKb1WR0uxWhic
=nLa0
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
