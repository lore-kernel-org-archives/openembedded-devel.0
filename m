Return-Path: <marek.belisko@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id C8F3278258
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:34:41 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q24so164523lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3mYkW077uKiA2Ed3F4D6hCTFtXHKiBYZV+qY28lPp+A=;
	b=WiUmq3SpnREAQTCFniHcJmVh6SlJ4vcsdGCZajoMtXQ3q7gmAJmBamDOiGJIceP6wc
	kWkSx/j/cWMRU5OwOmCRvtTacd/2kKcFu2kk2L1tcs8f0t+cJwwLTt8dhq1aAs+j+NSh
	/7tDtBZ/w82UUlkzuYKrWO77khwFB/gxV+c4XoCZbY2ndfFN7qScL0wS0bPSWnU2dpfk
	lxiOEv5Mt/VhmBmTCRIAAcWpWeQKERNVhft+dFsuyG8okyE1XyYzY5oGU2J/J931JXUm
	SDVzbPFDmtyVdnPnOGyKfyMaG+09DyPYtXcjCC1kkYCeLVjFQGqB0Kri4EYX6PoZnWho
	x3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3mYkW077uKiA2Ed3F4D6hCTFtXHKiBYZV+qY28lPp+A=;
	b=nNil7lcixosfstMC2KBtogoz9RgG55cpIAT5CiW2Dqkx4paVrqwjd1WRfOwwYvOC3s
	oey0YePJJzQ6T+gMWOJigALn/NstS/xlpRBhErNRzawHvf5g7YRCWHRWO18BqdgbSULY
	mA42Hu92m11yul6mNtH+mD0vqir4D/jJXWTw8kXW2GILjNjljedKTFZe4ufAqt0avehh
	h9F7MCXmuJyWitW27CMqRc6wCwWPS8/wl3ahpr4AALLfGpife2JJj3xJ/Cle3s1lRqiW
	E6k4HZV4f9dcTXVIXqQ4Wer+NrATb2TRHupiRYWFCJEMwzVkr7a9kG7JegnZGQtKztBR
	UTUQ==
X-Gm-Message-State: AODbwcCC5aoSVA3Er1x9zFJep5WM6aV+RQulJWv32xdolUVoiNjyN0F1
	qYsIBnfLYJ55AVwZG7BJ074xGBpYEw==
X-Received: by 10.46.84.92 with SMTP id y28mr148923ljd.63.1495780482308; Thu,
	25 May 2017 23:34:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.141.202 with HTTP; Thu, 25 May 2017 23:34:41 -0700 (PDT)
In-Reply-To: <CAC+thW0ENBbO+TAG7G5cMLSLryj1V00iU1+bC+zRPbvN0dJpig@mail.gmail.com>
References: <1495779679-26874-1-git-send-email-marek.belisko@open-nandra.com>
	<CAC+thW0ENBbO+TAG7G5cMLSLryj1V00iU1+bC+zRPbvN0dJpig@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 26 May 2017 08:34:41 +0200
Message-ID: <CAAfyv37_wwc9aBTeEj3dvBjZwSw6CR7CD7jzLRu=5TdC4WCDmA@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] recipes-support: Move libgpiod to meta-oe directory
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
X-List-Received-Date: Fri, 26 May 2017 06:34:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 8:29 AM, Andrea Galbusera <gizero@gmail.com> wrote:
>
>
> On Fri, May 26, 2017 at 8:21 AM, Marek Belisko
> <marek.belisko@open-nandra.com> wrote:
>>
>> Previously it was placed in meta directory which is
>> wrong. Move to meta-oe.
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>  meta-oe/recipes-support/libgpiod/libgpiod.bb | 30
>> ++++++++++++++++++++++++++++
>>  meta/recipes-support/libgpiod/libgpiod.bb    | 30
>> ----------------------------
>>  2 files changed, 30 insertions(+), 30 deletions(-)
>>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.bb
>>  delete mode 100644 meta/recipes-support/libgpiod/libgpiod.bb
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb
>> b/meta-oe/recipes-support/libgpiod/libgpiod.bb
>> new file mode 100644
>> index 0000000..fe56f7b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = "C library and tools for interacting with the linux GPIO
>> character device"
>> +HOMEPAGE = "https://github.com/brgl/libgpiod"
>> +
>> +LICENSE = "LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>> +
>> +UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
>> +
>> +SRC_URI = "git://github.com/brgl/libgpiod.git"
>> +
>> +SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
>> +
>> +PV = "0.2+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
>> +SRC_URI[sha256sum] =
>> "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
>> +
>> +inherit autotools pkgconfig
>> +
>> +# enable tools
>> +PACKAGECONFIG ?= "tools"
>> +
>> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
>> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
>> +
>> +PACKAGES += " ${PN}-tools"
>> +
>> +FILES_${PN}-tools = "${bindir}/*"
>> diff --git a/meta/recipes-support/libgpiod/libgpiod.bb
>> b/meta/recipes-support/libgpiod/libgpiod.bb
>> deleted file mode 100644
>> index fe56f7b..0000000
>> --- a/meta/recipes-support/libgpiod/libgpiod.bb
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -SUMMARY = "C library and tools for interacting with the linux GPIO
>> character device"
>> -HOMEPAGE = "https://github.com/brgl/libgpiod"
>> -
>> -LICENSE = "LGPLv2.1+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>> -
>> -UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
>> -
>> -SRC_URI = "git://github.com/brgl/libgpiod.git"
>> -
>> -SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
>> -
>> -PV = "0.2+git${SRCPV}"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
>> -SRC_URI[sha256sum] =
>> "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
>> -
>> -inherit autotools pkgconfig
>> -
>> -# enable tools
>> -PACKAGECONFIG ?= "tools"
>> -
>> -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
>> -PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
>> -
>> -PACKAGES += " ${PN}-tools"
>> -
>> -FILES_${PN}-tools = "${bindir}/*"
>> --
>> 2.7.4
>>
>
> I'm not a maintainer here, but you should probably send v2 with -M to detect
> renames (see
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/README)
Oh OK thanks. Done.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

