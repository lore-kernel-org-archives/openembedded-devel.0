Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7BF701E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 00:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 474923A169AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 20:32:32 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id X-vdpntiB0j5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 20:32:25 -0400 (EDT)
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.rogue-research.com (Postfix) with ESMTPSA id C4C503A1699A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 20:32:25 -0400 (EDT)
Received: by mail-ve0-f170.google.com with SMTP id i13so4225900veh.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 17:32:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.52.159.226 with SMTP id xf2mr4886412vdb.14.1403310744978;
	Fri, 20 Jun 2014 17:32:24 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Fri, 20 Jun 2014 17:32:24 -0700 (PDT)
In-Reply-To: <CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
Date: Fri, 20 Jun 2014 20:32:24 -0400
Message-ID: <CACgAsMf1LenfvgO=+rVQUp2Kt7-+Sy9pXGDHaqdnqYsfGeexXQ@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jun 2014 00:32:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 8:22 PM, Kevyn-Alexandre Par=C3=A9
<kapare@rogue-research.com> wrote:
> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=C3=A9 wrot=
e:
>>> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL make my
>>> build fail with:
>>> ERROR: qtwebkit not found in the base feeds
>>> LOG: http://pastebin.com/fx2Zi9vW
>>> Any clue what I'm doing wrong?
>>
>> Check which packages (if any) were created by qtwebkit recipe, if any
>> then read log.do_configure for possible clues.
>>
>
> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
> pkgdata these only to have ".packaged"
> http://pastebin.com/0ugj2NVF
>
> log.do_configure:
> http://pastebin.com/cXWdDXmy
>
> What's interesting or maybe not is that dgb and dev have empty rpm
> created and not the others?
> log.do_package_write_rpm
> http://pastebin.com/Cft9Uh3J
>

replacing qtwebkit for qtwebkit-dev gave this error:

Computing transaction...error: Can't install
qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package provides qtwebkit =3D
5.2.1-r0

replace qtwebkit-dev for qtwebkit-dbg

pass and generate a new image without error !!?

BR,

-KA

