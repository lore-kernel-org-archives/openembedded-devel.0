Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2AEC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:41:19 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.17246.1742550075556208054
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw8OnUsL;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bf87b8fcbso540103a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550075; x=1743154875; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqBCGvEiWLLqwyuX3egorDyH80ozhPmWCO41FGXfvHU=;
        b=Nw8OnUsLYH6BC6R9CPquVa/idw9MSJ2QXSpV/2VgDz8xJDU9u/tviUhkqpzP7GONaw
         tbYrqy08klinD6GysYXwIwVmvsw13AptsbOT2/cbI6Kh5YN2Ym8OuY4g4SJDjt2mKBXO
         5AB4CsB34nSMMeZ4H37XbvSKNBCw87dmWa2gU35D87JC7amFKrPhlIxuhRRy0VVW5Nyd
         GJ3eps3DyvUpfUsGlnB5t1WnsB+euu8PXTXQ9IaMrGHWlhmKD5r4CJ6MvA85tc/Kx6vP
         mZJKgNXPkyxr3dZddBP+rcPdF3lHrJxU8d+z/ttiIWbnsNzZchdUmjhRA0k44GyM9pk3
         NH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550075; x=1743154875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqBCGvEiWLLqwyuX3egorDyH80ozhPmWCO41FGXfvHU=;
        b=JkcoOKkQGyGxDSmZXxKMUxMdxzn3ymI0x+hs7n+tEfM+i+plg+j87QJ88NsFvJwkL2
         zbu8GwfmTSRGMyTUXBDj8M8Zu5z1IKNhHzTBed86N1caGpnju/ciGAoMTF+Cn7LnvB68
         /xuVHfWtZDEYZhH1roucT30RDs2RZMRN+o0QPfjhQ+2lsTb/M1nNN21yaxL1piySEws0
         5hdaa7UbqyJDlLSQY24/28tEcao2Qr/fwWV0RKBY/uMWBEw8lci0FsvmJ+hyKKu+o4yd
         6hM8LNRiWqq1IJZkq05V/RJLQhZpEy8pUTq/fg6CYnN3F8I3oz92YlAM6gTGYHdQxpX8
         473A==
X-Gm-Message-State: AOJu0YxC2ZppooQPmW1Pvi1dVl4J7dmnP/yYfLWIaztDJ1ZbjJ5ANR+M
	l/mr4QOiRF1GXeRvW7cPRdi27jY9tPNLwNZmng8LETNw+lpHoHQcq5sHR911S6WwV0McaT9T7Az
	uzt8H2uklRywB0lM18QIyKD3f0aU=
X-Gm-Gg: ASbGncvD+l0JdPwkpM27heL5F8amM9tSy11NpGg2Do8PL/QVbDolewbzvTvw0yq1qz7
	ANQj8saEK5scOUOkJ99uOLZPWFohTDsJYFbG5cdXCVwB2niKxRGhZtO8iQCgS73EQmsVRArSARK
	qghYGNnpVduNnJSrhFaWNn0YWlAg==
X-Google-Smtp-Source: AGHT+IEn4OY+KCe2uOOIgeZ0NCLX3bdBpRJ9DzfEJwBzCzDq9w4BAfrVKAvznv2PR0rG1R/EJ/8cQw/feOqBzZMw90o=
X-Received: by 2002:a05:6830:6685:b0:72b:8974:e3e6 with SMTP id
 46e09a7af769-72c0af12cf6mr1950199a34.28.1742550074617; Fri, 21 Mar 2025
 02:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250321084632.1889809-1-omri.sarig13@gmail.com>
In-Reply-To: <20250321084632.1889809-1-omri.sarig13@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Mar 2025 02:40:48 -0700
X-Gm-Features: AQ5f1JrtEWtPuhAXlzEA9OqsSzAQQ-FLfV-fswKApBG8ookMWDS--tGeADitAqM
Message-ID: <CAMKF1sqhQ=SuV2Je2T3NsZV-YZjGtmr3eAqKWC8=ttXUxfQieQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3] python3-varlink: Add recipe
To: omri.sarig13@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116177

On Fri, Mar 21, 2025 at 1:47=E2=80=AFAM Omri Sarig via lists.openembedded.o=
rg
<omri.sarig13=3Dgmail.com@lists.openembedded.org> wrote:
>
> Add a python recipe to install the python implementation for the varlink
> interface.
>
> The recipe is using the current master head, instead of the version from
> pypi or a tagged version. This is done as the pypi and tagged versions
> are quite old, while the master is continuously maintained in GitHub.
> The version set for the package is based upon the last tagged commit in
> the tree, with the addition of git.
> As the last tagged version is old, the recipe name is based over git,
> instead of adding the old tag version to the file name.
>
> The runtime dependencies were created by looking at all the import
> statement in the installed files of the repository and taking the
> relevant packages from the python3 manifest file in meta-poky.
> Unfortunately, python-varlink does not have different installation
> candidates for testing or example code - meaning that when the package
> is install through setuptools, the test code is part of the target
> system.
> This causes the runtime dependencies to contain some packages (like
> python3-unittest) which are not needed during regular operation of the
> system, assuming the user will not want to run test or example code.
> However, as these files are installed in the system, and are used as the
> reference example, we've decided to keep the runtime dependencies as-is.
> Future work on this package can be done to split the runtime
> dependencies to different parts (main and test for example), and modify
> the installed files on the system according to the user wishes.
>
> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-varlink_git.bb             | 30 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-varlink_g=
it.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 3a1fb13ba7..40df4f08f3 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-unidiff \
>      python3-uritemplate \
>      python3-validators \
> +    python3-varlink \
>      python3-wrapt \
>      python3-wsproto \
>      python3-xlrd \
> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b=
/meta-python/recipes-devtools/python/python3-varlink_git.bb
> new file mode 100644
> index 0000000000..b50bfac379
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D " Python implementation of the Varlink protocol"
> +HOMEPAGE =3D "https://varlink.org/python/"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
> +
> +SRC_URI =3D "git://github.com/varlink/python.git;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
> +
> +PV =3D "30.3.1+git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python_setuptools_build_meta ptest-python-pytest
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-core \
> +    python3-datetime \
> +    python3-io \
> +    python3-json \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-shell \
> +    python3-stringold \
> +    python3-unittest \
> +"

I think some of the rdeps here are only needed to run ptests, they
should be moved to RDEPENDS:${PN}-ptest rdeps



> +
> +PTEST_PYTEST_DIR =3D "varlink/tests"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116174): https://lists.openembedded.org/g/openembedde=
d-devel/message/116174
> Mute This Topic: https://lists.openembedded.org/mt/111824890/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

