Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76ACC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 08:07:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2389.1691222829479246367
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 01:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=hNNzY8tq;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3211E0003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691222828;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Abe539B7LAb9SKfhgqWc0HuWqEY30ZypwOof97jcu7Q=;
	b=hNNzY8tqDXCXOc++V/ta4DKH3VE8jh4Ob9zJjKtk0+C5GRVZpmLydQuxMSMKmErKPzh7+M
	9sAESYo6mV0ojB2T4YlY5qIp8geECcpQdggbGkj3k+tkHDfEvb4/YYCsbsYkFbmToD7q52
	gMdTgOeLZYQQUUUB/V+5OV4YUAi4AnHREF4oFQu9H5OMeAAKAlmSRD4NyO0kvUwNfDQKRK
	2HORCxE1P2tljujJ2lE1kPjj7kNdIEuwWFs/VZ0WqfwVgDKFSV7LePNikKE6p38wYb/a6c
	o2gTO8dF4W2S6ST306rc3rMeYWar8q+E2O3uootxWCLaT6GJ5tRliClB/Jg92Q==
Content-Type: multipart/mixed; boundary="===============1412751855436481096=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] libxml-libxml-perl: upgrading to 2.0209 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 08:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104288
Message-Id: <20230805080719.B76ACC001DB@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 08:07:19 +0000 (UTC)

--===============1412751855436481096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml-libxml-perl* to *2.0209* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libxml-libxml-perl failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12823 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 12823 entries from dependency cache.
Parsing recipes...done.
Parsing of 7344 .bb files complete (7338 cached, 6 parsed). 12619 targets, 353 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:287b9e43cc8f86f41cb58f5dfbbca5987ff12b5d"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-2.0209.tar.gz;name=libxml...
INFO: Rebasing devtool onto f349c73b57ce4b4beece36a7b773d8a5866219b8
WARNING: Command 'git rebase f349c73b57ce4b4beece36a7b773d8a5866219b8' failed:
First, rewinding head to replay your work on top of it...
Applying: Do not use the _libxml_check_lib() on cross-compile
Using index info to reconstruct a base tree...
M	Makefile.PL
Falling back to patching base and 3-way merge...
Auto-merging Makefile.PL
CONFLICT (content): Merge conflict in Makefile.PL
Patch failed at 0001 Do not use the _libxml_check_lib() on cross-compile
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /scratch1/auh/build-auh/workspace/sources/libxml-libxml-perl
INFO: New recipe is /scratch1/auh/build-auh/workspace/recipes/libxml-libxml-perl/libxml-libxml-perl_2.0209.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1412751855436481096==--

