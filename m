Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAAF60DFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 16:15:26 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a1so15728590wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 08:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=mI/Qs5lFZtiQJ4ccRaszb9bySlP/zlvZ58cwDEWXOn0=;
	b=UfAKhsGeo/5JQdN08IFDE3Mdpburqh6cbElE0+9sTMc9jiR8kRzyYu9UJhZ9Z5CCPt
	K13GvNbK1Q9y/6xjet79UGpHtPZgMXhkxkUl0qlz/QXvcrkeUuSdmLyGaLruIN+TTmiM
	L1dy3OornvwCqe/s36yv22scv77GyOkQ1GvwEXEc6dswoI9dhRIyFyf5eVdX+/E37qqF
	l6N4lIomu0qv5eBv8t+KCLrzGveJZHDw4THobawCC/OWGcu7mDr3oM0KxFb5aig8jLLG
	OWdK2vDhh/fGpVEWaDc1kbUaY7WVieOvVAbjpmI+Cf7/3n+h2cVADingARfkJBlaVv+D
	HMMA==
X-Gm-Message-State: ALoCoQl5/IdXrTUsuV7+xJjNg+x4/O4gMe5P1SG7CDQ3g3SSS2or27ox7peRo0JRlm+ZhAolaZXa
X-Received: by 10.180.84.166 with SMTP id a6mr12952045wiz.49.1389024926896;
	Mon, 06 Jan 2014 08:15:26 -0800 (PST)
Received: from ?IPv6:2001:610:612::94c7:9eb2:e5e3:f05f?
	([2001:610:612:0:94c7:9eb2:e5e3:f05f])
	by mx.google.com with ESMTPSA id uq2sm42993780wjc.5.2014.01.06.08.15.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 08:15:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1389024737-56946-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 6 Jan 2014 17:15:31 +0100
Message-Id: <C43D5437-90C2-4BF6-9519-43A8B7244576@dominion.thruhere.net>
References: <1389024737-56946-1-git-send-email-koen@dominion.thruhere.net>
To: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1827)
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: Re: [PATCH] udisks: updated to v2.1.1.
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
X-List-Received-Date: Mon, 06 Jan 2014 16:15:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2014, om 17:12 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> From: Yevhen Kyriukha <kirgene@gmail.com>
>=20
> One patch was removed because changes are already exist in upstream =
version.
> Added patch to turn libatasmart, polkit, acl and libsystemd-login into =
optional dependencies.
>=20
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Gah, stupid muscle memory, that SOB is premature

> ---

I played a bit with this patch and I have a few questions


> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb =
b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> similarity index 34%
> rename from meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> rename to meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> index 32f0c11..9eff5e1 100644
> --- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> +++ b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> @@ -1,39 +1,38 @@
> DESCRIPTION =3D "A storage daemon that implements well-defined D-Bus =
interfaces that can be used to query and manipulate storage devices."
> LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D73d83aebe7e4b62346afde80e0e94273"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddd79f6dbbffdbc8e86b086a8f0c0ef43"
>=20
> -DEPENDS =3D "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
> -# optional dependencies: device-mapper parted
> +DEPENDS =3D "udev dbus-glib glib-2.0"
>=20
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"

[..]

> inherit autotools systemd
>=20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[parted] =3D "--enable-parted,--disable-parted,parted"
> +PACKAGECONFIG ??=3D "atasmart polkit acl =
${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-login', '', d)}"
> +PACKAGECONFIG[atasmart] =3D =
"--enable-libatasmart,--disable-libatasmart,libatasmart"
> +PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
> +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl"
> +PACKAGECONFIG[systemd-login] =3D =
"--enable-libsystemd-login,--disable-libsystemd-login,systemd"

I think 3 different ways to add systemd to DEPENDS is a bit much, the =
inherit + PACKAGECONFIG should be enough. Also, what happened to the =
parted PACKAGECONFIG?

regards,

Koen


>=20
> -EXTRA_OECONF =3D "--disable-man-pages"
> +EXTRA_OECONF =3D "--disable-man"
> +
> +PACKAGES =3D+ "${PN}-bash-completion"
>=20
> FILES_${PN} +=3D "${libdir}/polkit-1/extensions/*.so \
>                 ${datadir}/dbus-1/ \
>                 ${datadir}/polkit-1 \
>                 ${base_libdir}/udev/* \
> +                ${libdir}/udisks2/* \
> "
> +FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug \
> +		${libdir}/udisks2/.debug"
> +FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
>=20
> -FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "udisks-daemon.service"
> +SYSTEMD_SERVICE_${PN} =3D "udisks2.service"
> SYSTEMD_AUTO_ENABLE =3D "disable"
> --=20
> 1.8.4
>=20
>=20


