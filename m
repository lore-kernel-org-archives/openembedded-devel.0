Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD27C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 14:56:13 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.33208.1724597766155031629
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 07:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfyHHhZm;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-26808290f43so3035526fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724597765; x=1725202565; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3bG2n0tTUeLdr8rgjrFfwzRHKpmi7+TbhJdJdthY5c=;
        b=dfyHHhZmjUNDCj9gNhh7122dTnxhwh4dOJurirQxkPq4Qq02KRXGYCJE39QPPOGrWw
         zp/2re/WdHffOoFGjmHSwrTb/mBq7rByyPzm28tWQxc2P8N13X9LmJE1kSkYuR1DNE3D
         n6c7Ii/+8miM+VqhnkZa54jpsqazX5ZArO5T6adqOr8eSZe0xLDOWuTHTHNNkX207xXM
         aWB+/JuQcpnwioSP4Opq43pdRcV3kM8BI5f8f2XGZ9lw2mKAyQgCFsd6I+4ZM/bFt0RW
         FcFOJWB63Wd4nGkOJP5h3pSP/S5bNaYaGfnM0+AUNQiyV4vkGH4zNNHbknVNkFJAgIMs
         XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724597765; x=1725202565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3bG2n0tTUeLdr8rgjrFfwzRHKpmi7+TbhJdJdthY5c=;
        b=oeQDPq3rZ89a9xCQyouhFx5NAX4Emyl6un7rYmxfXjkp/r8LmBxDWWA6sd9Vakue9h
         MugAouE181sFyX2D8OEOEPcS0/T0isISRV0UxfFmiNF+dKJWz+uEs1hzPaw/YwN8RkP5
         7j/5+XEstNlZV3uIWXum5I9Age0Bfh5e/dmn0rbwSetGzVDC1BBM7OUwFN7qP/dJhdZP
         0e++dQN8d8ofUjjzuiXGlhYy3q08rsB7jnR1XxZjuvB5r8i1zKz8KJpnGLTC10sy+Qwf
         HFj2JzqrXc4nRKz2RPs4CMTcWjimezeht2Q+fOyObMHjgadH7dov93ygX6AnYY269/gN
         TbFA==
X-Gm-Message-State: AOJu0YxGLzGYav8xtIxYvaXoncvri8L+Riz1gjLCKBjn6pwzsUOoZ7qC
	LclcJ6sYcQ1IHukMNGkOUAbxOB/yxf/5C4D+fCp66Z18Gsxfq8vdw05KO9kPKxMPktJ4Bv1dVRE
	bvXRufo+i+XZLbXhc6eHeJ0hRc6A=
X-Google-Smtp-Source: AGHT+IHAte7m4bGzOaxZlPRKbGgCt30qj7xY9EhYSKPkPxGLrdA1lOw9rfvhQ/Ll/zt7diCbmx+oPqGN0/NOPfYn6Wo=
X-Received: by 2002:a05:6871:7417:b0:261:900:b222 with SMTP id
 586e51a60fabf-273c8eb1f0dmr5236071fac.20.1724597765243; Sun, 25 Aug 2024
 07:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240825084947.1032325-1-michael@amarulasolutions.com>
In-Reply-To: <20240825084947.1032325-1-michael@amarulasolutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Aug 2024 07:55:38 -0700
Message-ID: <CAMKF1srbO=Us8xZHek=G_xC=KHwukNVC-vhDkh7Jz8oPmtavrQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] cpuset: Add recipe for cpuset tool 1.6.2
To: michael@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 14:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111928

meta/ layer is part of oe-core, this patch if intended for
meta-openembedded should be part of meta-oe layer.

On Sun, Aug 25, 2024 at 1:49=E2=80=AFAM Michael Nazzareno Trimarchi via
lists.openembedded.org
<michael=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
> Cpuset is a Python application that forms a wrapper around the
> standard Linux filesystem calls to make using the cpusets facilities
> in the Linux kernel easier. This can be used on linux realtime or
> standard linux
>
> Example
>
> cset shield --cpu 2-3
> echo c > /proc/irq/287/smp_affinity
> irq=3D`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
> cset shield -s -p $irq --force
> chrt -f -p 75 $irq
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  meta/conf/distro/include/maintainers.inc     |  1 +
>  meta/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 60f36a9449..fe3d9c83d8 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -121,6 +121,7 @@ RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richard Purd=
ie <richard.purdie@linuxfound
>  RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
> +RECIPE_MAINTAINER:pn-cpuset =3D "Michael Trimarchi <michael@amarulasolut=
ions.com>"
>  RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-createrepo-c =3D "Alexander Kanavin <alex.kanavin@g=
mail.com>"
>  RECIPE_MAINTAINER:pn-cronie =3D "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta/recipes-=
devtools/cpuset/cpuset_1.6.2.bb
> new file mode 100644
> index 0000000000..b404d4131e
> --- /dev/null
> +++ b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Cpuset manipulation tool"
> +HOMEPAGE =3D "https://github.com/SUSE/cpuset"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;branch=3D=
master"
> +
> +SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pydoc"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111927): https://lists.openembedded.org/g/openembedde=
d-devel/message/111927
> Mute This Topic: https://lists.openembedded.org/mt/108084672/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

