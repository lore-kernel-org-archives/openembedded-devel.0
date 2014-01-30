Return-Path: <ridishonline@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 55EF86E98F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 23:22:53 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so20043172ykr.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 15:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pRHpkAWxRw055R8INGksuwyOzNPss5AQwTfirSSbkSg=;
	b=K4NlwTafMo9KOyY6qdvE78OeUCQ6iu2OTGw0af+dipVaFjr1u0VfhPwmObjdvQsxiL
	g0BxdN109Tg+1oOMQM5VKE2bcsWF7kIxrtZXjRvDs7ZIFtGOWcllLKkIh7vg+NOFK0Vq
	v3ULibt7vsBl/Xf4Lg3dHglnfguN2ASuBE5Whs5y0an+0+0aMhLjBXnnnXYuuH+Px7V4
	Z7R+AwbRFAENTOPvzQLnSmJhS3sJcoOnMLLK32r4gDPPmGzhJDbFyrdNJy/aNeukG/7K
	OTtHTfHa0czCEmbawXMHx/yQFyDLRMWYnotzqZft5Dygm8WNbr9pU3RToF885k/DjwEm
	3zKQ==
MIME-Version: 1.0
X-Received: by 10.236.82.46 with SMTP id n34mr15882582yhe.25.1391124173187;
	Thu, 30 Jan 2014 15:22:53 -0800 (PST)
Received: by 10.170.49.200 with HTTP; Thu, 30 Jan 2014 15:22:53 -0800 (PST)
In-Reply-To: <CF101C5B.40876%Sanjay_Dorairaj@cable.comcast.com>
References: <lceiek$4oe$1@ger.gmane.org>
	<CF101C5B.40876%Sanjay_Dorairaj@cable.comcast.com>
Date: Thu, 30 Jan 2014 15:22:53 -0800
Message-ID: <CAMHavcLpxG+zE-+x5VHCwVX_oFCj7OmuGXpjWbC4Dc-rGkK6Cg@mail.gmail.com>
From: Ridish Rema Aravindan <ridishonline@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "ridish.ra@lntinfotech.com" <ridish.ra@lntinfotech.com>
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
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
X-List-Received-Date: Thu, 30 Jan 2014 23:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I applied the patch provided by Koen but still I face the same issue.

ridish@sanjay-Precision-M4500:~/RDK-RI-NICO-2/build-qemux86$ bitbake
rdk-generic-image -c populate_sdk
Loading cache: 100%
|##################################################################################################################################################|
ETA:  00:00:00
Loaded 1945 entries from dependency cache.
Parsing recipes: 100%
|################################################################################################################################################|
Time: 00:00:02
Parsing of 1546 .bb files complete (1543 cached, 3 parsed). 1946 targets,
107 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for eglibc (eglibc,
external-linaro-toolchain)
NOTE: consider defining a PREFERRED_PROVIDER entry to match eglibc
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg

