Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 902C16158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:04:23 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so4071946ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5zPKZKGM1iFxH69WFsuKx5LCA0ytqldHKqhvQSrQu3Y=;
	b=l7R/FPBhW3BrGaeVz3lDHtndWvW2YGtlgdOjvijNtdptzPoIEoMoAPBjmH5E9DtluL
	mFHRgRS6sDN64x0/+opblLF7+EyeI8fIp1XxAAc+itR7F12kpZ7fF4HE0ZGT8MnPihtS
	YgOtaGX2RVEHkYgPm128l2BdWyB6F0on9vivu4TXLS4DEpL2InOXS/qkbJdLxAsDTLNQ
	zcHzKagyDDlV29IglEcFWMZqhvmlCAdF30Wx+rn/NvwT76FR9uRLFjFjfXpqj7HEwCoG
	G1p6lDL/Zto6jTX6tcMZft5ZPuAm/3r2jkcRZKtsb7xS7g2RyJkevJk/IgWjPtnVgooI
	hshg==
X-Received: by 10.14.224.198 with SMTP id x46mr1771704eep.53.1379592264715;
	Thu, 19 Sep 2013 05:04:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm2115849eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:04:23 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:06:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919120601.GM7313@jama>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-xfce 0/9] minor libcanberra cleanup / new xfce stuff
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
X-List-Received-Date: Thu, 19 Sep 2013 12:04:23 -0000
X-Groupsio-MsgNum: 46245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Content-Disposition: inline

--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 11:04:10AM +0200, Andreas M=FCller wrote:
> [1-3] libcanberra: While working on event sounds libcanberra needed some =
love.
>       Sounds still doesn't work properly in gtk2 environment. There will =
be
>       follow ups.
> [4-9] Updates + new datetime setter for XFCE

All merged thanks.

>=20
> Andreas M=FCller (9):
>   libcanberra: add PACKAGES_DYNAMIC so we use the splitted packages
>   libcanberra: remove r0 - it is of no use
>   libcanberra: handle alsa and pulsaudio by PACKAGECONFIG - defaults
>     based upon DISTRO_FEATURES
>   libxfce4ui: update to git head
>   xfce4-settings: move to schnitzeltony's git repo to get new datetime
>     setter
>   xfwm4: move to git repo
>   xfce4-weather-plugin: update to 0.8.3
>   xfce4-equake-plugin: initial add 1.3.3
>   packagegroup-xfce-extended: add xfce4-equake-plugin
>=20
>  .../libcanberra/libcanberra_0.29.bb                |   12 +-
>  .../equake/xfce4-equake-plugin_1.3.3.bb            |   13 +
>  .../weather/files/port-to-libxfce4ui.patch         |  104 --
>  .../weather/xfce4-weather-plugin_0.7.4.bb          |   23 -
>  .../weather/xfce4-weather-plugin_0.8.3.bb          |   11 +
>  .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |   17 +-
>  .../packagegroups/packagegroup-xfce-extended.bb    |    1 +
>  ...the-settings-manager-window-size-bug-9384.patch |  155 ---
>  .../0001-add-cursor-theme-xfce-invisible.patch     |    8 +-
>  ...ngs-dialog-add-touchscreen-pointer-option.patch | 1083 +-------------=
------
>  ...tect-a-change-of-pointer-device-used-and-.patch |   10 +-
>  ...e4-settings_4.11.0.bb =3D> xfce4-settings_git.bb} |   23 +-
>  .../xfwm4/{xfwm4_4.10.1.bb =3D> xfwm4_git.bb}        |   17 +-
>  13 files changed, 90 insertions(+), 1387 deletions(-)
>  create mode 100644 meta-xfce/recipes-panel-plugins/equake/xfce4-equake-p=
lugin_1.3.3.bb
>  delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/port-to=
-libxfce4ui.patch
>  delete mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather=
-plugin_0.7.4.bb
>  create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather=
-plugin_0.8.3.bb
>  delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0003-Remember-the-settings-manager-window-size-bug-9384.patch
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.11.0.bb =
=3D> xfce4-settings_git.bb} (64%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.10.1.bb =3D> xfwm4_git.bb} =
(70%)
>=20
> --=20
> 1.7.6.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66KkACgkQN1Ujt2V2gBxkQwCfWh1WV+chozMYfFue2f33Nwz7
uAgAmwW15/l1kKR7NvIE9SnFhN/G6vQ9
=76P6
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
