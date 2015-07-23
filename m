Return-Path: <sadlife1990@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7278B734B8;
	Thu, 23 Jul 2015 11:01:41 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so18668008wib.1;
	Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+choI/9Q35p6ZDuD+SuYS0fqAxJDnrZFL0ePOEd1598=;
	b=mcClVc+C9aNfyoKhDavhG9xGZh3va15ji6IlBfurfddTj2q8hB5MJQaC9Bx/AmD6Al
	5+VH50QlGGjwLnkJGMnUUe9+a8GwVztcufTg+/EWgA54p9eV7aBNIWMt1tQt3T87Pdv6
	6rzfOfkBYRqQOhy+NaslJcr6Cf6n97p+5habXQiF9NIZXGQ+bywHr9YhUxGh6hdPH1Uv
	LK3zpJSCY9c/mAjiHpbmYaM02ROKlsESP0/AITMdRRbztG0ekiKyPP4aCVeiicdCrvpK
	QBDoK34l6MsDCxLu20DcAEtu/FI/2pQeabE/yywAgkBBOwb0q2goGMsU7Cg4q+EyCwQy
	vWcA==
MIME-Version: 1.0
X-Received: by 10.194.60.226 with SMTP id k2mr14090855wjr.10.1437649300652;
	Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
Received: by 10.194.120.132 with HTTP; Thu, 23 Jul 2015 04:01:40 -0700 (PDT)
Date: Thu, 23 Jul 2015 14:01:40 +0300
Message-ID: <CAAHuHfxtDAi4xF8tJqiiswWGMEC-=jsryjbvuKu1Fg311J+Jyw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: qt5 webkit Nothing RPROVIDES 'liborc-0.4'
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
X-List-Received-Date: Thu, 23 Jul 2015 11:01:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying to build qt5 webkit. I seen this error message

Build Configuration:
BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "phyboard-wega-am335x-2"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):9aff3a4ec058a1a1149d026ebedcc6251089fffb"
meta-phytec       = "(nobranch):ccf1c78f312f84933b90926e9bf4f72de59e8e94"
meta-phyam335x    = "(nobranch):a6c488b268d0c2e506f293221703dafcc05b9610"
meta-oe
meta-networking
meta-python
meta-multimedia   = "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e7278"
meta-qt5          = "master:6d9e2a6dfc21f7d9a3a11b4bcb426b5dfe6feaeb"
meta-ruby         = "(nobranch):9efaed99125b1c4324663d9a1b2d3319c74e7278"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3367 tasks of which 3367 didn't need to be
rerun and all succeeded.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'liborc-0.4' (but
/home/xy/yocto/build/recipes/images/
core-image-base-edited-20150723-135844.bb RDEPENDS on or otherwise requires
it)

