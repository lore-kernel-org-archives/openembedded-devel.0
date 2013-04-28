Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UWZWb-0003gl-1V
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Apr 2013 23:52:57 +0200
Received: by mail-la0-f48.google.com with SMTP id eo20so4878896lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=SP4wQYgT2K3+X80KNcC1rZjAewac1i3iuizrIwybSn8=;
	b=JD3QVV0xyj6i2/2tr4bx6nRmVClWVf4kbHrmgutof1O1VkaUoP/sxUhHyjNduL/SKt
	T6Fh2Qa2ZOe59QR78qZ8W8ozinB1nYgGzEZegzn6l2chqMScRLqhHk5HOIVSYQUZtLgV
	irLHMjD3vmT3CMfANDH79t/HXpkLJS9ENfxR/eDMMWDmqkTCujWXebifzszpbKwOj1S8
	yESvvFoiHJsfP3xSZwDhkN+yEKhZML6eBXRvMC3HmVrcP8BQKeckn0u5+nd0cLJ2keDD
	wndip9LPQr6IhY89xHeY6Zr7E1a+kHgn/cr29tQB0LbPoMzACVHae9oEhqDnRHyEer9Q
	gOHg==
MIME-Version: 1.0
X-Received: by 10.152.4.100 with SMTP id j4mr26089398laj.14.1367184900671;
	Sun, 28 Apr 2013 14:35:00 -0700 (PDT)
Received: by 10.112.131.228 with HTTP; Sun, 28 Apr 2013 14:35:00 -0700 (PDT)
In-Reply-To: <20130427105400.GB3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama>
Date: Sun, 28 Apr 2013 23:35:00 +0200
Message-ID: <CAAQYJAtXBegqvnqMYyLZ+c=NA2sKE33cVOicwD9DSP5=sz8WDA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Apr 2013 21:53:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 12:54 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Updated status, but only change IIRC is fixed php, tbb,
> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
> fix build on qemuarm again)
>
> qemuarm Summary: 19 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130426_185942.log/
> qemux86 Summary: 20 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130427_002532.log/
> qemux86-64 Summary: 22 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130427_044751.log/
>
> common from notify mismatch (6):
>   I'll send patch excluding libnotify3 and nautilus3 from world to hide t=
hem
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26=
.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb,=
 do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-=
settings-daemon_2.32.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb,=
 do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_=
compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-po=
wer-manager_2.32.0.bb, do_compile
>
> common (8):
>   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to no=
nworking
>   and exclude compat-wireless-all, samsung-rfs-mgr from world + check aur=
ora-daemon (probably debugedit issue)
>
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, =
do_compile
>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireles=
s-all_3.6.8.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.b=
b, do_compile
>   meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb,=
 do_configure
>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pack=
age
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>   meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb,=
 do_package
>   meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mg=
r_git.bb, do_configure
>
> qemuarm (5):
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_configur=
e
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>
> qemux86* common (4):
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.3.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
_2.0.2.bb, do_configure

I've sent a patch masking kexec-tools-klibc for x86 and x86-64 and the
image using it.
Feedback from upstream: vfscanf() could be added to the next klibc
release so we'd unmask soon.

(If in hurry, there is a single patch to revert, about EDD stuff).

Cheers

Andrea


>
> qemux86 (2):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>
> qemux86-64 (4):
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb=
, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>
> On Mon, Apr 15, 2013 at 04:12:53PM +0200, Martin Jansa wrote:
>> Hi,
>>
>> just reminder of pending build issues with distro-less qemuarm world bui=
ls,
>> unfortunately a lot of these recipes are still there since I started to =
send
>> "world build status", so I will comment only on new or suspicious entrie=
s.
>>
>> Complete log as always available at
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.=
20130415_033339.log/
>>
>> qemux86 and qemux86-64 still running (one build takes +- 24hours)
>>
>> # old entries:
>> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, =
do_compile
>> meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.=
0.bb, do_compile
>> meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, d=
o_compile
>> meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_=
2.0.2.bb, do_configure
>> openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_com=
pile
>> meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless=
-all_3.6.8.bb, do_compile
>> meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, =
do_compile
>> meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_g=
it.bb, do_configure
>> meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb=
, do_compile
>> meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compi=
le
>> meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb, =
do_configure
>> openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>> meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_c=
ompile
>> meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, =
do_compile
>> meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.=
5.0.bb, do_compile
>> meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-pow=
er-manager_2.32.0.bb, do_compile
>>
>> *gnome*: biggest part of this is caused by libnotify3/libnotify conflict=
s and list of failing gnome
>> recipes always is different, depending which libnotify version was built=
/reused from sstate first :/
>>
>> *klibc*: also happen quite often missing limits.h
>>
>> meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
>>   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercep=
t.cpp: In constructor '{anonymous}::StatSymbols::StatSymbols()':
>>   | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/llvm2.9/2.9-r2.0/llvm-2.9/lib/ExecutionEngine/JIT/Intercep=
t.cpp:69:67: error: 'lseek64' was not declared in this scope
>>   from my pending patch, need to hunt this down before merging it or try=
 if 2.8 suffers the same
>>
>> meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless=
-all_3.6.8.bb
>>   this is picky about used defconfig, not sure how to "blacklist" it whe=
n something is missing in defconfig
>>
>> meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.19.bb
>>   Applying patch phar-makefile.patch
>>   patching file ext/phar/Makefile.frag
>>   Hunk #1 FAILED at 6.
>>   1 out of 1 hunk FAILED -- rejects in file ext/phar/Makefile.frag
>>   probably reexecuting do_patch in same directory for some reason..
>>
>> meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb
>>   reported on pending review
>>
>> meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
>>   reported on review, but then I've accidentally merged it (I had it bla=
cklisted as known broken,
>>   but then v2 came and I supposed it's fixed because it wasn't in list o=
f failing :/)
>> meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_conf=
igure
>>   node-waf: not found
>>   probably caused by my pending patch to upgrade nodejs to 0.10.4
>>
>> meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, d=
o_configure
>>   fix on ML http://patchwork.openembedded.org/patch/48153/
>>
>> meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/andr=
oid-audiosystem_bzr.bb, do_package
>>   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/sh=
r-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/d=
ebugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/a=
rmv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audio=
system/1.8+bzr43-r0/debugsources.list' '/home/jenkins/oe/shr-core-branches/=
shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/android-audiosystem/1.8+b=
zr43-r0/package/usr/lib/alsa-lib/libasound_module_pcm_android.so')
>>
>> meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.bb, =
do_package
>>   ERROR: debugedit failed with exit code 1 (cmd was '/home/jenkins/oe/sh=
r-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/d=
ebugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/a=
rmv5te-oe-linux-gnueabi' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/aurora-daemon=
/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a679ba71ddef0c4-r0.17/debugsource=
s.list' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t=
e-oe-linux-gnueabi/aurora-daemon/0.1+gitrAUTOINC+b65354ad6c0e201eea8559743a=
679ba71ddef0c4-r0.17/package/usr/lib/qt4/imports/Aurora/Components/libauror=
a-components.so')
>>
>> meta-smartphone/meta-samsung/recipes-bsp/samsung-rfs-mgr/samsung-rfs-mgr=
_git.bb, do_configure
>>   depends on samsung-ipc-1.0 >=3D 0.2', but we have that with negative D=
_P
>>
>> meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>>   pending review for Koen's patches, still need some improvements
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


