Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id A56746FD38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 20:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id AD1773A07EE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:32:25 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9GNV+TeOZZ5J
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:32:18 -0400 (EDT)
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 5ECB63A07EDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:32:18 -0400 (EDT)
Received: by mail-vc0-f173.google.com with SMTP id lf12so2716683vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 13:32:17 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.195.172 with SMTP id if12mr4384815vec.12.1403209937610;
	Thu, 19 Jun 2014 13:32:17 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Thu, 19 Jun 2014 13:32:17 -0700 (PDT)
In-Reply-To: <20140619192658.GS2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
Date: Thu, 19 Jun 2014 16:32:17 -0400
Message-ID: <CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Jun 2014 20:32:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On Thu, Jun 19, 2014 at 3:26 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

>>   ruby \
>>   qtbase \
>>   qtconnectivity \
>>   qtdeclarative \
>>   qtgraphicaleffects \
>>   qtimageformats \
>>   qtlocation \
>>   qtmultimedia \
>>   qtquick1 \
>>   qtquickcontrols \
>>   qtscript \
>>   qtsensors \
>>   qtserialport \
>>   qtsvg \
>>   qtsystems \
>>   qttools \
>>   qtwebkit \
>>   qtwebkit-examples \
>>   qtx11extras \
>>   qtxmlpatterns \
>>   qsiv \
>>   packagegroup-qt5-qtcreator-debug \
>>   packagegroup-qt5-toolchain-target \
>>   meta-toolchain-qt5 \
>>   maliit-framework-qt5 \
>>   maliit-plugins-qt5 \
>>   cinematicexperience \
>
> recipe-name != package-name, check which packages were created by those
> recipes and include those in your image.
>

Yes still a lot to learn...

So I could do
bitbake qtbase
ls tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.2.1-r0/packages-split/
qtbase      qtbase-doc           qtbase-examples-dev
qtbase-fonts-pfa  qtbase-fonts-ttf-dejavu  qtbase-mkspecs
qtbase-plugins.shlibdeps  qtbase.shlibdeps  qtbase-tools-dbg
qtbase-dbg  qtbase-examples      qtbase-examples-staticdev
qtbase-fonts-pfb  qtbase-fonts-ttf-vera    qtbase-plugins
qtbase-qmlplugins         qtbase-staticdev  qtbase-tools.shlibdeps
qtbase-dev  qtbase-examples-dbg  qtbase-fonts
qtbase-fonts-qpf  qtbase-locale            qtbase-plugins-dbg
qtbase-qmlplugins-dbg     qtbase-tools

or use bitbake -e qtbase | grep PACKAGES=

Other solutions?

BR,

-KA

