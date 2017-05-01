Return-Path: <list@xenhideout.nl>
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	by mail.openembedded.org (Postfix) with ESMTP id 568336FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 16:01:09 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 39DA61F10C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 18:01:11 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 01 May 2017 18:01:11 +0200
From: Xen <list@xenhideout.nl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8abc320ccb1265aac68072693427f8eb@xenhideout.nl>
References: <8abc320ccb1265aac68072693427f8eb@xenhideout.nl>
Message-ID: <60efb2f4be96b3eba98acf834cb98556@xenhideout.nl>
X-Sender: list@xenhideout.nl
User-Agent: Roundcube Webmail/1.2.4
Subject: Re: cacao-native 1.6.1 failing because compiler not produced?
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
X-List-Received-Date: Mon, 01 May 2017 16:01:10 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Forgot to mention that:

Loading cache: 100% | --- | Time: 0:00:00
Loaded 1 entries from dependency cache.
Parsing recipes: 100% | --- | Time: 0:01:54
Parsing of 1551 .bb files complete (1 cached, 1550 parsed). 2178 
targets, 196 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_meta-kirkwood 
'^/store/projects/embedded-java/meta-kirkwood/'
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.34.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "ubuntu-16.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta              = "master:123962018251dfb1d6ca5aa5c0d02534007de3ab"
meta-oe           = "master:e7ad92decb7025d76e2e8b2bc15349d548c8ad14"
meta-java         = "master:6eed0bbfa831f736bbab4d285c57deeec8f5d562"
meta-kirkwood     = "master:e06973b85716a1cf920dc3d27beccecf3de12bf3"

Is the main start output.

And the command I use is just bitbake openjdk-7 or bitbake openjdk-8, 
same result.

Regards.





Xen schreef op 01-05-2017 17:49:
> I am trying to compile openjdk with cacao for Armv5.



> build/tmp-glibc/work/x86_64-linux/cacao-native/1.6.1-r0/recipe-sysroot-native/usr/bin/ecj-initial
> 
> could not find java-initial which, when present, would not be able to
> find cacao-initial.

