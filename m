Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id D27A471D31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 13:15:47 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 35so23619516wrw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sgPIIv6VYnhwgOjwfZV8ZMq0g/owh1pZc2ciV7UFha4=;
	b=h3v/gU66K8MdGYU1GHlTSUE4qLiYd2YqPfMNXy6phS0RmDtjyw8TRYfrdmKttx/GO5
	vF8KJl6yO28LHkJQxjHqeI3JEOBHsIV/vZNwT5KDV6rzz0ajowma/cYfbgXUFNQWVqIO
	olFH+56cbUoKIUD0lPlQv0m5ONVEB38IW1xqbJY7DHULqiFWWdtUBV8zGwQ1K9m9Ibjh
	rB6f3Em8tKKDXf9rzPEdVDdGX5V83WDeAsvtzsAapyqyLmz72GHHSmjCpYqlrln01e4o
	eJoA5M6sC2Q/i6GRTrlnggzmKMGqIGQ4Xe4mhqfT7y3m3vq9aAlTuGnfeskr+rvYzNl6
	WJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sgPIIv6VYnhwgOjwfZV8ZMq0g/owh1pZc2ciV7UFha4=;
	b=QdozA+gdHTNXWRt49XzxaN+MlPml2IoVepwlX03hMQ9SGUaIYRqhi3gTwqVKclfZpW
	f2Va6F8LGOWEkoAhoIAHsyeOiU/uPgJ2UEmhKPvuiLSolBAiO+HxTJY75Z8I60ch4iM2
	50IfzFBpPfps2K+cCKN0zqW9paiAXPcTNFoZbc+SMQICg4c9BhTeVtqgGWArKePzvJi4
	MwyVHGjvvOrzcZ1n8ssWtAzE10Tv+nTYxe0MctPbAv6cGUh9wh9ZsjLGMZktmGuqSa2+
	Q3iKCxQJtutbdKDFkSSD9+2f1ErOtzQwGxST0chm9MXWSjIWDl43bInPN3cbiwjbUroY
	C+3A==
X-Gm-Message-State: AMke39mwxux9WALXsIpCOhoa6Rx6FlYUWvgHuvQqPEb27xuNbKLwmeIZpzvERN/itSEnrw==
X-Received: by 10.223.133.131 with SMTP id 3mr15861711wrt.161.1487596547553;
	Mon, 20 Feb 2017 05:15:47 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e16sm24776795wra.36.2017.02.20.05.15.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Feb 2017 05:15:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Feb 2017 14:15:47 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170220131547.GD3266@jama>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
	<20170220121752.GB3266@jama>
	<CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 13:15:55 -0000
X-Groupsio-MsgNum: 65342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline

--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 01:51:49PM +0100, Andreas M=FCller wrote:
> > In last build I've noticed only this new issue related to samba:
> >
> > ctdb-2.5.6: ctdb rdepends on samba, but it isn't a build dependency, mi=
ssing samba in DEPENDS or PACKAGECONFIG? [build-deps]
> >
> > Maybe this dependency was created from samba being libldb provider in
> > this build.
> >
> > gvfs and whole meta-gnome layers is still included in my world, maybe it
> > didn't fail because some gvfs dependency was already failing or one of
> > samba related changes in master-next is fixing this one.
> >
> Some background: During last weekend I prepared a series based on
> master-next unblacklisting.

Weren't all of these merged before the blacklist in master on Sunday?