Build Configuration:
BB_VERSION        = "1.20.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "i586-rdk-linux"
MACHINE           = "qemux86"
DISTRO            = "rdk"
DISTRO_VERSION    = "0.1+snapshot-20140130"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "(nobranch):198623d80d31f19c963e61d03cbcb12dd318dfdf"
toolchain-layer
meta-multimedia
meta-oe
meta-networking
meta-ruby         = "(nobranch):fdf74512fc4e8514ad74458601adb96916f7cf72"
meta-linaro
meta-linaro-toolchain =
"(nobranch):8aaf10d8dda34bc02d4ef62d0501b83603b6f827"
meta-rdk          =
"contrib/ndec/rdk-ri:b0bcf359aed07d86a2175df01d2bcae069e7c867"
meta-qt5          = "(nobranch):cefaba69a785c5221463f0eb496b749d5ddf8a5a"
meta-rdk-cpc      = "(nobranch):80e239735dd5f1e08026d66df6b25b0f5a782bfb"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Command Error: exit status: 1  Output:
Applying patch relocatable_sdk.patch
can't find file to patch at input line 13
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Upstream-Status: Inappropriate [SDK specific]
|
|In order to be able to change the dynamic loader path when relocating
|binaries, the interp section has to be made big enough to accomodate
|the new path (4096 is the maximum path length in Linux).
|
|Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
|
|Index: qemu-1.4.0/ldscripts/i386.ld
|===================================================================
|--- qemu-1.4.0.orig/ldscripts/i386.ld  2013-02-15 15:05:35.000000000 -0800
|+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.138816418 -0800
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 26
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: qemu-1.4.0/ldscripts/x86_64.ld
|===================================================================
|--- qemu-1.4.0.orig/ldscripts/x86_64.ld        2013-02-15
15:05:35.000000000 -0800
|+++ qemu-1.4.0/ldscripts/x86_64.ld     2013-02-28 22:55:36.138816418 -0800
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch relocatable_sdk.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/ridish/RDK-RI-NICO-2/build-qemux86/tmp/work/i686-nativesdk-rdksdk-linux/nativesdk-qemu/1.7.50+gitAUTOINC+f976b09ea2-r0/temp/log.do_patch.31750
ERROR: Task 1617
(virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-linaro/recipes-devtools/qemu/
qemu_git.bb, do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3140 tasks of which 3135 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

Summary: 1 task failed:

virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-linaro/recipes-devtools/qemu/
qemu_git.bb, do_patch
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
ridish@sanjay-Precision-M4500:~/RDK-RI-NICO-2/build-qemux86$

Can someone please help on this?


On Thu, Jan 30, 2014 at 3:12 PM, Dorairaj, Sanjay <
Sanjay_Dorairaj@cable.comcast.com> wrote:

>
>
> Sanjay Dorairaj
> Comcast Silicon Valley Innovation Center
> 1050 Enterprise Way, Suite 100
> Sunnyvale, CA 94089
> Desk: (408)900-8737 Cell:(215)900-2349
> Skype: dorairajsanjay
>
>
>
>
>
> On 1/30/14 2:07 PM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:
>
> >-----BEGIN PGP SIGNED MESSAGE-----
> >Hash: SHA1
> >
> >Nicolas Dechesne schreef op 30-01-14 22:07:
> >> hi,
> >>
> >> On Thu, Jan 30, 2014 at 10:52 AM, Ridish RA <Ridish.RA@lntinfotech.com>
> >> wrote:
> >>> I think I got the root cause of the issue, meta-linaro that we have
> >>> depends on openembedded-core dylan-qt5.1, but Nicolas recently updated
> >>> openembedded-core to dora. And I think this is the root cause of the
> >>> issue of the relocatable patch being not able to apply?
> >>>
> >>> So do we have meta-linaro layer based openembedded-core dora?
> >>>
> >>
> >> yes, the problem is a misalignment between oe-core and meta-linaro.
> >> meta-linaro is using a recent qemu upstream commit, and the list of
> >> patches from oe-core no longer works with meta-linaro qemu_git recipe.
> >> the 2 commits in upstream qemu responsible for the misalignment are:
> >>
> >> 53db78543e473bdf7650a406767d0901c6e26480
> >> 964c6fa16f50a607f9da5068d6bf15ccc93872c0
> >>
> >> I am cc'ing riku and koen since that needs fixing in meta-linaro
> >> (nativesdk-qemu does not build).
> >
> >Can you push cherry-picks for:
> >
> >
> http://git.linaro.org/openembedded/meta-linaro.git/commit/2def4e0a5548cadf
> >edcf9511f835af9456b40953
> >
> >and
> >
> >
> http://git.linaro.org/openembedded/meta-linaro.git/commit/fc9473336a77603e
> >dabda89ae0bac58ef652d649
> >
> >to gerrit? I'm off to fosdem tomorrow and have a day off monday, so
> >tuesday
> >is the earliest I can look at it.
> >
> >regards,
> >
> >Koen
> >
> >-----BEGIN PGP SIGNATURE-----
> >Version: GnuPG v1.4.5 (Darwin)
> >Comment: GPGTools - http://gpgtools.org
> >
> >iD8DBQFS6s0sMkyGM64RGpERAoqHAJsEe/DFtL4TZYq/Hx+CDA0YVwKXpACggj6+
> >wIlhhY8LamC7C+lf/BobULY=
> >=8Jo3
> >-----END PGP SIGNATURE-----
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

