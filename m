Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5174C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:09:05 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5059.1718096937016269542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=Baor/Q3J;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i0+peQO+Man3lxgo8drVbD75h8qld8DZP+NMhHiqcZ0=; b=Baor/Q3J5Z08fIrBqZTLait0GX
	82CsTRZQxWtalBmtlWJVTTlasHmXx/S98hrV20ETyGStFcXMncpWzCRGAjPsVWhPhXO1FMLNQ+63r
	d3YIXaCQOshuD7MldcwreUkMrWx/c7A2toWm1ACU9CWi3GdVUTTRkPs5QilNc8sA5BnrLcDJyClmv
	FqLTWpTns8eOGjZByq6lvrIxoCr1tAU+SctiKAECNFye/15w0Ur3w13qQzT5L5ywoe1BDHf7Wbwrn
	wacqluiNEvo4ZRF3yqPqcdjhuvFfMZkiXy7uP9BZZjkMVEWLhQh9STQckR/jFmTo+PD3O1K7vgXJ2
	dUWH7zaA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sGxUv-0004id-QJ; Tue, 11 Jun 2024 11:08:54 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sGxUs-000OH5-2A;
	Tue, 11 Jun 2024 11:08:54 +0200
Message-ID: <a7f86b7f45c4becd011b034d028e3bf53cf0891a.camel@geanix.com>
Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] tipcutils: add systemd
 service file
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: vanusuri@mvista.com, openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2024 11:08:53 +0200
In-Reply-To: <20240611070857.825852-1-vanusuri@mvista.com>
References: <20240611070857.825852-1-vanusuri@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27302/Mon Jun 10 10:25:43 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 09:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110825

Hi,

On Tue, 2024-06-11 at 12:38 +0530, Vijay Anusuri via
lists.openembedded.org wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Add systemd service file for tipcutils
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
> =C2=A0.../tipcutils/tipcutils/tipcutils.service=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12
> ++++++++++++
> =C2=A0meta-oe/recipes-extended/tipcutils/tipcutils_git.bb=C2=A0 |=C2=A0 9=
 ++++++++-
> =C2=A02 files changed, 20 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 meta-oe/recipes-
> extended/tipcutils/tipcutils/tipcutils.service
>=20
> diff --git a/meta-oe/recipes-
> extended/tipcutils/tipcutils/tipcutils.service b/meta-oe/recipes-
> extended/tipcutils/tipcutils/tipcutils.service
> new file mode 100644
> index 000000000..42bf6517e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DTransparent Inter-Process Communication protocol
> +After=3Dsyslog.target remote-fs.target
> +
> +[Service]
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +ExecStart=3Dmodprobe tipc
> +ExecStop=3Drmmod tipc

Wouldn't it be better to use modules-load.d instead:
https://www.man7.org/linux/man-pages/man5/modules-load.d.5.html

?

// Martin

> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> index 596aa260e..335263009 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL-2.0-only"
> =C2=A0LIC_FILES_CHKSUM =3D
> "file://tipclog/tipc.h;endline=3D35;md5=3D985b6ea8735818511d276c1b466cce9
> 8"
> =C2=A0
> =C2=A0SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster=
 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://tipc=
utils.service=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> file://0001-include-sys-select.h-for-FD_-definitions.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> file://0002-replace-non-standard-uint-with-unsigned-int.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
> =C2=A0\
> @@ -11,7 +12,7 @@ SRC_URI =3D
> "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
> =C2=A0SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
> =C2=A0PV =3D "2.2.0+git"
> =C2=A0
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig systemd
> =C2=A0
> =C2=A0DEPENDS +=3D "libdaemon"
> =C2=A0
> @@ -41,8 +42,14 @@ do_install:append() {
> =C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}
> =C2=A0=C2=A0=C2=A0=C2=A0 cp -R --no-dereference --preserve=3Dmode,links -=
v
> ${S}/scripts/etc/* ${D}${sysconfdir}/
> =C2=A0=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${sysconfdir}
> +=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd'=
, d)}" ];
> then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_unit=
dir}/system
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/ti=
pcutils.service
> ${D}/${systemd_unitdir}/system
> +=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> =C2=A0
> +SYSTEMD_SERVICE:${PN} =3D "tipcutils.service"
> +
> =C2=A0PACKAGES +=3D "${PN}-demos"
> =C2=A0FILES:${PN}-dbg +=3D "/opt/tipcutils/demos/*/.debug
> /opt/tipcutils/ptts/.debug"
> =C2=A0FILES:${PN}-demos =3D "/opt/tipcutils/*"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110818):
> https://lists.openembedded.org/g/openembedded-devel/message/110818
> Mute This Topic: https://lists.openembedded.org/mt/106609163/3618414
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


