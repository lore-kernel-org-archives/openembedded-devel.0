Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 52D926BA11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 03:21:24 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id w2so232848qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 20:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IbX/wnN7KUuN1sIb56kmUPhtEcpYrMK107tsbPI6eFw=;
	b=NRJnrywWYcOr8Gcg9OcsT7VI5vybckw6dTnP+UzEk51UH63PQdb5pVuZ1ZX+IQpSTz
	n00DbwEAVvg7YlbrIkVBdSSvzLMSI5v3/ylfji7+RpSWyU8QwsCqHOn1uNtcFh2ufPVC
	HvO6DjM6wxqQ2+53MZkhg3UpUh8k39rJyF+l1WvMa04h4h//aNJE8GxLjuvUKtZvdS2k
	3pS35TA25MPqfj5ZtkGDXq/RwWyMlqFGXtPo4eDXXozXeN4C/XzoDa4ctVOi0VfeRdwF
	BwmYuCSBUK/q9m3Qxwc7N43b0nqMixpCvpfSr1jaowyRnz+YE6fhmt2P7abUq39UM241
	kzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IbX/wnN7KUuN1sIb56kmUPhtEcpYrMK107tsbPI6eFw=;
	b=MeAU/4vEWKXuR0lUth9Abuj5pPLmSg17G4fu7p1Eo/e5+iswGmpNIuR2YF9ehOT+Ar
	lMPz1BD95s9tND+Wdozph67qFkuvOsREl+lbY2VOUUtjXJ4j3spqAKoTEO7sxQB+mA0X
	1VNSb67bRN8JOdlAz0Mx8W2c3IXBaiyD0HFy6Ttasnfmr5/yPukxK9l2Fgrzgu55e9LR
	J7sLeji1enBHwpN6Bywispnu7B+ZieE917B1m2DCpmHJq3wjrFEWUVPfQHKyXWm3R5qh
	95C18rbsgp0Mf6Q6n6GXkZIugnb3miWcLKVsQjuSf8HTffOux2gF5fpoLlQWAwQp/5vf
	z44g==
X-Gm-Message-State: APjAAAUzNMG1DofvP2+JMZaVXmwAhaQBNxP1y7fQzLXw1jNH6riH8iyr
	RnGvKCnm3+tw82VBsYI6dVFPv4vnjdapz7ZJZJw=
X-Google-Smtp-Source: APXvYqxbmdi73CrpL18c/KEiIOvCn3nliRGxy6EHsuHQEPTu1QWfJtG4ClNrBs+8yHH5clxtD/7tDt5hELysVP5CD6A=
X-Received: by 2002:ae9:edd8:: with SMTP id
	c207mr33203113qkg.337.1568258484682; 
	Wed, 11 Sep 2019 20:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190829082942.128713-1-kai.kang@windriver.com>
	<c0d140cb-bdac-7e6f-d118-bd2a370e5d1c@windriver.com>
	<ccffd278-6ed8-ffb5-3c1d-09b945bfbb60@gmail.com>
	<e355d649-407a-7cdd-ccb9-a20d4adf8baf@windriver.com>
In-Reply-To: <e355d649-407a-7cdd-ccb9-a20d4adf8baf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Sep 2019 20:21:13 -0700
Message-ID: <CAMKF1sqrHDGYExqk6UEuX4k-b9agi+PbZ+1z1G+=TapvULJLEA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][Patch] libwacom: add recipe
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
X-List-Received-Date: Thu, 12 Sep 2019 03:21:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2019 at 8:18 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/9/6 =E4=B8=8A=E5=8D=889:10, Khem Raj wrote:
> > On 9/4/19 6:51 PM, Kang Kai wrote:
> >> On 2019/8/29 =E4=B8=8B=E5=8D=884:29, kai.kang@windriver.com wrote:
> >>> From: Kai Kang <kai.kang@windriver.com>
> >>>
> >>> Package libinput has a package config 'libwacom'. When it is set,
> >>> package libwacom is required. So add the recipe of libwacom.
> >>>
> >>> Add a patch to generate udev rules file on target that it is not
> >>> suitable for cross compile.
> >
> > fails to build
> >
> > https://errors.yoctoproject.org/Errors/Details/268566/
> >
> > https://errors.yoctoproject.org/Errors/Details/268387/
>
> HI Khem,
>
> I still can't reproduce the failures. And I can't find the config of the
> failed builds. Would you like to tell me where can I find the build
> config? Thanks.
>

This is using gold linker I think that=E2=80=99s what you might be missing

