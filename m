Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tnqq8-0005Cy-6S
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 14:16:35 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3450373eaa.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 05:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=25eRp/D7mJLQ/HmnDdNDuMHFhv2XM2apcBp+fU/AWx0=;
	b=nM4eQhZ8uRySIYZc6WxR2VhpNGJeSDxugyf5AlNiox+yJ5BAtkFIwWlLJOjO09ziRF
	+jPDzQOfGuwCl53sDD7cJxXjC1XZS6JcVD7xwaSi8sgVf/ILOKnbpIBYLzZcDbT1YUt6
	+dPXzu8F/oamGGORgGWtc2+OiBINUFqhBUgSm5uUQzMuBEwuq4Mrv5LoNzfPXt88oJvU
	ROprVNlR42oBN5NT9cdIfRkWIZp0RWXhyWbAl92gEG4Moduxy1Tb39sosoEf7CHR4ozv
	Z7GXTEBzz2f2y8O52cP4s/H7AonzIfAzsf+yQZCd19MrmIjtHPFZK2zJMjGFIGmWpSCw
	/L+A==
X-Received: by 10.14.213.134 with SMTP id a6mr69803084eep.45.1356526875362;
	Wed, 26 Dec 2012 05:01:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm53097673eek.0.2012.12.26.05.01.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 05:01:14 -0800 (PST)
Date: Wed, 26 Dec 2012 14:01:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121226130115.GB8988@jama.palm1.palmone.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xfce/meta-gnome 00/12] meta-xfce updates
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
X-List-Received-Date: Wed, 26 Dec 2012 13:16:36 -0000
X-Groupsio-MsgNum: 42416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LMmSgwdUwKH/sMG1"
Content-Disposition: inline

--LMmSgwdUwKH/sMG1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 02:02:29PM +0100, Andreas M=FCller wrote:
> The following changes since commit a623fd942f6561a425278cf9f114d212d06e59=
82:
>=20
>   samba: disable avahi and build without acl (2012-12-21 16:45:28 +0100)

No new issues in world build with this patchset applied.

I've added PR bump to samba and rebase gvfs change to apply in master,
I'll push this tomorrow if nobody objects.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches
>=20
> Andreas M=FCller (12):
>       icon-slicer: initial add 0.3
>       xcursorgen: initial add 1.0.5
>       openzone: Initial add 1.2.3
>       xfce4-settings: add garcon to DEPENDS
>       xfce4-settings: add a 'Touchscreen pointer' option in mouse settings
>       xfce4-settings: Remember the settings manager window size
>       xfce4-settings: update to 4.11.0
>       xfce4-session: remove gnome-keyring dependency
>       xfce4-session: Add shutdown/reboot functionality for systemd
>       lxdm: disable keyboard selection
>       samba: add new package libwbclient to avoid libsmbclient dragging i=
n samba
>       gvfs: reenable gvfs-smb
>=20
>  .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    3 +-
>  meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    5 +-
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb        |    2 +-
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |    3 +-
>  .../files/0001-Makefile.am-no-examples.patch       |   27 +
>  .../icon-slicer/icon-slicer_0.3.bb                 |   13 +
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    3 +-
>  .../xcursorgen/xcursorgen_1.0.5.bb                 |   12 +
>  ...n-reboot-functionality-for-systemd-bug-87.patch |  482 ++++++++
>  .../xfce4-session/xfce4-session_4.10.0.bbappend    |    8 +
>  .../recipes-art/cursor-themes/openzone_1.2.3.bb    |   29 +
>  .../files/0002-Remove-gnome-keyring-remains.patch  |   82 ++
>  .../xfce4-session/xfce4-session_4.10.0.bb          |    6 +-
>  ...the-settings-manager-window-size-bug-9384.patch |  155 +++
>  .../0001-add-cursor-theme-xfce-invisible.patch     |  248 ++++
>  ...ngs-dialog-add-touchscreen-pointer-option.patch | 1233 ++++++++++++++=
++++++
>  ...sHelper-gets-a-pointer-to-XfceXSettingsHe.patch |  137 +++
>  ...gsHelper-gets-a-property-touchscreen-poin.patch |  249 ++++
>  ...tect-a-change-of-pointer-device-used-and-.patch |  582 +++++++++
>  .../xfce4-settings/touchscreen/invisible           |  Bin 0 -> 4160 bytes
>  .../xfce4-settings/xfce4-settings/touchscreen/wait |  Bin 0 -> 126096 by=
tes
>  .../xfce4-settings/xfce4-settings_4.10.0.bb        |   16 -
>  .../xfce4-settings/xfce4-settings_4.11.0.bb        |   31 +
>  23 files changed, 3300 insertions(+), 26 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/0001-Makef=
ile.am-no-examples.patch
>  create mode 100644 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.=
bb
>  create mode 100644 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.=
bb
>  create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/fil=
es/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
>  create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfc=
e4-session_4.10.0.bbappend
>  create mode 100644 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0002-Remov=
e-gnome-keyring-remains.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
0003-Remember-the-settings-manager-window-size-bug-9384.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/0001-add-cursor-theme-xfce-invisible.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/invisible
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/=
touchscreen/wait
>  delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_=
4.10.0.bb
>  create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_=
4.11.0.bb
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LMmSgwdUwKH/sMG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDa9RsACgkQN1Ujt2V2gBy07ACggGxVYqH5+FXaVcuhNSr7d7ue
7ZQAn1brxtpMVBSZdE91IJ7r/kZGpbTK
=8xm5
-----END PGP SIGNATURE-----

--LMmSgwdUwKH/sMG1--
