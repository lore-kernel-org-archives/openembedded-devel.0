Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C13F965C60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:25:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZDZEe-0008Hf-Rt for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2015 16:25:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 16:25:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 16:25:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Jul 2015 16:21:49 +0200
Message-ID: <mnokdt$fuc$2@ger.gmane.org>
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>	<mnfurd$pvc$1@ger.gmane.org>	<559B8063.7010906@windriver.com>	<mnir45$f4q$1@ger.gmane.org>
	<559DCDF7.3020003@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <559DCDF7.3020003@windriver.com>
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
X-List-Received-Date: Fri, 10 Jul 2015 14:25:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rongqing Li schreef op 09-07-15 om 03:27:
> 
> 
> On 2015年07月08日 17:39, Koen Kooi wrote: Rongqing Li schreef op 07-07-15 om
> 09:31:
>>>> 
>>>> 
>>>> On 2015年07月07日 15:24, Koen Kooi wrote: rongqing.li@windriver.com
>>>> schreef op 07-07-15 om 03:55:
>>>>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>>>> 
>>>>>>> Remove backport patch Add CSocket submodule Add the
>>>>>>> dependency on icu
>>>>>>> 
>>>>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com> ---
>>>> 
>>>>>>> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb 
>>>>>>> b/meta-networking/recipes-irc/znc/znc_git.bb index 
>>>>>>> 2e35e4d..f5bed08 100644 --- 
>>>>>>> a/meta-networking/recipes-irc/znc/znc_git.bb +++ 
>>>>>>> b/meta-networking/recipes-irc/znc/znc_git.bb @@ -1,16 +1,16
>>>>>>> @@ SUMMARY = "ZNC, an advanced IRC bouncer" SECTION = "net"
>>>>>>> LICENSE = "GPLv2" -LIC_FILES_CHKSUM = 
>>>>>>> "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe" 
>>>>>>> +LIC_FILES_CHKSUM = 
>>>>>>> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>>>>>> 
>>>>>>> -DEPENDS = "openssl" +DEPENDS = "openssl zlib icu"
>>>>>>> 
>>>>>>> -PV = "1.0+git" +PV = "1.6.0+git"
>>>> 
>>>> If it's the 1.6 release, just call it '1.6.0'
>>>> 
>>>> 
>>>>> grep oe-core
>>>> 
>>>>> ./meta/recipes-graphics/mesa/mesa_git.bb:PV =
>>>>> "10.5.4+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/fstests/fstests_git.bb:PV =
>>>>> "0.1+git${SRCPV}" ./meta/recipes-graphics/mx/mx-1.0_1.4.7.bb:PV =
>>>>> "1.4.7+git${SRCPV}" ./meta/recipes-graphics/drm/libdrm_git.bb:PV
>>>>> = "2.4.40+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-lib/libxcb_git.bb:PV = 
>>>>> "1.1.90.1+gitr${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-lib/libxext_git.bb:PV = 
>>>>> "1.0.99.1+gitr${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb:PV = 
>>>>> "0.0+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb:PV
>>>>> = "1.3.2+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb:PV = 
>>>>> "1.3.0+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb:PV
>>>>> = "0.15.2+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:PV
>>>>> = "0.1.1+gitr${SRCPV}" 
>>>>> ./meta/recipes-graphics/libepoxy/libepoxy_git.bb:PV = 
>>>>> "1.2+git${SRCPV}" 
>>>>> ./meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb:PV = 
>>>>> "0.1+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb:PV = 
>>>>> "1.1+git${SRCPV}" ./meta/recipes-devtools/qemu/qemu_git.bb:PV = 
>>>>> "1.3.0+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/swabber/swabber-native_git.bb:PV = 
>>>>> "0.0+git${SRCPV}" ./meta/recipes-devtools/remake/remake_git.bb:PV
>>>>> = "3.82+dbg-0.9+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/mtd/mtd-utils_git.bb:PV =
>>>>> "1.5.1+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/opkg-utils/opkg-utils_git.bb:PV = 
>>>>> "0.1.8+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/bootchart2/bootchart2_git.bb:PV = 
>>>>> "0.14.6+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/mkelfimage/mkelfimage_git.bb:PV = 
>>>>> "4.0+git${SRCPV}" ./meta/recipes-devtools/mmc/mmc-utils_git.bb:PV
>>>>> = "0.1" ./meta/recipes-devtools/pseudo/pseudo_git.bb:PV = 
>>>>> "1.6.5+git${SRCPV}"
>>>>> ./meta/recipes-devtools/prelink/prelink_git.bb:PV = 
>>>>> "1.0+git${SRCPV}"
>>>>> ./meta/recipes-devtools/pkgconfig/pkgconfig.inc:PV = 
>>>>> "0.28+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb:PV = 
>>>>> "4.0.1+git${SRCPV}" 
>>>>> ./meta/recipes-devtools/gnu-config/gnu-config_git.bb:PV = 
>>>>> "1.0+git${SRCPV}"
>>>>> ./meta/recipes-devtools/tcf-agent/tcf-agent_git.bb:PV =
>>>>> "0.4.0+git${SRCPV}"
>>>>> ./meta/recipes-devtools/fdisk/gptfdisk_git.bb:PV =
>>>>> "0.8.10+git${SRCPV}"
>>>>> ./meta/recipes-multimedia/x264/x264_git.bb:PV = 
>>>>> "r2491+git${SRCPV}" 
>>>>> ./meta/recipes-multimedia/libav/libpostproc_git.bb:PV = 
>>>>> "52.3.0+git${SRCPV}"
> 
> Your point being?
> 
>> lots of recipes under oe-core is using this style { PV=version+git}

Like lemmings of a cliff...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVn9T9MkyGM64RGpERAqViAJ9+8Ad3sQQE1bvAvPfYbnxXvLZgIgCbBR1P
y8Z1GLTedpVErGs9YPLUkg4=
=0qW2
-----END PGP SIGNATURE-----


