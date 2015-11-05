Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 55D0E76E2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:29:09 +0000 (UTC)
Received: by wikq8 with SMTP id q8so8462939wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=7vq08zCxTPcJdJc8ncR9kiGthG+AvmaaxlpgTPkL76g=;
	b=GRZXd14A7rwDLu84dfm9+ZCepVu8T3BjMdsYOw4B0Y5FibyZsSvMsj2H98em57zKm8
	+cM2KQMkvY/ZY+AC6Iyp4Ijj12h4webgjYKtuaqmFD+JDKi/GtEveLlaQZH9PGnyjZnW
	+WaMenoSlspbzGDQCiTXprocql/RL762guOqI9Qw44cOqce2eofNDb5SOyN3Rf15XXsV
	3QzvCrsmTUVOw0AgxigRJwvnAY4/ki4iKkIbDb+8kCDbMNJJk64ivJeHUgidsuMGAea9
	fXSBnDExMMPzxC+DfrfhG04AG2zGOfp2ZqGkitJITfuCRJj2RKTOBJrNjJGjMDlr+1/c
	9OnA==
X-Received: by 10.194.95.202 with SMTP id dm10mr7963799wjb.56.1446722949717;
	Thu, 05 Nov 2015 03:29:09 -0800 (PST)
Received: from [192.168.0.13] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	t126sm7899604wmd.23.2015.11.05.03.29.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 03:29:08 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-3-git-send-email-funman@videolan.org>
	<20151104222547.GA2556@jama> <563B3682.6000407@videolan.org>
	<20151105111611.GC2556@jama>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <563B3D83.4000007@videolan.org>
Date: Thu, 5 Nov 2015 12:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151105111611.GC2556@jama>
Subject: Re: [meta-multimedia][PATCH 3/3] VLC: drop gnome-vfs, it will be removed from upstream in VLC 3.0
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
X-List-Received-Date: Thu, 05 Nov 2015 11:29:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 05/11/2015 12:16, Martin Jansa wrote:
> On Thu, Nov 05, 2015 at 11:59:14AM +0100, Rafaël Carré wrote:
>> Hello,
>>
>> On 04/11/2015 23:25, Martin Jansa wrote:
>>> On Wed, Nov 04, 2015 at 05:03:19PM +0100, Rafaël Carré wrote:
>>>> ---
>>>
>>> Is it still used in 2.2.1 version? we aren't using 3.0 yet:
>>
>> Yes, that module is still present in 2.2 (2.2.1 and future 2.2.X versions).


>> What do you think?
> 
> NAK it's not acceptable to make gnome-vfs support undeterministic in
> 2.2.x just because some future 3.0 recipe won't use it.

Ok

> We already have too many autodetected dependencies again, last bunch
> added by new 1394 recipes in meta-multimedia:
> vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [build-deps]
> vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency? [build-deps]
> vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency? [build-deps]
> 
> Add PACKAGECONFIG for it please and to get bonus points add

Done

> PACKAGECONFIG for deps from QA issues above.

I will take a deeper look as there are more than just those

>> Thanks for the feedback
>>
>>>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>> index ad5c81d..dddbb5b 100644
>>>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>>  DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
>>>>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>>>>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
>>>> -   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
>>>> +   libdvdcss libdvdread lua-native lua libidn \
>>>>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>>>>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>>>>     tiff xcb-util-keysyms samba"

