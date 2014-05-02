Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id DD3E5605B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:26:08 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so2271507pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=dpGRGMXG0rsuPTn81ayrBGyFvZl4hPpqqYev7nT4O2k=;
	b=0j8bCMvGt0kKXEKmgcYx4yc/dDpM6INdyxqmfXblFyPY+XzmFyob3/lxbQ657vgA+8
	b7c0wCOkqlDRa+lw/pzd+iU75LMdWDTYruwU57yxDnEaR3hVOi0auRA0z1JjbS3OA/BV
	QmOJM+6NJRKb/CkanbnFErd6LhBjCOal5Ddt9gPCYe0dZD4fBCXKU5k/anDrUZ8wKheT
	4kJhVMdeQwHUnPGD1uSkwjzsbx21+WBadJQN9gSYrPLQ2rCkwL3UGoLd4EG4A1pVSflo
	j2tQNpHlTFs/9f39+4AXOkn5eSs0XphVMQCgTlE0zKNoMF8LfwwifT9mc8vNGrFmdq6I
	klMQ==
X-Received: by 10.66.147.99 with SMTP id tj3mr1527322pab.47.1399019169631;
	Fri, 02 May 2014 01:26:09 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ry8sm177453409pac.29.2014.05.02.01.26.07 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 May 2014 01:26:08 -0700 (PDT)
Message-ID: <53635681.8020201@gmail.com>
Date: Fri, 02 May 2014 18:25:37 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>	<5362EE82.8030607@gmail.com>	<CAPbeDCn7jKZZGg2gVamYQR90tcsq=efETY3VG4q7Ovw1mdz6_Q@mail.gmail.com>	<53633C90.8050208@gmail.com>
	<CAPbeDCnw6B1fYcaiEhqugGZeY9N-Eph-H1MSesb2h5UPFLt-Kg@mail.gmail.com>
In-Reply-To: <CAPbeDCnw6B1fYcaiEhqugGZeY9N-Eph-H1MSesb2h5UPFLt-Kg@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 May 2014 08:26:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/05/2014 6:17 PM, Jacob Kroon wrote:
> On Fri, May 2, 2014 at 8:34 AM, Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     On 2/05/2014 4:28 PM, Jacob Kroon wrote:
>>     Hi Jonathan,
>>
>>     On Fri, May 2, 2014 at 3:01 AM, Jonathan Liu <net147@gmail.com
>>     <mailto:net147@gmail.com>> wrote:
>>
>>         On 1/05/2014 6:29 PM, Jacob Kroon wrote:
>>
>>             Hi,
>>
>>             For a while I've been working around a problem with using
>>             populate_sdk_qt5.bbclass in my image recipe, I've had to
>>             use a
>>             packagegroup-qt5-toolchain-target.bbappend to remove the
>>             following
>>             dependant packages:
>>
>>             qt3d-dev
>>             qt3d-mkspecs
>>             qt3d-qmlplugins
>>             qtlocation-dev
>>             qtlocation-mkspecs
>>             qtlocation-plugins
>>             qtlocation-qmlplugins
>>
>>             I'm building for wandboard-* machines, and if I try to
>>             bitbake qt3d or
>>             qtlocation, I get the following error:
>>
>>             Project ERROR: Unknown module(s) in QT: opengl
>>
>>             In my distro.conf I'm using:
>>
>>             DISTRO_FEATURES_append = " opengl ptest systemd"
>>             DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"
>>
>>             Could anyone hint at what a proper solution would be ?
>>
>>             I'm using master branches.
>>
>>             Build Configuration:
>>             BB_VERSION        = "1.23.0"
>>             BUILD_SYS         = "x86_64-linux"
>>             NATIVELSBSTRING   = "Fedora-20"
>>             TARGET_SYS        = "arm-oe-linux-gnueabi"
>>             MACHINE           = "wandboard-dual"
>>             DISTRO            = "monkey"
>>             DISTRO_VERSION    = "0.1"
>>             TUNE_FEATURES     = "arm armv7a vfp neon
>>             callconvention-hard cortexa9"
>>             TARGET_FPU        = "vfp-neon"
>>             meta-qt5          =
>>             "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
>>             meta              =
>>             "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
>>             meta-fsl-arm      =
>>             "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
>>             meta-fsl-arm-extra =
>>             "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"
>>
>>                -- Jacob
>>
>>         Try adding the following to your distro.conf if you are using
>>         OpenGL ES 2.0:
>>         PACKAGECONFIG_GL_pn-qtbase = "gles2"
>>
>>
>>     I think this is already done by a qtbase_%.bbappend in the
>>     meta-fsl-arm layer. I do have:
>>
>>     [OE jkroon@localhost build]$ bitbake -e qtbase | grep -e
>>     "^PACKAGECONFIG="
>>     PACKAGECONFIG="     release     udev evdev tools libs     openssl
>>     gles2                    jpeg libpng zlib          
>>     accessibility  tslib icu"
>>
>>     Could it be that Qt3D and QtLocation requires full OpenGL
>>     support, and that gles2 is not enough ?
>>
>>     -- Jacob
>     I have built all Qt modules fine with gles2. However, your
>     PACKAGECONFIG doesn't have "widgets".
>     I think the QtOpenGL module depends on widgets.
>
> Indeed, adding "widgets" solves the issue, many thanks.
> Can we describe this dependency in the recipes somehow ?
>
>   -- Jacob
"widgets" is added to PACKAGECONFIG by default in meta-qt5. You could 
submit a patch to add a comment for PACKAGECONFIG[widgets] in qtbase.inc.

Regards,
Jonathan

