Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id BA5907002B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:26:05 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id F384568A01A; Thu, 17 Mar 2016 09:26:04 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2611568A01A;
	Thu, 17 Mar 2016 09:26:01 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id BCDD6674053F;
	Thu, 17 Mar 2016 10:26:00 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-3-git-send-email-gary@mlbassoc.com>
	<20160311131752.GA2555@jama> <56E3A074.2020509@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56EA7828.4030606@mlbassoc.com>
Date: Thu, 17 Mar 2016 10:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E3A074.2020509@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v3 2/2] mpv: Media Player
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
X-List-Received-Date: Thu, 17 Mar 2016 09:26:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ping?  Once I understand why it breaks in world builds, I can submit a new patchset.
See below - what's causing rst to be brought in?

Thanks

On 03/12/2016 05:52 AM, Gary Thomas wrote:
> On 2016-03-11 14:17, Martin Jansa wrote:
>> On Thu, Mar 10, 2016 at 05:07:22PM +0100, Gary Thomas wrote:
>>> mpv is a fork of mplayer2 and MPlayer. It shares some features with
>>> the former projects while introducing many more.
>>>
>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>> ---
>>>   meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 67 ++++++++++++++++++++++++
>>>   1 file changed, 67 insertions(+)
>>>   create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>
>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>> new file mode 100644
>>> index 0000000..acad319
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>> @@ -0,0 +1,67 @@
>>> +SUMMARY = "Open Source multimedia player"
>>> +SECTION = "multimedia"
>>> +HOMEPAGE = "http://www.mpv.io/"
>>> +DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
>>> +           libxscrnsaver libv4l libxinerama \
>>> +"
>>
>> It's failing in world builds
>>
>> ERROR: mpv-0.15.0-r0 do_compile: Function failed: do_compile (log file is located at
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/temp/log.do_compile.11834)
>> ERROR: Logfile of failure stored in:
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/temp/log.do_compile.11834
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | Waf: Entering directory
>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/mpv-0.15.0/build'
>> | [  1/195] Compiling version.sh
>> | [  2/195] Compiling TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
>> | [  3/195] Compiling video/out/x11_icon.bin
>> | [  4/195] Compiling etc/input.conf
>> | [  5/195] Compiling sub/osd_font.otf
>> | [  6/195] Compiling video/out/opengl/nnedi3_weights.bin
>> | [  7/195] Compiling player/lua/defaults.lua
>> | [  8/195] Compiling player/lua/assdraw.lua
>> | [  9/195] Compiling player/lua/options.lua
>> | [ 10/195] Compiling player/lua/osc.lua
>> | [ 11/195] Compiling player/lua/ytdl_hook.lua
>> | [ 13/195] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> build/ebml_types.h
>> | [ 13/195] Compiling demux/ebml.c
>> | [ 14/195] Compiling DOCS/man/mpv.rst
>> | Traceback (most recent call last):
>> |   File "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/rst2man.py", line 21, in <module>
>> |     from docutils.core import publish_cmdline, default_description
>> | ImportError: No module named docutils.core
>> |
>> | Waf: Leaving directory
>> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/mpv-0.15.0/build'
>> | Build failed
>> |  -> task in 'rst2man' failed (exit status 1):
>> |     {task 139933719149072: rst2man mpv.rst -> mpv.1}
>> | ' /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/rst2man.py ../DOCS/man/mpv.rst
>> DOCS/man/mpv.1 '
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mpv/0.15.0-r0/temp/log.do_compile.11834)
>> NOTE: recipe mpv-0.15.0-r0: task do_compile: Failed
>> ERROR: Task 15304 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb,
>> do_compile) failed with exit code '1'
>>
>
> What recipe/package is pulling in rst?  I'll check the config options
> and make sure it builds correctly with/without that package present.
>
>>> +
>>> +REQUIRED_DISTRO_FEATURES = "x11"
>>> +
>>> +LICENSE = "GPLv2+"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
>>> +
>>> +SRC_URI = "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
>>> +           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
>>> +"
>>> +SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
>>> +SRC_URI[mpv.sha256sum] = "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
>>> +SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
>>> +SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
>>> +
>>> +inherit pkgconfig
>>> +
>>> +# Note: both lua and libass are required to get on-screen-display (controls)
>>> +PACKAGECONFIG ??= "lua libass"
>>> +PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
>>> +PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
>>> +PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
>>> +
>>> +EXTRA_OECONF = " \
>>> +    --prefix=${prefix} \
>>> +    --target=${SIMPLE_TARGET_SYS} \
>>
>> Where is this variable set? git grep in oe-core and meta-oe didn't show anything.
>>
>> Did you copy it from mplayer2 recipe?
>>
>> If yes then you forgot to include:
>> export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
>
> Thanks for pointing this out.
>
>>
>>> +    --confdir=${sysconfdir} \
>>> +    --datadir=${datadir} \
>>> +    --disable-manpage-build \
>>> +    --disable-gl \
>>> +    --disable-libsmbclient \
>>> +    --disable-encoding \
>>> +    --disable-libbluray \
>>> +    --disable-dvdread \
>>> +    --disable-dvdnav \
>>> +    --disable-cdda \
>>> +    --disable-enca \
>>> +    --disable-libguess \
>>> +    --disable-uchardet \
>>> +    --disable-rubberband \
>>> +    --disable-lcms2 \
>>> +    --disable-vapoursynth \
>>> +    --disable-vapoursynth-lazy \
>>> +"
>>> +
>>> +do_configure() {
>>> +    if [ ! -L ../waf ]; then
>>> +        chmod a+x ../waf-1.8.12
>>> +    ln -s waf-1.8.12 ../waf
>>> +    fi
>>> +    ../waf configure ${EXTRA_OECONF}
>>> +}
>>> +
>>> +do_compile () {
>>> +    ../waf build
>>> +}
>>> +
>>> +do_install() {
>>> +    ../waf install --destdir=${D}
>>> +}
>>> +
>>> +FILES_${PN} += "${datadir}/icons"
>>> --
>>> 2.5.0
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

