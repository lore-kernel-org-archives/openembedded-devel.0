Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D53D560107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 08:11:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f75so12994269wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Nl1vXpx+2WNO3Ll1g8LOo6iGOmENAeDIRYnLEfSMFtQ=;
	b=L3srgkUSNAH/GuFigNDpyM6/U8mJ8JyH/SIhJDwKAhAz/KRsjwdIX5Ro5PYlQDY5PP
	LvhrAImQ9efkA02FOz4n7Cr+/D5cAUmsNhucyDf4cilkKjQkYrOQpFMtRkhMsnoAlbjO
	jnzDS1mvKUuScIXILHyueF4KSRe8V7Er3hsJG7ycfly4YdqaQQQXjnRSDk9SNKuCVnzL
	bWjm+HB7QShChmIP4Is8DgNrmISmKWCr+flH+NQ+8xdvrAo5RipTxIfoKdB5z1ijyBsx
	dHqOt3/USJenGFStWmO78HZIchqU8hhY9FuKSBvfUakfalbjeeVmv2npDqo5j2bTqaOl
	XaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Nl1vXpx+2WNO3Ll1g8LOo6iGOmENAeDIRYnLEfSMFtQ=;
	b=SV68b+EoTAI6LNfb0x92Deqc0iuAowbmjU7ummXEIgtfUCCVE5lAjOjvuo0ATrUQF3
	Kz0REuGz0sm5alLtBW15nkz8/Mzs0P4CfInncGwVHwUyEkJvB4GNmNnmq/s/hCfI3STX
	EQhSClmq20fad63sUbOPuxt3K4nC3Rf5U0nClaGVRlfvUsJqJrfse0N0590r09zIu3Nc
	sedj0+FLEMRL61P4eE5Qaeids8e/6GYxXXfz+zFmf/KNqT5VE1LFPMOV7xxRfLkDlvCB
	T4N1zPwuPlgjMWZtj2Zen0/2/PhzarDsti4+v7CQck4HWQxQ7tHRfdDvkfW3zHuTigHC
	goJA==
X-Gm-Message-State: ALyK8tISS0DOnWFOsmtFIn1zKacwof4zKM64ivGHpsKt46bQcIVWUW5s0cH0sfX1zFYfYA==
X-Received: by 10.28.216.78 with SMTP id p75mr2042103wmg.66.1464163889191;
	Wed, 25 May 2016 01:11:29 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	h14sm19918144wme.1.2016.05.25.01.11.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2016 01:11:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1464159700-16254-1-git-send-email-zhenbo.gao@windriver.com>
Date: Wed, 25 May 2016 10:11:26 +0200
Message-Id: <D9C8A333-331C-4D27-A60D-EDB3DDC244D3@dominion.thruhere.net>
References: <1464159700-16254-1-git-send-email-zhenbo.gao@windriver.com>
To: Zhenbo Gao <zhenbo.gao@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: add alias for networkmanager
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
X-List-Received-Date: Wed, 25 May 2016 08:11:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 25 mei 2016, om 09:01 heeft Zhenbo Gao <zhenbo.gao@windriver.com> =
het volgende geschreven:
>=20
> connman get conflicts with networkmanager when building
> the project.

What=E2=80=99s the conflict? I=E2=80=99m hesitant to add yet another =
virtual since history has shown that most OE people can=E2=80=99t deal =
with the consequences and maintenance load for keeping the virtuals =
working

>=20
> here introduce alias virtual/networkmanager for these
> two recipes, so setting PREFERRED_PROVIDER to the proper
> one can solve the conflicts.
>=20
> this patch is for networkmanager recipe.
>=20
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
> meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb   =
 | 1 +
> =
meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb =
| 2 +-
> 2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> index 831ddf0..efd4d08 100644
> --- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> +++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dcbbffd568227ada506640fe950a4823b \
> "
>=20
> DEPENDS =3D "libnl dbus dbus-glib libgudev util-linux libndp libnewt =
polkit"
> +PROVIDES =3D "virtual/networkmanager"
>=20
> inherit gnomebase gettext systemd bluetooth bash-completion vala =
gobject-introspection
>=20
> diff --git =
a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb =
b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
> index 2070db2..59e1d40 100644
> --- =
a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
> +++ =
b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
> @@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin =3D " \
> "
>=20
> RDEPENDS_xfce4-powermanager-plugin =3D "${PN}"
> -RDEPENDS_${PN} =3D "networkmanager =
${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
> +RDEPENDS_${PN} =3D "virtual/networkmanager =
${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
>=20
> # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
> RPROVIDES_xfce4-powermanager-plugin +=3D "xfce4-brightness-plugin"
> --=20
> 1.9.1
>=20


