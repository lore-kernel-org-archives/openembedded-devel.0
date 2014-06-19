Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id C6FCE70243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id C29793A094A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:06:13 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id lcEpijrPrddL
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:06:09 -0400 (EDT)
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 24B813A09494
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:06:09 -0400 (EDT)
Received: by mail-vc0-f169.google.com with SMTP id la4so2868008vcb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:06:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.52.252.4 with SMTP id zo4mr5440470vdc.20.1403219168262; Thu,
	19 Jun 2014 16:06:08 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 16:06:08 -0700 (PDT)
In-Reply-To: <CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
Date: Thu, 19 Jun 2014 19:06:08 -0400
Message-ID: <CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Jun 2014 23:06:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm a bit further but still have some interrogations?

ERROR: qtwebkit not found in the base feeds (overo armv7a-vfp-neon
armv7a-vfp armv7a armv6-vfp armv6 armv5e-vfp armv5e armv5-vfp armv5
armv4 arm noarch any all)

I'm having these included in my image:

  ruby \
  qtbase \
  qtbase-fonts \
  qtbase-fonts-ttf-vera \
  qtbase-fonts-ttf-dejavu \
  qtbase-fonts-pfa \
  qtbase-fonts-pfb \
  qtbase-fonts-qpf \
  qtbase-tools-dbg \
  qtbase-plugins-dbg \
  qtbase-tools \
  qtbase-plugins \
  qtbase-mkspecs \
  qtbase-dev \
  qtdeclarative-qmlplugins-dbg \
  qtdeclarative-tools-dbg \
  qtdeclarative-plugins-dbg \
  qtdeclarative-qmlplugins \
  qtdeclarative-tools \
  qtdeclarative-plugins \
  qtdeclarative-mkspecs \
  qtdeclarative-dbg \
  qtdeclarative-dev \
  qtdeclarative \
  qtquick1-qmlplugins-dbg \
  qtquick1-tools-dbg \
  qtquick1-plugins-dbg \
  qtquick1-qmlplugins \
  qtquick1-tools \
  qtquick1-plugins \
  qtquick1-mkspecs \
  qtquick1-dbg \
  qtquick1-dev \
  qtquick1 \
  qttools-tools-dbg \
  qttools-tools \
  qttools-mkspecs \
  qttools-dbg \
  qttools-dev \
  qttools \
  qtwebkit \

[1] Why the bitbake qtwebkit is working but not when I'm including it
in my image?

BR,

-KA


On Thu, Jun 19, 2014 at 5:34 PM, Kevyn-Alexandre Par=C3=A9
<kapare@rogue-research.com> wrote:
> On Thu, Jun 19, 2014 at 5:08 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Thu, Jun 19, 2014 at 04:32:17PM -0400, Kevyn-Alexandre Par=C3=A9 wrot=
e:
>>> Hi Martin,
>>>
>>> On Thu, Jun 19, 2014 at 3:26 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>
> ...
>>> or use bitbake -e qtbase | grep PACKAGES=3D
>>>
>>> Other solutions?
>>
>> buildhistory is great tool
>>
>
> k reading:
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#maint=
aining-build-output-quality
>
> thx!
>
> -KA

