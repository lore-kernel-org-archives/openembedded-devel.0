Return-Path: <hieu2.nguyen@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5BAC021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 09:00:28 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] gphoto: Fix the sed expression to remove --sysroot from config.h
To: openembedded-devel@lists.openembedded.org
From: "Hieu Van Nguyen" <hieu2.nguyen@lge.com>
X-Originating-Location: Ho Chi Minh City, Ho Chi Minh, VN (14.191.164.158)
X-Originating-Platform: Windows Chrome 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 01:00:21 -0800
References: <CAMKF1sr5_pemR2VogAwgbopYDudLSvi0Yvy4dYX4eydVndOjFA@mail.gmail.com>
In-Reply-To: <CAMKF1sr5_pemR2VogAwgbopYDudLSvi0Yvy4dYX4eydVndOjFA@mail.gmail.com>
Message-ID: <23323.1740301221091041675@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YE6qM2K9a7FK1Nxf5lYy"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 09:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115545

--YE6qM2K9a7FK1Nxf5lYy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

oh sorry, I understand this patch is to fix your commit before:
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-graph=
ics/gphoto2/gphoto2_2.5.28.bb?id=3Dbdbc71f61a86b598fc72bcc167e6bf1f7cc33b08
I meant do we really need to remove "--sysrooot=3D"? What happens when I re=
move ${RECIPE_SYSROOT} only?

>=20
> #define HAVE_CC "...... -Werror=3Dformat-security --sysroot=3D"
>

--YE6qM2K9a7FK1Nxf5lYy
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>oh sorry, I understand this patch is to fix your commit before:<br /><=
a href=3D"https://git.openembedded.org/meta-openembedded/commit/meta-oe/rec=
ipes-graphics/gphoto2/gphoto2_2.5.28.bb?id=3Dbdbc71f61a86b598fc72bcc167e6bf=
1f7cc33b08" target=3D"_blank" rel=3D"noopener">https://git.openembedded.org=
/meta-openembedded/commit/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.b=
b?id=3Dbdbc71f61a86b598fc72bcc167e6bf1f7cc33b08</a></div>
<div>I meant do we really need to remove "--sysrooot=3D"? What happens when=
 I remove ${RECIPE_SYSROOT} only?</div>
<blockquote>
<div>#define HAVE_CC "...... -Werror=3Dformat-security --sysroot=3D"</div>
</blockquote>

--YE6qM2K9a7FK1Nxf5lYy--

