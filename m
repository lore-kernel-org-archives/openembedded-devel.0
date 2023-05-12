Return-Path: <ken.s@variscite.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D0CC77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 21:14:55 +0000 (UTC)
Subject: Re: bug: meta-networking: networkmanager: Langdale: duplicate NetworkManager services at runtime
To: openembedded-devel@lists.openembedded.org
From: "Ken Sloat" <ken.s@variscite.com>
X-Originating-Location: Tampa, Florida, US (47.201.82.85)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 May 2023 14:14:54 -0700
References: <6ef48dfeb218986c6227fadef69959b1493157cd.camel@gmail.com>
In-Reply-To: <6ef48dfeb218986c6227fadef69959b1493157cd.camel@gmail.com>
Message-ID: <674.1683926094725585368@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GthobaXAu79rckKHztDq"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 21:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102559

--GthobaXAu79rckKHztDq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

Thanks for your quick reply.

I was looking at the packages-split folders the other day and yes it is pac=
kaged there.

Thanks for pointing out rm_sysvinit_initddir. I debugged this a bit, and it=
 turns out that "sysvinit" is actually still in DISTRO_FEATURES along with =
"systemd." In Langdale at least, it appears that the statements from:

https://github.com/yoctoproject/poky/blob/langdale/meta/conf/distro/include=
/init-manager-systemd.inc

that is:
DISTRO_FEATURES:append =3D " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " sysvinit"
VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"

are not removing "sysvinit" from DISTRO_FEATURES. The if statement in rm_sy=
svinit_initddir requires that both systemd be present and sysvinit not pres=
ent to call the removal functions.

I was only able to force "sysvinit" removal via
DISTRO_FEATURES:remove =3D "sysvinit"

I debugged in Kirkstone as well and rm_sysvinit_initddir did remove the scr=
ipts there (DISTRO_FEATURES properly set). Did something change with specif=
ying systemd in Langdale? Those statements are still in init-manager-system=
d.inc file in Langdale.

Sincerely,
Ken Sloat

--GthobaXAu79rckKHztDq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Adrian,<br /><br />Thanks for your quick reply.<br /><br />I was look=
ing at the packages-split folders the other day and yes it is packaged ther=
e.<br /><br />Thanks for pointing out rm_sysvinit_initddir. I debugged this=
 a bit, and it turns out that "sysvinit" is actually still in DISTRO_FEATUR=
ES along with "systemd." In Langdale at least, it appears that the statemen=
ts from:</p>
<p><a href=3D"https://github.com/yoctoproject/poky/blob/langdale/meta/conf/=
distro/include/init-manager-systemd.inc" target=3D"_blank" rel=3D"noopener"=
>https://github.com/yoctoproject/poky/blob/langdale/meta/conf/distro/includ=
e/init-manager-systemd.inc</a><br /><br />that is:<br />DISTRO_FEATURES:app=
end =3D " systemd"<br />DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " sy=
svinit"<br />VIRTUAL-RUNTIME_init_manager ??=3D "systemd"<br />VIRTUAL-RUNT=
IME_initscripts ??=3D "systemd-compat-units"<br />VIRTUAL-RUNTIME_login_man=
ager ??=3D "shadow-base"<br />VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"<b=
r /><br />are not removing "sysvinit" from DISTRO_FEATURES. The if statemen=
t in rm_sysvinit_initddir requires that both systemd be present and sysvini=
t not present to call the removal functions.<br /><br />I was only able to =
force "sysvinit" removal via<br />DISTRO_FEATURES:remove =3D "sysvinit"<br =
/><br />I debugged in Kirkstone as well and rm_sysvinit_initddir did remove=
 the scripts there (DISTRO_FEATURES properly set). Did something change wit=
h specifying systemd in Langdale? Those statements are still in init-manage=
r-systemd.inc file in Langdale.<br /><br /></p>
<p>Sincerely,<br />Ken Sloat</p>

--GthobaXAu79rckKHztDq--

