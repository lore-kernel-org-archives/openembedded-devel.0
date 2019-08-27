Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id F3DEA6D548
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 01:37:37 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id s14so15752900qkm.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZGC7y0yq/qwZpthXzpKJNfr8UD4NwPEdVyduzCp50vk=;
	b=VFhSoCjBFGRppnLC8rKy3JyiQ+qwD7EKLL7IYL6yROybQKbBs4G4sa0qIKnG5tt/18
	uhipdE2OOkfCm6KfvoAPGD00jH2TCAZ9CgLBy1fW/L5L+zxxP2KKyNdkqA0ObUkG0Z8u
	PrdxzOLB0DiEKM4tFXAMwtmzfVy10UwoOdZc4VboZ+to2BJVmryjCQr169qe/1CHoRFQ
	xu3gDCJl+3OEaTbeMJWIZSZ3YQ9unrn6xVcGw1qmU0+ykpaymrcrZlPolslYio9Itbyh
	8YMCdsaX0LpND32R7iwd/JgmOCnLQaRnvfGP6lj+YDe5TWzmn/Y+JW48VAF6IfAFejW/
	ptIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZGC7y0yq/qwZpthXzpKJNfr8UD4NwPEdVyduzCp50vk=;
	b=UbAJidp6imdCQje+DtJL+EPFEb1GxxGunE29CUQk0DBH8QwV4w2ehZ4HIc1LwIA0UK
	0ooS3zPwm6HC56Utn1yrnnJL59ZTd4qIWbpehQ3GlRUWPTe53TjAww3WNeVFtZuBeQqB
	9ehBgUKHbrheeTVIvxUvm04qI9OY5Vzho4XffBbYbGUA1xhQbpGYc52GS01hMm4i8ORZ
	E75mvQViIBSLsCicjHY9WZH5PJ2opx/JQ4f7mQOchocKFWBU5zIPU6j2yFVtwvjeM6Lz
	R5Z6+sT2D4PuCnxip6q20GX3IOpVAAUyZmwTrdDxHr++MrfTigVKG5fkpHiERSKnmaEg
	T0FA==
X-Gm-Message-State: APjAAAUC1QQYmnyaTbaKuMaZMj6OqqdGLgbRC9Fhn2WivLcI+Jo8Jr/8
	iTzmyUQhvMWN+eWFVXW6hKpod8iWBCSTN7HJ/f4=
X-Google-Smtp-Source: APXvYqzRs5RjPn0WM4ElewEWeoFQSUC8hCwKeBWYQJShPS8txEW0mztAmIk8IitNByqSjf8SSmpVhZ+t98iD5SugQQ4=
X-Received: by 2002:a37:a24c:: with SMTP id l73mr19862382qke.9.1566869858548; 
	Mon, 26 Aug 2019 18:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190816071246.168087-1-kai.kang@windriver.com>
	<28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
	<CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
	<CALbNGRTri949iQT=judPQ+kdsr8oWqyB0a1WDrdfCxqx71Kw2Q@mail.gmail.com>
	<1654f218-c8f9-64ea-dfd8-496860af6ca1@windriver.com>
