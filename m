Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC27EC7EE22
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 00:42:53 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.3974.1684370572032030519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 17:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jmxD6Gdz;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-54fba751417so409707eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 17:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684370571; x=1686962571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayqZglVRJCwNXcfbajo/VLhYx9r/mx4tDsSYpXg5hWA=;
        b=jmxD6GdzvO/QDKrMZyeE6Oa7DR66d1vFaeBSR/rMHRJCAFxn6AyIBW4ITSHxSGQkpW
         Crq52pO0g5RNL88Apyi7r7t5kiiJiZ3zKcllXHnyab9178eFvX+Bckir0KTp4FmKTtU6
         cqnFPV9ixmwgIZHi70/42Z+BOgv01s4L7O0eWWjq/lBZxZfGsx2JMpNKFp4rQbiZ5oL0
         VDFFQwKFLmXL/tro0xLgrs6Y+aDZCrlBPRcWok4loFfLlL7mwNIDgO6akFNNSwcG/yvT
         wg/XFgVH6n+jlP5AjVN2ke5D7FvhAoNbFn0VX9w9EfEAbHtyzGzIL/QPFjCNg7+DPY8T
         EJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684370571; x=1686962571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayqZglVRJCwNXcfbajo/VLhYx9r/mx4tDsSYpXg5hWA=;
        b=fanfdVkpgWfE2cZHZYUviPVcom6SbgBn1RVFaXfcBgN6w0gD2WNNyr/FQ2oxsDLIbx
         XYO0j7t+IcXSKs7OmDSP7BV8M/PKgcf6+yE1xMYb9T+N8GsE5btdhA6EYK52enXlPtV4
         DHaY5jGb895r0+QzdRrBsTLUPleBPBrHqIBCm84ZoPdyjEw+Vp28NwjEgosLdlqmXdKG
         DNzaHZ//N3j0FqS4r7RiIxk/80lke+1CnXaWjPjrK/AmGXPl38/k4OlmfxLjbnqMEjVJ
         95JZBbyB0QyoblAB2XVNzUqFd6B3f0DSgvCY00nqqbr78S7kKh76eMfdLlNbZCRW7y6w
         kW8w==
X-Gm-Message-State: AC+VfDzqMzSxzLeJwHrYqXzmGXoSnZWPhK2S12mmeKkflJm0q55NAMej
	M32yWHoMcTVelIdY44X7gPLxG75vrN5QiQm69h6Q7JspDE8=
X-Google-Smtp-Source: ACHHUZ4iBDa0MyeqNRv7Q8uN/ywEFzCulnm90Df4blqw+S05nm1+6B7Cn6ac6ObZPPJAd7UIeMtwGogw3l06HSNzUfk=
X-Received: by 2002:a4a:301c:0:b0:551:50d8:2325 with SMTP id
 q28-20020a4a301c000000b0055150d82325mr8714259oof.3.1684370571016; Wed, 17 May
 2023 17:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqfE0Q5vwC+2sG5wGHeadoabqQHhSSy=y4aQVjPDOrfgA@mail.gmail.com>
 <ba0f0a849c0c2eedd3d1bf04635ae5ea@amelkin.msk.ru>
In-Reply-To: <ba0f0a849c0c2eedd3d1bf04635ae5ea@amelkin.msk.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 May 2023 17:42:25 -0700
Message-ID: <CAMKF1spcReLzKP=s0PMmoNbYZ96=4qz2+g9xEFdJ7EZjMAq0gQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: Update links
To: Alexander Amelkin <alexander@amelkin.msk.ru>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 00:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102651

still not good

seeing this on git am
error: patch fragment without header at line 6: @@ -22,14 +22,14 @@
LIC_FILES_CHKSUM =3D

On Wed, May 17, 2023 at 4:13=E2=80=AFAM Alexander Amelkin
<alexander@amelkin.msk.ru> wrote:
>
> The project has been moved to CodeBerg.org.
> Update the links in the recipe and also bump to the
> latest revision (1.8.19.13).
>
> Additionally fix the link to the IANA PEN registry as IANA
> has changed their URL scheme some time ago and the old link
> started pointing to the HTML page instead of the text file.
>
> Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
> ---
>   meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> index 0340901c2..ab9074bba 100644
> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> @@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU)
> information, reading and \
>   setting LAN configuration, and chassis power control. \
>   "
>
> -HOMEPAGE =3D "http://ipmitool.sourceforge.net/"
> +HOMEPAGE =3D "http://codeberg.org/IPMITool/ipmitool"
>   SECTION =3D "kernel/userland"
>
>   LICENSE =3D "BSD-3-Clause"
> @@ -22,14 +22,14 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D9aa91e13d644326bf281924212862184"
>
>   DEPENDS =3D "openssl readline ncurses"
>   SRCREV =3D "19d78782d795d0cf4ceefe655f616210c9143e62"
> -SRC_URI =3D
> "git://github.com/ipmitool/ipmitool;protocol=3Dhttps;branch=3Dmaster \
> +SRC_URI =3D
> "git://codeberg.org/ipmitool/ipmitool;protocol=3Dhttps;branch=3Dmaster \
>              ${IANA_ENTERPRISE_NUMBERS} \
>
> file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
>              "
>   IANA_ENTERPRISE_NUMBERS ?=3D ""
>
>   # Add these via bbappend if this database is needed by the system
> -#IANA_ENTERPRISE_NUMBERS =3D
> "http://www.iana.org/assignments/enterprise-numbers;name=3Diana-enterpris=
e-numbers;downloadfilename=3Diana-enterprise-numbers"
> +#IANA_ENTERPRISE_NUMBERS =3D
> "http://www.iana.org/assignments/enterprise-numbers.txt;name=3Diana-enter=
prise-numbers;downloadfilename=3Diana-enterprise-numbers"
>   #SRC_URI[iana-enterprise-numbers.sha256sum] =3D
> "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
>
>   S =3D "${WORKDIR}/git"
> --
> 2.28.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102644): https://lists.openembedded.org/g/openembedde=
d-devel/message/102644
> Mute This Topic: https://lists.openembedded.org/mt/98903374/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

