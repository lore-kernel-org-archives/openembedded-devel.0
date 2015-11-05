Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6D560125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 20:42:50 +0000 (UTC)
Received: by wmww144 with SMTP id w144so16264541wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 12:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Rt+T2k4+4gT2X1shxNDeBzxAFp2hZs2X+QXW7TdYpio=;
	b=fTkUVnoC10SVv1QXo7UVBG/KwmPOU8tPHaL06Mf5BZc/4g4KLpbLXk8JFLx5hZFu8/
	0Kv0mau2SGq9BvH3lC8KhgIl/Bja3DKLdUuhKl9SVEkcB2GJqanBkXf0RxsCPd0+hvFk
	GG5lRQpoqiMdteX5Ff9VD53cRXPwJgDkC0vSqc4SwZIzqcTc4ZFRy13HDpIzxbEoSMUv
	YAraYgqd8K1HOCHtA4/Et+6LtGGW76S4esNqlu2UYYqNjeCIPXEbD+Ea5/fdhW37TVXC
	7zvWkLR9GNsRpuo4igttf6UqncYa71dn0UnHYINZW+kfdrYDhYieFo0aI1V4Sak8L7ZQ
	Ha6A==
X-Received: by 10.28.93.70 with SMTP id r67mr5739130wmb.16.1446756170091;
	Thu, 05 Nov 2015 12:42:50 -0800 (PST)
Received: from [192.168.0.13] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	gl4sm8728649wjd.49.2015.11.05.12.42.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 12:42:48 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-2-git-send-email-funman@videolan.org>
	<20151105201759.GG2556@jama>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <563BBF43.5010309@videolan.org>
Date: Thu, 5 Nov 2015 21:42:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151105201759.GG2556@jama>
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
X-List-Received-Date: Thu, 05 Nov 2015 20:42:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 05/11/2015 21:17, Martin Jansa wrote:
> On Wed, Nov 04, 2015 at 05:03:18PM +0100, Rafaël Carré wrote:
>> ---
>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index b989849..ad5c81d 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
>>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
>> -   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
>> +   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
>>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>>     tiff xcb-util-keysyms samba"
>> @@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.
>>  PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
>>  PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
>>  PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
>> +PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
> 
> Removing gtk+ from DEPENDS causes even more undeterministic
> dependencies:

I would guess those real dependencies were hidden by gtk+ which depends on
every single one of them.

Except maybe vorbis which was hidden by gstreamer plugins?

I agree that although depending on gtk+ is not fully nice neither
correct, it makes
things deterministic.


So I guess I should rather add all the PACKAGECONFIG for these modules
first and then move
those dependencies to their respective PACKAGECONFIG ?


How is your jenkins instance built: world first, then VLC ?

Should I check for additional automatic dependencies inside VLC or
assume that
the list below is exhaustive?

> vlc-2.2.1: vlc: configure was passed unrecognised options:
> --disable-gnome-vfs [unknown-configure-option]
> vlc-2.2.1: vlc rdepends on fontconfig, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on pixman, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on freetype, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on pango, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libvorbis, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on cairo, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on harfbuzz, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libssh2, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on gdk-pixbuf, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on gnome-vfs, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libcroco, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency?
> [build-deps]
> vlc-2.2.1: vlc rdepends on librsvg, but it isn't a build dependency?
> [build-deps]
> 
>>  
>>  do_configure_prepend() {
>>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true