>
> Regards,
> Kai
>
>
> >
> >
> >> Ping.
> >>
> >>
> >>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>> ---
> >>>    .../generate-udev-rules-on-target.patch       | 59
> +++++++++++++++++++
> >>>    .../recipes-extended/libwacom/libwacom_1.0.bb | 17 ++++++
> >>>    2 files changed, 76 insertions(+)
> >>>    create mode 100644
> >>>
> meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.=
patch
> >>>    create mode 100644 meta-oe/recipes-extended/libwacom/
> libwacom_1.0.bb
> >>>
> >>> diff --git
> >>>
> a/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-targe=
t.patch
> >>>
> b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-targe=
t.patch
> >>>
> >>> new file mode 100644
> >>> index 000000000..27e037c98
> >>> --- /dev/null
> >>> +++
> >>>
> b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-targe=
t.patch
> >>> @@ -0,0 +1,59 @@
> >>> +libwacom create a native executable file to generate udev rules
> >>> file. But it is
> >>> +not suitable for cross compile. And it is complicate to create
> >>> libwacom-native
> >>> +that libgudev-native and udev-native are required.
> >>> +
> >>> +So do not generate udev rules file during compilation. Install the
> >>> executable
> >>> +file to generate udev rules on target. It should put the generated
> >>> rules file
> >>> +at /lib/udev/rules.d/65-libwacom.rules.
> >>> +
> >>> +Upstream-Status: Inappropriate [cross-compile specific]
> >>> +
> >>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>> +---
> >>> +diff --git a/meson.build b/meson.build
> >>> +index 6584c86..4009f5f 100644
> >>> +--- a/meson.build
> >>> ++++ b/meson.build
> >>> +@@ -407,20 +407,20 @@ executable('libwacom-list-local-devices',
> >>> +        include_directories: [includes_src],
> >>> +        install: true)
> >>> +
> >>> +-tools_cflags =3D ['-DTOPSRCDIR=3D"@0@"'.format(meson.source_root())=
]
> >>> ++tools_cflags =3D ['-DTOPSRCDIR=3D"@0@"'.format(meson.source_root())=
,
> >>> '-DLIBWACOM_DATA_DIR=3D"@0@"'.format(dir_data)]
> >>> +
> >>> +-gen_udev_rules =3D executable('generate-udev-rules',
> >>> ++gen_udev_rules =3D executable('libwacom-generate-udev-rules',
> >>> +                 'tools/generate-udev-rules.c',
> >>> +                 dependencies: [dep_libwacom, dep_glib],
> >>> +                 include_directories: [includes_src],
> >>> +                 c_args: tools_cflags,
> >>> +-                install: false)
> >>> +-custom_target('udev-rules',
> >>> +-          command: gen_udev_rules,
> >>> +-          capture: true,
> >>> +-          output: '65-libwacom.rules',
> >>> +-          install: true,
> >>> +-          install_dir: join_paths(dir_udev, 'rules.d'))
> >>> ++                install: true)
> >>> ++#custom_target('udev-rules',
> >>> ++#          command: gen_udev_rules,
> >>> ++#          capture: true,
> >>> ++#          output: '65-libwacom.rules',
> >>> ++#          install: true,
> >>> ++#          install_dir: join_paths(dir_udev, 'rules.d'))
> >>> +
> >>> + executable('list-devices',
> >>> +        'tools/list-devices.c',
> >>> +diff --git a/tools/generate-udev-rules.c b/tools/generate-udev-rules=
.c
> >>> +index bb00e7b..fbf49f0 100644
> >>> +--- a/tools/generate-udev-rules.c
> >>> ++++ b/tools/generate-udev-rules.c
> >>> +@@ -229,7 +229,7 @@ int main(int argc, char **argv)
> >>> +     }
> >>> +
> >>> +
> >>> +-    db =3D libwacom_database_new_for_path(TOPSRCDIR"/data");
> >>> ++    db =3D libwacom_database_new_for_path(LIBWACOM_DATA_DIR);
> >>> +
> >>> +     list =3D libwacom_list_devices_from_database(db, NULL);
> >>> +     if (!list) {
> >>> diff --git a/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
> >>> b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
> >>> new file mode 100644
> >>> index 000000000..0787ad246
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
> >>> @@ -0,0 +1,17 @@
> >>> +DESCRIPTION =3D "libwacom is a library to identify wacom tablets and
> >>> their model-specific features."
> >>> +HOMEPAGE =3D "https://github.com/linuxwacom/libwacom/wiki"
> >>> +SECTION =3D "libs"
> >>> +
> >>> +LICENSE =3D "MIT"
> >>> +LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3D40a21fffb367c82f39fd91a3b137c36e"
> >>> +
> >>> +DEPENDS =3D "libgudev libxml2"
> >>> +
> >>> +SRC_URI =3D "git://github.com/linuxwacom/libwacom.git;protocol=3Dhtt=
ps \
> >>> +           file://generate-udev-rules-on-target.patch \
> >>> +           "
> >>> +SRCREV =3D "ae6c9cf78802844349986ac2a708d87e891a3e6e"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +inherit meson pkgconfig
> >>
>
> --
> Kai Kang
>
>

