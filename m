Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C85C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:25:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.466.1634750739582530240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P52wTb7s;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id np13so2948369pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJu+VdqvVqgXv/8R8/uSMqSVAlF0eUUV+7//Cvmjjp4=;
        b=P52wTb7sNeekaW+QjZdK2WvI5R06IsSAFnuPFM+4yVmnWLXENixr+YVZmKNdg0UhwY
         UW/AI4pNOccNFSusraw/yO1Xp67EGLEUrFbCIg5bF+f0+QiP2eMMpRgFN3NHmRvxk/9j
         z8EfEmBdzA8e+X2EuBoU89XnlTZVGJjZluO+OGHk/Xza9v9yLjDx2aD5nilB/bbaErEf
         g1qrH0eqDrDmFYZ7oXo9V50i8MNLxAWWhyO0io7Ps35+M7vhwVrbvnZ3DqY1TPf3yQ1W
         ldmjYNzbmmsfgXNbQfJJYiM3t4Xb1qJzfpUJHAguUaQh20Aplg7I6gJgw3JpZ7PLkFjv
         ZcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJu+VdqvVqgXv/8R8/uSMqSVAlF0eUUV+7//Cvmjjp4=;
        b=P829zxB0ChOFcQfGTMfxrlThrUJ+k9IfTrbXrtHhhIva0fTlutThbuhAGml7UZJQ0M
         lYd4Y+M6a0oIkJDXo2IUtcitaCVZCMj8NT2YDy08GHCbCKPDqRYiPVvThRwgzpYnfCh6
         XuH+I2E89AbEEI/oFmocXnSlv8MthM9H+2S089CnSwxYKEohm568A5KszipeSzMTAVEC
         8PvC8+dPBY1md694IE3s0ySB2kH3LcR0dMbrhJwSXLSsOmX7Zs//nBy+LvjYAvZautGz
         sPHwEKe9Sw96JBHPMlSxA6p8WrEFJFlYCIe3WfVBBnmUmX9RnJLmLdEcYj8p1OXxoOc3
         0KYQ==
X-Gm-Message-State: AOAM532bTBfn/SyzUfYLuG5b60Azwm12VKFjItOJERQeH8uTBEcCOije
	QezepgIvk4SLtnPNB2buPCUQ3UQPqM9DhITmb8ccUEgPFtk=
X-Google-Smtp-Source: 
 ABdhPJz+hoKjW4fx25PBdWBEMALGL/wxoeY4lLjCcjFzIvcRklLtsFlpWjEMFwVvY2ITzy86VWkTYatNXChGig5B9b0=
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr178709pjb.183.1634750739203;
 Wed, 20 Oct 2021 10:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211020172214.394631-1-raj.khem@gmail.com>
In-Reply-To: <20211020172214.394631-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:25:28 +0200
Message-ID: 
 <CA+chaQcUrs4RUubDHhP66L2Y4SXx3-MBKD9h2X8858DCmjhMuA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 1/2] bluepy: Set PV and correct syntax
 for RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Marco Cavallini <m.cavallini@koansoftware.com>
Content-Type: multipart/alternative; boundary="0000000000001b496605cecc111c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:25:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93494

--0000000000001b496605cecc111c
Content-Type: text/plain; charset="UTF-8"

Thanks! <3

On Wed, Oct 20, 2021 at 7:22 PM Khem Raj <raj.khem@gmail.com> wrote:

> Also organize the recipe to to match OE style
> Remove PYTHON_PN from DEPENDS, setuptools should be enough
> Correct setting LIC_FILES_CHKSUM
> Move setting git SHA to SRCREV
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Marco Cavallini <m.cavallini@koansoftware.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../recipes-connectivity/bluepy/bluepy_git.bb    | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> index 03b1562b60..c1bcbc25b1 100644
> --- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -1,17 +1,19 @@
>  DESCRIPTION = "Python interface to Bluetooth LE on Linux"
>  HOMEPAGE = "https://github.com/IanHarvey/bluepy"
>  SECTION = "devel/python"
> +LICENSE = "GPLv2 & PD"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6
> \
> +
> file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +DEPENDS = "glib-2.0"
> +SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
> +PV = "1.3.0+git${SRCPV}"
>
> -DEPENDS = "${PYTHON_PN} glib-2.0"
> -RDEPENDS_${PN} = "bluez5"
> +SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https"
>
> -LICENSE = "GPLv2 & PD"
> -LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> -LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +S = "${WORKDIR}/git"
>
>  inherit setuptools3 pkgconfig
>
> -SRC_URI = "git://
> github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09
> "
> -S = "${WORKDIR}/git"
> +RDEPENDS:${PN} = "bluez5"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
> --
> 2.33.1
>
>

--0000000000001b496605cecc111c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! &lt;3<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 7:22 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also organize t=
he recipe to to match OE style<br>
Remove PYTHON_PN from DEPENDS, setuptools should be enough<br>
Correct setting LIC_FILES_CHKSUM<br>
Move setting git SHA to SRCREV<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Marco Cavallini &lt;<a href=3D"mailto:m.cavallini@koansoftware.com" tar=
get=3D"_blank">m.cavallini@koansoftware.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/bluepy/<a href=3D"http://bluepy_git.bb" rel=
=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a>=C2=A0 =C2=A0 | 16 +++++=
++++-------<br>
=C2=A01 file changed, 9 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://=
bluepy_git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a> b/met=
a-networking/recipes-connectivity/bluepy/<a href=3D"http://bluepy_git.bb" r=
el=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
index 03b1562b60..c1bcbc25b1 100644<br>
--- a/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bluepy_=
git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
+++ b/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bluepy_=
git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
@@ -1,17 +1,19 @@<br>
=C2=A0DESCRIPTION =3D &quot;Python interface to Bluetooth LE on Linux&quot;=
<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/IanHarvey/bluepy" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/IanHarvey/bluepy</a>&=
quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;GPLv2 &amp; PD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-licenses/G=
PL-2.0;md5=3D801f80980d171dd6425610833a22dbe6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${COREBASE}/meta/files/common-licenses/PD;md5=3Db3597d12946881e13cb3b548=
d1173851&quot;<br>
+DEPENDS =3D &quot;glib-2.0&quot;<br>
+SRCREV =3D &quot;7ad565231a97c304c0eff45f2649cd005e69db09&quot;<br>
+PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
<br>
-DEPENDS =3D &quot;${PYTHON_PN} glib-2.0&quot;<br>
-RDEPENDS_${PN} =3D &quot;bluez5&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/IanHarvey/bluepy.git;=
protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/IanHarvey=
/bluepy.git;protocol=3Dhttps</a>&quot;<br>
<br>
-LICENSE =3D &quot;GPLv2 &amp; PD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-licenses/G=
PL-2.0;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-licenses/P=
D;md5=3Db3597d12946881e13cb3b548d1173851&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit setuptools3 pkgconfig<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/IanHarvey/bluepy.git;=
protocol=3Dhttps;rev=3D7ad565231a97c304c0eff45f2649cd005e69db09" rel=3D"nor=
eferrer" target=3D"_blank">github.com/IanHarvey/bluepy.git;protocol=3Dhttps=
;rev=3D7ad565231a97c304c0eff45f2649cd005e69db09</a>&quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+RDEPENDS:${PN} =3D &quot;bluez5&quot;<br>
<br>
=C2=A0TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
-- <br>
2.33.1<br>
<br>
</blockquote></div>

--0000000000001b496605cecc111c--

