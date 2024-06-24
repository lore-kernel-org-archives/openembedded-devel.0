Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53031C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 16:22:53 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.145500.1719246170702880984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 09:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 45OGLiU2015934;
	Mon, 24 Jun 2024 11:21:44 -0500
Received: from [192.168.2.236] ([192.168.2.236])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 45OGLh0a015658;
	Mon, 24 Jun 2024 11:21:43 -0500
Message-ID: <92e7ccae-9ec2-4802-b9a4-38ce34317aaa@kernel.crashing.org>
Date: Mon, 24 Jun 2024 11:21:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install media
 ctrl header and library files
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
        neel.gandhi@amd.com, Mark Hatle <mark.hatle@amd.com>
References: <2662af04-b171-4f5b-9010-2e9b1bad0431@kernel.crashing.org>
 <CAMKF1srMod9wgJMjfoQTWZY4tbfQ9oDoa9aGs=uO7fY7wOV21A@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAMKF1srMod9wgJMjfoQTWZY4tbfQ9oDoa9aGs=uO7fY7wOV21A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 45OGLiU2015934
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 16:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111004

What kind of error are you getting?  I just rebased and the system told m=
e there=20
were no differences.  Did it get munged by my email sending?

--Mark

On 6/24/24 11:02 AM, Khem Raj wrote:
> Hi Mark
>=20
> This patch does not apply cleanly on master or master-next, please
> rebase it on either of these branches and resend
>=20
> Thanks
> -Khem
>=20
> On Mon, Jun 24, 2024 at 8:28=E2=80=AFAM Mark Hatle via lists.openembedd=
ed.org
> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>>
>> From: Neel Gandhi <neel.gandhi@amd.com>
>>
>> Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previous pat=
ch
>> that caused the recipe to install the header and library files. Restor=
e
>> this behavior to the new meson based build system.
>>
>> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>
>> This is a resend, the first copy seems to have not been delivered to t=
he list?
>>
>> We would like to get this applied to both master and scarthgap.  Any q=
uestions
>> let me know.
>>
>>    ...l-media-ctl-header-and-library-files.patch | 78 ++++++++++++++++=
+++
>>    .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
>>    2 files changed, 79 insertions(+)
>>    create mode 100644
>> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-m=
edia-ctl-header-and-library-files.patch
>>
>> diff --git
>> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install=
-media-ctl-header-and-library-files.patch
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install=
-media-ctl-header-and-library-files.patch
>> new file mode 100644
>> index 000000000..6c946d8c4
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install=
-media-ctl-header-and-library-files.patch
>> @@ -0,0 +1,78 @@
>> +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 200=
1
>> +From: Neel Gandhi <neel.gandhi@amd.com>
>> +Date: Wed, 5 Jun 2024 13:51:36 +0530
>> +Subject: [PATCH] media-ctl: Install media-ctl header and library file=
s
>> +
>> +Install mediactl and v4l2subdev header and library
>> +files, which may be required by 3rd party applications
>> +to populate and control v4l2subdev device node tree
>> +
>> +Install of these files was removed in upstream commit
>> +0911dce53b08b0df3066be2c75f67e8a314d8729.
>> +
>> +Upstream-Status: Denied
>> +
>> +v4l-utils maintainers do not promise a stable API for this library, a=
nd
>> +do not currently have the time to do so. So exporting the API in this
>> +way is fine, as long as we understand that it will change and users o=
f
>> +the API will need to adapt over time.
>> +
>> +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
>> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> +---
>> + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
>> + 1 file changed, 21 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.buil=
d
>> +index 3a7b0c9a..40669b4c 100644
>> +--- a/utils/media-ctl/meson.build
>> ++++ b/utils/media-ctl/meson.build
>> +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(
>> +     'mediactl-priv.h',
>> + )
>> + ++libmediactl_api =3D files(
>> ++    'mediactl.h',
>> ++    'v4l2subdev.h',
>> ++)
>> ++
>> ++install_headers(libmediactl_api, subdir: 'mediactl')
>> ++
>> + libmediactl_deps =3D [
>> +     dep_libudev,
>> + ]
>> + +-libmediactl =3D static_library('mediactl',
>> +-                             libmediactl_sources,
>> +-                             dependencies : libmediactl_deps,
>> +-                             include_directories : v4l2_utils_incdir=
)
>> ++libmediactl =3D library('mediactl',
>> ++                      libmediactl_sources,
>> ++                      soversion: '0',
>> ++                      version: '0.0.0',
>> ++                      install : true,
>> ++                      dependencies : libmediactl_deps,
>> ++                      include_directories : v4l2_utils_incdir)
>> + + dep_libmediactl =3D declare_dependency(link_with : libmediactl)
>> + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files('libv4l2subdev.c=
')
>> + libv4l2subdev_sources +=3D media_bus_format_names_h
>> + libv4l2subdev_sources +=3D media_bus_format_codes_h
>> + +-libv4l2subdev =3D static_library('v4l2subdev',
>> +-                               libv4l2subdev_sources,
>> +-                               include_directories : v4l2_utils_incd=
ir)
>> ++libv4l2subdev =3D library('v4l2subdev',
>> ++                        libv4l2subdev_sources,
>> ++                        soversion: '0',
>> ++                        version: '0.0.0',
>> ++                        install : true,
>> ++                        dependencies : dep_libmediactl,
>> ++                        include_directories : v4l2_utils_incdir)
>> + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev=
)
>> + +-- +2.34.1
>> +
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> index 52759ef18..eb38d9713 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddis=
abled,json-c"
>>    SRC_URI =3D "\
>>        git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Ds=
table-1.26 \
>>        file://0001-keytable-meson-Restrict-the-installation-of-50-rc_k=
e.patch \
>> +    file://0001-media-ctl-Install-media-ctl-header-and-library-files.=
patch \
>>    "
>>     SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
>> --
>> 2.39.3 (Apple Git-146)
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111001): https://lists.openembedded.org/g/openembe=
dded-devel/message/111001
>> Mute This Topic: https://lists.openembedded.org/mt/106851971/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

