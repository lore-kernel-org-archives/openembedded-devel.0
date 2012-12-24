Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tn7gI-0007NQ-0q
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 14:02:58 +0100
Received: by mail-ea0-f170.google.com with SMTP id d11so2822715eaa.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 04:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rfYTBvo4mQrdDOQGgsFwgPsfJUcWpPHVHWx6bnX0ogQ=;
	b=aMmzpZy4hGC1q1v9wH0NU2aLsys/HFzVOZ1NV3ifDxelRN9qfDOWNZ1b46eDxxgJ2C
	ErezvRhvBuKt+rreRPzlYYXEehLGfEZgWKl82cPfjOguMkWpwa1opWK153VN9k8qYfp0
	V7Y4wV1w7N5BxSgNa0Rmr64cl3HKsRAmY4hbyw8zdc+6dAnKwC46ReLXFXZIUWflRSNG
	XAV+IKxn+sJ+KkMyPvnQ5VQ0u7zZq8TomU6sqts8HqwmUBZKWgNb6yBCcHskzGVHeejx
	H55z0xe0XSo1iJBdbL9ZcWbr0LKJGXyQA9uvrE3Os9yfY5UkHk1VqsCIyh1bluxNid9s
	Of9g==
X-Received: by 10.14.204.198 with SMTP id h46mr55857394eeo.1.1356353287886;
	Mon, 24 Dec 2012 04:48:07 -0800 (PST)
Received: from ?IPv6:2001:610:612::a88f:411:73bb:819b?
	([2001:610:612:0:a88f:411:73bb:819b])
	by mx.google.com with ESMTPS id e2sm41117544eeo.8.2012.12.24.04.48.01
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 04:48:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1356352009-30859-3-git-send-email-eric@eukrea.com>
Date: Mon, 24 Dec 2012 13:48:03 +0100
Message-Id: <A25F2E6C-5865-4009-A61B-9775278A09AB@dominion.thruhere.net>
References: <1356352009-30859-1-git-send-email-eric@eukrea.com>
	<1356352009-30859-3-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlU2Ai+34/su7lQxp9KUMrDckzRU7cSVyHWM2K9hvbnqAHI1H65jqKDY9NvBv9X8cOFG7tS
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH for denzil 3/3] systemd_v189: add D_P=-1
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
X-List-Received-Date: Mon, 24 Dec 2012 13:02:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Awesome solution!

Op 24 dec. 2012, om 13:26 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> now users have the choice :
> * keep the old behaviour when not using systemd :
> PREFERRED_PROVIDER_udev =3D "udev"
> * switch to systemd (while keeping upgrade path) :
> PREFERRED_PROVIDER_udev =3D "systemd"
> PREFFERED_VERSION_systemd =3D "v189"
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
> meta-oe/recipes-core/systemd/systemd_v189.bb |    2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd_v189.bb =
b/meta-oe/recipes-core/systemd/systemd_v189.bb
> index 613f703..633e542 100644
> --- a/meta-oe/recipes-core/systemd/systemd_v189.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_v189.bb
> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>=20
> PROVIDES =3D "udev"
>=20
> +DEFAULT_PREFERENCE =3D "-1"
> +
> DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native =
gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils =
glib-2.0 libgcrypt"
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
>=20
> --=20
> 1.7.10.4
>=20



