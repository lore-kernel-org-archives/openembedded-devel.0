Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1C96F573
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:01:59 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3512730eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rLTdVXRTIMHtZlh/31SVRAxwLJJzmjsV0VMXzrjVr5A=;
	b=aA8nLROujTUbbPE5GbDRkfB08gZujH1N46HGsgSkNU3pNHVdn9rN2Mgm1nFjKjgGvJ
	DdvEqiLYCZsirp8TGAH3nCmWPkaqJXUpDqbehyoC22JO91iLsb0dDMKT3g1D/zFTP0dC
	ReyKF07lRU4VHFEaVOr9XxjwZPEzzMG6szVHHs64h8t7Ied/kvO5YPAomqP/6ryqz1n/
	ZIcyi0y2bqgWcMP+Gfd5dANXX1HGh6ANuPc6AeiP67HhIxQSI5I3u/U+VZUV/8mq1TS6
	FUc262AMeBjevXUzUTlKn4dncgsAL5F9cFsJ+5yUISlwiTcc8O+hWaY8Jdba06fDlA8q
	giGg==
X-Received: by 10.14.211.66 with SMTP id v42mr20267832eeo.31.1395014520632;
	Sun, 16 Mar 2014 17:02:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm33727964eep.12.2014.03.16.17.01.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 17:01:59 -0700 (PDT)
Date: Mon, 17 Mar 2014 01:02:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140317000217.GD3725@jama>
References: <1395010139-15359-1-git-send-email-stephen.arnold42@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1395010139-15359-1-git-send-email-stephen.arnold42@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH] updated mpd to current upstream stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 00:02:04 -0000
X-Groupsio-MsgNum: 48711
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline

--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2014 at 03:48:58PM -0700, stephen.arnold42 wrote:
> ---
>  .../recipes-multimedia/musicpd/mpd_0.18.8.bb       | 59 ++++++++++++++++=
++++++

Can you please remove 0.18.4 in the same commit and resend with -M?

Thanks

>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8=
=2Ebb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> new file mode 100644
> index 0000000..b6882af
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "Music Player Daemon"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +HOMEPAGE =3D"http://www.musicpd.org"
> +
> +DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 =
ffmpeg curl sqlite bzip2 pulseaudio"
> +
> +SRC_URI =3D " \
> +    http://www.musicpd.org/download/${PN}/stable/${P}.tar.xz \
> +    file://mpd.conf.in \
> +"
> +
> +SRC_URI[md5sum] =3D "7bbe1caf5abe404dc985ca4f44984b1f"
> +SRC_URI[sha256sum] =3D "5366378e548fb77996cc33b0e15165ddd84f1e496bdd0461=
6bd593aecdc26450"
> +
> +inherit autotools useradd systemd
> +
> +EXTRA_OECONF =3D "enable_bzip2=3Dyes"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemdsys=
temunitdir', d)}"
> +
> +PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> +PACKAGECONFIG[id3tag] =3D "--enable-id3,--disable-id3,libid3tag"
> +PACKAGECONFIG[lame] =3D "--enable-lame-encoder,--disable-lame-encoder,la=
me"
> +
> +do_install_append() {
> +    install -d ${D}/${localstatedir}/lib/mpd/music
> +    chmod 775 ${D}/${localstatedir}/lib/mpd/music
> +    install -d ${D}/${localstatedir}/lib/mpd/playlists
> +    chown -R mpd ${D}/${localstatedir}/lib/mpd
> +    chown mpd:mpd ${D}/${localstatedir}/lib/mpd/music
> +
> +    install -d ${D}/${sysconfdir}
> +    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
> +    sed -i \
> +        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
> +        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
> +        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
> +        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
> +        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
> +        ${D}/${sysconfdir}/mpd.conf
> +
> +    if [ -e ${D}/${systemd_unitdir}/system/mpd.service ] ; then
> +        sed -i \
> +            's|^ExecStart=3D.*|ExecStart=3D${bindir}/mpd --no-daemon|' \
> +            ${D}/${systemd_unitdir}/system/mpd.service
> +    fi
> +}
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "mpd.service"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D " \
> +    --system --no-create-home \
> +    --home ${localstatedir}/lib/mpd \
> +    --groups audio \
> +    --user-group mpd"
> --=20
> 1.8.5.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMmO4kACgkQN1Ujt2V2gBy3HwCfX/doSmmsS/tBcSivXllX0hxp
JfQAoJIe9NgLLOvWraSr41IfvQFnu6RZ
=1y9J
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
