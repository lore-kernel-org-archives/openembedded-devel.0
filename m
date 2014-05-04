Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1579060E49
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 01:47:38 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so4683329pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 18:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=lHOPkiTjJQWUQcGAn3r/XACn6/R8Byi0LTRy6N/+LMM=;
	b=uZFI/a2oSYuBfcLLOXlJMclt+mhnXkClDLf5SI/R0Kk5O2Be+bpLX3ulzWW05DFhtl
	NEv4oS5/w2XngX/zQuDhIWikJxEs4TqiTiP+yL9TGjgcBFKrSFlaG+FiGU9x7hTDyoTs
	SS7HcQC7LWd151AVQKdncD7hVDLXbMeHk18GP84dsFpT4IC5ERnlD+ZZXqqxDjcIlcLi
	j3S7egzRrJr5EGmFaforhlmVq7bDW/PM7GbY4IM1ZpkBZgGLjQB9Amg7tryb+dSIPpCN
	PD7NA6hPOvxfL8ERNdUqI35LhESPf8WEiSJJ7Mj/qoKz1I/5gA/P4cVNi/agsof4zwFA
	9voA==
X-Received: by 10.66.155.102 with SMTP id vv6mr53866624pab.89.1399168059474;
	Sat, 03 May 2014 18:47:39 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	el14sm32042011pac.31.2014.05.03.18.47.36 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 May 2014 18:47:38 -0700 (PDT)
Message-ID: <53659C1A.5020808@gmail.com>
Date: Sun, 04 May 2014 11:47:06 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>	<5362EE82.8030607@gmail.com>	<CAPbeDCn7jKZZGg2gVamYQR90tcsq=efETY3VG4q7Ovw1mdz6_Q@mail.gmail.com>	<53633C90.8050208@gmail.com>	<CAPbeDCnw6B1fYcaiEhqugGZeY9N-Eph-H1MSesb2h5UPFLt-Kg@mail.gmail.com>	<53635681.8020201@gmail.com>	<CAPbeDCmYQ4rx0N_+dRaBGACd1g+cPuCqp02x0bsvEyJhbEt+7Q@mail.gmail.com>
	<CAPbeDCnfD-MFsoy0AAwauLMTLWAWMSVhZcJ6=jNMbQath5w3gg@mail.gmail.com>
In-Reply-To: <CAPbeDCnfD-MFsoy0AAwauLMTLWAWMSVhZcJ6=jNMbQath5w3gg@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 May 2014 01:47:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/05/2014 1:48 AM, Jacob Kroon wrote:
> On Fri, May 2, 2014 at 5:06 PM, Jacob Kroon <jacob.kroon@gmail.com 
> <mailto:jacob.kroon@gmail.com>> wrote:
>
>     On Fri, May 2, 2014 at 10:25 AM, Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>> wrote:
>
>         On 2/05/2014 6:17 PM, Jacob Kroon wrote:
>>         On Fri, May 2, 2014 at 8:34 AM, Jonathan Liu
>>         <net147@gmail.com <mailto:net147@gmail.com>> wrote:
>>
>>             On 2/05/2014 4:28 PM, Jacob Kroon wrote:
>>>             Hi Jonathan,
>>>
>>>             On Fri, May 2, 2014 at 3:01 AM, Jonathan Liu
>>>             <net147@gmail.com <mailto:net147@gmail.com>> wrote:
>>>
>>>                 On 1/05/2014 6:29 PM, Jacob Kroon wrote:
>>>
>>>                     Hi,
>>>
>>>                     For a while I've been working around a problem
>>>                     with using
>>>                     populate_sdk_qt5.bbclass in my image recipe,
>>>                     I've had to use a
>>>                     packagegroup-qt5-toolchain-target.bbappend to
>>>                     remove the following
>>>                     dependant packages:
>>>
>>>                     qt3d-dev
>>>                     qt3d-mkspecs
>>>                     qt3d-qmlplugins
>>>                     qtlocation-dev
>>>                     qtlocation-mkspecs
>>>                     qtlocation-plugins
>>>                     qtlocation-qmlplugins
>>>
>>>                     I'm building for wandboard-* machines, and if I
>>>                     try to bitbake qt3d or
>>>                     qtlocation, I get the following error:
>>>
>>>                     Project ERROR: Unknown module(s) in QT: opengl
>>>
>>>                     In my distro.conf I'm using:
>>>
>>>                     DISTRO_FEATURES_append = " opengl ptest systemd"
>>>                     DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"
>>>
>>>                     Could anyone hint at what a proper solution
>>>                     would be ?
>>>
>>>                     I'm using master branches.
>>>
>>>                     Build Configuration:
>>>                     BB_VERSION    = "1.23.0"
>>>                     BUILD_SYS     = "x86_64-linux"
>>>                     NATIVELSBSTRING   = "Fedora-20"
>>>                     TARGET_SYS    = "arm-oe-linux-gnueabi"
>>>                     MACHINE     = "wandboard-dual"
>>>                     DISTRO    = "monkey"
>>>                     DISTRO_VERSION    = "0.1"
>>>                     TUNE_FEATURES     = "arm armv7a vfp neon
>>>                     callconvention-hard cortexa9"
>>>                     TARGET_FPU    = "vfp-neon"
>>>                     meta-qt5    =
>>>                     "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
>>>                     meta    =
>>>                     "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
>>>                     meta-fsl-arm    =
>>>                     "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
>>>                     meta-fsl-arm-extra =
>>>                     "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"
>>>
>>>                        -- Jacob
>>>
>>>                 Try adding the following to your distro.conf if you
>>>                 are using OpenGL ES 2.0:
>>>                 PACKAGECONFIG_GL_pn-qtbase = "gles2"
>>>
>>>
>>>             I think this is already done by a qtbase_%.bbappend in
>>>             the meta-fsl-arm layer. I do have:
>>>
>>>             [OE jkroon@localhost build]$ bitbake -e qtbase | grep -e
>>>             "^PACKAGECONFIG="
>>>             PACKAGECONFIG=" release udev evdev tools libs openssl
>>>             gles2 jpeg libpng zlib accessibility tslib icu"
>>>
>>>             Could it be that Qt3D and QtLocation requires full
>>>             OpenGL support, and that gles2 is not enough ?
>>>
>>>             -- Jacob
>>             I have built all Qt modules fine with gles2. However,
>>             your PACKAGECONFIG doesn't have "widgets".
>>             I think the QtOpenGL module depends on widgets.
>>
>>         Indeed, adding "widgets" solves the issue, many thanks.
>>         Can we describe this dependency in the recipes somehow ?
>>
>>           -- Jacob
>         "widgets" is added to PACKAGECONFIG by default in meta-qt5.
>         You could submit a patch to add a comment for
>         PACKAGECONFIG[widgets] in qtbase.inc.
>
>
>     Something like this ?
>
>     +# needed for qt3d and qtlocation (otherwise do_configure fails to
>     find 'opengl' module, which in turn requires 'widgets')
>      PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>
Looks okay, though I haven't verified this myself.

>
>
> Would it not be possible to write the recipe so that it depends on 
> just the mkspec/dev packages that are actually used in the target image ?
>
I can't think of a good way to do that at the moment though there has 
been some minimal discussion about improving the SDK generation:
http://article.gmane.org/gmane.comp.handhelds.openembedded.core/48084
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5429

Regards,
Jonathan


