Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F30656072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:18:16 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4BF8F68A019; Thu, 10 Mar 2016 08:18:17 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL,T_FRT_BELOW2 autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id D258368A019;
	Thu, 10 Mar 2016 08:18:14 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 4B8286740554;
	Thu, 10 Mar 2016 09:18:14 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
	<20160309191532.GI2542@jama> <56E0FB3F.3020004@mlbassoc.com>
	<20160310073340.GR2542@jama> <56E12501.1070909@mlbassoc.com>
	<CA+chaQfjDkzXNBzMkRQg2xzqh43Ph-+iLQBPi5Rb+F1-C_1Xqg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56E12DC6.3000704@mlbassoc.com>
Date: Thu, 10 Mar 2016 09:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfjDkzXNBzMkRQg2xzqh43Ph-+iLQBPi5Rb+F1-C_1Xqg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 08:18:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-10 08:57, Martin Jansa wrote:
> I did and there was still:
> FILES_${PN} += "${prefix}"
>
> that's why I've asked again here.

Now I understand why you're asking.  I'll verify that it works correctly
without that line, just using the standard packaging.  If so, need I send
another patch revision or can you just leave that one line out when you merge?

>
> On Thu, Mar 10, 2016 at 8:40 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> On 2016-03-10 08:33, Martin Jansa wrote:
>>
>>> On Thu, Mar 10, 2016 at 05:42:39AM +0100, Gary Thomas wrote:
>>>
>>>> On 2016-03-09 20:15, Martin Jansa wrote:
>>>>
>>>>> On Wed, Mar 09, 2016 at 07:20:33AM +0100, Gary Thomas wrote:
>>>>>
>>>>>> mpv is a fork of mplayer2 and MPlayer. It shares some features with
>>>>>> the former projects while introducing many more.
>>>>>>
>>>>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>>>>> ---
>>>>>>     meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60
>>>>>> ++++++++++++++++++++++++
>>>>>>     1 file changed, 60 insertions(+)
>>>>>>     create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>>> new file mode 100644
>>>>>> index 0000000..37e4b02
>>>>>> --- /dev/null
>>>>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
>>>>>> @@ -0,0 +1,60 @@
>>>>>> +SUMMARY = "Open Source multimedia player"
>>>>>> +SECTION = "multimedia"
>>>>>> +HOMEPAGE = "http://www.mpv.io/"
>>>>>> +DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrnsaver"
>>>>>> +
>>>>>> +# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
>>>>>> +REQUIRED_DISTRO_FEATURES = "x11"
>>>>>> +
>>>>>> +LICENSE = "GPLv2+"
>>>>>> +LIC_FILES_CHKSUM =
>>>>>> "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
>>>>>> +
>>>>>> +SRC_URI = "
>>>>>> https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
>>>>>> +
>>>>>> http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
>>>>>> +"
>>>>>> +SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
>>>>>> +SRC_URI[mpv.sha256sum] =
>>>>>> "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
>>>>>> +SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
>>>>>> +SRC_URI[waf.sha256sum] =
>>>>>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
>>>>>> +
>>>>>> +EXTRA_OECONF = " \
>>>>>> +    --prefix=${D}/usr \
>>>>>>
>>>>> why not ${prefix} and does it really need to be prefixed with ${D}
>>>>> (unlike mandir bellow)? Ugly waf.
>>>>>
>>>>
>>> What about ${D}?
>>>
>>> +    --mandir=${mandir} \
>>>>>> +    --target=${SIMPLE_TARGET_SYS} \
>>>>>> +    --disable-gl \
>>>>>> +    --disable-libsmbclient \
>>>>>> +    --disable-libass \
>>>>>> +    --disable-lua \
>>>>>> +    --disable-libass-osd \
>>>>>> +    --disable-encoding \
>>>>>> +    --disable-libbluray \
>>>>>> +    --disable-dvdread \
>>>>>> +    --disable-dvdnav \
>>>>>> +    --disable-cdda \
>>>>>> +    --disable-enca \
>>>>>> +    --disable-libguess \
>>>>>> +    --disable-uchardet \
>>>>>> +    --disable-rubberband \
>>>>>> +    --disable-lcms2 \
>>>>>> +    --disable-vapoursynth \
>>>>>> +    --disable-vapoursynth-lazy \
>>>>>> +    --enable-libarchive \
>>>>>> +"
>>>>>> +
>>>>>> +do_configure() {
>>>>>> +    if [ ! -L ../waf ]; then
>>>>>> +        chmod a+x ../waf-1.8.12
>>>>>> +       ln -s waf-1.8.12 ../waf
>>>>>> +    fi
>>>>>> +    ../waf configure ${EXTRA_OECONF}
>>>>>> +}
>>>>>> +
>>>>>> +do_compile () {
>>>>>> +    ../waf build
>>>>>> +}
>>>>>> +
>>>>>> +do_install() {
>>>>>> +    ../waf install
>>>>>> +}
>>>>>> +
>>>>>> +FILES_${PN} += "/usr/"
>>>>>>
>>>>>
>>>>> ${prefix}?
>>>>>
>>>>> Does it install files in strange directories not covered by standard
>>>>> FILES?
>>>>>
>>>>>
>>>> Use of ${prefix} does seem correct, I've updated the recipe.
>>>> Patch v2 has been dispatched, including a required update to
>>>> the libass package which was necessary to get a fully functional
>>>> mpv.
>>>>
>>>
>>> Does it install files in strange directories not covered by standard
>>> FILES?
>>>
>>
>> No, but it doesn't seem to have any notion of adjusting the install
>> directory except at configure time, hence ${D}${prefix}
>>
>> Please refer to the new patchset to see how I've changed the recipe.
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

