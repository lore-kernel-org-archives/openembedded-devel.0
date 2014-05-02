Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCE3605B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:17:06 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u14so342888lbd.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3Pds/pUudEepsRf/Pjft5eJR6QZ0rieMfxVj9orDOsk=;
	b=Z4kXqoiw+rraEeEJA245uX9LcXdwRHp6zWkE4xZAF9Wn7ECFgfidokYP0iofOb8OCt
	wAuzUH/6wVT+VFF0QItNamlIR6xdZ0d2sGiz2PW9JD/LHeUMEKleSVGiwLtl1/qs8Th3
	EzzeQUzaAul/SfZOor/H1IXq4P4zYpVR9M/qYvgFf4854PMDEz3nLzLGPAPBqCPwcZZD
	TAqSE7IHu+d7bCvEMN8Cyu66ko79A37BfqiqShOEMRwmpFqnCgFJwoMYQXigXvc8SHD+
	EueXLagByGOJjZotenp5hF9+RV6otyGwlVHci7aG8ehiWl98lHHzdt83qIYlLbmwbLO2
	4WTA==
MIME-Version: 1.0
X-Received: by 10.112.201.1 with SMTP id jw1mr49880lbc.47.1399018626543; Fri,
	02 May 2014 01:17:06 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Fri, 2 May 2014 01:17:06 -0700 (PDT)
In-Reply-To: <53633C90.8050208@gmail.com>
References: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>
	<5362EE82.8030607@gmail.com>
	<CAPbeDCn7jKZZGg2gVamYQR90tcsq=efETY3VG4q7Ovw1mdz6_Q@mail.gmail.com>
	<53633C90.8050208@gmail.com>
Date: Fri, 2 May 2014 10:17:06 +0200
Message-ID: <CAPbeDCnw6B1fYcaiEhqugGZeY9N-Eph-H1MSesb2h5UPFLt-Kg@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 May 2014 08:17:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 2, 2014 at 8:34 AM, Jonathan Liu <net147@gmail.com> wrote:

>  On 2/05/2014 4:28 PM, Jacob Kroon wrote:
>
> Hi Jonathan,
>
> On Fri, May 2, 2014 at 3:01 AM, Jonathan Liu <net147@gmail.com> wrote:
>
>>  On 1/05/2014 6:29 PM, Jacob Kroon wrote:
>>
>>> Hi,
>>>
>>> For a while I've been working around a problem with using
>>> populate_sdk_qt5.bbclass in my image recipe, I've had to use a
>>> packagegroup-qt5-toolchain-target.bbappend to remove the following
>>> dependant packages:
>>>
>>> qt3d-dev
>>> qt3d-mkspecs
>>> qt3d-qmlplugins
>>> qtlocation-dev
>>> qtlocation-mkspecs
>>> qtlocation-plugins
>>> qtlocation-qmlplugins
>>>
>>> I'm building for wandboard-* machines, and if I try to bitbake qt3d or
>>> qtlocation, I get the following error:
>>>
>>> Project ERROR: Unknown module(s) in QT: opengl
>>>
>>> In my distro.conf I'm using:
>>>
>>> DISTRO_FEATURES_append = " opengl ptest systemd"
>>> DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"
>>>
>>> Could anyone hint at what a proper solution would be ?
>>>
>>> I'm using master branches.
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.23.0"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Fedora-20"
>>> TARGET_SYS        = "arm-oe-linux-gnueabi"
>>> MACHINE           = "wandboard-dual"
>>> DISTRO            = "monkey"
>>> DISTRO_VERSION    = "0.1"
>>> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
>>> TARGET_FPU        = "vfp-neon"
>>> meta-qt5          = "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
>>> meta              = "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
>>> meta-fsl-arm      = "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
>>> meta-fsl-arm-extra = "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"
>>>
>>>    -- Jacob
>>>
>>  Try adding the following to your distro.conf if you are using OpenGL ES
>> 2.0:
>> PACKAGECONFIG_GL_pn-qtbase = "gles2"
>>
>>
>  I think this is already done by a qtbase_%.bbappend in the meta-fsl-arm
> layer. I do have:
>
> [OE jkroon@localhost build]$ bitbake -e qtbase | grep -e "^PACKAGECONFIG="
> PACKAGECONFIG="     release     udev evdev tools libs     openssl
> gles2                    jpeg libpng zlib           accessibility  tslib
> icu"
>
>  Could it be that Qt3D and QtLocation requires full OpenGL support, and
> that gles2 is not enough ?
>
>  -- Jacob
>
> I have built all Qt modules fine with gles2. However, your PACKAGECONFIG
> doesn't have "widgets".
> I think the QtOpenGL module depends on widgets.
>
>
Indeed, adding "widgets" solves the issue, many thanks.
Can we describe this dependency in the recipes somehow ?

  -- Jacob

