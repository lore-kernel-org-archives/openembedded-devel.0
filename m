Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 018E271E68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 14:39:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0C1CCF811DB; Fri, 20 Feb 2015 07:39:10 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 61817F811D9;
	Fri, 20 Feb 2015 07:39:10 -0700 (MST)
Message-ID: <54E74711.30202@mlbassoc.com>
Date: Fri, 20 Feb 2015 07:39:13 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1423788858-16687-1-git-send-email-gary@mlbassoc.com>
	<CA+chaQdfVy4bdE+-Yq7YakQ9pYnSkDLEGiqxAsVnkq7rP26KrA@mail.gmail.com>
	<54DD5AED.9050707@mlbassoc.com> <20150220134358.GE2322@jama>
	<54E73E6E.3040303@mlbassoc.com> <20150220143400.GH2322@jama>
In-Reply-To: <20150220143400.GH2322@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] mplayer2: Remove blacklist
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
X-List-Received-Date: Fri, 20 Feb 2015 14:39:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-20 07:34, Martin Jansa wrote:
> On Fri, Feb 20, 2015 at 07:02:22AM -0700, Gary Thomas wrote:
>> On 2015-02-20 06:43, Martin Jansa wrote:
>>> On Thu, Feb 12, 2015 at 07:01:17PM -0700, Gary Thomas wrote:
>>>> On 2015-02-12 18:08, Martin Jansa wrote:
>>>>> Does it have --enable-* options for the new PACKAGECONFIGs? If yes then it should specify them as well (advantage at least in some projects is that when it explicitly asking for
>>>>> foo and foo is unusable it will end with fatal error instead of ignoring broken foo dependency.
>>>>
>>>> No, those are auto-discover and only have disable options.
>>>
>>> Please add REQUIRED_DISTRO_FEATURES = "x11"
>>> because it depends on couple of recipes which aren't available without
>>> x11: xsp, libxv, virtual/libx11, libxscrnsaver
>>>
>>> and it should set LICENSE_FLAGS like libpostproc has to resolve:
>>> ERROR: Nothing PROVIDES 'libpostproc' (but meta-oe/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb DEPENDS on or otherwise requires it)
>>> ERROR: libpostproc was skipped: because it has a restricted license not whitelisted in LICENSE_FLAGS_WHITELIST
>>
>> Is there a way to make these conditional?  For example, you could build
>> without libpostproc and the result would not need the commercial license.
>> There may also be a way to build without X11, but I've not investigated
>> that yet.
>
> You have added postproc to default PACKAGECONFIG, I haven't tried if it
> works without it. The same for x11 related dependencies.

The question was is there a way to not set the license as commercial
if libpostproc is disabled?

>
>>>>> On Fri, Feb 13, 2015 at 1:54 AM, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>>>>>
>>>>>       mplayer2 no longer needs to be blacklisted as OE-core has moved
>>>>>       to libav_9.16.
>>>>>
>>>>>       [v2-v3] Also update build dependencies to quash QA warnings, using
>>>>>       PACKAGECONFIG for most optional features.
>>>>>
>>>>>       Signed-off-by: Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>>
>>>>>       ---
>>>>>         meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplayer2_git.bb> | 9 ++++++---
>>>>>         1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>>       diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplayer2_git.bb> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplayer2_git.bb>
>>>>>       index 7c04ff1..2de26b0 100644
>>>>>       --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplayer2_git.bb>
>>>>>       +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb <http://mplayer2_git.bb>
>>>>>       @@ -3,7 +3,7 @@ SECTION = "multimedia"
>>>>>         HOMEPAGE = "http://www.mplayerhq.hu/"
>>>>>         DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
>>>>>                    libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
>>>>>       -           libxv virtual/libx11 libass speex faad2"
>>>>>       +           libxv virtual/libx11 libass speex faad2 libxscrnsaver"
>>>>>
>>>>>         RDEPENDS_${PN} = "mplayer-common"
>>>>>         PROVIDES = "mplayer"
>>>>>       @@ -13,8 +13,6 @@ RCONFLICTS_${PN} = "mplayer"
>>>>>         LICENSE = "GPLv3"
>>>>>         LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>>>>>
>>>>>       -PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
>>>>>       -
>>>>>         SRC_URI = "git://repo.or.cz/mplayer.git <http://repo.or.cz/mplayer.git> \
>>>>>             file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
>>>>>         "
>>>>>       @@ -109,9 +107,14 @@ EXTRA_OECONF = " \
>>>>>         EXTRA_OECONF_append_armv6 = " --enable-armv6"
>>>>>         EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
>>>>>
>>>>>       +PACKAGECONFIG ??= "vorbis postproc"
>>>>>         PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>>>>>         PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
>>>>>         PACKAGECONFIG[lame] = ",,lame"
>>>>>       +PACKAGECONFIG[postproc] = ",--disable-libpostproc,libpostproc"
>>>>>       +PACKAGECONFIG[vorbis] = ",--disable-libvorbis,libvorbis"
>>>>>       +PACKAGECONFIG[portaudio] = ",--disable-portaudio,portaudio-v19"
>>>>>       +PACKAGECONFIG[mpg123] = ",--disable-mpg123,mpg123"
>>>>>
>>>>>         FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
>>>>>         BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
>>>>>       --
>>>>>       1.9.1
>>>>>
>>>>>       --
>>>>>       _______________________________________________
>>>>>       Openembedded-devel mailing list
>>>>>       Openembedded-devel@lists.openembedded.org <mailto:Openembedded-devel@lists.openembedded.org>
>>>>>       http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>>
>>>>
>>>> --
>>>> ------------------------------------------------------------
>>>> Gary Thomas                 |  Consulting for the
>>>> MLB Associates              |    Embedded world
>>>> ------------------------------------------------------------
>>>
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

