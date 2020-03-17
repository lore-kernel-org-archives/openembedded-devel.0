Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A079060B35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:19:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h4so5583549wru.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GdmUR8xkMvOLzpcw4wVhel0GBnPsXQ+aNw0v4zZ7LVE=;
	b=Shz77AM4vpCJ+bg67Z5oGk2BebGdxbKTZVexDeUfAsctOVuiHTUjwogj03oHlcG2Zx
	SqYobYKY4qY9SBVkCbt0Lkc042Yx0xsIPVY1jGxgq7Ld2THjFtyWW9GJQpihlUuexzcH
	FZ/bBd01lEtpH1Bcqij09KOkcq8My5iF+3flw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GdmUR8xkMvOLzpcw4wVhel0GBnPsXQ+aNw0v4zZ7LVE=;
	b=FET5c/e3Ted15ni+9Zj5Z0ZXYf+4BnIF/rjWFjYzryfd4HdKYtfiFlNatm/3nEMUE4
	rnaSziDqlo2Lsv2UkYOM5Zn9phxfGqsmRVl54VV+vMUSgkwWak6PsvbhpDUM59UVL6Bz
	kFI9CYYcnSoy26NxBGGKEEkjv//Q5NFXPqC4W/DW1iG1UzutXudaBuWtLMTr0svQ7pU0
	snn7OwPzhZxX5ECeqXIKVKIvw4svU4Pr9eauRltDhU3FuFRMia0I2nwkOJgobA6IV0J7
	hJNYV6qvaOxLCI2xWW6DoCuIlJyzPV7ZA+wuoE2rDwiW2AIzhY2LOtQ08ppeZOAWZ5yU
	pj1A==
X-Gm-Message-State: ANhLgQ3dDzmsdvvRObqdUTltEcGJlbsqzeuc5f86XGG9oIt4xTS13jp4
	AUaOf7euzdN4vST04BY+4kttJQ==
X-Google-Smtp-Source: ADFU+vtjAW9Tzh4WfAyOv3KqcwqEibfGHWvwcGsGSptMBWMdCNxzSX+KaSnDoO84uys43F/gtspYAA==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr6536168wrl.184.1584458358809; 
	Tue, 17 Mar 2020 08:19:18 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	m187sm4209135wme.16.2020.03.17.08.19.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:19:18 -0700 (PDT)
Date: Tue, 17 Mar 2020 15:19:17 +0000
From: Paul Barker <pbarker@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200317151917.4a3f3f55@ub1910>
In-Reply-To: <8b1a37c0-ec84-6989-459a-d55c739c055c@gmail.com>
References: <c68254db-aa96-df47-7b86-179bab336393@gmail.com>
	<20200317150405.578ddb5f@ub1910>
	<8b1a37c0-ec84-6989-459a-d55c739c055c@gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: zeus pull request
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
X-List-Received-Date: Tue, 17 Mar 2020 15:19:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Mar 2020 08:12:54 -0700
akuster808 <akuster808@gmail.com> wrote:

> On 3/17/20 8:04 AM, Paul Barker wrote:
> > On Tue, 17 Mar 2020 07:48:47 -0700
> > akuster808 <akuster808@gmail.com> wrote:
> > =20
> >> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1e=
d884c:
> >>
> >> =C2=A0 fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -=
0800)
> >>
> >> are available in the Git repository at:
> >>
> >> =C2=A0 https://git.openembedded.org/meta-openembedded zeus-next
> >>
> >> for you to fetch changes up to 9e60d30669a2ad0598e9abf0cd15ee06b523986=
b:
> >>
> >> =C2=A0 sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15
> >> 13:30:34 -0700)
> >>
> >> ----------------------------------------------------------------
> >> Adrian Bunk (1):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wireshark: Upgrade 3.0.6 -> 3.0.8
> >>
> >> Carlos Rafael Giani (1):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: Enable pkg-config .pc file gene=
ration
> >>
> >> Khem Raj (2):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ade: Fix install paths in multilib buil=
ds
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sanlock: Replace cp -a with cp -R --no-=
dereference
> >>
> >> Martin Jansa (1):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s3c24xx-gpio, s3c64xx-gpio, sjf2410-lin=
ux-native, usbpath,
> >> wmiconfig: use git fetcher instead of svn fetcher
> >>
> >> Mike Krupicka (1):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: Use mosquitto.init for daemo=
n init
> >>
> >> Paul Barker (1):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lmsensors: Fix sensord dependencies
> >>
> >> Peter Kjellerstedt (2):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lvm2, libdevmapper: Do not patch config=
ure
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libldb: Do not require the "pam" distro=
 feature to be enabled
