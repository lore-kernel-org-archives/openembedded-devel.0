Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0F09601A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 15:48:23 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id w7so3198027lbi.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=D/J5gvkf8a0dQWlLEN8EpUD/pXyyTJF985Du3aZisH8=;
	b=uQoc5tg4gly48fF6WTRqVX9UH8mZ0z7cn2dUQvEabnB5Da5FKlW9oTXsnF55QrEFVl
	6uizdXSJpENoFgI0X/lkg5TrRw5VzJtPQXnPH2jja2jmbkv+rl8d7IEUaXQP7fRBt2Y7
	yQkVrYViyuYPlGlHQlecOW3nqr0Y5ZwKQrZp1u0SHqHsEnuu6W7OV56fGtcG8o/tCy0G
	Dg91U4MVJ+69toA4nPxN2cEIDYMf9EUic4yoMbecJtiTSKfp2T0iK+540n8ufpp7ymzK
	TZtxb1nJJK2A/p4+vlX7UFM6gdAUeEqI4xa8Y67qzzpdwqT6Ht6W4+x74wVaZYz62TPj
	xFPg==
MIME-Version: 1.0
X-Received: by 10.112.150.162 with SMTP id uj2mr602334lbb.52.1399045704309;
	Fri, 02 May 2014 08:48:24 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Fri, 2 May 2014 08:48:24 -0700 (PDT)
In-Reply-To: <CAPbeDCmYQ4rx0N_+dRaBGACd1g+cPuCqp02x0bsvEyJhbEt+7Q@mail.gmail.com>
References: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>
	<5362EE82.8030607@gmail.com>
	<CAPbeDCn7jKZZGg2gVamYQR90tcsq=efETY3VG4q7Ovw1mdz6_Q@mail.gmail.com>
	<53633C90.8050208@gmail.com>
	<CAPbeDCnw6B1fYcaiEhqugGZeY9N-Eph-H1MSesb2h5UPFLt-Kg@mail.gmail.com>
	<53635681.8020201@gmail.com>
	<CAPbeDCmYQ4rx0N_+dRaBGACd1g+cPuCqp02x0bsvEyJhbEt+7Q@mail.gmail.com>
Date: Fri, 2 May 2014 17:48:24 +0200
Message-ID: <CAPbeDCnfD-MFsoy0AAwauLMTLWAWMSVhZcJ6=jNMbQath5w3gg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Qt5 SDK problem when building for Wandboard
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
X-List-Received-Date: Fri, 02 May 2014 15:48:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 2, 2014 at 5:06 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On Fri, May 2, 2014 at 10:25 AM, Jonathan Liu <net147@gmail.com> wrote:
>
>>  On 2/05/2014 6:17 PM, Jacob Kroon wrote:
>>
>>  On Fri, May 2, 2014 at 8:34 AM, Jonathan Liu <net147@gmail.com> wrote:
>>
>>>   On 2/05/2014 4:28 PM, Jacob Kroon wrote:
>>>
>>> Hi Jonathan,
>>>
>>> On Fri, May 2, 2014 at 3:01 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>>>  On 1/05/2014 6:29 PM, Jacob Kroon wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> For a while I've been working around a problem with using
>>>>> populate_sdk_qt5.bbclass in my image recipe, I've had to use a
>>>>> packagegroup-qt5-toolchain-target.bbappend to remove the following
>>>>> dependant packages:
>>>>>
>>>>> qt3d-dev
>>>>> qt3d-mkspecs
>>>>> qt3d-qmlplugins
>>>>> qtlocation-dev
>>>>> qtlocation-mkspecs
>>>>> qtlocation-plugins
>>>>> qtlocation-qmlplugins
>>>>>
>>>>> I'm building for wandboard-* machines, and if I try to bitbake qt3d or
>>>>> qtlocation, I get the following error:
>>>>>
>>>>> Project ERROR: Unknown module(s) in QT: opengl
>>>>>
>>>>> In my distro.conf I'm using:
>>>>>
>>>>> DISTRO_FEATURES_append = " opengl ptest systemd"
>>>>> DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"
>>>>>
>>>>> Could anyone hint at what a proper solution would be ?
>>>>>
>>>>> I'm using master branches.
>>>>>
>>>>> Build Configuration:
>>>>> BB_VERSION        = "1.23.0"
>>>>> BUILD_SYS         = "x86_64-linux"
>>>>> NATIVELSBSTRING   = "Fedora-20"
>>>>> TARGET_SYS        = "arm-oe-linux-gnueabi"
>>>>> MACHINE           = "wandboard-dual"
>>>>> DISTRO            = "monkey"
>>>>> DISTRO_VERSION    = "0.1"
>>>>> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
>>>>> TARGET_FPU        = "vfp-neon"
>>>>> meta-qt5          = "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
>>>>> meta              = "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
>>>>> meta-fsl-arm      = "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
>>>>> meta-fsl-arm-extra = "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"
>>>>>
>>>>>    -- Jacob
>>>>>
>>>>  Try adding the following to your distro.conf if you are using OpenGL
>>>> ES 2.0:
>>>> PACKAGECONFIG_GL_pn-qtbase = "gles2"
>>>>
>>>>
>>>  I think this is already done by a qtbase_%.bbappend in the
>>> meta-fsl-arm layer. I do have:
>>>
>>> [OE jkroon@localhost build]$ bitbake -e qtbase | grep -e
>>> "^PACKAGECONFIG="
>>> PACKAGECONFIG="     release     udev evdev tools libs     openssl
>>> gles2                    jpeg libpng zlib           accessibility  tslib
>>> icu"
>>>
>>>  Could it be that Qt3D and QtLocation requires full OpenGL support, and
>>> that gles2 is not enough ?
>>>
>>>  -- Jacob
>>>
>>>  I have built all Qt modules fine with gles2. However, your
>>> PACKAGECONFIG doesn't have "widgets".
>>> I think the QtOpenGL module depends on widgets.
>>>
>>>
>> Indeed, adding "widgets" solves the issue, many thanks.
>>  Can we describe this dependency in the recipes somehow ?
>>
>>    -- Jacob
>>
>> "widgets" is added to PACKAGECONFIG by default in meta-qt5. You could
>> submit a patch to add a comment for PACKAGECONFIG[widgets] in qtbase.inc.
>>
>>
> Something like this ?
>
> +# needed for qt3d and qtlocation (otherwise do_configure fails to find
> 'opengl' module, which in turn requires 'widgets')
>  PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>
>
Would it not be possible to write the recipe so that it depends on just the
mkspec/dev packages that are actually used in the target image ?

