Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B422601C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:04:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w16so9712938wrv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=x5rncQppC2vIVEMSXy+wyI42K8WDsRXoPDXz2ddoP18=;
	b=HjQ2JBbDTjFLX66OS51vS4VGwRNbQ9VYF90fNeTShbUNv4AvnMF3wphuAedWlUcGPr
	FWUdSCHEjHxf5P12s/P/gE7z9AF24BhbKFrBdIEJrqrsY0PZgjjoEXukj1wwHKYdC6xZ
	rnmPlZGZR7zmmXSD3RfTobH9RaSWYz9Uj9EiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=x5rncQppC2vIVEMSXy+wyI42K8WDsRXoPDXz2ddoP18=;
	b=eo2Qg9Km6ID+qIQ5CXIGroRmqsSlD5PyREfutKqkrG3IVKA2V64QjQwntKonUJdzs6
	IyYLb3qL6o2WRg+XbIVC/nUS5D9SsoeckLLzKQxgiddoE4G0rklOEWqqZbJXJia0ygrA
	SoWLwxijxFbosycycnS7L0EnQiQBhTSvsauqeFFJD8DTzidnCBR1pMqZnIkna9op5IDh
	e5wNAZU3h2jcKprrEhYlozBXhdgkfIT8jmZ8NjMQ2wzJiZDgvPQ/qw0mZQgf1z6AiNya
	EMMxgOhoH6b0l00fYOGPF4qeDJqe5qM9HHVBPineZVy9GhOa+3EwhgbWgjuIx3+uCroz
	EZ6g==
X-Gm-Message-State: ANhLgQ0g8Q1I4FnTHHCQTNJ4he8ITwY50BzwUoolG8sVDP+xUlpZsIlq
	Ewf+kcGsruQvulrkTZNm3ILWgA==
X-Google-Smtp-Source: ADFU+vstcVBek97BklyNHsk1cgJKNAmXpnVW5VbpbnM1sB6Yyby30+owb4BPU08FeQEfFq4gnOM/Ig==
X-Received: by 2002:a5d:6388:: with SMTP id p8mr6336562wru.51.1584457447519;
	Tue, 17 Mar 2020 08:04:07 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	f15sm4284400wmj.25.2020.03.17.08.04.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:04:07 -0700 (PDT)
Date: Tue, 17 Mar 2020 15:04:05 +0000
From: Paul Barker <pbarker@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200317150405.578ddb5f@ub1910>
In-Reply-To: <c68254db-aa96-df47-7b86-179bab336393@gmail.com>
References: <c68254db-aa96-df47-7b86-179bab336393@gmail.com>
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
X-List-Received-Date: Tue, 17 Mar 2020 15:04:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Mar 2020 07:48:47 -0700
akuster808 <akuster808@gmail.com> wrote:

> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed88=
4c:
>=20
> =C2=A0 fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -080=
0)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://git.openembedded.org/meta-openembedded zeus-next
>=20
> for you to fetch changes up to 9e60d30669a2ad0598e9abf0cd15ee06b523986b:
>=20
> =C2=A0 sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15
> 13:30:34 -0700)
>=20
> ----------------------------------------------------------------
> Adrian Bunk (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wireshark: Upgrade 3.0.6 -> 3.0.8
>=20
> Carlos Rafael Giani (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: Enable pkg-config .pc file generat=
ion
>=20
> Khem Raj (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ade: Fix install paths in multilib builds
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sanlock: Replace cp -a with cp -R --no-der=
eference
>=20
> Martin Jansa (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-=
native, usbpath,
> wmiconfig: use git fetcher instead of svn fetcher
>=20
> Mike Krupicka (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: Use mosquitto.init for daemon i=
nit
>=20
> Paul Barker (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lmsensors: Fix sensord dependencies
>=20
> Peter Kjellerstedt (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lvm2, libdevmapper: Do not patch configure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libldb: Do not require the "pam" distro fe=
ature to be enabled
>=20
> Ross Burton (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: don't download during configure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: also download face alignment data =
in do_fetch()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: PACKAGECONFIG for G-API, use syste=
m ADE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opencv: abort configure if we need to down=
load
>=20
> =C2=A0.../mosquitto/files/mosquitto.init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../recipes-support/libldb/libldb_1.5.6.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0.../{wireshark_3.0.6.bb =3D> wireshark_3.0.8.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 +-
> =C2=A0meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb=C2=A0 |=C2=A0 3 +-
> =C2=A0...lace-cp-a-with-cp-R-no-dereference-preser.patch | 51
> ++++++++++++++++++++++
> =C2=A0meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb=C2=A0 |=C2=A0 4 +-
> =C2=A0...configure-Fix-setting-of-CLDFLAGS-default.patch | 34 +----------=
----
> =C2=A0...NUInstallDirs-for-detecting-install-paths.patch | 39 +++++++++++=
++++++
> =C2=A0meta-oe/recipes-support/opencv/ade_0.1.1f.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../recipes-support/opencv/opencv/download.patch=C2=A0=C2=A0 | 32 +=
+++++++++++++
> =C2=A0meta-oe/recipes-support/opencv/opencv_4.1.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 32 ++++++++++++--
> =C2=A0.../{s3c24xx-gpio_svn.bb =3D> s3c24xx-gpio_git.bb}=C2=A0=C2=A0 |=C2=
=A0 7 ++-
> =C2=A0.../{s3c64xx-gpio_svn.bb =3D> s3c64xx-gpio_git.bb}=C2=A0=C2=A0 |=C2=
=A0 6 +--
> =C2=A0...x-native_svn.bb =3D> sjf2410-linux-native_git.bb} | 11 +++--
> =C2=A0.../usbpath/{usbpath_svn.bb =3D> usbpath_git.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0 | 10 ++---
> =C2=A0.../{wmiconfig_svn.bb =3D> wmiconfig_git.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++---
> =C2=A016 files changed, 183 insertions(+), 69 deletions(-)
> =C2=A0rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.b=
b =3D>
> wireshark_3.0.8.bb} (95%)
> =C2=A0create mode 100644
> meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-c=
p-R-no-dereference-preser.patch
> =C2=A0create mode 100644
> meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-=
install-paths.patch
> =C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/download.p=
atch
> =C2=A0rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.=
bb
> =3D> s3c24xx-gpio_git.bb} (73%)
> =C2=A0rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.=
bb
> =3D> s3c64xx-gpio_git.bb} (74%)
> =C2=A0rename
> meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb
> =3D> sjf2410-linux-native_git.bb} (72%)
> =C2=A0rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb =3D>
> usbpath_git.bb} (68%)
> =C2=A0rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb =3D>
> wmiconfig_git.bb} (58%)
>=20

Could we also consider backport of:

kernel-yocto.bbclass: Support config fragments with externalsrc (44f04c03)
perf: Fix externalsrc support (eab605ba)
kernelsrc.bbclass: Fix externalsrc support (2c17d35c)

Thanks,

--=20
Paul Barker
Konsulko Group

