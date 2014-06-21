Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id A2433701A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 03:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id A507D3A17884
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 23:35:42 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 1pMKZ4Q4bNtp
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 23:35:36 -0400 (EDT)
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.rogue-research.com (Postfix) with ESMTPSA id EE1B53A17878
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 23:35:35 -0400 (EDT)
Received: by mail-we0-f177.google.com with SMTP id u56so4605248wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 20:35:34 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.76.212 with SMTP id m20mr9002767wjw.30.1403321734664;
	Fri, 20 Jun 2014 20:35:34 -0700 (PDT)
Received: by 10.180.205.175 with HTTP; Fri, 20 Jun 2014 20:35:34 -0700 (PDT)
In-Reply-To: <20140621010508.GC2117@jama>
References: <CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
	<CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
	<20140620081307.GW2117@jama>
	<CACgAsMeUBoXLNq48-2fz_ifnxf=nHGwE_RvAc-q+E_HRGmoYsA@mail.gmail.com>
	<20140620234853.GA2117@jama>
	<CACgAsMczZMkbPJ4VsfA8iHBKysS1uLKzDqxLxgkQr7cU_n1TmQ@mail.gmail.com>
	<20140621010508.GC2117@jama>
Date: Fri, 20 Jun 2014 23:35:34 -0400
Message-ID: <CACgAsMdguugQZiTiOo8aWaBZFCYnsWUtp7-0KWu7VdGvdBDCSA@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Jun 2014 03:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jun 20, 2014 at 08:22:39PM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
>> On Fri, Jun 20, 2014 at 7:48 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Fri, Jun 20, 2014 at 06:30:09PM -0400, Kevyn-Alexandre Par=C3=A9 wr=
ote:
>> >> [1] I still don't understand why adding qtwebkit IMAGE_INSTALL make m=
y
>> >> build fail with:
>> >> ERROR: qtwebkit not found in the base feeds
>> >> LOG: http://pastebin.com/fx2Zi9vW
>> >> Any clue what I'm doing wrong?
>> >
>> > Check which packages (if any) were created by qtwebkit recipe, if any
>> > then read log.do_configure for possible clues.
>> >
>>
>> qtwebkit-dbg and qtwebkit-dev is part of deploy rpm not qtwebkit? In
>> pkgdata these only to have ".packaged"
>> http://pastebin.com/0ugj2NVF
>>
>> log.do_configure:
>> http://pastebin.com/cXWdDXmy
>
> The WebKit build was disabled for the following reasons:
>     * ICU is required. To build QtWebKit with Qt 5 you need to build Qt
>      5 with libICU support. Check for ICU support being mentioned in
>      qtbase/config.summary.
>

Yes you told me that in previous email I when to
layers.openembedded.org to check

icu  53.1 International Component for Unicode libraries   openembedded-core

I add it in PACKAGECONFIG_append_pn-qtbase and IMAGE_INSTALL I thought
it will be enough?

Obviously, I'm still missing somethink

qtbase/config.summary? you mean qtbase.inc?

I see icu only mention in

poky/meta-qt5$ grep -Ri ICU *
COPYING.MIT:FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE
licenses/DIGIA-TPLA-2.4:merchantability, fitness for a particular
purpose, title and
licenses/DIGIA-TPLA-2.4:merchantability, fitness for a particular
purpose, title and
recipes-qt/qt5/qtwebkit.inc:DEPENDS +=3D "qtbase qtdeclarative icu
ruby-native sqlite3 glib-2.0 libxslt"
recipes-qt/qt5/qtbase.inc:# be aware that you need to add icu to build
qtwebkit, default
recipes-qt/qt5/qtbase.inc:PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"
recipes-qt/qt5/qtbase-native.inc:    -no-icu \

My qtbase log.do_configure shows that it have been enable:
http://pastebin.com/g7Lh5cPU

>> What's interesting or maybe not is that dgb and dev have empty rpm
>> created and not the others?
>> log.do_package_write_rpm
>> http://pastebin.com/Cft9Uh3J
>
> -dbg and -dev are configured to create empty package
> ALLOW_EMPTY_<pkgname>
>

Aa, I'm only seeing it for these:

poky/meta-qt5$ grep -R ALLOW_EMPTY *
recipes-qt/qt5/qtimageformats.inc:ALLOW_EMPTY_${PN} =3D "1"
recipes-qt/qt5/qtbase.inc:ALLOW_EMPTY_${PN}-fonts =3D "1"

BR,

-KA

