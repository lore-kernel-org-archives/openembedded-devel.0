Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 77C2060D62
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 08:29:12 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so1964277lbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Pqtp+xg4vM3pYxvH2KVGYe1tejDzRnmCSlM+FE+Ztns=;
	b=V5j4EjDOlBBUI9od2CZkTXxcSX+b/ftz+dkSkgJLf6nbJCVMJ5Z9ncuaOT79dfOQdO
	HzahG7g6FWXoO0YW05/Exy8tJZvFsgHQFY/NUmKaqos3eTZv3iLzGVZCJryGe2Tx6vo1
	+N7FT0i4kHkUH4E7x4B0G0Vs0aszhBTzEj+QOyobIy1/SrrkhLoPihCq1kd/Muou0wkr
	zvIC0blkurzqtJQLZxHVEcRm6zrzbDe3grc9UtyezqdZdvNTByiNQS3qoZN2LTmEhZuj
	LxaNAvyqqBjsBWcLKLBa+1IRY1bUiwffXVQCYRxc3Sw5VJlKnVPgLBWCokfeyRgKgsOV
	zUUQ==
MIME-Version: 1.0
X-Received: by 10.152.19.65 with SMTP id c1mr843553lae.35.1398932952786; Thu,
	01 May 2014 01:29:12 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Thu, 1 May 2014 01:29:12 -0700 (PDT)
Date: Thu, 1 May 2014 10:29:12 +0200
Message-ID: <CAPbeDCkKRSjuHso9238SzkFScQb9e3nKmcyw6SfuE6Wf_231ow@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Qt5 SDK problem when building for Wandboard
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
X-List-Received-Date: Thu, 01 May 2014 08:29:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

For a while I've been working around a problem with using
populate_sdk_qt5.bbclass in my image recipe, I've had to use a
packagegroup-qt5-toolchain-target.bbappend to remove the following
dependant packages:

qt3d-dev
qt3d-mkspecs
qt3d-qmlplugins
qtlocation-dev
qtlocation-mkspecs
qtlocation-plugins
qtlocation-qmlplugins

I'm building for wandboard-* machines, and if I try to bitbake qt3d or
qtlocation, I get the following error:

Project ERROR: Unknown module(s) in QT: opengl

In my distro.conf I'm using:

DISTRO_FEATURES_append = " opengl ptest systemd"
DISTRO_FEATURES_remove = "pulseaudio sysvinit x11"

Could anyone hint at what a proper solution would be ?

I'm using master branches.

Build Configuration:
BB_VERSION        = "1.23.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-20"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "wandboard-dual"
DISTRO            = "monkey"
DISTRO_VERSION    = "0.1"
TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
TARGET_FPU        = "vfp-neon"
meta-qt5          = "master:485c277940d26e0c96953d8a649a9c84eed0afb8"
meta              = "master:4c2ffce2ae32447a1e39877b9bcbc2cc11ddd2fa"
meta-fsl-arm      = "master:27b0ffc33d75f0c37a876849a0db9c0277d5f036"
meta-fsl-arm-extra = "master:a7515d4b20e43cfdd8654249fc16ac6b8c5ec3bc"

  -- Jacob