> >>
> >> Ross Burton (4):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: don't download during configure
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: also download face alignment da=
ta in do_fetch()
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: PACKAGECONFIG for G-API, use sy=
stem ADE
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: abort configure if we need to d=
ownload
> >>
> >> =C2=A0.../mosquitto/files/mosquitto.init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> >> =C2=A0.../recipes-support/libldb/libldb_1.5.6.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> >> =C2=A0.../{wireshark_3.0.6.bb =3D> wireshark_3.0.8.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 +-
> >> =C2=A0meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb=C2=A0 |=C2=A0 =
3 +-
> >> =C2=A0...lace-cp-a-with-cp-R-no-dereference-preser.patch | 51
> >> ++++++++++++++++++++++
> >> =C2=A0meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb=C2=A0 |=C2=A0 =
4 +-
> >> =C2=A0...configure-Fix-setting-of-CLDFLAGS-default.patch | 34 +-------=
-------
> >> =C2=A0...NUInstallDirs-for-detecting-install-paths.patch | 39 ++++++++=
+++++++++
> >> =C2=A0meta-oe/recipes-support/opencv/ade_0.1.1f.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> >> =C2=A0.../recipes-support/opencv/opencv/download.patch=C2=A0=C2=A0 | 3=
2 ++++++++++++++
> >> =C2=A0meta-oe/recipes-support/opencv/opencv_4.1.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 | 32 ++++++++++++--
> >> =C2=A0.../{s3c24xx-gpio_svn.bb =3D> s3c24xx-gpio_git.bb}=C2=A0=C2=A0 |=
=C2=A0 7 ++-
> >> =C2=A0.../{s3c64xx-gpio_svn.bb =3D> s3c64xx-gpio_git.bb}=C2=A0=C2=A0 |=
=C2=A0 6 +--
> >> =C2=A0...x-native_svn.bb =3D> sjf2410-linux-native_git.bb} | 11 +++--
> >> =C2=A0.../usbpath/{usbpath_svn.bb =3D> usbpath_git.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 ++---
> >> =C2=A0.../{wmiconfig_svn.bb =3D> wmiconfig_git.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++---
> >> =C2=A016 files changed, 183 insertions(+), 69 deletions(-)
> >> =C2=A0rename meta-networking/recipes-support/wireshark/{wireshark_3.0.=
6.bb =3D>
> >> wireshark_3.0.8.bb} (95%)
> >> =C2=A0create mode 100644
> >> meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-wit=
h-cp-R-no-dereference-preser.patch
> >> =C2=A0create mode 100644
> >> meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecti=
ng-install-paths.patch
> >> =C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/downloa=
d.patch
> >> =C2=A0rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_s=
vn.bb =20
> >> =3D> s3c24xx-gpio_git.bb} (73%) =20
> >> =C2=A0rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_s=
vn.bb =20
> >> =3D> s3c64xx-gpio_git.bb} (74%) =20
> >> =C2=A0rename
> >> meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb=
 =20
> >> =3D> sjf2410-linux-native_git.bb} (72%) =20
> >> =C2=A0rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb =3D>
> >> usbpath_git.bb} (68%)
> >> =C2=A0rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb =3D>
> >> wmiconfig_git.bb} (58%)
> >> =20
> > Could we also consider backport of: =20
> hmm, that might be a bit hard.=C2=A0
> >
> > kernel-yocto.bbclass: Support config fragments with externalsrc (44f04c=
03)
> > perf: Fix externalsrc support (eab605ba)
> > kernelsrc.bbclass: Fix externalsrc support (2c17d35c) =20
>=20
> aren't this in core ??

oops. Yes, I was talking about core, should have sent this as a separate
mail to the other list.

--=20
Paul Barker
Konsulko Group

