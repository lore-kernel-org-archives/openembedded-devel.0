Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 4270B60088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:11:39 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 824CB68A01C; Wed, 22 Jun 2016 18:11:38 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 8519C68A019;
	Wed, 22 Jun 2016 18:11:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 4534C674031D;
	Wed, 22 Jun 2016 19:11:33 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1465300884-32459-1-git-send-email-abdur_rehman@mentor.com>
	<1465300884-32459-2-git-send-email-abdur_rehman@mentor.com>
	<15AFC889-4496-4B83-88A7-CD76CB3B13E7@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <576AC6C5.80204@mlbassoc.com>
Date: Wed, 22 Jun 2016 19:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <15AFC889-4496-4B83-88A7-CD76CB3B13E7@gmail.com>
Subject: Re: [meta-oe][PATCH v5 2/2] mpv: Media Player
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
X-List-Received-Date: Wed, 22 Jun 2016 17:11:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-22 19:06, Khem Raj wrote:
>
>> On Jun 7, 2016, at 5:01 AM, Abdur Rehman <abdur_rehman@mentor.com> wrote:
>>
>> mpv is a fork of mplayer2 and MPlayer. It shares some features with
>> the former projects while introducing many more.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
>> ---
>> meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 69 ++++++++++++++++++++++++
>> 1 file changed, 69 insertions(+)
>> create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>
>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>> new file mode 100644
>> index 0000000..4f4aec1
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>> @@ -0,0 +1,69 @@
>> +SUMMARY = "Open Source multimedia player"
>> +SECTION = "multimedia"
>> +HOMEPAGE = "http://www.mpv.io/"
>> +DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
>> +           libxscrnsaver libv4l libxinerama \
>> +"
>> +
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
>> +
>> +SRC_URI = "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
>> +           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
>> +"
>> +SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
>> +SRC_URI[mpv.sha256sum] = "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
>> +SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
>> +SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
>> +
>> +inherit pkgconfig pythonnative distro_features_check
>> +# depends on virtual/libx11
>> +REQUIRED_DISTRO_FEATURES = "x11"
>> +
>> +# Note: both lua and libass are required to get on-screen-display (controls)
>> +PACKAGECONFIG ??= "lua libass"
>> +PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
>> +PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
>> +PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
>> +PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
>> +
>> +EXTRA_OECONF = " \
>> +    --prefix=${prefix} \
>> +    --target=${SIMPLE_TARGET_SYS} \
>> +    --confdir=${sysconfdir} \
>> +    --datadir=${datadir} \
>> +    --disable-manpage-build \
>> +    --disable-gl \
>> +    --disable-libsmbclient \
>> +    --disable-encoding \
>> +    --disable-libbluray \
>> +    --disable-dvdread \
>> +    --disable-dvdnav \
>> +    --disable-cdda \
>> +    --disable-enca \
>> +    --disable-libguess \
>> +    --disable-uchardet \
>> +    --disable-rubberband \
>> +    --disable-lcms2 \
>> +    --disable-vapoursynth \
>> +    --disable-vapoursynth-lazy \
>> +"
>> +
>> +do_configure() {
>> +    if [ ! -L ../waf ]; then
>> +        chmod a+x ../waf-1.8.12
>> +	ln -s waf-1.8.12 ../waf
>> +    fi
>> +    export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
>> +    ../waf configure ${EXTRA_OECONF}
>> +}
>> +
>> +do_compile () {
>> +    ../waf build
>> +}
>> +
>> +do_install() {
>> +    ../waf install --destdir=${D}
>> +}
>
> may be you should inherit waf

I didn't make it, but there was a recent Vn patchset that does.

>
>> +
>> +FILES_${PN} += "${datadir}/icons"
>> --
>> 1.9.1

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