In-Reply-To: <1654f218-c8f9-64ea-dfd8-496860af6ca1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Aug 2019 18:37:27 -0700
Message-ID: <CAMKF1sqpPg6bxtYD7vL9XckcJxfiYuNVscyMay2EWeyknM0Z2g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch] xfce4-datetime-setter: fix compile error and requires distro feature x11
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
X-List-Received-Date: Tue, 27 Aug 2019 01:37:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 6:11 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/8/24 =E4=B8=8A=E5=8D=884:45, Andreas M=C3=BCller wrote:
> > On Fri, Aug 23, 2019 at 10:38 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
> wrote:
> >> On Fri, Aug 23, 2019 at 3:59 AM Kang Kai <Kai.Kang@windriver.com>
> wrote:
> >>> On 2019/8/16 =E4=B8=8B=E5=8D=883:12, kai.kang@windriver.com wrote:
> >>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>
> >>>> It fails to compile xfce4-datetime-setter occasionally when system
> load
> >>>> is high:
> >>>>
> >>>> | ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No
> such file or directory
> >>>> |    42 | #include "cc-datetime-resources.h"
> >>>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> | compilation terminated.
> >>>>
> >>>> Update datetime_panel_dep to make sure cc-datetime-resources.h be
> >>>> generated before including.
> >>> Hi Andreas,
> >>>
> >>> Any comment on this patch please? And I also sent a pull request on
> github.
> >>>
> >>> Regards,
> >>> Kai
> >>>
> >>>
> >>>> xfce4-datetime-setter depends on libxfce4ui which requires distro
> >>>> feature 'x11', so make it require 'x11' too.
> >>>>
> >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>> ---
> >>>>    .../files/fix-inner-dependency.patch          | 28
> +++++++++++++++++++
> >>>>    .../xfce4-datetime-setter_3.32.2.bb           |  7 +++--
> >>>>    2 files changed, 33 insertions(+), 2 deletions(-)
> >>>>    create mode 100644
> meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.p=
atch
> >>>>
> >>>> diff --git
> a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency=
.patch
> b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency=
.patch
> >>>> new file mode 100644
> >>>> index 000000000..9cccb892f
> >>>> --- /dev/null
> >>>> +++
> b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency=
.patch
> >>>> @@ -0,0 +1,28 @@
> >>>> +It fails to compile xfce4-datetime-setter occasionally when system
> load is high:
> >>>> +
> >>>> +| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: N=
o
> such file or directory
> >>>> +|    42 | #include "cc-datetime-resources.h"
> >>>> +|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> +| compilation terminated.
> >>>> +
> >>>> +Update datetime_panel_dep to make sure cc-datetime-resources.h be
> generated
> >>>> +before including.
> >>>> +
> >>>> +Upstream-Status: Submitted [
> https://github.com/schnitzeltony/xfce4-datetime-setter/pull/2]
> >>>> +
> >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>> +---
> >>>> +diff --git a/panels/datetime/meson.build
> b/panels/datetime/meson.build
> >>>> +index c5bf39c..241e177 100644
> >>>> +--- a/panels/datetime/meson.build
> >>>> ++++ b/panels/datetime/meson.build
> >>>> +@@ -175,7 +175,8 @@ datetime_panel_lib =3D static_library(
> >>>> +
> >>>> + datetime_panel_dep =3D declare_dependency(
> >>>> +   include_directories: [ common_inc, include_directories('.') ],
> >>>> +-  link_with: datetime_panel_lib
> >>>> ++  link_with: datetime_panel_lib,
> >>>> ++  sources: resources
> >>>> + )
> >>>> +
> >>>> + subdir('po-timezones')
> >>>> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/
> xfce4-datetime-setter_3.32.2.bb
> b/meta-xfce/recipes-apps/xfce4-datetime-setter/
> xfce4-datetime-setter_3.32.2.bb
> >>>> index d64358537..4d128ac51 100644
> >>>> --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/
> xfce4-datetime-setter_3.32.2.bb
> >>>> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/
> xfce4-datetime-setter_3.32.2.bb
> >>>> @@ -6,13 +6,16 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D75859989545e37968a99b631ef42722e"
> >>>>
> >>>>    DEPENDS =3D "glib-2.0-native libxfce4ui"
> >>>>
> >>>> -SRC_URI =3D "git://
> github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=3Dhttps"
> >>>> +SRC_URI =3D "git://
> github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=3Dhttps \
> >>>> +           file://fix-inner-dependency.patch \
> >>>> +"
> >>>>    SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
> >>>>
> >>>>    S =3D "${WORKDIR}/git"
> >>>>
> >>>>    inherit gettext meson distro_features_check
> >>>> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> >>>> +
> >>>> +REQUIRED_DISTRO_FEATURES =3D "systemd x11"
> >>>>
> >>>>    FILES_${PN} +=3D "${datadir}/icons/hicolor"
> >>>>
> >> Woops I missed that completely - will check
> > Thanks! Did apply the patch
>
> Hi Andreas,
>
> Thanks.
>
>
> Hi Khem,
>
> Would you like to review this patch? Thanks.
>
>
This looks fine to me have we not applied it yet ?

>
> Kai
>
>
> >
> > Andreas
> >
>
> --
> Kai Kang
>
>

