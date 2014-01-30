Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 725696E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 16:54:03 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id u16so3583119iet.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LkGgoTeicXJ1FqjbWjweA254Q9m7Xl9FtmiRkCtjDCs=;
	b=NatooCSdw5zpCQG/u9XxMIbtUd/vVnJIqyi7YMvvHJV8OHZ4dB75Lo0qPJcfuFga6O
	Jt7ksGU+NOZ1UJgcbtupQxMg9fqOfM5bh5ocUKgYj6HfGTQuaI/hdM6qURSbD4A8L7Nt
	YnGXsWx+sRYHz3gQlgocWSDYftVHYM1A4k4XUNdR65fe4yMBinnYA8Ar6JbwUCAQxNet
	yfulqYJuVDaasPcYaHvQEaA1X+jkrPzKyXANIWGc+dtigB3qXjkyS9wIP5vgWMh00W0f
	HrvWFrJKVU8t4qI9gQveGgZgiTsTzLDlqXBr+mXNBN6aB4SoCxwoLqWo62SmYCmEtjhA
	27Qw==
X-Received: by 10.42.85.140 with SMTP id q12mr2008597icl.51.1391100844382;
	Thu, 30 Jan 2014 08:54:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 30 Jan 2014 08:53:34 -0800 (PST)
In-Reply-To: <CF0F9308.4046D%Sanjay_Dorairaj@cable.comcast.com>
References: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
	<CF0F9308.4046D%Sanjay_Dorairaj@cable.comcast.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2014 08:53:34 -0800
Message-ID: <CAMKF1spT1epjxfM1Nyi86wFCk23BAZ26zun-Ju94JkcYiXwE7A@mail.gmail.com>
To: "Dorairaj, Sanjay" <Sanjay_Dorairaj@cable.comcast.com>
Cc: "ridish.ra@lntinfotech.com" <ridish.ra@lntinfotech.com>,
	KalyanKumar Nagabhirava <kalyankumar.nagabhirava@lntinfotech.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 30 Jan 2014 16:54:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi Sanjay

On Thu, Jan 30, 2014 at 5:35 AM, Dorairaj, Sanjay
<Sanjay_Dorairaj@cable.comcast.com> wrote:
> Hi All,
>
> We are getting build error when using populate_sdk for our RDK builds. Has
> anyone seen this?
>

Would be nice if you included you Build Configuration that bitbake
prints at beginning of build step


> For generating sdk we use  "bitbake -c populate_sdk rdk-generic-image"
> command ,  we are getting below error:
>
> ===========================================================================
> ==========================
> NOTE: Applying patch 'relocatable_sdk.patch'
> (../meta-linaro/meta-linaro/recipes-devtools/qemu/files/relocatable_sdk.pat
> ch)

OK so it seems you have meta-linaro in the layer mix. Besides
toolchain it provided many other recipes, qemu is one of them
and I am not sure if you are interested to use qemu also from
meta-linaro, if you are then some of Linaro developers manitnaining
meta-linaro might know better. It could just be an oversight. But you
could pin to use OE-Core qemu

so in your distro.conf or local.conf add

PREFERRED_PROVIDER_qemu-native = "qemu-native"
PREFERRED_VERSION_qemu = "${QEMUVER}"
PREFERRED_VERSION_qemu-native = "${QEMUVER}"
PREFERRED_VERSION_nativesdk-qemu = "${QEMUVER}"

where QEMUVER = "1.5.0" if you are on dora and "1.7.0" if you are on
master branch of OE-Core layer


> ERROR: Command Error: exit status: 1  Output:
> Applying patch relocatable_sdk.patch
> can't find file to patch at input line 13
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |Upstream-Status: Inappropriate [SDK specific]
> |
> |In order to be able to change the dynamic loader path when relocating
> |binaries, the interp section has to be made big enough to accomodate
> |the new path (4096 is the maximum path length in Linux).
> |
> |Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> |
> |Index: qemu-1.4.0/ldscripts/i386.ld
> |===================================================================
> |--- qemu-1.4.0.orig/ldscripts/i386.ld  2013-02-15 15:05:35.000000000 -0800
> |+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.138816418 -0800
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> can't find file to patch at input line 26
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |Index: qemu-1.4.0/ldscripts/x86_64.ld
> |===================================================================
> |--- qemu-1.4.0.orig/ldscripts/x86_64.ld        2013-02-15
> 15:05:35.000000000 -0800
> |+++ qemu-1.4.0/ldscripts/x86_64.ld     2013-02-28 22:55:36.138816418 -0800
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> Patch relocatable_sdk.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/ridish/RDK-RI-NICO-2/build-qemux86/tmp/work/i686-nativesdk-rdksdk-lin
> ux/nativesdk-qemu/1.6.0+gitAUTOINC+0169c51155-r2/temp/log.do_patch.15188
> ERROR: Task 1574
> (virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-linaro/recip
> es-devtools/qemu/qemu_git.bb, do_patch) failed with exit code '1'
>
>
> Regards,
>
>
> Sanjay
>
>
>>
>

