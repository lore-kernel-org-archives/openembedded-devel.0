Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1E63607A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 01:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t691RKvH019780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 18:27:20 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 18:27:20 -0700
Message-ID: <559DCDF7.3020003@windriver.com>
Date: Thu, 9 Jul 2015 09:27:19 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>	<mnfurd$pvc$1@ger.gmane.org>	<559B8063.7010906@windriver.com>
	<mnir45$f4q$1@ger.gmane.org>
In-Reply-To: <mnir45$f4q$1@ger.gmane.org>
Subject: Re: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Thu, 09 Jul 2015 01:27:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月08日 17:39, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Rongqing Li schreef op 07-07-15 om 09:31:
>>
>>
>> On 2015年07月07日 15:24, Koen Kooi wrote: rongqing.li@windriver.com schreef
>> op 07-07-15 om 03:55:
>>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>>
>>>>> Remove backport patch Add CSocket submodule Add the dependency on
>>>>> icu
>>>>>
>>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com> ---
>>
>>>>> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb
>>>>> b/meta-networking/recipes-irc/znc/znc_git.bb index
>>>>> 2e35e4d..f5bed08 100644 ---
>>>>> a/meta-networking/recipes-irc/znc/znc_git.bb +++
>>>>> b/meta-networking/recipes-irc/znc/znc_git.bb @@ -1,16 +1,16 @@
>>>>> SUMMARY = "ZNC, an advanced IRC bouncer" SECTION = "net" LICENSE =
>>>>> "GPLv2" -LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>>>>
>>>>> -DEPENDS = "openssl" +DEPENDS = "openssl zlib icu"
>>>>>
>>>>> -PV = "1.0+git" +PV = "1.6.0+git"
>>
>> If it's the 1.6 release, just call it '1.6.0'
>>
>>
>>> grep oe-core
>>
>>> ./meta/recipes-graphics/mesa/mesa_git.bb:PV = "10.5.4+git${SRCPV}"
>>> ./meta/recipes-graphics/fstests/fstests_git.bb:PV = "0.1+git${SRCPV}"
>>> ./meta/recipes-graphics/mx/mx-1.0_1.4.7.bb:PV = "1.4.7+git${SRCPV}"
>>> ./meta/recipes-graphics/drm/libdrm_git.bb:PV = "2.4.40+git${SRCPV}"
>>> ./meta/recipes-graphics/xorg-lib/libxcb_git.bb:PV =
>>> "1.1.90.1+gitr${SRCPV}"
>>> ./meta/recipes-graphics/xorg-lib/libxext_git.bb:PV =
>>> "1.0.99.1+gitr${SRCPV}"
>>> ./meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb:PV =
>>> "0.0+git${SRCPV}"
>>> ./meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb:PV =
>>> "1.3.2+git${SRCPV}"
>>> ./meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb:PV =
>>> "1.3.0+git${SRCPV}"
>>> ./meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb:PV =
>>> "0.15.2+git${SRCPV}"
>>> ./meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:PV =
>>> "0.1.1+gitr${SRCPV}"
>>> ./meta/recipes-graphics/libepoxy/libepoxy_git.bb:PV =
>>> "1.2+git${SRCPV}"
>>> ./meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb:PV =
>>> "0.1+git${SRCPV}"
>>> ./meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb:PV =
>>> "1.1+git${SRCPV}" ./meta/recipes-devtools/qemu/qemu_git.bb:PV =
>>> "1.3.0+git${SRCPV}"
>>> ./meta/recipes-devtools/swabber/swabber-native_git.bb:PV =
>>> "0.0+git${SRCPV}" ./meta/recipes-devtools/remake/remake_git.bb:PV =
>>> "3.82+dbg-0.9+git${SRCPV}"
>>> ./meta/recipes-devtools/mtd/mtd-utils_git.bb:PV = "1.5.1+git${SRCPV}"
>>> ./meta/recipes-devtools/opkg-utils/opkg-utils_git.bb:PV =
>>> "0.1.8+git${SRCPV}"
>>> ./meta/recipes-devtools/bootchart2/bootchart2_git.bb:PV =
>>> "0.14.6+git${SRCPV}"
>>> ./meta/recipes-devtools/mkelfimage/mkelfimage_git.bb:PV =
>>> "4.0+git${SRCPV}" ./meta/recipes-devtools/mmc/mmc-utils_git.bb:PV =
>>> "0.1" ./meta/recipes-devtools/pseudo/pseudo_git.bb:PV =
>>> "1.6.5+git${SRCPV}" ./meta/recipes-devtools/prelink/prelink_git.bb:PV =
>>> "1.0+git${SRCPV}" ./meta/recipes-devtools/pkgconfig/pkgconfig.inc:PV =
>>> "0.28+git${SRCPV}"
>>> ./meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb:PV =
>>> "4.0.1+git${SRCPV}"
>>> ./meta/recipes-devtools/gnu-config/gnu-config_git.bb:PV =
>>> "1.0+git${SRCPV}" ./meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:PV
>>> = "0.4.0+git${SRCPV}" ./meta/recipes-devtools/fdisk/gptfdisk_git.bb:PV
>>> = "0.8.10+git${SRCPV}" ./meta/recipes-multimedia/x264/x264_git.bb:PV =
>>> "r2491+git${SRCPV}"
>>> ./meta/recipes-multimedia/libav/libpostproc_git.bb:PV =
>>> "52.3.0+git${SRCPV}"
>
> Your point being?

lots of recipes under oe-core is using this style { PV=version+git}

-Roy

>
>
>>
>>
>>
>>>>>
>>>>> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2" -SRC_URI =
>>>>> "git://github.com/znc/znc.git \ -
>>>>> file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
>>>>> +SRC_URI =
>>>>> "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df
> 8
>>>>>
>>>>>
> \ +
>>>>> git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;n
> ame
>>
>>>>>
> =Csocket
>>>>> \ " +SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
>>>>>
>>
>> Why are you using 2 different notations for SRCREV?
>>
>>
>>
>>> there are two different git repo
>
> That's not a reason to use 2 different notations. Either put both in SRC_URI
> or use two SRCREV_foo statements.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFVnO/FMkyGM64RGpERAr4DAJ96PYxPoMF3JR3Vc4QpMP2l9FhuAACfYPao
> pdHU9MAwNQDfvcegqR7tRTY=
> =GSXq
> -----END PGP SIGNATURE-----
>

-- 
Best Reagrds,
Roy | RongQing Li

