Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id F1CD47E684
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 01:45:00 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l9so19877390qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 18:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I4nGLSN+7Z/kl3MR37vun7nt/Fo0YtDkhn/doeOsKbM=;
	b=Ex15icQH/KCfWDFH0UMeirZc4LpH25kU4bfk5YPE0+SghtImA6doo49gCq1PT6wNB+
	LCCGCrEQpnVr13XO8KwOy8lS2DNG/9tRQvNc62WLAvv8K4djZdMj9cn3qJLV0Mjs+cu6
	Y0yhJUXAT1CtaHKQbgDnSMkxlgUABPXJhdYiuhSPKfpmAgBiwggLPe26jrjGykPOuKuk
	yROrr0W9umaHJUHlaHLlSd9HgeXRYaN7jjJV7dCC06a2dAHZm+91i+EG+0OMYDtUxSmM
	IGxORLHv3Qv/Oz03NBrVyfqCLXVJDhHFQ1wLs4FQbYyBy0VHbXmu9gqBz/uvNtWBmxpZ
	TUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I4nGLSN+7Z/kl3MR37vun7nt/Fo0YtDkhn/doeOsKbM=;
	b=MXkZjSqA0RAd4ZPKcreTat/BhYl3ZPVNfNlwR2LFNKPWa7qMvrXgi75RxY8KM9jKpl
	5PYd5JJvaCTR1dIJVMaUC9cJEE6tQVfYSn4TkbHhUBjmAHbX50dwtGmgct1nemYferLM
	mnvrlGv5d5P2reJnBAWUGystM7mGYmYcLFi/yQ2iEGLdrNNXd0kHfala61rSnuOGXV/9
	tO5hkg/GRD2PIisKAUzR85z/KSQvW7CoSXSnid3bQfOhFkZY8hYLe7gCrVnE6VU0MUBc
	vNKwY/JiqzdQ4v5eV6BGmSNrA8yvgjtVoesR/Ml9OsAceaWoLtgdg1nVuybhdBM1yGET
	3nkA==
X-Gm-Message-State: APjAAAV79wqexucJPjm/yVc2KOAgWEuo/PPezPSBq1QFOK6tCf8RS/lV
	Ao3MqpxPOIEjLljENR4kI2qd913iDkBjgy0ixk0=
X-Google-Smtp-Source: APXvYqxxcFyXovQLkGMnDQn7NOUxPhgI+8wqQwZQGqEPpFDVy6rp8WE34+EwXN6EdtIZVRsjDtqhAh5PnIelrxhJkFY=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr17495782qtr.53.1566870301598; 
	Mon, 26 Aug 2019 18:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190816071246.168087-1-kai.kang@windriver.com>
	<28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
	<CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
	<CALbNGRTri949iQT=judPQ+kdsr8oWqyB0a1WDrdfCxqx71Kw2Q@mail.gmail.com>
	<1654f218-c8f9-64ea-dfd8-496860af6ca1@windriver.com>
	<CAMKF1sqpPg6bxtYD7vL9XckcJxfiYuNVscyMay2EWeyknM0Z2g@mail.gmail.com>
	<57be0426-253d-cae1-5118-5a0a48147f01@windriver.com>