044e51895 smbnetfs gnome-disk-utility contacts kexecboot initramfs-kexecboo=
t-klibc-image system-config-keyboard system-setup-keyboard geany geany-plug=
ins efivar efibootmgr gimp system-config-keyboard tumbler: Blacklistptograp=
hy-vectors python3-ndg-httpsclient python-cryptography-vectors python-pbr b=
undler netdata menulibre openzone xfce4-verve-plugin iperf terminus-font xf=
86-video-nouveau ipmiutil klibc-utils pmbw multipath-tools gparted, gnome-s=
ystem-monitor, php, vala-dbus-binding-tool, gtkmathview, lmsensors, postgre=
sql: Blacklist
92a1d82b0 gnome-disk-utility: add dbus-glib-native to DEPENDS
cfad4bab5 nostromo: add base-passwd to DEPENDS
38813ff30 sthttpd: add base-passwd to DEPENDS
7b62fe8ea xfce4-notifyd: add dbus-glib-native to DEPENDS
f501f7a26 geany: fix build
ffd750f0d abiword: fix build
6bb7f371d gedit: fix build
d34a32cf3 gegl: fix build
786d11d77 libgnomeui: fix build
6f9b762d0 evolution-data-server: fix build
ca8ddbe66 poppler: add qttools-native to qt5 dependency to fix build
928849af3 libglade: fix build and cleanup
f35f4fbb7 esound: fix build
765ac5125 audiofile: add alsa-lib to DEPENDS
93a44dfa4 exfat-utils: update SRC_URI
f87a2b06a glibmm: add dependency on glib-2.0-native

If I have missed some, please resend them. Currently master-next has only
couple (20) changes for meta-networking and new changes (10 for apache2,
lvm2, gitpkgv) from last 2 days which are now being built on jenkins.

$ git log --oneline origin/master..origin/master-next=20
51f1b50ba gitpkgv.bbclass: fix versioning with multiple repos
41c5a0f4b netcat-openbsd: fix implicit dependency on pkg-config
29880b781 lvm2: Move libdevmapper to a separate package
e1d9fe8c2 lvm2: Move bash scripts to a separate package
b524e0d7f lvm2: Add a PACKAGECONFIG for lvmetad
02342e3e8 lvm2: Add a PACKAGECONFIG for dmeventd
edbcf88b2 lvm2: Add a PACKAGECONFIG for udev support
0d8ed3a91 lvm2: Standardize how PACKAGECONFIG is defined
daf140bd7 lvm2: Make sure odirect is always enabled
4b8449cdc lvm2: Depend on autoconf-archive-native instead of autoconf-archi=
ve
5c752a3cf apache2: Correct the SRC_URI
a40798024 libldb: update package split rules
dcdb7c78f inetutils: update files for -dbg packages
27c27bd91 openconnect: add gettext-native to DEPENDS
cd8780d24 openflow: inherit pkgconfig
5a9f66f13 Samba: use built-in libtevent
f0441dae1 tcpdump: update to 4.9.0 for security fixes
865b175ee wireshark: fix build issue
068a82479 lldpd: Update to version 0.9.6
38b751ec7 inetutils: register hostname.1 man page as an alternate
17beda82a wireshark: update package to 2.2.4
e1968a360 iscsitarget: update patch to contain changes required to build wi=
th only linux v4.8 and above
085e8a140 iscsitarget: use upstream to build with linux kernel >=3D 4.3
7a1bd1a1d iscsitarget: fix inconsistent crash while login to iscsi target f=
rom initiator
ae911f1f5 dibbler: fix SRC_URI from ${P} to ${BP}
2b451aaac relayd: derive PV from SRCPV
b07f47fbd iscsitarget: Fix call trace of ahash API calling
2998d7c54 tcpdump: upgrade to 4.8.1
4fb056126 lftp: update to 4.7.5 and change SRC_URI source
8186ef64a opensaf: 5.0.0 -> 5.1.0

> First target is to build a xfce-image
> again [1]. Last step yesterday evening should be rebasing against
> latest master-next and run a test build. That failed for gvfs - so I
> stopped sending stuff. Now I know why gvfs fails...

This branch has many good changes, please send them to ML soonish even
with gvfs failing (or preferably blacklisted until this is resolved) and
I'll happily test and merge as much as possible.

> How do we proceed with this patch?

Only now I've noticed that you're replying on change which is still only in
master-next and not master, so if it's causing issue for gvfs (and ctdb, th=
en
I'll drop
5a9f66f13 Samba: use built-in libtevent
=66rom master-next and Joe can re-visit it later.

> [1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-02
>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKrsAQAKCRA3VSO3ZXaA
HHLoAKCgiEBoOEEy2K4BWJd5b/CzrpK2gQCcCjMCIih4NePkxw2IEIIVE38R8WM=
=4qLX
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
