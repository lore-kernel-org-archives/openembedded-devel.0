Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id C14EA70247
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 00:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id B97653A09E05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 20:38:26 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id q1IXtdKw86KS
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 20:38:20 -0400 (EDT)
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 0F4023A09DFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 20:38:20 -0400 (EDT)
Received: by mail-ve0-f170.google.com with SMTP id i13so3054725veh.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:38:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.52.29.236 with SMTP id n12mr8224vdh.38.1403224699371; Thu,
	19 Jun 2014 17:38:19 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 17:38:19 -0700 (PDT)
In-Reply-To: <20140619232132.GV2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
	<20140619232132.GV2117@jama>
Date: Thu, 19 Jun 2014 20:38:19 -0400
Message-ID: <CACgAsMdCCZNcNwmLF-BEEcY=JuTtMCPL9K+9TEhCKU7Q+DAs4g@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Jun 2014 00:38:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 7:21 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 19, 2014 at 07:06:08PM -0400, Kevyn-Alexandre Par=C3=A9 wrote=
:
>> I'm a bit further but still have some interrogations?
>>
>> ERROR: qtwebkit not found in the base feeds (overo armv7a-vfp-neon
>> armv7a-vfp armv7a armv6-vfp armv6 armv5e-vfp armv5e armv5-vfp armv5
>> armv4 arm noarch any all)
>>
>> I'm having these included in my image:
>>
>>   ruby \
>>   qtbase \
>>   qtbase-fonts \
>>   qtbase-fonts-ttf-vera \
>>   qtbase-fonts-ttf-dejavu \
>>   qtbase-fonts-pfa \
>>   qtbase-fonts-pfb \
>>   qtbase-fonts-qpf \
>>   qtbase-tools-dbg \
>>   qtbase-plugins-dbg \
>>   qtbase-tools \
>>   qtbase-plugins \
>>   qtbase-mkspecs \
>>   qtbase-dev \
>>   qtdeclarative-qmlplugins-dbg \
>>   qtdeclarative-tools-dbg \
>>   qtdeclarative-plugins-dbg \
>>   qtdeclarative-qmlplugins \
>>   qtdeclarative-tools \
>>   qtdeclarative-plugins \
>>   qtdeclarative-mkspecs \
>>   qtdeclarative-dbg \
>>   qtdeclarative-dev \
>>   qtdeclarative \
>>   qtquick1-qmlplugins-dbg \
>>   qtquick1-tools-dbg \
>>   qtquick1-plugins-dbg \
>>   qtquick1-qmlplugins \
>>   qtquick1-tools \
>>   qtquick1-plugins \
>>   qtquick1-mkspecs \
>>   qtquick1-dbg \
>>   qtquick1-dev \
>>   qtquick1 \
>>   qttools-tools-dbg \
>>   qttools-tools \
>>   qttools-mkspecs \
>>   qttools-dbg \
>>   qttools-dev \
>>   qttools \
>>   qtwebkit \
>>
>> [1] Why the bitbake qtwebkit is working but not when I'm including it
>> in my image?
>
> What PACKAGECONFIG values are you using (especially for qtbase)?

Sorry for a lot of newbie questions... But I have not play with PACKAGECONF=
IG
I didn't change PACKAGECONFIG. The only thing I was doing was to add
previous list of packages to IMAGE_INSTALL +=3D

>
> carefully read comments in qtbase.inc
>

Reading it make me remember that what I want to do, enable qtquick,
that depends on qtquick1.inc:

DEPENDS +=3D "qtscript qtsvg qtxmlpatterns qtwebkit"

I thought that simply adding them to the IMAGE_INSTALL will be enough

Then in qtbase.inc:

# separate some parts of PACKAGECONFIG which are often changed
# be aware that you need to add icu to build qtwebkit, default
# PACKAGECONFIG is kept rather minimal for people who don't need
# stuff like webkit (and it's easier to add options than remove)

So could this be because I'm not adding the icu?

PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"

So from a old email you respond:
https://www.mail-archive.com/yocto@yoctoproject.org/msg16316.html

I think that if I want to enable the icu I need to add???
PACKAGECONFIG vim ??=3D "icu" in my local.conf or could I add it
somewhere else? like in the recipe of my image?

Still confuse about that part...

BR,

-KA

