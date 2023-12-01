Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BF8C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 19:01:09 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.1087.1701457268525017051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 11:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.37] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3B1J17GJ032732
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Dec 2023 13:01:07 -0600
Message-ID: <97bf355d-f3f6-1a2e-9aca-cffadd2631f1@kernel.crashing.org>
Date: Fri, 1 Dec 2023 13:01:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [oe] [meta-multimedia][PATCH v2] gstd: Fix systemd user unit
 packaging
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20231201165727.8679-1-raj.khem@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20231201165727.8679-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 3B1J17GJ032732
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 19:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107192

After talking with Khem (and running this) I think this is the right solu=
tion.

Thanks!
--Mark

On 12/1/23 10:57=E2=80=AFAM, Khem Raj wrote:
> We do not need to preprocess it offline as its not run per session but
> per user.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Mark Hatle <mark.hatle@amd.com>
> ---
> v2: Fix runtime systemd service launch issue
>=20
>   .../recipes-multimedia/gstreamer-1.0/gstd_git.bb            | 6 ++---=
-
>   1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.=
bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> index 88acdb190e..cabbf2cc11 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> @@ -17,7 +17,7 @@ PV =3D "1.0+really0.15.0"
>  =20
>   GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
>  =20
> -inherit meson pkgconfig gettext gtk-doc systemd python3native python3-=
dir python3targetconfig
> +inherit meson pkgconfig gettext gtk-doc python3native python3-dir pyth=
on3targetconfig
>  =20
>   do_install:append() {
>           rmdir ${D}${root_prefix}${localstatedir}/run/${BPN} ${D}${roo=
t_prefix}${localstatedir}/run \
> @@ -28,7 +28,7 @@ do_install:append() {
>                   install -d ${D}${sysconfdir}/tmpfiles.d
>                   echo "d /run/${BPN} - - - -" \
>                   > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> -                echo "d /${localstatedir}/log/${BPN} 0755 root root -"=
 \
> +                echo "d ${localstatedir}/log/${BPN} 0755 root root -" =
\
>                   >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
>           fi
>           ln -sf gst-client-1.0 ${D}${bindir}/gst-client
> @@ -38,5 +38,3 @@ PACKAGES =3D+ "${PN}-python"
>  =20
>   FILES:${PN} +=3D "${systemd_user_unitdir}"
>   FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> -
> -SYSTEMD_SERVICE:${PN} =3D "gstd.service"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107191): https://lists.openembedded.org/g/openembed=
ded-devel/message/107191
> Mute This Topic: https://lists.openembedded.org/mt/102919731/3616948
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

