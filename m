Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2A7E7F9A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 15:18:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k11so7465513qtm.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2ezkHb1wAARadoqzHbG1x9juChE7kDqVYmArphM7gXM=;
	b=t++mGWBS7Z87PzQMjsF8fk06Z7df0mwee9tXRyTOoCyTDNFmIUNGvUrOIh5gJvkgTA
	FiM2cPsBSLXgQPrbhoyLZ2fvcGEXivj8jElZJWDQYS36KqjWQCQIQ2BXT38m7NDCNJw6
	YEl4B/hBR0+aWjRTas/NkX17+K6nr7pxXhKbCC8ycSS7aCMYqNjiH8kocQxYagmIXwHY
	i6/01QxGwHsofn6jyiBqpJD6A/CXfDnh+sC8r6beTg4HYyiY5vWyHkWpvxTGM2HRnhxx
	PDlQBzoW766jT7W5fp1BKqhmKJ0rwV44AY9jRahS/KKjn4WBZ7DhpjNZU8IQIJPNZqM9
	xSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2ezkHb1wAARadoqzHbG1x9juChE7kDqVYmArphM7gXM=;
	b=sbyBc7Cg/tmSxaKixzODTNKf/GPoswrOU/PosS8xIljuPmuINIpZvgVtk1l7mht+Pr
	NXF3ZtVnKbbr0ZNO9997u5x8mxkdNidF6qzXsg0O1mZsicdCNf/k4VXhmERIKzSrohy8
	bHLcbm5QYgMsHpLX2YcT+bTJAQGjmuj9kic6i3M9FS/72C7xZdCL9sO4C6bUS9sAyTuQ
	a89VohuRDBMIqnQ3bVGeCGSYi12fGCuFF2ZtWz9/rxcQMWPz/KmtX1AdQpeq+IrVo637
	g7fW07HJlCgjdN6tkO2/2vmrEazxYF/wSI1O/pLYfEzdx2DvswrkgnxTpturb9RxayTA
	3QYA==
X-Gm-Message-State: APjAAAW91l6aniInx2+O6nlMgNEs2ma49grROG1cPtQFkiVE0xCuIQdV
	Dz3f+ag+ZGHafDhevN/k9toXX024JAfbazy4u94=
X-Google-Smtp-Source: APXvYqw5t0fowtzSZ2SpRIp0c61qW/ZMsRdDBGV0Aiuj5jfgT+6lJFTCwX6soj3H+TD1CB6qmjH/ti0xNgTOGy3hwzc=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr12762811qtj.80.1575645532494; 
	Fri, 06 Dec 2019 07:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-10-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-10-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Dec 2019 07:18:26 -0800
Message-ID: <CAMKF1sphY+s=Th_e33dLYFXJT_utkd7vBj3QddQKubWYEYPzww@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/21] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Fri, 06 Dec 2019 15:18:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is on musl perhaps wtmp is assumed

http://errors.yoctoproject.org/Errors/Details/290480/

On Thu, Dec 5, 2019 at 4:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> It is a dependency for upcoming gnome-control-center
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice_0.6.55.bb
>
> diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0=
.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.5=
5.bb
> new file mode 100644
> index 000000000..bf603b3bc
> --- /dev/null
> +++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.b=
b
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "D-Bus interfaces for querying and manipulating user acc=
ount information"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/AccountsService/=
"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +DEPENDS =3D " \
> +    dbus \
> +    polkit \
> +"
> +
> +inherit meson gobject-introspection gtk-doc features_check systemd
> +
> +REQUIRED_DISTRO_FEATURES =3D "polkit"
> +
> +SRC_URI =3D "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz"
> +SRC_URI[md5sum] =3D "6e4c6fbd490260cfe17de2e76f5d803a"
> +SRC_URI[sha256sum] =3D "ff2b2419a7e06bd9cb335ffe391c7409b49a0f0130b890bd=
54692a3986699c9b"
> +
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
> +
> +SYSTEMD_SERVICE_${PN} =3D "accounts-daemon.service"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/polkit-1 \
> +"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