In-Reply-To: <57be0426-253d-cae1-5118-5a0a48147f01@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Aug 2019 18:44:50 -0700
Message-ID: <CAMKF1soacRwo3vDSuc-GFVqJoYSxTa79C7Vtk8sCdB7yzJHNUw@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Aug 2019 01:45:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 6:40 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/8/27 =E4=B8=8A=E5=8D=889:37, Khem Raj wrote:
>
>
>
> On Mon, Aug 26, 2019 at 6:11 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> On 2019/8/24 =E4=B8=8A=E5=8D=884:45, Andreas M=C3=BCller wrote:
>> > On Fri, Aug 23, 2019 at 10:38 PM Andreas M=C3=BCller <
>> schnitzeltony@gmail.com> wrote:
>> >> On Fri, Aug 23, 2019 at 3:59 AM Kang Kai <Kai.Kang@windriver.com>
>> wrote:
>> >>> On 2019/8/16 =E4=B8=8B=E5=8D=883:12, kai.kang@windriver.com wrote:
>> >>>> From: Kai Kang <kai.kang@windriver.com>
>> >>>>
>> >>>> It fails to compile xfce4-datetime-setter occasionally when system
>> load
>> >>>> is high:
>> >>>>
>> >>>> | ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: N=
o
>> such file or directory
>> >>>> |    42 | #include "cc-datetime-resources.h"
>> >>>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>> >>>> | compilation terminated.
>> >>>>
>> >>>> Update datetime_panel_dep to make sure cc-datetime-resources.h be
>> >>>> generated before including.
>> >>> Hi Andreas,
>> >>>
>> >>> Any comment on this patch please? And I also sent a pull request on
>> github.
>> >>>
>> >>> Regards,
>> >>> Kai
>> >>>
>> >>>
>> >>>> xfce4-datetime-setter depends on libxfce4ui which requires distro
>> >>>> feature 'x11', so make it require 'x11' too.
>> >>>>
>> >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> >>>> ---
>> >>>>    .../files/fix-inner-dependency.patch          | 28
>> +++++++++++++++++++
>> >>>>    .../xfce4-datetime-setter_3.32.2.bb           |  7 +++--
>> >>>>    2 files changed, 33 insertions(+), 2 deletions(-)
>> >>>>    create mode 100644
>> meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.=
patch
>> >>>>
>> >>>> diff --git
>> a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependenc=
y.patch
>> b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependenc=
y.patch
>> >>>> new file mode 100644
>> >>>> index 000000000..9cccb892f
>> >>>> --- /dev/null
>> >>>> +++
>> b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependenc=
y.patch
>> >>>> @@ -0,0 +1,28 @@
>> >>>> +It fails to compile xfce4-datetime-setter occasionally when system
>> load is high:
>> >>>> +
>> >>>> +| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h:
>> No such file or directory
>> >>>> +|    42 | #include "cc-datetime-resources.h"
>> >>>> +|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>> >>>> +| compilation terminated.
>> >>>> +
>> >>>> +Update datetime_panel_dep to make sure cc-datetime-resources.h be
>> generated
>> >>>> +before including.
>> >>>> +
>> >>>> +Upstream-Status: Submitted [
>> https://github.com/schnitzeltony/xfce4-datetime-setter/pull/2]
>> >>>> +
>> >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> >>>> +---
>> >>>> +diff --git a/panels/datetime/meson.build
>> b/panels/datetime/meson.build
>> >>>> +index c5bf39c..241e177 100644
>> >>>> +--- a/panels/datetime/meson.build
>> >>>> ++++ b/panels/datetime/meson.build
>> >>>> +@@ -175,7 +175,8 @@ datetime_panel_lib =3D static_library(
>> >>>> +
>> >>>> + datetime_panel_dep =3D declare_dependency(
>> >>>> +   include_directories: [ common_inc, include_directories('.') ],
>> >>>> +-  link_with: datetime_panel_lib
>> >>>> ++  link_with: datetime_panel_lib,
>> >>>> ++  sources: resources
>> >>>> + )
>> >>>> +
>> >>>> + subdir('po-timezones')
>> >>>> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/
>> xfce4-datetime-setter_3.32.2.bb
>> b/meta-xfce/recipes-apps/xfce4-datetime-setter/
>> xfce4-datetime-setter_3.32.2.bb
>> >>>> index d64358537..4d128ac51 100644
>> >>>> --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/
>> xfce4-datetime-setter_3.32.2.bb
>> >>>> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/
>> xfce4-datetime-setter_3.32.2.bb
>> >>>> @@ -6,13 +6,16 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D75859989545e37968a99b631ef42722e"
>> >>>>
>> >>>>    DEPENDS =3D "glib-2.0-native libxfce4ui"
>> >>>>
>> >>>> -SRC_URI =3D "git://
>> github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=3Dhttps"
>> >>>> +SRC_URI =3D "git://
>> github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=3Dhttps \
>> >>>> +           file://fix-inner-dependency.patch \
>> >>>> +"
>> >>>>    SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>> >>>>
>> >>>>    S =3D "${WORKDIR}/git"
>> >>>>
>> >>>>    inherit gettext meson distro_features_check
>> >>>> -REQUIRED_DISTRO_FEATURES =3D "systemd"
>> >>>> +
>> >>>> +REQUIRED_DISTRO_FEATURES =3D "systemd x11"
>> >>>>
>> >>>>    FILES_${PN} +=3D "${datadir}/icons/hicolor"
>> >>>>
>> >> Woops I missed that completely - will check
>> > Thanks! Did apply the patch
>>
>> Hi Andreas,
>>
>> Thanks.
>>
>>
>> Hi Khem,
>>
>> Would you like to review this patch? Thanks.
>>
>>
> This looks fine to me have we not applied it yet ?
>
> I didn't see it in master-next. :(
>

Thanks for letting me know

Kai
>
>
>
>> Kai
>>
>>
>> >
>> > Andreas
>> >
>>
>> --
>> Kai Kang
>>
>>
> --
> Kai Kang
>
>

