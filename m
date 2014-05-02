Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 617D3609BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 01:02:25 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fb1so4495877pad.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 18:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=6eoRNAixQMgQBbqw54PMwb+AUjdhM789Bw/d2ePUX+Q=;
	b=KUZqmaJb53Emv7uu6a14KHkeHLbMI8CxudpdLzMBcU5AhZdMEkcnnxC2yc0n8FwuG8
	DGjEbOVyNdqHA8A9WhnM3Au5T4C4GtaV95p4whnxPrR065Gh2lxqXxVipn8rh3hQahFo
	9qE+ggzqBE7GLylYClBy0bDMEwKKnKwUF7Idpi9mlVCc2Ke19bu6HmtA3mUg+vObteKy
	pnBhPUpTGWcAdWAABHu2uDPDHjVOq5+vIxqL4maeHL2KLzH6tdvE8EOQDw77Od45ird/
	IgEpKuQrMOxZD6NTzQWYGo29+oN4ihy4bhkvFQExLud33Xx7OLNMGRHfDE2V9uIMo2cD
	tjpw==
X-Received: by 10.66.254.166 with SMTP id aj6mr27953237pad.11.1398992545824;
	Thu, 01 May 2014 18:02:25 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ey5sm169174261pab.22.2014.05.01.18.02.23 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 May 2014 18:02:25 -0700 (PDT)
Message-ID: <5362EE82.8030607@gmail.com>
Date: Fri, 02 May 2014 11:01:54 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>
In-Reply-To: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 May 2014 01:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/05/2014 6:29 PM, Jacob Kroon wrote:
> Hi,
>
> For a while I've been working around a problem with using
> populate_sdk_qt5.bbclass in my image recipe, I've had to use a
> packagegroup-qt5-toolchain-target.bbappend to remove the following
> dependant packages:
>
> qt3d-dev
> qt3d-mkspecs
> qt3d-qmlplugins
> qtlocation-dev
> qtlocation-mkspecs
> qtlocation-plugins
> qtlocation-qmlplugins
>
> I'm building for wandboard-* machines, and if I try to bitbake qt3d or
> qtlocation, I get the following error:
>
> Project ERROR: Unknown module(s) in QT: opengl
>
> In my distro.conf I'm using:
>
> DISTRO_FEATURES_append = " opengl ptest systemd"
> DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"
>
> Could anyone hint at what a proper solution would be ?
>
> I'm using master branches.
>
> Build Configuration:
> BB_VERSION        = "1.23.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Fedora-20"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "wandboard-dual"
> DISTRO            = "monkey"
> DISTRO_VERSION    = "0.1"
> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta-qt5          = "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
> meta              = "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
> meta-fsl-arm      = "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
> meta-fsl-arm-extra = "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"
>
>    -- Jacob
Try adding the following to your distro.conf if you are using OpenGL ES 2.0:
PACKAGECONFIG_GL_pn-qtbase = "gles2"

Regards,
Jonathan

