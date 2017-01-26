Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0D671C5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:22:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so50976857wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mFUY57gxPnnmbO0/HJ0XRYEwt48A2LrpkyCYXK6goQw=;
	b=PipmOJG4UPPZ6A5cSeqTehYMaLzWBlB3w5GKMU1vQE4tGrDIW+W7FwfMenYvea3kwf
	37wejxhIEqLnev4mNBfD2nc1iAwYAV2jE+ts7YZhUnjboSNedzDtCckii+13j8Vb2lS8
	F0Y3f5HzoI9LlyavYVL3sIOYXoA8o1yfGsha6RZ4DqyXCEJkhyO7r6WuD/dO2DmX2LOd
	eVH0O74GTtXkGl53hn1HDUjqeGR0j2dGYd8xOYbs6M1GmAEo3fZpioq81yrvCvJZRyS1
	rIIWPFHXaweKxsH3Z7dspoUQZS1MNHbd6a4a31DLlRQN/1hjyAF88rr/NTf6MrNwKl+o
	B64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mFUY57gxPnnmbO0/HJ0XRYEwt48A2LrpkyCYXK6goQw=;
	b=ZCU5jIc0P/jW/dwf8whgA6DwuNioV7K97cGB3AzNq70KYl7zYz6JC8THoMpT6vj99h
	PTQH2kW1kBtoxeE/qC7dqMJKHbk9QLqwEL+G2zhNSiaWmGPqXgMTGDPPvV9cwqGR1zvt
	eDuLC9SQgHBQ8BfWjiVagyDG0pEGgnRFpdhfYPnhaqN6fVEKUdUUoIFtEtTDKjhFop1r
	EcqZ9gWFxu5UcOqMqj6EIDyLIwpc7ZUfd3ro5+C4KuJlJoph5rFXWS3u5zzfSXJ+qdVB
	oWbGg1g1dNiWEXqE2/8fgFRVmid22KgLQ0e5iP/4RFm9ed/G+Xmv5ppIszKkFapUREDs
	Ij6Q==
X-Gm-Message-State: AIkVDXJ1aFgP3ZHQQG2Vx2pJ93pZpRrnK+WmTzxDdQLRDEN37iYmJ9EmHzeMYh3NEx/qHLVZ9ifsmLvUrB8MSA==
X-Received: by 10.28.189.134 with SMTP id n128mr25874596wmf.77.1485444156764; 
	Thu, 26 Jan 2017 07:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.152.19 with HTTP; Thu, 26 Jan 2017 07:22:35 -0800 (PST)
In-Reply-To: <20170126125414.GA3016@jama>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
	<20170126125414.GA3016@jama>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Thu, 26 Jan 2017 16:22:35 +0100
Message-ID: <CAHvQdo1SNOuWuyeAQU_sC88cU_vMbd=PRWt4fVSaQAq3OhM7jw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 26 Jan 2017 15:22:38 -0000
Content-Type: text/plain; charset=UTF-8

Did you also see the issue with the QMAKE_INCDIR_EGL, QMAKE_LIBS_EGL
and QMAKE_CFLAGS_EGL variables?

2017-01-26 13:54 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Jan 26, 2017 at 11:00:59AM +0100, Johannes Pointner wrote:
>> Hello,
>>
>> I tried to build qtbase after this update, but it failed to configure
>> because of PACKAGECONFIG options which are no longer available or
>> moved to another part (qtmultimedia):
>> PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
>>
>> PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
>> PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
>
> Yes, I'm seeing the same issue, the flags were removed in:
>
> commit 90c425642dfeae4564b43dacf15f80479962e910
> Merge: 1a43199 9808b53
> Author: Liang Qi <liang.qi@qt.io>
> Date:   Wed Nov 16 07:37:38 2016 +0100
>
>     Merge remote-tracking branch 'origin/5.7' into 5.8
>
> but there is still PACKAGECONFIG in qtbase recipe, so this needs be
> fixed in v6.
>
>>
>> After removing them I was able to configure, but I saw following
>> warnings during the configure process:| WARNING: Unable to find file
>> /mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/git/mkspecs/linux-oe-g++/../oe-device-extra.pri
>> | WARNING: Unable to find file
>
> These warnings were there before as well, since oe-device-extra.pri
> support was added in:
>
> commit 37693b5357e790665bce4957cb7a8d5d2423390d
> Author: Samuli Piippo <samuli.piippo@theqtcompany.com>
> Date:   Thu Oct 15 13:00:31 2015 +0300
>
>     qt5: use extra .pri file from linux-oe-g++ mkspec
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

