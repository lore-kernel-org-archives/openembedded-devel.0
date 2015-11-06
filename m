Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 75B1760124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 15:16:09 +0000 (UTC)
Received: by wikq8 with SMTP id q8so32196785wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/akg0P2Svwk7IazoMfgAs95olKzvwcS51zawtTeSyWY=;
	b=B/Y1/Uli2CNQGtuzuFvn9FKEnhGsgIBKFKJCea1rGcYbrNwKUZmc0LAInjGbLqiTZ2
	o4qy3Ka49OlFQElo+GiPKJVV5f3VcgRJw6ny9+Gu1jGB6clbkLRqf5vZjyDkySMrjwNf
	7kPvvJGPCXz2bGxEtMwWzPNAr8yDcfyKdimGxauXFaK57BXOve4Yeq8qLS6V4BO75Izv
	anOIWyfkl2ZpR6sArgMccnCWMmLiZY+zkbm2CNShr0fNnhsVOVvuBYqx5bXIKzzyZatE
	IsI7B/7QwlROAZjbF5NDp03/6xv7kECY22YO1T9QWTwQhvyp8jvcAP9VSKwnnnNbGRPw
	b4XQ==
X-Received: by 10.194.57.142 with SMTP id i14mr17482366wjq.24.1446822969538;
	Fri, 06 Nov 2015 07:16:09 -0800 (PST)
Received: from [192.168.0.13] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	b12sm3507191wma.6.2015.11.06.07.16.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 07:16:08 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-2-git-send-email-funman@videolan.org>
	<20151105201759.GG2556@jama> <563BBF43.5010309@videolan.org>
	<20151105205707.GH2556@jama>
	<CANx9H-AznEWHvGH9PHb1tjT03h4rPo=F_XAZARmyDDiUZZwncg@mail.gmail.com>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <563CC437.2090106@videolan.org>
Date: Fri, 6 Nov 2015 16:16:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AznEWHvGH9PHb1tjT03h4rPo=F_XAZARmyDDiUZZwncg@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH 2/3] VLC: make libnotify a configurable dependency
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
X-List-Received-Date: Fri, 06 Nov 2015 15:16:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 06/11/2015 01:07, Tim Orling wrote:
> On Thu, Nov 5, 2015 at 12:57 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
>> On Thu, Nov 05, 2015 at 09:42:43PM +0100, Rafaël Carré wrote:
>>> On 05/11/2015 21:17, Martin Jansa wrote:
>>>> On Wed, Nov 04, 2015 at 05:03:18PM +0100, Rafaël Carré wrote:
>>>>> ---
>>>>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>>> index b989849..ad5c81d 100644
>>>>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>>>  DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
>>>>>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>>>>>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
>>>>> -   libdvdcss libdvdread lua-native lua libidn libnotify gtk+
>> gnome-vfs \
>>>>> +   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
>>>>>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>>>>>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>>>>>     tiff xcb-util-keysyms samba"
>>>>> @@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] =
>> "--enable-gst-decode,--disable-gst-decode,gstreamer1.
>>>>>  PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
>>>>>  PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
>>>>>  PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp,
>> freerdp"
>>>>> +PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify
>> gtk+"
>>>>
>>>> Removing gtk+ from DEPENDS causes even more undeterministic
>>>> dependencies:
>>>
>>> I would guess those real dependencies were hidden by gtk+ which depends
>> on
>>> every single one of them.
>>>
>>> Except maybe vorbis which was hidden by gstreamer plugins?
>>>
>>> I agree that although depending on gtk+ is not fully nice neither
>>> correct, it makes
>>> things deterministic.
>>>
>>>
>>> So I guess I should rather add all the PACKAGECONFIG for these modules
>>> first and then move
>>> those dependencies to their respective PACKAGECONFIG ?
>>
>> yes
>>
>> There are 112 AC_ARG_ENABLE clauses in configure.ac
> <https://github.com/videolan/vlc/blob/master/configure.ac>... but adding
> PACKAGECONFIG for those that make sense has been on my list of TODO for a
> long time. Not all of them apply to our usage (winstore_app for instance).
> Testing all those options is one of the things that has held me back...so
> the approach of fixing what becomes broken has been the easier route.
> 
> At least there aren't a large amount of PKG_CHECK_MODULES which leads to
> endless patches to make it deterministic which other upstreams have zero
> interest in applying.

There are a lot PKG_ENABLE_MODULES_VLC which call that macro though

> --Tim
> 

